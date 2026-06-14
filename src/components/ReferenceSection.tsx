"use client";

import { useEffect, useState, useCallback } from "react";
import { createClient } from "@/lib/supabase/client";
import Link from "next/link";

interface Reference {
  id: number;
  timestamp_sec: number;
  description: string;
  episodes: {
    id: number;
    episode_number: number;
    title: string;
  } | null;
}

function formatTime(sec: number): string {
  const m = Math.floor(sec / 60);
  const s = sec % 60;
  return m + ":" + String(s).padStart(2, "0");
}

export default function ReferenceSection({ episodeId }: { episodeId: number }) {
  const [refs, setRefs] = useState<Reference[]>([]);
  const [user, setUser] = useState<{ id: string } | null>(null);
  const [showForm, setShowForm] = useState(false);
  const [toEpNum, setToEpNum] = useState("");
  const [tsSec, setTsSec] = useState("");
  const [desc, setDesc] = useState("");
  const [msg, setMsg] = useState("");

  const load = useCallback(async () => {
    const supabase = createClient();
    const { data } = await supabase
      .from("episode_references")
      .select("id, timestamp_sec, description, episodes:to_episode_id(id, episode_number, title)")
      .eq("from_episode_id", episodeId)
      .order("timestamp_sec");
    if (data) setRefs(data as unknown as Reference[]);
  }, [episodeId]);

  useEffect(() => {
    load();
    const supabase = createClient();
    supabase.auth.getUser().then(({ data }) => setUser(data.user));
  }, [load]);

  const handleAdd = async () => {
    const num = parseInt(toEpNum, 10);
    if (isNaN(num) || num <= 0) { setMsg("请输入有效期号"); return; }
    const supabase = createClient();
    const epResult = await supabase.from("episodes").select("id").eq("episode_number", num).limit(1).single();
    const ep = epResult.data as { id: number } | null;
    if (!ep) { setMsg("未找到期号 #" + num); return; }
    const sec = parseInt(tsSec, 10) || 0;
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const insertResult = await (supabase.from("episode_references") as any).insert({
      from_episode_id: episodeId,
      to_episode_id: ep.id,
      timestamp_sec: sec,
      description: desc.trim()
    });
    if (insertResult.error) { setMsg(insertResult.error.message); return; }
    setToEpNum(""); setTsSec(""); setDesc(""); setShowForm(false); setMsg("");
    load();
  };

  return (
    <div className="border-2 border-ink-200 p-4">
      <div className="flex items-center justify-between mb-3">
        <h3 className="text-sm font-bold text-ink-700 flex items-center gap-1.5">
          <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.101m-.758-4.899a4 4 0 005.656 0l4-4a4 4 0 00-5.656-5.656l-1.1 1.1" />
          </svg>
          引用节目
        </h3>
        {user && (
          <button onClick={() => setShowForm(!showForm)} className="text-xs text-primary font-medium hover:underline">
            {showForm ? "取消" : "+ 添加引用"}
          </button>
        )}
      </div>

      {showForm && (
        <div className="border border-ink-200 p-3 mb-3 space-y-2">
          <div className="flex gap-2">
            <input type="text" inputMode="numeric" placeholder="期号" value={toEpNum} onChange={(e) => setToEpNum(e.target.value.replace(/\D/g, ""))} className="flex-1 border-2 border-ink-200 p-1.5 text-xs" />
            <input type="text" inputMode="numeric" placeholder="时间(秒)" value={tsSec} onChange={(e) => setTsSec(e.target.value.replace(/\D/g, ""))} className="w-24 border-2 border-ink-200 p-1.5 text-xs" />
          </div>
          <input type="text" placeholder="引用描述 (可选)" value={desc} onChange={(e) => setDesc(e.target.value)} className="w-full border-2 border-ink-200 p-1.5 text-xs" />
          {msg && <div className="text-xs text-red-500">{msg}</div>}
          <button onClick={handleAdd} className="btn btn-primary text-xs">确认添加</button>
        </div>
      )}

      {refs.length === 0 ? (
        <div className="text-xs text-ink-300">暂无引用</div>
      ) : (
        <div className="space-y-1.5">
          {refs.map((r) => (
            <Link key={r.id} href={"/episodes/" + (r.episodes?.id ?? "")} className="flex items-center gap-2 border border-ink-100 p-2 hover:bg-ink-50 transition-colors group">
              <span className="text-xs font-mono text-primary font-bold min-w-[40px]">#{r.episodes?.episode_number}</span>
              <span className="flex-1 text-xs text-ink-600 truncate">{r.episodes?.title}</span>
              {r.timestamp_sec > 0 && (
                <span className="text-xs text-ink-300 font-mono">{formatTime(r.timestamp_sec)}</span>
              )}
              <svg className="w-3 h-3 text-ink-300 opacity-0 group-hover:opacity-100 transition-opacity shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
              </svg>
            </Link>
          ))}
        </div>
      )}
    </div>
  );
}