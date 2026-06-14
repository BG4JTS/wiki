-- 合集/系列功能
-- 合集表
CREATE TABLE IF NOT EXISTS public.collections (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT DEFAULT '',
  cover_url TEXT DEFAULT '',
  created_by UUID REFERENCES auth.users(id),
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- 合集-节目关联表
CREATE TABLE IF NOT EXISTS public.collection_episodes (
  id SERIAL PRIMARY KEY,
  collection_id INTEGER NOT NULL REFERENCES public.collections(id) ON DELETE CASCADE,
  episode_id INTEGER NOT NULL REFERENCES public.episodes(id) ON DELETE CASCADE,
  sort_order INTEGER DEFAULT 0,
  added_by UUID REFERENCES auth.users(id),
  added_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE(collection_id, episode_id)
);

-- RLS: 所有人可查看
ALTER TABLE public.collections ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.collection_episodes ENABLE ROW LEVEL SECURITY;

DO $$ BEGIN
  CREATE POLICY collections_select ON public.collections FOR SELECT USING (true);
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

DO $$ BEGIN
  CREATE POLICY collection_episodes_select ON public.collection_episodes FOR SELECT USING (true);
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

-- 登录用户可创建合集
DO $$ BEGIN
  CREATE POLICY collections_insert ON public.collections FOR INSERT TO authenticated WITH CHECK (true);
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

DO $$ BEGIN
  CREATE POLICY collections_update ON public.collections FOR UPDATE TO authenticated USING (created_by = auth.uid()) WITH CHECK (created_by = auth.uid());
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

DO $$ BEGIN
  CREATE POLICY collections_delete ON public.collections FOR DELETE TO authenticated USING (created_by = auth.uid());
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

-- 登录用户可管理合集内的节目
DO $$ BEGIN
  CREATE POLICY collection_episodes_insert ON public.collection_episodes FOR INSERT TO authenticated WITH CHECK (true);
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

DO $$ BEGIN
  CREATE POLICY collection_episodes_delete ON public.collection_episodes FOR DELETE TO authenticated USING (true);
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

-- 索引
CREATE INDEX IF NOT EXISTS idx_collection_episodes_collection ON public.collection_episodes(collection_id);
CREATE INDEX IF NOT EXISTS idx_collection_episodes_episode ON public.collection_episodes(episode_id);
