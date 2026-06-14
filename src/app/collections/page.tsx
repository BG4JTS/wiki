import { createClient } from "@/lib/supabase/server";
import Link from "next/link";

interface Collection {
  id: number;
  name: string;
  description: string;
  created_at: string;
}

export const dynamic = "force-dynamic";

export default async function CollectionsPage() {
  const supabase = await createClient();
  const { data } = await supabase
    .from("collections")
    .select("*")
    .order("created_at", { ascending: false });
  const collections = (data ?? []) as Collection[];

  return (
    <div className="animate-fade-in-up">
      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold text-ink-800">合集</h1>
        <Link href="/collections/new" className="btn btn-primary text-xs">
          + 创建合集
        </Link>
      </div>
      <p className="text-ink-400 text-sm mb-6">节目系列归类，快速找到同一话题的多期节目</p>
      {collections.length === 0 ? (
        <div className="border-2 border-ink-200 p-12 text-center text-ink-400">
          还没有合集，<Link href="/collections/new" className="text-primary font-medium underline">创建第一个</Link>
        </div>
      ) : (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
          {collections.map((c) => (
            <Link key={c.id} href={"/collections/" + c.id} className="block border-2 border-ink-200 p-5 hover:border-ink-400 transition-colors">
              <div className="flex items-center gap-2 mb-2">
                <svg className="w-5 h-5 text-ink-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10" />
                </svg>
                <span className="font-semibold text-ink-700 text-sm">{c.name}</span>
              </div>
              {c.description && <p className="text-xs text-ink-400 line-clamp-2">{c.description}</p>}
              <div className="text-xs text-ink-300 mt-2">{new Date(c.created_at).toLocaleDateString("zh-CN")}</div>
            </Link>
          ))}
        </div>
      )}
    </div>
  );
}