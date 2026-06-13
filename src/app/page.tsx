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
 let totalCount = 0;
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
 if (currentTab === "published") {
 episodes = allData.filter(ep => !ep.status || ep.status === "published");
 } else {
 episodes = allData.filter(ep => ep.status && ep.status !== "published");
 }
 totalCount = epResult.count || 0;
 } catch { /* query failed, show empty */ }

 const totalPages = Math.ceil(totalCount / PAGE_SIZE);

 const statusBadge = (s?: string) => {
 if (!s || s === "published") return null;
 if (s === "pending") return <span className="badge badge-pending">⏳ 待审核</span>;
 return <span className="badge badge-draft">📝 草稿</span>;
 };

 return (
 <div className="animate-fade-in-up">
 {/* Hero */}
 <div className="mb-8 sm:mb-10">
 <div className="flex flex-col sm:flex-row sm:items-end sm:justify-between gap-4">
 <div>
 <h1 className="text-3xl sm:text-4xl font-bold text-ink-800 tracking-tight">
 原样WIKI
 </h1>
 <p className="text-ink-400 text-sm mt-2 max-w-md">
 播客文字稿知识库 — 大家一起补充、讨论、挖坑填坑
 </p>
 </div>
 <Link href="/episodes/new" className="btn btn-primary self-start sm:self-auto">
 <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
 <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 4v16m8-8H4" />
 </svg>
 提节目
 </Link>
 </div>
 </div>

 {/* Tabs */}
 <div className="flex items-center gap-3 mb-6 border-b border-ink-200 pb-3">
 <Link
 href="/?tab=published"
 className={`text-sm font-medium pb-1.5 border-b-2 transition-colors ${
 currentTab === "published"
 ? "border-brand-500 text-brand-600"
 : "border-transparent text-ink-400 hover:text-ink-600"
 }`}
 >
 已发布
 </Link>
 <Link
 href="/?tab=drafts"
 className={`text-sm font-medium pb-1.5 border-b-2 transition-colors ${
 currentTab === "drafts"
 ? "border-brand-500 text-brand-600"
 : "border-transparent text-ink-400 hover:text-ink-600"
 }`}
 >
 草稿
 </Link>
 </div>

 {/* Empty State */}
 {episodes.length === 0 ? (
 <div className="text-center py-20">
 <div className="text-5xl mb-4">{currentTab === "drafts" ? "📝" : "📚"}</div>
 <p className="text-lg font-medium text-ink-500 mb-1">
 {currentTab === "drafts" ? "暂无草稿" : "暂无节目"}
 </p>
 <p className="text-sm text-ink-400 mb-6">
 {currentTab === "published"
 ? "还没有已发布的节目，来提第一个吧"
 : "还没有草稿节目"}
 </p>
 <Link href="/episodes/new" className="btn btn-primary text-sm">
 来提第一个
 </Link>
 </div>
 ) : (
 /* Episode Cards */
 <div className="space-y-0">
 {episodes.map((ep, i) => (
 <Link
 key={ep.id}
 href={`/episodes/${ep.id}`}
 className={`card card-interactive p-5 flex flex-col animate-fade-in-up stagger-${Math.min(i + 1, 5)}`}
 >
 <div className="flex items-center gap-2 mb-2">
 <span className="text-xs font-mono text-brand-500 font-medium">
 #{ep.episode_number}
 </span>
 {statusBadge(ep.status)}
 </div>
 <h2 className="font-semibold text-ink-800 mb-1.5 line-clamp-2 leading-snug">
 {ep.title}
 </h2>
 <p className="text-xs text-ink-400 line-clamp-2 mb-3 flex-1">
 {ep.description || "暂无简介"}
 </p>
 <div className="flex items-center gap-3 text-xs text-ink-300 pt-3 border-t-2 border-ink-200">
 <span className="flex items-center gap-1">
 <svg className="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
 <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
 </svg>
 {ep.publish_date}
 </span>
 <span className="flex items-center gap-1">
 <svg className="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
 <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
 </svg>
 {Math.floor(ep.duration / 60)} 分钟
 </span>
 </div>
 </Link>
 ))}
 </div>
 )}

 {/* Pagination */}
 {totalPages > 1 && (
 <div className="flex justify-center gap-1.5 mt-10">
 {Array.from({ length: totalPages }, (_, i) => i + 1).map((n) => (
 <Link
 key={n}
 href={`/?tab=${currentTab}&page=${n}`}
 className={`w-9 h-9 flex items-center justify-center text-sm font-medium transition-all ${
 n === currentPage
 ? "bg-ink-700 text-white dark:bg-ink-600 "
 : "bg-white text-ink-500 border-2 border-ink-300 dark:bg-[#1a1a1a] dark:border-[#525252] dark:text-ink-400 hover:border-ink-700 hover:text-ink-700"
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
