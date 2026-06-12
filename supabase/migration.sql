-- ============================================
-- 原样WIKI 数据库迁移文件
-- 请在 Supabase SQL Editor 中执行此文件
-- ============================================

-- 1. 节目主表
CREATE TABLE IF NOT EXISTS episodes (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  episode_number INT4 NOT NULL UNIQUE,
  title TEXT NOT NULL,
  publish_date DATE,
  duration INT4 DEFAULT 0,
  description TEXT DEFAULT '',
  transcript TEXT DEFAULT '',
  created_at TIMESTAMPTZ DEFAULT NOW()
);
CREATE INDEX IF NOT EXISTS idx_episodes_episode_number ON episodes(episode_number);

-- 2. 时间轴
CREATE TABLE IF NOT EXISTS timelines (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  episode_id BIGINT NOT NULL REFERENCES episodes(id) ON DELETE CASCADE,
  timestamp_sec INT4 NOT NULL DEFAULT 0,
  title VARCHAR(100) NOT NULL,
  description TEXT DEFAULT ''
);

-- 3. 评论
CREATE TABLE IF NOT EXISTS comments (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  episode_id BIGINT NOT NULL REFERENCES episodes(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  content TEXT NOT NULL,
  parent_id BIGINT REFERENCES comments(id) ON DELETE CASCADE,
  likes INT4 DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 4. 用户扩展信息
CREATE TABLE IF NOT EXISTS user_profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  username TEXT UNIQUE,
  avatar_url TEXT DEFAULT '',
  bio TEXT DEFAULT ''
);

-- 5. 用户补充信息
CREATE TABLE IF NOT EXISTS user_contributions (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  episode_id BIGINT NOT NULL REFERENCES episodes(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  content_type TEXT NOT NULL CHECK (content_type IN ('link', 'note', 'image_url')),
  content TEXT NOT NULL,
  description VARCHAR(500) DEFAULT '',
  votes INT4 DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- 行级安全策略 (RLS)
-- ============================================

ALTER TABLE episodes ENABLE ROW LEVEL SECURITY;
ALTER TABLE timelines ENABLE ROW LEVEL SECURITY;
ALTER TABLE comments ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_contributions ENABLE ROW LEVEL SECURITY;

-- episodes: 任何人可读，仅管理员可写
CREATE POLICY "episodes_select" ON episodes FOR SELECT USING (true);
CREATE POLICY "episodes_insert" ON episodes FOR INSERT
  WITH CHECK (auth.email() = current_setting('app.admin_email', true));
CREATE POLICY "episodes_update" ON episodes FOR UPDATE
  USING (auth.email() = current_setting('app.admin_email', true));
CREATE POLICY "episodes_delete" ON episodes FOR DELETE
  USING (auth.email() = current_setting('app.admin_email', true));

-- timelines: 任何人可读，仅管理员可写
CREATE POLICY "timelines_select" ON timelines FOR SELECT USING (true);
CREATE POLICY "timelines_insert" ON timelines FOR INSERT
  WITH CHECK (auth.email() = current_setting('app.admin_email', true));
CREATE POLICY "timelines_update" ON timelines FOR UPDATE
  USING (auth.email() = current_setting('app.admin_email', true));
CREATE POLICY "timelines_delete" ON timelines FOR DELETE
  USING (auth.email() = current_setting('app.admin_email', true));

-- comments: 任何人可读，登录用户可创建自己的评论，仅自己的可改/删
CREATE POLICY "comments_select" ON comments FOR SELECT USING (true);
CREATE POLICY "comments_insert" ON comments FOR INSERT
  WITH CHECK (auth.role() = 'authenticated' AND user_id = auth.uid());
CREATE POLICY "comments_update" ON comments FOR UPDATE
  USING (auth.uid() = user_id);
CREATE POLICY "comments_delete" ON comments FOR DELETE
  USING (auth.uid() = user_id);

-- user_profiles: 任何人可读，仅自己可改
CREATE POLICY "profiles_select" ON user_profiles FOR SELECT USING (true);
CREATE POLICY "profiles_insert" ON user_profiles FOR INSERT
  WITH CHECK (auth.uid() = id);
CREATE POLICY "profiles_update" ON user_profiles FOR UPDATE
  USING (auth.uid() = id);

-- user_contributions: 任何人可读，登录用户可创建
CREATE POLICY "contributions_select" ON user_contributions FOR SELECT USING (true);
CREATE POLICY "contributions_insert" ON user_contributions FOR INSERT
  WITH CHECK (auth.role() = 'authenticated');

-- ============================================
-- 触发器：用户注册时自动创建 Profile
-- ============================================

CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.user_profiles (id, username, avatar_url)
  VALUES (
    NEW.id,
    COALESCE(NEW.raw_user_meta_data->>'username', 'user_' || SUBSTRING(NEW.id::text, 1, 8)),
    ''
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- ============================================
-- 投票 RPC 函数
-- ============================================

CREATE OR REPLACE FUNCTION public.increment_votes(contribution_id BIGINT)
RETURNS VOID AS $$
BEGIN
  UPDATE user_contributions SET votes = votes + 1 WHERE id = contribution_id;
END;
$$ LANGUAGE plpgsql;
