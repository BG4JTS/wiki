"use client";

import { useState } from "react";
import Link from "next/link";
import { createClient } from "@/lib/supabase/client";

interface FillItem {
  id: number; pit_id: number; episode_id: number | null; timestamp_sec: number | null;
  user_id: string; description: string; up_votes: number; down_votes: number; created_at: string;
}

export default function FillSection({ pitId, pitStatus, fills, fillEpisodes, userId, ownerId, bestFillId, onSetBest, onVoted }: {
  pitId: number; pitStatus: string; fills: FillItem[];
  fillEpisodes: Map<number, string>; userId: string | null; ownerId: string | null;
  bestFillId: number | null; onSetBest?: (fillId: number) => void; onVoted?: () => void;
}) {
  const supabase = createClient();
  const [showForm, setShowForm] = useState(false);
  const [desc, setDesc] = useState(""); const [epId, setEpId] = useState("");
  const [tsSec, setTsSec] = useState(""); const [error, setError] = useState("");

  const handleSubmit = async () => {
    if(!desc.trim()||!userId) return;
    const { error: err } = await supabase.from("pit_fills").insert({
      pit_id:pitId, user_id:userId, description:desc.trim(),
      episode_id:epId?parseInt(epId):null, timestamp_sec:tsSec?parseInt(tsSec):null
    } as never);
    if(err){ setError(err.message); return; }
    setDesc(""); setEpId(""); setTsSec(""); setShowForm(false); onVoted?.();
  };

  const voteFill = async (fillId: number, type: "up"|"down") => {
    if(!userId) return;
    await supabase.rpc("vote_fill", { p_fill_id:fillId, p_vote_type:type } as never);
    onVoted?.();
  };

  return (
    <div>
      <div className="flex items-center justify-between mb-3">
        <h2 className="text-lg font-semibold">{"📝 填坑 ("+fills.length+")"}</h2>
        {userId && pitStatus==="pending" && (<button onClick={()=>setShowForm(!showForm)} className="text-sm text-indigo-600 hover:underline">+ 填坑</button>)}
      </div>
      {showForm&&(
        <div className="bg-white border rounded-lg p-3 mb-3 space-y-2">
          <textarea value={desc} onChange={e=>setDesc(e.target.value)} rows={3} placeholder="你的解答..." className="w-full px-2 py-1.5 text-sm border rounded focus:outline-none focus:ring-1 focus:ring-indigo-400 resize-none"/>
          <input type="number" value={epId} onChange={e=>setEpId(e.target.value)} placeholder="引用节目 ID" className="w-full px-2 py-1.5 text-sm border rounded"/>
          <input type="number" value={tsSec} onChange={e=>setTsSec(e.target.value)} placeholder="时间戳(秒)" className="w-full px-2 py-1.5 text-sm border rounded"/>
          {error&&<p className="text-xs text-red-500">{error}</p>}
          <button onClick={handleSubmit} className="w-full py-2 bg-indigo-600 text-white text-sm rounded hover:bg-indigo-700">提交</button>
        </div>
      )}
      {fills.length===0?(
        <p className="text-sm text-gray-400">暂无填坑</p>
      ):(
        <div className="space-y-2">
          {fills.map(f=>{
            const isBest = f.id===bestFillId;
            const isOwner = userId===ownerId;
            return (
            <div key={f.id} className={"border rounded-lg p-3 text-sm "+(isBest?"bg-green-50 border-green-300":"bg-white")}>
              <div className="flex items-start justify-between">
                <p>{f.description}</p>
                <div className="shrink-0 ml-2">
                  {isBest?<span className="text-xs text-green-600 font-bold">🏆 最佳</span>
                   :isOwner?<button onClick={()=>onSetBest?.(f.id)} className="text-xs text-indigo-500 hover:underline">选为最佳</button>
                   :null}
                </div>
              </div>
              <div className="flex flex-wrap gap-x-3 gap-y-0.5 mt-1 text-xs text-gray-400">
                {f.episode_id && fillEpisodes.get(f.episode_id) && (<Link href={"/episodes/"+f.episode_id} className="text-indigo-500 hover:underline">{"📄 "+fillEpisodes.get(f.episode_id)}</Link>)}
                {f.timestamp_sec!=null && <span>{"⏱ "+formatTime(f.timestamp_sec)}</span>}
              </div>
              <div className="flex items-center gap-3 mt-2">
                <button onClick={()=>voteFill(f.id,"up")} className={"text-xs "+(userId?"hover:text-green-600 text-green-500":"text-gray-300")}>{"👍 "+f.up_votes}</button>
                <button onClick={()=>voteFill(f.id,"down")} className={"text-xs "+(userId?"hover:text-red-500 text-red-400":"text-gray-300")}>{"👎 "+f.down_votes}</button>
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
