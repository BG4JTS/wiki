"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";

export default function NewEpisodePage() {
  const router = useRouter();
  const supabase = createClient();
  const [epNum, setEpNum] = useState("");
  const [title, setTitle] = useState("");
  const [publishDate, setPublishDate] = useState("");
  const [duration, setDuration] = useState("");
  const [description, setDescription] = useState("");
  const [transcript, setTranscript] = useState("");
  const [message, setMessage] = useState("");
  const [loading, setLoading] = useState(false);

  const handleSubmit = async () => {
    if (!title.trim()) { setMessage("至少填个标题"); return; }
    setLoading(true); setMessage("");
    const payload = {
      episode_number: parseInt(epNum) || 0,
      title: title.trim(),
      publish_date: publishDate || new Date().toISOString().split("T")[0],
      duration: parseInt(duration) || 0,
      description: description.trim(),
      transcript: transcript.trim(),
      status: "draft",
    };
    const { error } = await supabase.from("episodes").insert(payload as never) as unknown as { error: { message: string } | null };
    if (error) { setMessage("提交失败：" + error.message); setLoading(false); return; }
    setMessage("提交成功！即将跳转到节目页...");
    const { data } = await supabase.from("episodes").select("id").order("id", { ascending: false }).limit(1) as { data: { id: number }[] | null; error: unknown };
    if (data?.[0]) { router.push("/episodes/" + data[0].id); }
    else { router.push("/"); }
  };

  return (
    <div className="max-w-2xl mx-auto animate-fade-in-up">
      <h1 className="text-2xl font-bold text-ink-800 mb-2">提出新节目</h1>
      <p className="text-sm text-ink-400 mb-6">只需填写标题或期号即可提交，其他信息可由大家一起补充 ✍️</p>

      <div className="card p-6 space-y-4">
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
          <div>
            <label className="block text-sm font-medium text-ink-600 mb-1.5">期号</label>
            <input type="number" value={epNum} onChange={e => setEpNum(e.target.value)} placeholder="如 123" className="input" />
          </div>
          <div>
            <label className="block text-sm font-medium text-ink-600 mb-1.5">发布日期</label>
            <input type="date" value={publishDate} onChange={e => setPublishDate(e.target.value)} className="input" />
          </div>
        </div>
        <div>
          <label className="block text-sm font-medium text-ink-600 mb-1.5">标题 *</label>
          <input type="text" value={title} onChange={e => setTitle(e.target.value)} placeholder="节目标题" className="input" />
        </div>
        <div>
          <label className="block text-sm font-medium text-ink-600 mb-1.5">时长（秒）</label>
          <input type="number" value={duration} onChange={e => setDuration(e.target.value)} placeholder="如 3600" className="input" />
        </div>
        <div>
          <label className="block text-sm font-medium text-ink-600 mb-1.5">简介</label>
          <textarea value={description} onChange={e => setDescription(e.target.value)} rows={3} placeholder="节目简介..." className="input resize-none" />
        </div>
        <div>
          <label className="block text-sm font-medium text-ink-600 mb-1.5">文稿</label>
          <textarea value={transcript} onChange={e => setTranscript(e.target.value)} rows={10} placeholder="可以后续补充..." className="input font-mono text-xs resize-none" />
        </div>

        {message && (
          <div className={`text-sm p-3 rounded-lg ${message.includes("成功") ? "bg-green-50 text-green-600 border border-green-100" : "bg-red-50 text-red-600 border border-red-100"}`}>
            {message}
          </div>
        )}

        <button onClick={handleSubmit} disabled={loading} className="btn btn-primary w-full">
          {loading ? "提交中..." : "提交节目"}
        </button>
      </div>
    </div>
  );
}