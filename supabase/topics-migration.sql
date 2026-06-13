-- ============================================
-- 原样WIKI - 选题库
-- 请在 Supabase SQL Editor 执行
-- ============================================

-- 1. 选题主表
CREATE TABLE IF NOT EXISTS topics (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  description TEXT DEFAULT '',
  up_votes INT4 DEFAULT 0,
  down_votes INT4 DEFAULT 0,
  status TEXT NOT NULL DEFAULT 'open' CHECK (status IN ('open', 'closed')),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. 选题投票（一人一票，可切换/取消）
CREATE TABLE IF NOT EXISTS topic_votes (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  topic_id BIGINT NOT NULL REFERENCES topics(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  vote_type TEXT NOT NULL CHECK (vote_type IN ('up', 'down')),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(topic_id, user_id)
);

-- 3. 索引
CREATE INDEX IF NOT EXISTS idx_topics_up_votes ON topics(up_votes DESC);
CREATE INDEX IF NOT EXISTS idx_topics_created_at ON topics(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_topics_status ON topics(status);

-- ============================================
-- RLS
-- ============================================
ALTER TABLE topics ENABLE ROW LEVEL SECURITY;
ALTER TABLE topic_votes ENABLE ROW LEVEL SECURITY;

-- topics: 任何人可读，登录用户可创建，作者可更新
CREATE POLICY "topics_select" ON topics FOR SELECT USING (true);
CREATE POLICY "topics_insert" ON topics FOR INSERT WITH CHECK (auth.role() = 'authenticated');
CREATE POLICY "topics_update" ON topics FOR UPDATE USING (auth.uid() = user_id);

-- topic_votes: 任何人可读，登录用户可投票
CREATE POLICY "topic_votes_select" ON topic_votes FOR SELECT USING (true);
CREATE POLICY "topic_votes_insert" ON topic_votes FOR INSERT WITH CHECK (auth.role() = 'authenticated' AND auth.uid() = user_id);

-- ============================================
-- 投票 RPC：投票并自动更新计票
-- ============================================
CREATE OR REPLACE FUNCTION vote_topic(p_topic_id BIGINT, p_vote_type TEXT)
RETURNS VOID AS $$
DECLARE
  existing_vote TEXT;
BEGIN
  SELECT vote_type INTO existing_vote FROM topic_votes
    WHERE topic_id = p_topic_id AND user_id = auth.uid();

  IF existing_vote IS NOT NULL THEN
    IF existing_vote = p_vote_type THEN
      DELETE FROM topic_votes WHERE topic_id = p_topic_id AND user_id = auth.uid();
      IF p_vote_type = 'up' THEN
        UPDATE topics SET up_votes = GREATEST(up_votes - 1, 0) WHERE id = p_topic_id;
      ELSE
        UPDATE topics SET down_votes = GREATEST(down_votes - 1, 0) WHERE id = p_topic_id;
      END IF;
    ELSE
      UPDATE topic_votes SET vote_type = p_vote_type, created_at = NOW()
        WHERE topic_id = p_topic_id AND user_id = auth.uid();
      IF p_vote_type = 'up' THEN
        UPDATE topics SET up_votes = up_votes + 1, down_votes = GREATEST(down_votes - 1, 0) WHERE id = p_topic_id;
      ELSE
        UPDATE topics SET down_votes = down_votes + 1, up_votes = GREATEST(up_votes - 1, 0) WHERE id = p_topic_id;
      END IF;
    END IF;
  ELSE
    INSERT INTO topic_votes (topic_id, user_id, vote_type) VALUES (p_topic_id, auth.uid(), p_vote_type);
    IF p_vote_type = 'up' THEN
      UPDATE topics SET up_votes = up_votes + 1 WHERE id = p_topic_id;
    ELSE
      UPDATE topics SET down_votes = down_votes + 1 WHERE id = p_topic_id;
    END IF;
  END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;