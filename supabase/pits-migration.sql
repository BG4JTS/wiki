-- ============================================
-- 原样WIKI - 坑 & 填坑 功能
-- 请在 Supabase SQL Editor 执行
-- ============================================

-- 1. 坑主表
CREATE TABLE IF NOT EXISTS pits (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  episode_id BIGINT REFERENCES episodes(id) ON DELETE SET NULL,
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  description TEXT DEFAULT '',
  status TEXT NOT NULL DEFAULT 'open' CHECK (status IN ('open', 'pending', 'filled')),
  up_votes INT4 DEFAULT 0,
  down_votes INT4 DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. 坑投票（一人一票）
CREATE TABLE IF NOT EXISTS pit_votes (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  pit_id BIGINT NOT NULL REFERENCES pits(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  vote_type TEXT NOT NULL CHECK (vote_type IN ('up', 'down')),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(pit_id, user_id)
);

-- 3. 填坑声明
CREATE TABLE IF NOT EXISTS pit_fills (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  pit_id BIGINT NOT NULL REFERENCES pits(id) ON DELETE CASCADE,
  episode_id BIGINT REFERENCES episodes(id) ON DELETE SET NULL,
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  description TEXT DEFAULT '',
  up_votes INT4 DEFAULT 0,
  down_votes INT4 DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 4. 填坑投票
CREATE TABLE IF NOT EXISTS pit_fill_votes (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  fill_id BIGINT NOT NULL REFERENCES pit_fills(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  vote_type TEXT NOT NULL CHECK (vote_type IN ('up', 'down')),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(fill_id, user_id)
);

-- ============================================
-- RLS
-- ============================================
ALTER TABLE pits ENABLE ROW LEVEL SECURITY;
ALTER TABLE pit_votes ENABLE ROW LEVEL SECURITY;
ALTER TABLE pit_fills ENABLE ROW LEVEL SECURITY;
ALTER TABLE pit_fill_votes ENABLE ROW LEVEL SECURITY;

-- pits: 任何人可读，登录用户可创建
CREATE POLICY "pits_select" ON pits FOR SELECT USING (true);
CREATE POLICY "pits_insert" ON pits FOR INSERT WITH CHECK (auth.role() = 'authenticated');
CREATE POLICY "pits_update" ON pits FOR UPDATE USING (auth.uid() = user_id);

-- pit_votes: 任何人可读，登录用户可投票
CREATE POLICY "pit_votes_select" ON pit_votes FOR SELECT USING (true);
CREATE POLICY "pit_votes_insert" ON pit_votes FOR INSERT WITH CHECK (auth.role() = 'authenticated' AND auth.uid() = user_id);

-- pit_fills: 任何人可读，登录用户可创建
CREATE POLICY "pit_fills_select" ON pit_fills FOR SELECT USING (true);
CREATE POLICY "pit_fills_insert" ON pit_fills FOR INSERT WITH CHECK (auth.role() = 'authenticated');

-- pit_fill_votes: 任何人可读，登录用户可投票
CREATE POLICY "pit_fill_votes_select" ON pit_fill_votes FOR SELECT USING (true);
CREATE POLICY "pit_fill_votes_insert" ON pit_fill_votes FOR INSERT WITH CHECK (auth.role() = 'authenticated' AND auth.uid() = user_id);

-- ============================================
-- 投票 RPC：投坑的票并自动更新计票和状态
-- ============================================
CREATE OR REPLACE FUNCTION vote_pit(p_pit_id BIGINT, p_vote_type TEXT)
RETURNS VOID AS $$
DECLARE
  existing_vote TEXT;
  up_count INT4;
  down_count INT4;
BEGIN
  -- 检查是否已投票
  SELECT vote_type INTO existing_vote FROM pit_votes
    WHERE pit_id = p_pit_id AND user_id = auth.uid();
  
  IF existing_vote IS NOT NULL THEN
    -- 同类型则取消投票
    IF existing_vote = p_vote_type THEN
      DELETE FROM pit_votes WHERE pit_id = p_pit_id AND user_id = auth.uid();
      IF p_vote_type = 'up' THEN
        UPDATE pits SET up_votes = GREATEST(up_votes - 1, 0) WHERE id = p_pit_id;
      ELSE
        UPDATE pits SET down_votes = GREATEST(down_votes - 1, 0) WHERE id = p_pit_id;
      END IF;
    ELSE
      -- 切换投票
      UPDATE pit_votes SET vote_type = p_vote_type, created_at = NOW()
        WHERE pit_id = p_pit_id AND user_id = auth.uid();
      IF p_vote_type = 'up' THEN
        UPDATE pits SET up_votes = up_votes + 1, down_votes = GREATEST(down_votes - 1, 0) WHERE id = p_pit_id;
      ELSE
        UPDATE pits SET down_votes = down_votes + 1, up_votes = GREATEST(up_votes - 1, 0) WHERE id = p_pit_id;
      END IF;
    END IF;
  ELSE
    -- 新投票
    INSERT INTO pit_votes (pit_id, user_id, vote_type) VALUES (p_pit_id, auth.uid(), p_vote_type);
    IF p_vote_type = 'up' THEN
      UPDATE pits SET up_votes = up_votes + 1 WHERE id = p_pit_id;
    ELSE
      UPDATE pits SET down_votes = down_votes + 1 WHERE id = p_pit_id;
    END IF;
  END IF;

  -- 检查是否应进入待填状态（正面票 >= 3 且多于负面）
  SELECT up_votes, down_votes INTO up_count, down_count FROM pits WHERE id = p_pit_id;
  IF up_count >= 3 AND up_count > down_count THEN
    UPDATE pits SET status = 'pending' WHERE id = p_pit_id AND status = 'open';
  END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ============================================
-- 填坑投票 RPC
-- ============================================
CREATE OR REPLACE FUNCTION vote_fill(p_fill_id BIGINT, p_vote_type TEXT)
RETURNS VOID AS $$
DECLARE
  existing_vote TEXT;
  up_count INT4;
  down_count INT4;
  v_pit_id BIGINT;
BEGIN
  SELECT vote_type INTO existing_vote FROM pit_fill_votes
    WHERE fill_id = p_fill_id AND user_id = auth.uid();
  
  IF existing_vote IS NOT NULL THEN
    IF existing_vote = p_vote_type THEN
      DELETE FROM pit_fill_votes WHERE fill_id = p_fill_id AND user_id = auth.uid();
      IF p_vote_type = 'up' THEN
        UPDATE pit_fills SET up_votes = GREATEST(up_votes - 1, 0) WHERE id = p_fill_id;
      ELSE
        UPDATE pit_fills SET down_votes = GREATEST(down_votes - 1, 0) WHERE id = p_fill_id;
      END IF;
    ELSE
      UPDATE pit_fill_votes SET vote_type = p_vote_type, created_at = NOW()
        WHERE fill_id = p_fill_id AND user_id = auth.uid();
      IF p_vote_type = 'up' THEN
        UPDATE pit_fills SET up_votes = up_votes + 1, down_votes = GREATEST(down_votes - 1, 0) WHERE id = p_fill_id;
      ELSE
        UPDATE pit_fills SET down_votes = down_votes + 1, up_votes = GREATEST(up_votes - 1, 0) WHERE id = p_fill_id;
      END IF;
    END IF;
  ELSE
    INSERT INTO pit_fill_votes (fill_id, user_id, vote_type) VALUES (p_fill_id, auth.uid(), p_vote_type);
    IF p_vote_type = 'up' THEN
      UPDATE pit_fills SET up_votes = up_votes + 1 WHERE id = p_fill_id;
    ELSE
      UPDATE pit_fills SET down_votes = down_votes + 1 WHERE id = p_fill_id;
    END IF;
  END IF;

  -- 填坑正面票 >= 3 则自动标记坑为已填
  SELECT up_votes, down_votes, pit_id INTO up_count, down_count, v_pit_id FROM pit_fills WHERE id = p_fill_id;
  IF up_count >= 3 AND up_count > down_count THEN
    UPDATE pits SET status = 'filled' WHERE id = v_pit_id AND status = 'pending';
  END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
