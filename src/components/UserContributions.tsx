"use client";

import { useState, useEffect } from "react";
import { createClient } from "@/lib/supabase/client";
import type { UserContribution, User } from "@/types/database";

export default function UserContributions({ episodeId }: { episodeId: number }) {
 const [contributions, setContributions] = useState<UserContribution[]>([]);
 const [showForm, setShowForm] = useState(false);
 const [contentType, setContentType] = useState<"link" | "note" | "image_url">("link");
 const [content, setContent] = useState("");
 const [description, setDescription] = useState("");
 const [loading, setLoading] = useState(true);
 const [error, setError] = useState("");
 const [user, setUser] = useState<User | null>(null);
 const supabase = createClient();

 useEffect(() => {
  supabase.auth.getUser().then(({ data }) => setUser(data.user));
  loadContributions();
 }, [episodeId]);

 const loadContributions = async () => {
  const result = await supabase
   .from("user_contributions")
   .select("*")
   .eq("episode_id", episodeId)
   .order("votes", { ascending: false })
   .order("created_at", { ascending: false }) as { data: UserContribution[] | null; error: { message: string } | null };
  const data = result.data; const error = result.error;

  if (error) setError(error.message);
  else if (data && data.length > 0) {
   const userIds = [...new Set(data.map((c) => c.user_id))];
   const pResult = await supabase
    .from("user_profiles")
    .select("id, username, avatar_url, bio")
    .in("id", userIds) as { data: { id: string; username: string; avatar_url: string; bio: string }[] | null; error: unknown };
   if (pResult.data) {
    const profileMap = new Map(pResult.data.map((p) => [p.id, p]));
    data.forEach((c) => { c.user_profile = profileMap.get(c.user_id) ?? null; });
   }
  }
  setContributions(data || []);
  setLoading(false);
 };

 const handleSubmit = async () => {
  if (!content.trim() || !user) return;
  const { error } = await supabase.from("user_contributions").insert({
   episode_id: episodeId, user_id: user.id, content_type: contentType,
   content: content.trim(), description: description.trim(),
  } as never);
  if (error) { setError(error.message); }
  else { setContent(""); setDescription(""); setShowForm(false); loadContributions(); }
 };

 const handleVote = async (id: number) => {
  const { error } = await supabase.rpc("increment_votes", { contribution_id: id } as never);
  if (!error) loadContributions();
 };

 const typeLabels: Record<string, string> = {
  link: "🔗 链接", note: "📝 笔记", image_url: "🖼 图片",
 };

 return (
  <div>
   <div className="flex items-center justify-between mb-4">
    <h2 className="section-title">📌 用户补充</h2>
    {user && (
     <button onClick={() => setShowForm(!showForm)} className="btn btn-ghost text-xs">
      + 添加
     </button>
    )}
   </div>

   {error && <div className="bg-red-50 text-red-600 p-2 text-sm mb-3">{error}</div>}

   {showForm && (
    <div className="card p-4 mb-3 space-y-2">
     <div className="flex gap-1.5">
      {(["link", "note", "image_url"] as const).map((t) => (
       <button key={t} onClick={() => setContentType(t)}
        className={`text-xs px-2.5 py-1 font-medium transition-all ${
         contentType === t ? "bg-ink-700 text-white dark:bg-ink-600" : "bg-ink-100 text-ink-500 hover:bg-ink-200"
        }`}>
        {typeLabels[t]}
       </button>
      ))}
     </div>
     <input type="text" value={content} onChange={(e) => setContent(e.target.value)}
      placeholder={contentType === "link" ? "输入链接 URL" : contentType === "image_url" ? "输入图片 URL" : "输入笔记内容"}
      className="input" />
     <input type="text" value={description} onChange={(e) => setDescription(e.target.value)}
      placeholder="简短说明（可选）" maxLength={500} className="input" />
     <button onClick={handleSubmit} className="btn btn-primary w-full text-sm">提交</button>
    </div>
   )}

   {loading ? (
    <div className="space-y-2">
     {[1,2].map(i=><div key={i} className="skeleton h-14 w-full " />)}
    </div>
   ) : contributions.length === 0 ? (
    <p className="text-sm text-ink-400">暂无补充内容</p>
   ) : (
    <div className="space-y-2">
     {contributions.map((c) => (
      <div key={c.id} className="card p-3 text-sm">
       <div className="flex items-center gap-2 text-xs text-ink-400 mb-1">
        <span className="badge-brand text-xs px-2 py-0.5">{typeLabels[c.content_type]}</span>
        <span className="font-medium text-ink-600">
         {c.user_profile ? (<><img src={c.user_profile.avatar_url || ""} alt="" className="w-4 h-4 inline-block mr-1 object-cover" onError={e=>{(e.target as HTMLImageElement).style.display="none"}} />{c.user_profile.username}</>) : "匿名"}
        </span>
       </div>
       {c.content_type === "image_url" ? (
        <img src={c.content} alt={c.description || "补充图片"} className=" max-h-40 object-cover my-1" />
       ) : c.content_type === "link" ? (
        <a href={c.content} target="_blank" rel="noopener noreferrer" className="text-brand-500 hover:underline break-all text-sm">{c.description || c.content}</a>
       ) : (
        <p className="text-ink-700">{c.content}</p>
       )}
       {c.content_type !== "note" && c.description && <p className="text-ink-400 mt-0.5">{c.description}</p>}
       <button onClick={() => handleVote(c.id)} className="text-xs text-ink-400 hover:text-brand-500 mt-1 font-medium">👍 {c.votes}</button>
      </div>
     ))}
    </div>
   )}
  </div>
 );
}