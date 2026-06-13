-- 为 pits 和 pit_fills 添加时间戳字段
ALTER TABLE pits ADD COLUMN IF NOT EXISTS timestamp_sec INT4 DEFAULT NULL;
ALTER TABLE pit_fills ADD COLUMN IF NOT EXISTS timestamp_sec INT4 DEFAULT NULL;
