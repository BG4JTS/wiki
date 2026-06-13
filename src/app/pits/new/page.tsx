"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { parseTimeInput } from "@/lib/time";
import { createClient } from "@/lib/supabase/client";

export default function NewPitPage() {
 const router = useRouter();
 const supabase = createClient();
 const [title, setTitle] = useState("");
 const [description, setDescription] = useState("");
 const [episodeId, setEpisodeId] = useState("");
 const [error, setError] = useState("");
 const [tsDisplay, setTsDisplay] = useState("");
 const [loading, setLoading] = useState(false);

 const handleSubmit = async () => {
  if (!title.trim()) return;
  setLoading(true);
  setError("");
  const { error: err } = await supabase.from("pits").insert({
   title: title.trim(),
   description: description.trim(),
   episode_id: episodeId ? parseInt(episodeId) : null,
   timestamp_sec: tsDisplay ? parseTimeInput(tsDisplay) : null,
   user_id: (await supabase.auth.getUser()).data.user?.id,
  } as never);
  if (err) { setError(err.message); setLoading(false); return; }
  router.push("/pits");
  router.refresh();
 };

 return (
  <div className="max-w-lg mx-auto animate-fade-in-up">
   <h1 className="text-2xl font-bold text-ink-800 mb-6">🕳 挖坑</h1>
   {error && <div className="bg-red-50 text-red-600 p-3 text-sm mb-4 border border-red-100">{error}</div>}
   <div className="space-y-4">
    <div>
     <label className="block text-sm font-medium text-ink-600 mb-1.5">坑标题 *</label>
     <input type="text" value={title} onChange={e => setTitle(e.target.value)}
      placeholder="节目里没讲清楚的问题..." className="input" />
    </div>
    <div>
     <label className="block text-sm font-medium text-ink-600 mb-1.5">描述（可选）</label>
     <textarea value={description} onChange={e => setDescription(e.target.value)} rows={3}
      placeholder="补充背景信息..." className="input resize-none" />
    </div>
    <div>
     <label className="block text-sm font-medium text-ink-600 mb-1.5">关联节目 ID（可选）</label>
     <input type="number" value={episodeId} onChange={e => setEpisodeId(e.target.value)}
      placeholder="例如：5" className="input" />
    </div>
    <div>
     <label className="block text-sm font-medium text-ink-600 mb-1.5">时间戳（分:秒，可选）</label>
     <input type="text" value={tsDisplay} onChange={e => setTsDisplay(e.target.value)} placeholder="12:34" className="input" />
    </div>
    <button onClick={handleSubmit} disabled={loading || !title.trim()} className="btn btn-primary w-full">
     {loading ? "提交中..." : "挖坑"}
    </button>
   </div>
  </div>
 );
}