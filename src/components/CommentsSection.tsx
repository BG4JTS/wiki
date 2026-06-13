"use client";

import { useState, useEffect } from "react";
import { createClient } from "@/lib/supabase/client";
import type { Comment, User } from "@/types/database";

interface CommentWithReplies extends Comment {
 replies?: CommentWithReplies[];
}

export default function CommentsSection({ episodeId }: { episodeId: number }) {
 const [comments, setComments] = useState<CommentWithReplies[]>([]);
 const [newComment, setNewComment] = useState("");
 const [replyTo, setReplyTo] = useState<number | null>(null);
 const [replyContent, setReplyContent] = useState("");
 const [loading, setLoading] = useState(true);
 const [error, setError] = useState("");
 const [user, setUser] = useState<User | null>(null);
 const supabase = createClient();

 useEffect(() => {
  supabase.auth.getUser().then(({ data }) => setUser(data.user));
  loadComments();
 }, [episodeId]);

 const loadComments = async () => {
  const result = await supabase
   .from("comments")
   .select("*")
   .eq("episode_id", episodeId)
   .order("created_at", { ascending: true }) as { data: CommentWithReplies[] | null; error: { message: string } | null };
  const data = result.data; const error = result.error;

  if (error) { setError(error.message); }
  else {
   const rootComments = (data || []).filter((c) => !c.parent_id);
   const childComments = (data || []).filter((c) => c.parent_id);
   const tree = rootComments.map((root) => ({
    ...root,
    replies: childComments.filter((c) => c.parent_id === root.id),
   }));
   if (data && data.length > 0) {
    const userIds = [...new Set(data.map((c) => c.user_id))];
    const pResult = await supabase
     .from("user_profiles")
     .select("id, username, avatar_url, bio")
     .in("id", userIds) as { data: { id: string; username: string; avatar_url: string; bio: string }[] | null; error: unknown };
    if (pResult.data) {
     const profileMap = new Map(pResult.data.map((p) => [p.id, p]));
     tree.forEach((c) => { c.user_profile = profileMap.get(c.user_id) ?? null; });
    }
   }
   setComments(tree);
  }
  setLoading(false);
 };

 const handleSubmit = async (parentId: number | null) => {
  const content = parentId ? replyContent : newComment;
  if (!content.trim() || !user) return;
  setError("");
  const { error } = await supabase.from("comments").insert({
   episode_id: episodeId, user_id: user.id, content: content.trim(), parent_id: parentId,
  } as never);
  if (error) { setError(error.message); }
  else {
   if (parentId) { setReplyContent(""); setReplyTo(null); }
   else { setNewComment(""); }
   loadComments();
  }
 };

 const handleDelete = async (commentId: number) => {
  if (!user) return;
  const { error } = await supabase.from("comments").delete().eq("id", commentId).eq("user_id", user.id);
  if (!error) loadComments();
 };

 const renderComment = (comment: CommentWithReplies, depth = 0) => (
  <div key={comment.id} style={{ marginLeft: depth * 24 }}>
   <div className="bg-ink-50/60 p-3 mb-2 border border-ink-200">
    <div className="flex items-center gap-2 text-xs text-ink-400 mb-1.5">
     {comment.user_profile ? (
      <span className="flex items-center gap-1.5 text-ink-600 font-medium">
       <img src={comment.user_profile.avatar_url || ""} alt="" className="w-4 h-4 object-cover" onError={e=>{(e.target as HTMLImageElement).style.display="none"}} />
       {comment.user_profile.username}
      </span>
     ) : (
      <span className="text-ink-400">匿名用户</span>
     )}
     <span className="text-ink-300">{new Date(comment.created_at).toLocaleString("zh-CN")}</span>
     {user && user.id === comment.user_id && (
      <button onClick={() => handleDelete(comment.id)} className="text-ink-300 hover:text-red-500 ml-auto text-xs">删除</button>
     )}
    </div>
    <p className="text-sm text-ink-700">{comment.content}</p>
    {user && (
     <button onClick={() => setReplyTo(replyTo === comment.id ? null : comment.id)}
      className="text-xs text-brand-500 hover:text-brand-600 mt-1.5 font-medium">
      回复
     </button>
    )}
    {replyTo === comment.id && (
     <div className="mt-2 flex gap-2">
      <input type="text" value={replyContent} onChange={(e) => setReplyContent(e.target.value)}
       placeholder="写下你的回复..." className="input flex-1 text-xs" />
      <button onClick={() => handleSubmit(comment.id)} className="btn btn-primary text-xs">发送</button>
     </div>
    )}
   </div>
   {comment.replies?.map((reply) => renderComment(reply, depth + 1))}
  </div>
 );

 return (
  <div>
   <h2 className="section-title mb-4">💬 评论</h2>

   {error && <div className="bg-red-50 text-red-600 p-2.5 text-sm mb-3">{error}</div>}

   {user ? (
    <div className="flex gap-2 mb-5">
     <input type="text" value={newComment} onChange={(e) => setNewComment(e.target.value)}
      placeholder="发表评论..." className="input flex-1" />
     <button onClick={() => handleSubmit(null)} className="btn btn-primary text-sm shrink-0">发送</button>
    </div>
   ) : (
    <p className="text-sm text-ink-400 mb-5">请登录后发表评论</p>
   )}

   {loading ? (
    <div className="space-y-3">
     {[1,2,3].map(i=><div key={i} className="skeleton h-16 w-full " />)}
    </div>
   ) : comments.length === 0 ? (
    <p className="text-sm text-ink-400">暂无评论，抢个沙发吧</p>
   ) : (
    comments.map((c) => renderComment(c))
   )}
  </div>
 );
}