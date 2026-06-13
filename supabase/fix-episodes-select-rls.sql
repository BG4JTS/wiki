-- 修复：episodes 表缺少 SELECT 策略，导致客户端（Navbar）无法读取
-- 请在 Supabase SQL Editor 中执行此文件
-- https://supabase.com/dashboard/project/_/sql/new

-- 1. episodes 表 — 任何人都可读（幂等：已存在则跳过）
DO $$ BEGIN
  CREATE POLICY "episodes_select" ON episodes FOR SELECT USING (true);
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

-- 2. timelines 表 — 任何人都可读（幂等：先删再建）
DROP POLICY IF EXISTS "timelines_select" ON timelines;
CREATE POLICY "timelines_select" ON timelines FOR SELECT USING (true);

-- 3. 确认 episodes 已开启 RLS（如果没有）
ALTER TABLE episodes ENABLE ROW LEVEL SECURITY;
ALTER TABLE timelines ENABLE ROW LEVEL SECURITY;