import Link from "next/link";
import { createClient } from "@/lib/supabase/server";

const PAGE_SIZE = 20;

interface EpisodeItem {
  id: number;
  episode_number: number;
  title: string;
  publish_date: string;
  duration: number;
  description: string;
  status?: string;
}

export default async function HomePage({
  searchParams,
}: {
  searchParams: Promise<{ page?: string; tab?: string }>;
}) {
  const { page, tab } = await searchParams;
  const currentPage = Math.max(1, parseInt(page || "1", 10) || 1);
  const currentTab = tab === "drafts" ? "drafts" : "published";
  const from = (currentPage - 1) * PAGE_SIZE;
  const to = from + PAGE_SIZE - 1;

  const supabase = await createClient();
  let episodes: EpisodeItem[] = [];
  let totalPages = 0;
  try {
    let epResult;
    try {
      epResult = await supabase
        .from("episodes")
        .select("id, episode_number, title, publish_date, duration, description, status", { count: "exact" })
        .order("episode_number", { ascending: false })
        .range(from, to);
    } catch {
      epResult = await supabase
        .from("episodes")
        .select("id, episode_number, title, publish_date, duration, description", { count: "exact" })
        .order("episode_number", { ascending: false })
        .range(from, to);
    }
    const allData = (epResult.data ?? []) as EpisodeItem[];
    // JS 层按标签过滤
    if (currentTab === "published") {
      episodes = allData.filter(ep => !ep.status || ep.status === "published");
    } else {
      episodes = allData.filter(ep => ep.status && ep.status !== "published");
    }
    totalPages = Math.ceil((epResult.count || 0) / PAGE_SIZE);
  } catch { /* query failed, show empty */ }

  const tabs = [
    { key: "published", label: "已发布" },
    { key: "drafts", label: "草稿" },
  ];

  const statusLabel: Record<string, string> = {
    draft: "📝 草稿",
    pending: "⏳ 待审核",
  };

  return (
    <div>
      <div className="flex items-center justify-between mb-4">
        <h1 className="text-2xl font-bold">节目列表</h1>
        <Link href="/episodes/new" className="px-4 py-2 bg-indigo-600 text-white text-sm rounded-lg hover:bg-indigo-700">+ 提节目</Link>
      </div>

      <div className="flex gap-1 mb-4">
        {tabs.map(t => (
          <Link
            key={t.key}
            href={`/?tab=${t.key}`}
            className={`text-xs px-3 py-1 rounded-full ${currentTab === t.key ? "bg-indigo-600 text-white" : "bg-gray-100 hover:bg-gray-200"}`}
          >
            {t.label}
          </Link>
        ))}
      </div>

      {episodes.length === 0 ? (
        <div className="text-center py-20 text-gray-400">
          <p className="text-lg mb-2">{currentTab === "drafts" ? "暂无草稿" : "暂无节目"}</p>
          <p className="text-sm">
            {currentTab === "published" ? (
              <>还没有已发布的节目，<Link href="/episodes/new" className="text-indigo-500 hover:underline">来提第一个</Link></>
            ) : (
              <>还没有草稿节目，<Link href="/episodes/new" className="text-indigo-500 hover:underline">来提一个</Link></>
            )}
          </p>
        </div>
      ) : (
        <div className="space-y-4">
          {episodes.map((ep) => (
            <Link
              key={ep.id}
              href={`/episodes/${ep.id}`}
              className="block bg-white rounded-lg shadow-sm border p-5 hover:shadow-md transition-shadow"
            >
              <div className="flex items-baseline gap-3 mb-2">
                <span className="text-indigo-600 font-mono text-sm">
                  #{ep.episode_number}
                </span>
                <h2 className="text-lg font-semibold">{ep.title}</h2>
                {ep.status && ep.status !== "published" && (
                  <span className={`text-xs px-2 py-0.5 rounded-full ${ep.status === "pending" ? "bg-yellow-100 text-yellow-700" : "bg-gray-100 text-gray-500"}`}>
                    {statusLabel[ep.status] || ep.status}
                  </span>
                )}
              </div>
              <p className="text-sm text-gray-500 line-clamp-2">
                {ep.description}
              </p>
              <div className="flex gap-4 mt-3 text-xs text-gray-400">
                <span>{ep.publish_date}</span>
                <span>{Math.floor(ep.duration / 60)} 分钟</span>
              </div>
            </Link>
          ))}
        </div>
      )}

      {totalPages > 1 && (
        <div className="flex justify-center gap-2 mt-8">
          {Array.from({ length: totalPages }, (_, i) => i + 1).map((n) => (
            <Link
              key={n}
              href={`/?tab=${currentTab}&page=${n}`}
              className={`px-3 py-1 rounded text-sm ${
                n === currentPage
                  ? "bg-indigo-600 text-white"
                  : "bg-white border hover:bg-gray-50"
              }`}
            >
              {n}
            </Link>
          ))}
        </div>
      )}
    </div>
  );
}
