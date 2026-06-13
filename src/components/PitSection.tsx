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
    <div className="mt-6">
      <h2 className="text-lg font-semibold mb-3">🕳 相关坑</h2>
      <div className="space-y-2">
        {pits.map(p => (
          <Link key={p.id} href={`/pits/${p.id}`}
            className="block bg-white border rounded-lg px-3 py-2 text-sm hover:shadow-sm">
            <span className="mr-2">{statusEmoji[p.status]}</span>
            {p.title}
            <span className="ml-2 text-xs text-gray-400">👍{p.up_votes} 👎{p.down_votes}</span>
          </Link>
        ))}
      </div>
    </div>
  );
}
