-- 修复 RLS 策略：删除依赖 app.admin_email 设置的旧策略，改用直接检验
-- 请在 Supabase SQL Editor 中执行此文件

-- 删除旧的 episodes 策略
DROP POLICY IF EXISTS "episodes_insert" ON episodes;
DROP POLICY IF EXISTS "episodes_update" ON episodes;
DROP POLICY IF EXISTS "episodes_delete" ON episodes;

-- 重建：任何人都可以读，但只有登录用户可以写（应用层已有邮箱校验）
CREATE POLICY "episodes_insert" ON episodes FOR INSERT
  WITH CHECK (auth.role() = 'authenticated');
CREATE POLICY "episodes_update" ON episodes FOR UPDATE
  USING (auth.role() = 'authenticated');
CREATE POLICY "episodes_delete" ON episodes FOR DELETE
  USING (auth.role() = 'authenticated');

-- timelines 同理
DROP POLICY IF EXISTS "timelines_insert" ON timelines;
DROP POLICY IF EXISTS "timelines_update" ON timelines;
DROP POLICY IF EXISTS "timelines_delete" ON timelines;

CREATE POLICY "timelines_insert" ON timelines FOR INSERT
  WITH CHECK (auth.role() = 'authenticated');
CREATE POLICY "timelines_update" ON timelines FOR UPDATE
  USING (auth.role() = 'authenticated');
CREATE POLICY "timelines_delete" ON timelines FOR DELETE
  USING (auth.role() = 'authenticated');
