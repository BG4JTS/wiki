-- 移除 episode_id 的外键强制约束（允许不存在ID，应用层自行校验）
ALTER TABLE pits DROP CONSTRAINT IF EXISTS pits_episode_id_fkey;
ALTER TABLE pit_fills DROP CONSTRAINT IF EXISTS pit_fills_episode_id_fkey;
