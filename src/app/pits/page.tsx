"use client";

import { useState, useEffect } from "react";
import Link from "next/link";
import { createClient } from "@/lib/supabase/client";

interface PitItem { id: number; episode_id: number | null; user_id: string; title: string; status: string; up_votes: number; down_votes: number; created_at: string; episode_title?: string; fill_count?: number; best_fill_id?: number | null; }

type SortKey = "up_votes" | "created_at";

export default function PitsPage() {
  const supabase = createClient();
  const [pits, setPits] = useState<PitItem[]>([]);
  const [tab, setTab] = useState<"all" | "open" | "pending" | "filled">("all");
  const [sort, setSort] = useState<SortKey>("up_votes");
  const [profiles, setProfiles] = useState<Map<string,{username:string;avatar_url:string}>>(new Map());
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
    const uids=[...new Set(data.map((p:PitItem)=>p.user_id||"").filter(Boolean))];
    if(uids.length){
      const pr=await supabase.from("user_profiles").select("id,username,avatar_url").in("id",uids)as{data:{id:string;username:string;avatar_url:string}[]|null;error:unknown};
      if(pr.data)setProfiles(new Map(pr.data.map(p=>[p.id,p])));
    }
    setPits(data); setLoading(false);
  };

  const filtered = pits.filter(p => tab==="all" ? true : p.status===tab).sort((a,b) => {
    if(sort==="up_votes") return b.up_votes - a.up_votes;
    return new Date(b.created_at).getTime() - new Date(a.created_at).getTime();
  });

  const sl:Record<string,string> = { open:"🕳 开放", pending:"⏳ 待填", filled:"✅ 已填" };
  const sc:Record<string,string> = { open:"badge-brand", pending:"badge-pending", filled:"badge-published" };
  const tabs:Array<{key:typeof tab; label:string}> = [
    {key:"all",label:"全部"},{key:"open",label:"开放"},{key:"pending",label:"待填"},{key:"filled",label:"已填"}
  ];

  if(loading) return (
    <div className="animate-fade-in space-y-4">
      <div className="skeleton h-9 w-32" />
      <div className="flex gap-2">
        {[1,2,3,4].map(i=><div key={i} className="skeleton h-7 w-16 rounded-full" />)}
      </div>
      {[1,2,3,4,5].map(i=><div key={i} className="skeleton h-20 w-full rounded-xl" />)}
    </div>
  );

  return (
    <div className="animate-fade-in-up">
      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold text-ink-800">🕳 坑</h1>
        <Link href="/pits/new" className="btn btn-primary text-sm">+ 挖坑</Link>
      </div>

      <div className="flex items-center justify-between mb-4 flex-wrap gap-2">
        <div className="flex gap-1">
          {tabs.map(t=>(
            <button key={t.key} onClick={()=>setTab(t.key)}
              className={`text-xs px-3 py-1.5 rounded-full font-medium transition-all ${
                tab===t.key ? "bg-brand-500 text-white shadow-sm" : "bg-white text-ink-500 border border-ink-100 hover:border-brand-200"
              }`}>
              {t.label}
            </button>
          ))}
        </div>
        <select value={sort} onChange={e=>setSort(e.target.value as SortKey)} className="text-xs border border-ink-200 rounded-lg px-3 py-1.5 bg-white text-ink-500">
          <option value="up_votes">👍 票数排序</option>
          <option value="created_at">🕐 时间排序</option>
        </select>
      </div>

      {filtered.length===0 ? (
        <div className="text-center py-20">
          <div className="text-4xl mb-3">🕳</div>
          <p className="text-ink-400">{tab==="all"?"暂无坑":"此分类暂无坑"}</p>
        </div>
      ) : (
        <div className="space-y-3">
          {filtered.map(pit=>{
            const pp=profiles.get(pit.user_id);
            return (
            <Link key={pit.id} href={"/pits/"+pit.id} className="card card-interactive p-4 flex items-start gap-3">
              <span className={`badge shrink-0 mt-0.5 ${sc[pit.status]}`}>{sl[pit.status]}</span>
              <div className="min-w-0 flex-1">
                <h3 className="font-semibold text-sm text-ink-800">{pit.title}{pit.best_fill_id?" 🏆":""}</h3>
                {pit.episode_title&&<p className="text-xs text-brand-500 mt-0.5">📄 {pit.episode_title}</p>}
              </div>
              <div className="flex items-center gap-3 text-xs text-ink-400 shrink-0">
                {pp && <span className="inline-flex items-center gap-1"><img src={pp.avatar_url||""} alt="" className="w-3.5 h-3.5 rounded-full object-cover" onError={e=>{(e.target as HTMLImageElement).style.display="none"}}/>{pp.username}</span>}
                <span>👍 {pit.up_votes}</span>
                <span>👎 {pit.down_votes}</span>
                {pit.fill_count?<span>💬 {pit.fill_count}</span>:null}
              </div>
            </Link>
          )})}
        </div>
      )}
    </div>
  );
}