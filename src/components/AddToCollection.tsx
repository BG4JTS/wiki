"use client";

import { useState, useEffect } from "react";
import { createClient } from "@/lib/supabase/client";

interface Collection {
  id: number;
  name: string;
}

export default function AddToCollection({ episodeId }: { episodeId: number }) {
  const [collections, setCollections] = useState<Collection[]>([]);
  const [selected, setSelected] = useState("");
  const [msg, setMsg] = useState("");

  useEffect(() => {
    const supabase = createClient();
    supabase.from("collections").select("id, name").order("name").then(({ data }) => {
      if (data) setCollections(data as Collection[]);
    });
  }, []);

  const handleAdd = async () => {
    if (!selected) return;
    const supabase = createClient();
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const result = await (supabase.from("collection_episodes") as any).insert({
      collection_id: parseInt(selected, 10),
      episode_id: episodeId,
      sort_order: 0
    });
    if (result.error) { setMsg(result.error.message); return; }
    setMsg("已添加"); setSelected("");
    setTimeout(() => setMsg(""), 1500);
  };

  if (collections.length === 0) return null;

  return (
    <div className="border-2 border-ink-200 p-4">
      <h3 className="text-sm font-bold text-ink-700 mb-2">添加到合集</h3>
      <div className="flex gap-1.5">
        <select value={selected} onChange={(e) => setSelected(e.target.value)} className="flex-1 border-2 border-ink-200 p-1.5 text-xs bg-white">
          <option value="">选择合集...</option>
          {collections.map((c) => <option key={c.id} value={c.id}>{c.name}</option>)}
        </select>
        <button onClick={handleAdd} disabled={!selected} className="btn btn-primary text-xs px-3">添加</button>
      </div>
      {msg && <div className={msg === "已添加" ? "text-xs text-green-500 mt-1.5" : "text-xs text-red-500 mt-1.5"}>{msg}</div>}
    </div>
  );
}