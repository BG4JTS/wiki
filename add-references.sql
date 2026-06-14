-- 节目引用功能
CREATE TABLE IF NOT EXISTS public.episode_references (
  id SERIAL PRIMARY KEY,
  from_episode_id INTEGER NOT NULL REFERENCES public.episodes(id) ON DELETE CASCADE,
  to_episode_id INTEGER NOT NULL REFERENCES public.episodes(id) ON DELETE CASCADE,
  timestamp_sec INTEGER DEFAULT 0,
  description TEXT DEFAULT '',
  created_by UUID REFERENCES auth.users(id),
  created_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE(from_episode_id, to_episode_id)
);

ALTER TABLE public.episode_references ENABLE ROW LEVEL SECURITY;

DO $$ BEGIN
  CREATE POLICY episode_references_select ON public.episode_references FOR SELECT USING (true);
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

DO $$ BEGIN
  CREATE POLICY episode_references_insert ON public.episode_references FOR INSERT TO authenticated WITH CHECK (true);
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

DO $$ BEGIN
  CREATE POLICY episode_references_delete ON public.episode_references FOR DELETE TO authenticated USING (true);
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

CREATE INDEX IF NOT EXISTS idx_ep_refs_from ON public.episode_references(from_episode_id);
CREATE INDEX IF NOT EXISTS idx_ep_refs_to ON public.episode_references(to_episode_id);