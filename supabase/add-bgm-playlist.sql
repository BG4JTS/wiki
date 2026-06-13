-- BGM 歌单表
-- 请在 Supabase SQL Editor 中执行

CREATE TABLE IF NOT EXISTS bgm_playlist (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  episode_id BIGINT NOT NULL REFERENCES episodes(id) ON DELETE CASCADE,
  timestamp_sec INT4 NOT NULL DEFAULT 0,
  title TEXT NOT NULL,
  artist TEXT DEFAULT '',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_bgm_playlist_episode ON bgm_playlist(episode_id, timestamp_sec);

ALTER TABLE bgm_playlist ENABLE ROW LEVEL SECURITY;

-- 任何人可读
CREATE POLICY "bgm_select" ON bgm_playlist FOR SELECT USING (true);
-- 登录用户可写
CREATE POLICY "bgm_insert" ON bgm_playlist FOR INSERT WITH CHECK (auth.role() = 'authenticated');
CREATE POLICY "bgm_update" ON bgm_playlist FOR UPDATE USING (auth.role() = 'authenticated');
CREATE POLICY "bgm_delete" ON bgm_playlist FOR DELETE USING (auth.role() = 'authenticated');
