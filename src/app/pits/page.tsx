"use client";

import { useState, useEffect } from "react";
import Link from "next/link";
import { createClient } from "@/lib/supabase/client";

interface PitItem { id: number; episode_id: number | null; title: string; status: string; up_votes: number; down_votes: number; created_at: string; episode_title?: string; fill_count?: number; best_fill_id?: number | null; }

type SortKey = "up_votes" | "created_at";

export default function PitsPage() {
  const supabase = createClient();
  const [pits, setPits] = useState<PitItem[]>([]);
  const [tab, setTab] = useState<"all" | "open" | "pending" | "filled">("all");
  const [sort, setSort] = useState<SortKey>("up_votes");
  const [loading, setLoading] = useState(true);

  useEffect(() => { load(); }, []);

  const load = async () => {
    const r = await supabase.from("pits").select("*").order("up_votes",{ascending:false}).limit(100) as { data:PitItem[]|null; error:unknown };
    const data = r.data ?? [];

    const epIds = [...new Set(data.filter(p=>p.episode_id).map(p=>p.episode_id!))];
    if(epIds.length){
      const er = await supabase.from("episodes").select("id,title").in("id",epIds) as { data:{id:number;title:string}[]|null; error:unknown };
      if(er.data){ const m = new Map(er.data.map(e=>[e.id,e.title])); data.forEach(p=>{if(p.episode_id)p.episode_title=m.get(p.episode_id);}); }
    }
    const pitIds = data.map(p=>p.id);
    if(pitIds.length){
      const fr = await supabase.from("pit_fills").select("pit_id").in("pit_id",pitIds) as { data:{pit_id:number}[]|null; error:unknown };
      if(fr.data){ const cm = new Map<number,number>(); fr.data.forEach(f=>cm.set(f.pit_id,(cm.get(f.pit_id)||0)+1)); data.forEach(p=>{p.fill_count=cm.get(p.id)||0;}); }
    }
    setPits(data); setLoading(false);
  };

  const filtered = pits.filter(p => tab==="all" ? true : p.status===tab).sort((a,b) => {
    if(sort==="up_votes") return b.up_votes - a.up_votes;
    return new Date(b.created_at).getTime() - new Date(a.created_at).getTime();
  });

  const sl:Record<string,string> = { open:"🕳 开放", pending:"⏳ 待填", filled:"✅ 已填" };
  const sc:Record<string,string> = { open:"bg-gray-100 text-gray-600", pending:"bg-yellow-100 text-yellow-700", filled:"bg-green-100 text-green-700" };
  const tabs:Array<{key:typeof tab; label:string}> = [{key:"all",label:"全部"},{key:"open",label:"🕳 开放"},{key:"pending",label:"⏳ 待填"},{key:"filled",label:"✅ 已填"}];

  if(loading) return <div className="text-center py-20 text-gray-400">加载中...</div>;

  return (
    <div>
      <div className="flex items-center justify-between mb-4">
        <h1 className="text-2xl font-bold">🕳 坑</h1>
        <Link href="/pits/new" className="px-4 py-2 bg-indigo-600 text-white text-sm rounded-lg hover:bg-indigo-700">+ 挖坑</Link>
      </div>

      <div className="flex items-center justify-between mb-3 flex-wrap gap-2">
        <div className="flex gap-1">
          {tabs.map(t=>(<button key={t.key} onClick={()=>setTab(t.key)} className={"text-xs px-3 py-1 rounded-full "+(tab===t.key?"bg-indigo-600 text-white":"bg-gray-100 hover:bg-gray-200")}>{t.label}</button>))}
        </div>
        <select value={sort} onChange={e=>setSort(e.target.value as SortKey)} className="text-xs border rounded px-2 py-1">
          <option value="up_votes">👍 票数排序</option>
          <option value="created_at">🕐 时间排序</option>
        </select>
      </div>

      {filtered.length===0?(
        <p className="text-gray-400 text-center py-20">{tab==="all"?"暂无坑":"此分类暂无坑"}</p>
      ):(
        <div className="space-y-3">
          {filtered.map(pit=>(
            <Link key={pit.id} href={"/pits/"+pit.id} className="block bg-white border rounded-lg p-4 hover:shadow-md transition-shadow">
              <div className="flex items-start gap-3">
                <span className={"text-xs px-2 py-0.5 rounded-full shrink-0 mt-0.5 "+sc[pit.status]}>{sl[pit.status]}</span>
                <div className="min-w-0 flex-1">
                  <h3 className="font-semibold text-sm">{pit.title}{pit.best_fill_id?" 🏆":""}</h3>
                  {pit.episode_title&&<p className="text-xs text-indigo-500 mt-0.5">📄 {pit.episode_title}</p>}
                </div>
                <div className="flex items-center gap-3 text-xs text-gray-400 shrink-0">
                  <span>👍 {pit.up_votes}</span><span>👎 {pit.down_votes}</span>
                  {pit.fill_count?<span>💬 {pit.fill_count}</span>:null}
                </div>
              </div>
            </Link>
          ))}
        </div>
      )}
    </div>
  );
}
