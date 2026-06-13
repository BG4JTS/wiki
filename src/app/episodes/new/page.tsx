"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { parseTimeInput } from "@/lib/time";
import { createClient } from "@/lib/supabase/client";

export default function NewEpisodePage() {
 const router = useRouter();
 const supabase = createClient();
 const [epNum, setEpNum] = useState("");
 const [title, setTitle] = useState("");
 const [publishDate, setPublishDate] = useState("");
 const [durationDisplay, setDurationDisplay] = useState("");
 const [description, setDescription] = useState("");
 const [transcript, setTranscript] = useState("");
 const [message, setMessage] = useState("");
 const [loading, setLoading] = useState(false);

 const handleSubmit = async () => {
  if (!title.trim()) { setMessage("至少填个标题"); return; }
  setLoading(true); setMessage("");
  // 检查自动审核设置
  let status = "draft";
  try {
   const sr = await supabase.from("site_settings").select("value").eq("key", "auto_approve_episodes").single() as unknown as { data: { value: string } | null; error: unknown };
   if (sr.data && sr.data.value === "true") status = "published";
  } catch { /* 查询失败保持 draft */ }
  const payload = {
   episode_number: parseInt(epNum) || 0,
   title: title.trim(),
   publish_date: publishDate || new Date().toISOString().split("T")[0],
   duration: parseTimeInput(durationDisplay),
   description: description.trim(),
   transcript: transcript.trim(),
   status,
  };
  const { error } = await supabase.from("episodes").insert(payload as never) as unknown as { error: { message: string } | null };
  if (error) { setMessage("提交失败：" + error.message); setLoading(false); return; }
  setMessage(status === "published" ? "提交成功！节目已自动发布" : "提交成功！等待管理员审核");
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
     <label className="block text-sm font-medium text-ink-600 mb-1.5">时长（分:秒）</label>
     <input type="text" value={durationDisplay} onChange={e => setDurationDisplay(e.target.value)} placeholder="12:34" className="input" />
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
     <div className={`text-sm p-3 ${message.includes("成功") ? "bg-green-100 text-green-600 border-2 border-green-300" : "bg-red-100 text-red-600 border-2 border-red-300"}`}>
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