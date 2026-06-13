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
}

export default async function HomePage({
  searchParams,
}: {
  searchParams: Promise<{ page?: string }>;
}) {
  const { page } = await searchParams;
  const currentPage = Math.max(1, parseInt(page || "1", 10) || 1);
  const from = (currentPage - 1) * PAGE_SIZE;
  const to = from + PAGE_SIZE - 1;

  const supabase = await createClient();
  const epResult = await supabase
    .from("episodes")
    .select("id, episode_number, title, publish_date, duration, description", {
      count: "exact",
    })
    .order("episode_number", { ascending: false })
    .range(from, to);
  const episodes = (epResult.data ?? []) as EpisodeItem[];
  const totalPages = Math.ceil((epResult.count || 0) / PAGE_SIZE);

  return (
    <div>
      <h1 className="text-2xl font-bold mb-6">节目列表</h1>

      {episodes.length === 0 ? (
        <div className="text-center py-20 text-gray-400">
          <p className="text-lg mb-2">暂无节目</p>
          <p className="text-sm">数据库中尚未添加任何节目，请通过管理后台添加。</p>
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
              href={`/?page=${n}`}
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
