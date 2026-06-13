"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { parseTimeInput, formatTimeInput } from "@/lib/time";
import { createClient } from "@/lib/supabase/client";

interface EpFields {
 episode_number: number;
 title: string;
 publish_date: string;
 duration: number;
 description: string;
 transcript: string;
 status: string;
}

export default function WikiEditor({ episode }: { episode: EpFields & { id: number } }) {
 const router = useRouter();
 const supabase = createClient();
 const [editing, setEditing] = useState<string | null>(null);
 const [message, setMessage] = useState("");
 const [loading, setLoading] = useState(false);

 // 编辑状态
 const [epNum, setEpNum] = useState(String(episode.episode_number));
 const [title, setTitle] = useState(episode.title);
 const [publishDate, setPublishDate] = useState(episode.publish_date);
 const [durationDisplay, setDurationDisplay] = useState(formatTimeInput(episode.duration));
 const [description, setDescription] = useState(episode.description);
 const [transcript, setTranscript] = useState(episode.transcript);

 const startEdit = (field: string) => {
  setEpNum(String(episode.episode_number));
  setTitle(episode.title);
  setPublishDate(episode.publish_date);
  setDurationDisplay(formatTimeInput(episode.duration));
  setDescription(episode.description);
  setTranscript(episode.transcript);
  setEditing(field);
  setMessage("");
 };

 const handleSave = async () => {
  setLoading(true); setMessage("");
  const payload: Record<string, unknown> = {
   episode_number: parseInt(epNum) || 0,
   title: title.trim(),
   publish_date: publishDate,
   duration: parseTimeInput(durationDisplay),
   description: description.trim(),
   transcript: transcript.trim(),
  };
  const { error } = await supabase.from("episodes").update(payload as never).eq("id", episode.id) as unknown as { error: { message: string } | null };
  if (error) { setMessage("保存失败：" + error.message); }
  else { setMessage("已保存！"); setEditing(null); router.refresh(); }
  setLoading(false);
 };

 const handleRequestReview = async () => {
  setLoading(true); setMessage("");
  const { error } = await supabase.from("episodes").update({ status: "pending" } as never).eq("id", episode.id) as unknown as { error: { message: string } | null };
  if (error) { setMessage("申请失败：" + error.message); }
  else { setMessage("已提交审核申请！"); router.refresh(); }
  setLoading(false);
 };

 return (
  <div className="mb-6">
   {!editing ? (
    <div className="flex items-center gap-3 flex-wrap">
     <button onClick={() => startEdit("all")} className="btn btn-ghost text-xs">
      ✏️ 编辑此节目
     </button>
     {episode.status === "draft" && (
      <button onClick={handleRequestReview} disabled={loading}
       className="btn btn-warm text-xs">
       {loading ? "提交中..." : "📤 申请发布"}
      </button>
     )}
     {episode.status === "pending" && (
      <span className="badge badge-pending">⏳ 审核中</span>
     )}
    </div>
   ) : (
    <div className="card p-5 space-y-4 bg-brand-50/50 border-brand-100">
     <div className="flex items-center justify-between">
      <span className="text-sm font-medium text-brand-600">✍️ 协作编辑（所有人可参与）</span>
      <button onClick={() => setEditing(null)} className="btn btn-ghost text-xs">取消</button>
     </div>
     <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
      <div>
       <label className="block text-xs font-medium text-ink-500 mb-1">期号</label>
       <input type="text" placeholder="12:34" value={epNum} onChange={e => setEpNum(e.target.value)} className="input" />
      </div>
      <div>
       <label className="block text-xs font-medium text-ink-500 mb-1">日期</label>
       <input type="date" value={publishDate} onChange={e => setPublishDate(e.target.value)} className="input" />
      </div>
      <div>
       <label className="block text-xs font-medium text-ink-500 mb-1">时长（分:秒）</label>
       <input type="text" placeholder="12:34" value={durationDisplay} onChange={e => setDurationDisplay(e.target.value)} className="input" />
      </div>
     </div>
     <div>
      <label className="block text-xs font-medium text-ink-500 mb-1">标题</label>
      <input type="text" value={title} onChange={e => setTitle(e.target.value)} className="input" />
     </div>
     <div>
      <label className="block text-xs font-medium text-ink-500 mb-1">简介</label>
      <textarea value={description} onChange={e => setDescription(e.target.value)} rows={2} className="input resize-none" />
     </div>
     <div>
      <label className="block text-xs font-medium text-ink-500 mb-1">文稿</label>
      <textarea value={transcript} onChange={e => setTranscript(e.target.value)} rows={10} className="input font-mono text-xs resize-none" />
     </div>
     {message && (
      <div className={`text-xs p-2.5 ${message.includes("失败") ? "bg-red-50 text-red-600" : "bg-green-50 text-green-600"}`}>
       {message}
      </div>
     )}
     <div className="flex gap-2">
      <button onClick={handleSave} disabled={loading} className="btn btn-primary flex-1">
       {loading ? "保存中..." : "保存修改"}
      </button>
      {episode.status === "draft" && (
       <button onClick={handleRequestReview} disabled={loading} className="btn btn-warm">
        📤 申请发布
       </button>
      )}
     </div>
    </div>
   )}
  </div>
 );
}