"use client";

import { useState } from "react";
import Link from "next/link";
import { parseTimeInput } from "@/lib/time";
import { createClient } from "@/lib/supabase/client";

interface FillItem {
  id: number; pit_id: number; episode_id: number | null; timestamp_sec: number | null;
  user_id: string; description: string; up_votes: number; down_votes: number; created_at: string;
}

export default function FillSection({ pitId, pitStatus, fills, fillEpisodes, fillEpNums, userId, ownerId, bestFillId, onSetBest, onVoted }: {
  pitId: number; pitStatus: string; fills: FillItem[];
  fillEpisodes: Map<number, string>; fillEpNums: Map<number, number>; userId: string | null; ownerId: string | null;
  bestFillId: number | null; onSetBest?: (fillId: number) => void; onVoted?: () => void;
}) {
  const supabase = createClient();
  const [showForm, setShowForm] = useState(false);
  const [desc, setDesc] = useState(""); const [epId, setEpId] = useState("");
  const [tsDisplay, setTsDisplay] = useState(""); const [error, setError] = useState("");

  const handleSubmit = async () => {
    if(!desc.trim()||!userId) return;
    const { error: err } = await supabase.from("pit_fills").insert({
      pit_id:pitId, user_id:userId, description:desc.trim(),
      episode_id:epId?parseInt(epId):null, timestamp_sec:tsDisplay?parseTimeInput(tsDisplay):null
    } as never);
    if(err){ setError(err.message); return; }
    setDesc(""); setEpId(""); setTsDisplay(""); setShowForm(false); onVoted?.();
  };

  const voteFill = async (fillId: number, type: "up"|"down") => {
    if(!userId) return;
    await supabase.rpc("vote_fill", { p_fill_id:fillId, p_vote_type:type } as never);
    onVoted?.();
  };

  return (
    <div>
      <div className="flex items-center justify-between mb-4">
        <h2 className="section-title">📝 填坑 ({fills.length})</h2>
        {userId && pitStatus==="pending" && (
          <button onClick={()=>setShowForm(!showForm)} className="btn btn-ghost text-xs">{showForm?"取消":"+ 填坑"}</button>
        )}
      </div>
      {showForm&&(
        <div className="card p-4 mb-4 space-y-2">
          <textarea value={desc} onChange={e=>setDesc(e.target.value)} rows={3} placeholder="你的解答..." className="input resize-none" />
          <input type="number" value={epId} onChange={e=>setEpId(e.target.value)} placeholder="引用节目 ID" className="input" />
          <input type="text" value={tsDisplay} onChange={e=>setTsDisplay(e.target.value)} placeholder="12:34" className="input" />
          {error&&<p className="text-xs text-red-500">{error}</p>}
          <button onClick={handleSubmit} className="btn btn-primary w-full text-sm">提交</button>
        </div>
      )}
      {fills.length===0?(
        <p className="text-sm text-ink-400">暂无填坑</p>
      ):(
        <div className="space-y-2.5">
          {fills.map(f=>{
            const isBest = f.id===bestFillId;
            const isOwner = userId===ownerId;
            return (
            <div key={f.id} className={`card p-4 text-sm ${isBest?"bg-green-50 border-green-200":""}`}>
              <div className="flex items-start justify-between gap-2">
                <p className="text-ink-700">{f.description}</p>
                <div className="shrink-0">
                  {isBest?<span className="badge badge-published text-xs">🏆 最佳</span>
                   :isOwner?<button onClick={()=>onSetBest?.(f.id)} className="btn btn-ghost text-xs">选为最佳</button>
                   :null}
                </div>
              </div>
              <div className="flex flex-wrap gap-x-3 gap-y-0.5 mt-2 text-xs text-ink-400">
                {f.episode_id && fillEpisodes.get(f.episode_id) && (
                  <Link href={"/episodes/" + (fillEpNums.get(f.episode_id!) ?? f.episode_id)} className="text-brand-500 hover:text-brand-600 font-medium">📄 {fillEpisodes.get(f.episode_id)}</Link>
                )}
                {f.timestamp_sec!=null && <span>⏱ {formatTime(f.timestamp_sec)}</span>}
              </div>
              <div className="flex items-center gap-3 mt-2">
                <button onClick={()=>voteFill(f.id,"up")}
                  className={`text-xs font-medium ${userId?"hover:text-green-600 text-green-500":"text-ink-300"}`}>👍 {f.up_votes}</button>
                <button onClick={()=>voteFill(f.id,"down")}
                  className={`text-xs font-medium ${userId?"hover:text-red-500 text-red-400":"text-ink-300"}`}>👎 {f.down_votes}</button>
              </div>
            </div>);
          })}
        </div>
      )}
    </div>
  );
}

function formatTime(sec: number | null): string {
  if(sec==null) return ""; const m=Math.floor(sec/60),s=sec%60;
  return m+":"+String(s).padStart(2,"0");
}