"use client";

import { useEffect, useState, useCallback } from "react";
import { createClient } from "@/lib/supabase/client";
import Link from "next/link";
import { useParams } from "next/navigation";

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

export default function CollectionDetailPage() {
  const params = useParams();
  const id = params.id as string;

  const [collection, setCollection] = useState<Collection | null>(null);
  const [eps, setEps] = useState<Episode[]>([]);
  const [loading, setLoading] = useState(true);
  const [notFound, setNotFound] = useState(false);

  // Add episode form
  const [addNum, setAddNum] = useState("");
  const [addMsg, setAddMsg] = useState("");

  const load = useCallback(async () => {
    const supabase = createClient();
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const colResult = await (supabase.from("collections") as any).select("*").eq("id", id).single();
    if (!colResult.data) { setNotFound(true); setLoading(false); return; }
    setCollection(colResult.data as Collection);

    const { data } = await supabase
      .from("collection_episodes")
      .select("episode_id, sort_order, episodes(id, episode_number, title, publish_date, duration)")
      .eq("collection_id", id)
      .order("sort_order");
    if (data) {
      const list: Episode[] = [];
      data.forEach((row: Record<string, unknown>) => {
        const ep = row.episodes as Episode | undefined;
        if (ep) list.push(ep);
      });
      setEps(list);
    }
    setLoading(false);
  }, [id]);

  useEffect(() => { load(); }, [load]);

  const handleAdd = async () => {
    const num = parseInt(addNum, 10);
    if (isNaN(num) || num <= 0) { setAddMsg("请输入有效期号"); return; }
    const supabase = createClient();
    const epResult = await supabase.from("episodes").select("id, episode_number, title").eq("episode_number", num).limit(1).single();
    const ep = epResult.data as { id: number; episode_number: number; title: string } | null;
    if (!ep) { setAddMsg("未找到 #" + num); return; }
    // Check if already in collection
    const exists = eps.some(e => e.id === ep.id);
    if (exists) { setAddMsg("#" + num + " 已在合集中"); return; }
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const insResult = await (supabase.from("collection_episodes") as any).insert({
      collection_id: parseInt(id, 10),
      episode_id: ep.id,
      sort_order: eps.length
    });
    if (insResult.error) { setAddMsg(insResult.error.message); return; }
    setAddNum(""); setAddMsg("");
    load();
  };

  if (loading) return <div className="animate-fade-in-up text-ink-400 text-sm">加载中...</div>;
  if (notFound) return <div className="animate-fade-in-up text-ink-400">合集不存在</div>;
  if (!collection) return null;

  return (
    <div className="animate-fade-in-up">
      <Link href="/collections" className="text-xs text-ink-400 hover:text-ink-600 mb-4 inline-block">
        ← 返回合集列表
      </Link>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-ink-800">{collection.name}</h1>
        {collection.description && <p className="text-ink-400 text-sm mt-2">{collection.description}</p>}
      </div>

      {/* Add episode */}
      <div className="border-2 border-ink-200 p-4 mb-6">
        <div className="text-sm font-bold text-ink-700 mb-2">添加节目到合集</div>
        <div className="flex gap-2">
          <input type="text" inputMode="numeric" placeholder="输入期号 如 621" value={addNum} onChange={(e) => setAddNum(e.target.value.replace(/\D/g, ""))} onKeyDown={(e) => { if (e.key === "Enter") handleAdd(); }} className="flex-1 border-2 border-ink-200 p-2 text-sm" />
          <button onClick={handleAdd} className="btn btn-primary text-sm">添加</button>
        </div>
        {addMsg && <div className="text-xs text-red-500 mt-1.5">{addMsg}</div>}
      </div>

      {eps.length === 0 ? (
        <div className="border-2 border-ink-200 p-12 text-center text-ink-400">
          此合集还没有节目，输入期号添加第一个
        </div>
      ) : (
        <div className="space-y-2">
          {eps.map((ep) => (
            <Link key={ep.id} href={"/episodes/" + ep.episode_number} className="flex items-center gap-4 border-2 border-ink-200 p-4 hover:border-ink-400 transition-colors">
              <span className="text-sm font-mono text-primary font-bold min-w-[60px]">#{ep.episode_number}</span>
              <span className="flex-1 text-sm font-medium text-ink-700">{ep.title}</span>
              <span className="text-xs text-ink-400">{ep.publish_date}</span>
              <span className="text-xs text-ink-300">{Math.floor((ep.duration || 0) / 60)}分钟</span>
            </Link>
          ))}
        </div>
      )}
    </div>
  );
}