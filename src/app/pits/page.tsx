import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import type { Pit, UserProfile } from "@/types/database";

interface PitWithMeta extends Pit {
  episode_title?: string;
  fill_count?: number;
}

export const dynamic = "force-dynamic";

export default async function PitsPage() {
  const supabase = await createClient();
  let pits: PitWithMeta[] = [];

  try {
    const result = await supabase
      .from("pits")
      .select("*")
      .order("up_votes", { ascending: false })
      .order("created_at", { ascending: false })
      .limit(50) as { data: PitWithMeta[] | null; error: unknown };
    pits = result.data ?? [];

    // 批量取节目标题
    const epIds = [...new Set(pits.filter(p => p.episode_id).map(p => p.episode_id!))];
    if (epIds.length > 0) {
      const epResult = await supabase
        .from("episodes")
        .select("id, title")
        .in("id", epIds) as { data: { id: number; title: string }[] | null; error: unknown };
      if (epResult.data) {
        const epMap = new Map(epResult.data.map(e => [e.id, e.title]));
        pits.forEach(p => { if (p.episode_id) p.episode_title = epMap.get(p.episode_id); });
      }
    }

    // 批量取填坑数
    const pitIds = pits.map(p => p.id);
    if (pitIds.length > 0) {
      const fillResult = await supabase
        .from("pit_fills")
        .select("pit_id")
        .in("pit_id", pitIds) as { data: { pit_id: number }[] | null; error: unknown };
      if (fillResult.data) {
        const countMap = new Map<number, number>();
        fillResult.data.forEach(f => countMap.set(f.pit_id, (countMap.get(f.pit_id) || 0) + 1));
        pits.forEach(p => { p.fill_count = countMap.get(p.id) || 0; });
      }
    }
  } catch { /* empty */ }

  const statusLabel: Record<string, string> = {
    open: "🕳 开放",
    pending: "⏳ 待填",
    filled: "✅ 已填",
  };

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold">🕳 坑</h1>
        <Link href="/pits/new" className="px-4 py-2 bg-indigo-600 text-white text-sm rounded-lg hover:bg-indigo-700">
          + 挖坑
        </Link>
      </div>

      {pits.length === 0 ? (
        <p className="text-gray-400 text-center py-20">暂无坑，来挖第一个吧</p>
      ) : (
        <div className="space-y-3">
          {pits.map((pit) => (
            <Link
              key={pit.id}
              href={`/pits/${pit.id}`}
              className="block bg-white border rounded-lg p-4 hover:shadow-md transition-shadow"
            >
              <div className="flex items-start gap-3">
                <span className={`text-xs px-2 py-0.5 rounded-full shrink-0 mt-0.5 ${
                  pit.status === "pending" ? "bg-yellow-100 text-yellow-700" :
                  pit.status === "filled" ? "bg-green-100 text-green-700" :
                  "bg-gray-100 text-gray-600"
                }`}>
                  {statusLabel[pit.status]}
                </span>
                <div className="min-w-0">
                  <h3 className="font-semibold text-sm">{pit.title}</h3>
                  {pit.episode_title && (
                    <p className="text-xs text-indigo-500 mt-0.5">📄 {pit.episode_title}</p>
                  )}
                </div>
                <div className="ml-auto flex items-center gap-3 text-xs text-gray-400 shrink-0">
                  <span>👍 {pit.up_votes}</span>
                  <span>👎 {pit.down_votes}</span>
                  {pit.fill_count != null && pit.fill_count > 0 && (
                    <span>💬 {pit.fill_count}</span>
                  )}
                </div>
              </div>
            </Link>
          ))}
        </div>
      )}
    </div>
  );
}
