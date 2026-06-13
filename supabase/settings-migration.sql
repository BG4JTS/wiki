-- ============================================
-- 原样WIKI - 站点设置
-- 请在 Supabase SQL Editor 执行
-- ============================================

-- 1. 设置表 (key-value)
CREATE TABLE IF NOT EXISTS site_settings (
  key TEXT PRIMARY KEY,
  value TEXT NOT NULL DEFAULT '',
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 默认值
INSERT INTO site_settings (key, value) VALUES ('auto_approve_episodes', 'false')
ON CONFLICT (key) DO NOTHING;

-- 2. RLS: 任何人可读，仅认证用户可写（应用层校验 admin）
ALTER TABLE site_settings ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "site_settings_select" ON site_settings;
CREATE POLICY "site_settings_select" ON site_settings FOR SELECT USING (true);
DROP POLICY IF EXISTS "site_settings_insert" ON site_settings;
CREATE POLICY "site_settings_insert" ON site_settings FOR INSERT WITH CHECK (auth.role() = 'authenticated');
DROP POLICY IF EXISTS "site_settings_update" ON site_settings;
CREATE POLICY "site_settings_update" ON site_settings FOR UPDATE USING (auth.role() = 'authenticated');

-- 3. 清空数据 RPC（极其危险，仅管理员可用）
CREATE OR REPLACE FUNCTION clear_all_data()
RETURNS TEXT AS $$
BEGIN
  DELETE FROM pit_fill_votes WHERE true;
  DELETE FROM pit_votes WHERE true;
  DELETE FROM pit_fills WHERE true;
  DELETE FROM pits WHERE true;
  DELETE FROM topic_votes WHERE true;
  DELETE FROM topics WHERE true;
  DELETE FROM bgm_songs WHERE true;
  DELETE FROM user_contributions WHERE true;
  DELETE FROM comments WHERE true;
  DELETE FROM timelines WHERE true;
  DELETE FROM episodes WHERE true;
  DELETE FROM site_settings WHERE true;
  INSERT INTO site_settings (key, value) VALUES ('auto_approve_episodes', 'false');
  RETURN 'ok';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 4. 获取设置辅助函数
CREATE OR REPLACE FUNCTION get_setting(p_key TEXT)
RETURNS TEXT AS $$
  SELECT value FROM site_settings WHERE key = p_key;
$$ LANGUAGE sql STABLE;