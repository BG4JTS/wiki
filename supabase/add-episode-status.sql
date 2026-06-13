-- 添加 episode 状态字段，支持 wiki 协作提节目
-- 请在 Supabase SQL Editor 中执行

ALTER TABLE episodes ADD COLUMN IF NOT EXISTS status TEXT DEFAULT 'draft';

-- 已有数据的节目设为 published
UPDATE episodes SET status = 'published' WHERE status IS NULL;

-- 首页只需要已发布的节目，建索引加速
CREATE INDEX IF NOT EXISTS idx_episodes_status ON episodes(status);
