"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";

export default function NewPitPage() {
  const router = useRouter();
  const supabase = createClient();
  const [title, setTitle] = useState("");
  const [description, setDescription] = useState("");
  const [episodeId, setEpisodeId] = useState("");
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);

  const handleSubmit = async () => {
    if (!title.trim()) return;
    setLoading(true);
    setError("");
    const { error: err } = await supabase.from("pits").insert({
      title: title.trim(),
      description: description.trim(),
      episode_id: episodeId ? parseInt(episodeId) : null,
      user_id: (await supabase.auth.getUser()).data.user?.id,
    } as never);
    if (err) { setError(err.message); setLoading(false); return; }
    router.push("/pits");
    router.refresh();
  };

  return (
    <div className="max-w-lg mx-auto">
      <h1 className="text-2xl font-bold mb-6">🕳 挖坑</h1>
      {error && <div className="bg-red-50 text-red-600 p-3 rounded text-sm mb-4">{error}</div>}
      <div className="space-y-4">
        <div>
          <label className="block text-sm font-medium mb-1">坑标题</label>
          <input type="text" value={title} onChange={e => setTitle(e.target.value)}
            placeholder="节目里没讲清楚的问题..." className="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-400" />
        </div>
        <div>
          <label className="block text-sm font-medium mb-1">描述（可选）</label>
          <textarea value={description} onChange={e => setDescription(e.target.value)} rows={3}
            placeholder="补充背景信息..." className="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-400 resize-none" />
        </div>
        <div>
          <label className="block text-sm font-medium mb-1">关联节目 ID（可选）</label>
          <input type="number" value={episodeId} onChange={e => setEpisodeId(e.target.value)}
            placeholder="例如：5" className="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-400" />
        </div>
        <button onClick={handleSubmit} disabled={loading}
          className="w-full py-2 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700 disabled:opacity-50">
          {loading ? "提交中..." : "提交"}
        </button>
      </div>
    </div>
  );
}
