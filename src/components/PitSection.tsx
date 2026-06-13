import Link from "next/link";
import { createClient } from "@/lib/supabase/server";

interface PitItem {
  id: number; title: string; status: string; up_votes: number; down_votes: number;
}

export default async function PitSection({ episodeId }: { episodeId: number }) {
  const supabase = await createClient();
  let pits: PitItem[] = [];
  try {
    const result = await supabase.from("pits").select("id, title, status, up_votes, down_votes")
      .eq("episode_id", episodeId).order("up_votes", { ascending: false }).limit(10) as { data: PitItem[] | null; error: unknown };
    pits = result.data ?? [];
  } catch { /* ignore */ }

  if (pits.length === 0) return null;

  const statusEmoji: Record<string, string> = { open: "🕳", pending: "⏳", filled: "✅" };

  return (
    <div>
      <h2 className="section-title mb-3">🕳 相关坑</h2>
      <div className="space-y-1.5">
        {pits.map(p => (
          <Link key={p.id} href={`/pits/${p.id}`}
            className="card card-interactive px-3 py-2.5 text-sm flex items-center gap-2">
            <span>{statusEmoji[p.status]}</span>
            <span className="flex-1 truncate">{p.title}</span>
            <span className="text-xs text-ink-300 shrink-0">👍{p.up_votes} 👎{p.down_votes}</span>
          </Link>
        ))}
      </div>
    </div>
  );
}