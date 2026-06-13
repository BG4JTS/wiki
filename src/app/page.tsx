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

type SortField = "episode_number" | "publish_date";
type SortOrder = "asc" | "desc";

export default async function HomePage({
  searchParams,
}: {
  searchParams: Promise<{ page?: string; tab?: string; sort?: string; order?: string }>;
}) {
  const { page, tab, sort, order } = await searchParams;
  const currentPage = Math.max(1, parseInt(page || "1", 10) || 1);
  const currentTab = tab === "drafts" ? "drafts" : "published";
  const sortField: SortField = (sort === "publish_date" ? "publish_date" : "episode_number");
  const sortOrder: SortOrder = (order === "asc" ? "asc" : "desc");
  const from = (currentPage - 1) * PAGE_SIZE;
  const to = from + PAGE_SIZE - 1;

  const supabase = await createClient();
  let episodes: EpisodeItem[] = [];
  let totalCount = 0;
  try {
    let epResult;
    try {
      epResult = await supabase
        .from("episodes")
        .select("id, episode_number, title, publish_date, duration, description, status", { count: "exact" })
        .order(sortField, { ascending: sortOrder === "asc" })
        .range(from, to);
    } catch {
      epResult = await supabase
        .from("episodes")
        .select("id, episode_number, title, publish_date, duration, description", { count: "exact" })
        .order(sortField, { ascending: sortOrder === "asc" })
        .range(from, to);
    }
    const allData = (epResult.data ?? []) as EpisodeItem[];
    if (currentTab === "published") {
      episodes = allData.filter(ep => !ep.status || ep.status === "published");
    } else {
      episodes = allData.filter(ep => ep.status && ep.status !== "published");
    }
    totalCount = epResult.count || 0;
  } catch { /* query failed, show empty */ }

  const totalPages = Math.max(1, Math.ceil(totalCount / PAGE_SIZE));

  const buildHref = (p: number) => "/?tab=" + currentTab + "&sort=" + sortField + "&order=" + sortOrder + "&page=" + p;

  const statusBadge = (s?: string) => {
    if (!s || s === "published") return null;
    if (s === "pending") return <span className="badge badge-pending ml-1">审核中</span>;
    return <span className="badge badge-draft ml-1">草稿</span>;
  };

  return (
    <div className="animate-fade-in-up">
      {/* Hero */}
      <div className="mb-6">
        <div className="flex flex-col sm:flex-row sm:items-end sm:justify-between gap-3">
          <div>
            <h1 className="text-3xl sm:text-4xl font-bold text-ink-800 tracking-tight">
              原样WIKI
            </h1>
            <p className="text-ink-400 text-sm mt-1.5 max-w-md">
              播客文字稿知识库 — 大家一起补充、讨论、挖坑填坑
            </p>
          </div>
          <Link href="/episodes/new" className="btn btn-primary self-start sm:self-auto text-xs">
            + 提节目
          </Link>
        </div>
      </div>

      {/* Toolbar: Tabs + Sort */}
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3 mb-4 border-b-2 border-ink-200 pb-3">
        {/* Tabs */}
        <div className="flex gap-1">
          <Link
            href={"/?tab=published&sort=" + sortField + "&order=" + sortOrder}
            className={"text-xs px-3 py-1.5 font-medium transition-colors " + (currentTab === "published" ? "bg-ink-700 text-white" : "text-ink-500 hover:bg-ink-100")}
          >
            已发布
          </Link>
          <Link
            href={"/?tab=drafts&sort=" + sortField + "&order=" + sortOrder}
            className={"text-xs px-3 py-1.5 font-medium transition-colors " + (currentTab === "drafts" ? "bg-ink-700 text-white" : "text-ink-500 hover:bg-ink-100")}
          >
            草稿
          </Link>
        </div>

        {/* Sort controls */}
        <div className="flex items-center gap-2 text-xs">
          <span className="text-ink-400">排序:</span>
          <Link
            href={"/?tab=" + currentTab + "&sort=episode_number&order=" + sortOrder}
            className={"px-2 py-1 font-medium transition-colors " + (sortField === "episode_number" ? "bg-ink-100 text-ink-700" : "text-ink-400 hover:text-ink-600")}
          >
            序号
          </Link>
          <Link
            href={"/?tab=" + currentTab + "&sort=publish_date&order=" + sortOrder}
            className={"px-2 py-1 font-medium transition-colors " + (sortField === "publish_date" ? "bg-ink-100 text-ink-700" : "text-ink-400 hover:text-ink-600")}
          >
            时间
          </Link>
          <span className="text-ink-300">|</span>
          <Link
            href={"/?tab=" + currentTab + "&sort=" + sortField + "&order=desc"}
            className={"px-2 py-1 font-mono font-medium transition-colors " + (sortOrder === "desc" ? "bg-ink-100 text-ink-700" : "text-ink-400 hover:text-ink-600")}
          >
            ↓ 倒序
          </Link>
          <Link
            href={"/?tab=" + currentTab + "&sort=" + sortField + "&order=asc"}
            className={"px-2 py-1 font-mono font-medium transition-colors " + (sortOrder === "asc" ? "bg-ink-100 text-ink-700" : "text-ink-400 hover:text-ink-600")}
          >
            ↑ 正序
          </Link>
        </div>
      </div>

      {/* Empty State */}
      {episodes.length === 0 ? (
        <div className="text-center py-20">
          <div className="text-4xl mb-3">{currentTab === "drafts" ? "📝" : "📚"}</div>
          <p className="text-ink-500">{currentTab === "drafts" ? "暂无草稿" : "暂无节目"}</p>
          {currentTab === "published" && (
            <Link href="/episodes/new" className="btn btn-primary text-xs mt-4">来提第一个</Link>
          )}
        </div>
      ) : (
        <>
          {/* Page info */}
          <div className="text-xs text-ink-400 mb-3">
            第 {(currentPage - 1) * PAGE_SIZE + 1}–{Math.min(currentPage * PAGE_SIZE, totalCount)} 期 / 共 {totalCount} 期
          </div>

          {/* Episode list */}
          <div className="space-y-0">
            {episodes.map((ep, i) => (
              <Link
                key={ep.id}
                href={"/episodes/" + ep.episode_number}
                className={"doc-row flex-col p-4 animate-fade-in-up stagger-" + Math.min(i + 1, 5)}
              >
                <div className="flex items-center gap-2 mb-1.5">
                  <span className="text-xs font-mono text-ink-600 font-medium">
                    #{String(ep.episode_number).padStart(3, "0")}
                  </span>
                  {statusBadge(ep.status)}
                </div>
                <h2 className="font-semibold text-ink-800 mb-1 line-clamp-2 text-sm leading-snug">
                  {ep.title}
                </h2>
                {ep.description ? (
                  <p className="text-xs text-ink-400 line-clamp-1">{ep.description}</p>
                ) : null}
                <div className="flex items-center gap-4 text-xs text-ink-300 mt-2">
                  {ep.publish_date && ep.publish_date !== "2014-01-01" ? (
                    <span>{ep.publish_date}</span>
                  ) : null}
                  {ep.duration > 0 ? (
                    <span>{Math.floor(ep.duration / 60)} 分钟</span>
                  ) : null}
                </div>
              </Link>
            ))}
          </div>

          {/* Pagination */}
          {totalPages > 1 && (
            <div className="flex items-center justify-center gap-1 mt-8 text-xs">
              {currentPage > 1 && (
                <Link href={buildHref(1)} className="px-2 py-1.5 border-2 border-ink-300 text-ink-500 hover:border-ink-700 hover:text-ink-700">
                  首页
                </Link>
              )}
              {currentPage > 1 && (
                <Link href={buildHref(currentPage - 1)} className="px-2 py-1.5 border-2 border-ink-300 text-ink-500 hover:border-ink-700 hover:text-ink-700 font-bold">
                  ‹
                </Link>
              )}

              {(() => {
                const pages: number[] = [];
                const start = Math.max(1, currentPage - 2);
                const end = Math.min(totalPages, currentPage + 2);
                if (start > 1) { pages.push(1); if (start > 2) pages.push(-1); }
                for (let p = start; p <= end; p++) pages.push(p);
                if (end < totalPages) { if (end < totalPages - 1) pages.push(-2); pages.push(totalPages); }
                return pages.map((p) => {
                  if (p < 0) return <span key={p} className="px-1 text-ink-300">…</span>;
                  return (
                    <Link
                      key={p}
                      href={buildHref(p)}
                      className={"w-8 h-8 flex items-center justify-center font-medium transition-colors " + (p === currentPage ? "bg-ink-700 text-white" : "border-2 border-ink-300 text-ink-500 hover:border-ink-700 hover:text-ink-700")}
                    >
                      {p}
                    </Link>
                  );
                });
              })()}

              {currentPage < totalPages && (
                <Link href={buildHref(currentPage + 1)} className="px-2 py-1.5 border-2 border-ink-300 text-ink-500 hover:border-ink-700 hover:text-ink-700 font-bold">
                  ›
                </Link>
              )}
              {currentPage < totalPages && (
                <Link href={buildHref(totalPages)} className="px-2 py-1.5 border-2 border-ink-300 text-ink-500 hover:border-ink-700 hover:text-ink-700">
                  末页
                </Link>
              )}
            </div>
          )}
        </>
      )}
    </div>
  );
}
