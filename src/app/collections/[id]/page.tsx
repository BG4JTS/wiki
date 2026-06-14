import { notFound } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import Link from "next/link";

interface Collection {
  id: number;
  name: string;
  description: string;
}

interface Episode {
  id: number;
  episode_number: number;
  title: string;
  publish_date: string;
  duration: number;
}

interface CollectionEpisodeRow {
  episode_id: number;
  sort_order: number;
  episodes: Episode | null;
}

export const dynamic = "force-dynamic";

export default async function CollectionDetailPage({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const { id } = await params;
  const supabase = await createClient();

  const colResult = await supabase.from("collections").select("*").eq("id", id).single();
  const collection = colResult.data as Collection | null;
  if (!collection) notFound();

  const { data } = await supabase
    .from("collection_episodes")
    .select("episode_id, sort_order, episodes(id, episode_number, title, publish_date, duration)")
    .eq("collection_id", id)
    .order("sort_order");
  const eps = (data ?? []) as CollectionEpisodeRow[];

  return (
    <div className="animate-fade-in-up">
      <Link href="/collections" className="text-xs text-ink-400 hover:text-ink-600 mb-4 inline-block">
        ← 返回合集列表
      </Link>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-ink-800">{collection.name}</h1>
        {collection.description && <p className="text-ink-400 text-sm mt-2">{collection.description}</p>}
      </div>
      {eps.length === 0 ? (
        <div className="border-2 border-ink-200 p-12 text-center text-ink-400">此合集还没有节目</div>
      ) : (
        <div className="space-y-2">
          {eps.map((row) => {
            const ep = row.episodes;
            if (!ep) return null;
            return (
              <Link key={ep.id} href={"/episodes/" + ep.episode_number} className="flex items-center gap-4 border-2 border-ink-200 p-4 hover:border-ink-400 transition-colors">
                <span className="text-sm font-mono text-primary font-bold min-w-[60px]">#{ep.episode_number}</span>
                <span className="flex-1 text-sm font-medium text-ink-700">{ep.title}</span>
                <span className="text-xs text-ink-400">{ep.publish_date}</span>
                <span className="text-xs text-ink-300">{Math.floor((ep.duration || 0) / 60)}分钟</span>
              </Link>
            );
          })}
        </div>
      )}
    </div>
  );
}