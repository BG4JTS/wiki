"use client";

import { useState, useEffect, useCallback } from "react";
import { createClient } from "@/lib/supabase/client";
import type { Comment, User } from "@/types/database";

interface CommentWithReplies extends Comment {
  replies?: CommentWithReplies[];
  user_profile?: { username: string; avatar_url: string } | null;
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
    const { data, error } = await supabase
      .from("comments")
      .select("*, user_profile:user_profiles(username, avatar_url)")
      .eq("episode_id", episodeId)
      .order("created_at", { ascending: true });

    if (error) {
      setError(error.message);
    } else {
      // 构建树形结构
      const rootComments = (data || []).filter((c) => !c.parent_id);
      const childComments = (data || []).filter((c) => c.parent_id);
      const tree = rootComments.map((root) => ({
        ...root,
        replies: childComments.filter((c) => c.parent_id === root.id),
      }));
      setComments(tree);
    }
    setLoading(false);
  };

  const handleSubmit = async (parentId: number | null) => {
    const content = parentId ? replyContent : newComment;
    if (!content.trim() || !user) return;

    setError("");
    const { error } = await supabase.from("comments").insert({
      episode_id: episodeId,
      user_id: user.id,
      content: content.trim(),
      parent_id: parentId,
    });

    if (error) {
      setError(error.message);
    } else {
      if (parentId) {
        setReplyContent("");
        setReplyTo(null);
      } else {
        setNewComment("");
      }
      loadComments();
    }
  };

  const handleDelete = async (commentId: number) => {
    if (!user) return;
    const { error } = await supabase
      .from("comments")
      .delete()
      .eq("id", commentId)
      .eq("user_id", user.id);

    if (!error) loadComments();
  };

  const renderComment = (comment: CommentWithReplies, depth = 0) => (
    <div key={comment.id} style={{ marginLeft: depth * 24 }}>
      <div className="bg-gray-50 rounded-lg p-3 mb-2">
        <div className="flex items-center gap-2 text-xs text-gray-500 mb-1">
          <span className="font-medium text-gray-700">
            {comment.user_profile?.username || "匿名用户"}
          </span>
          <span>{new Date(comment.created_at).toLocaleString("zh-CN")}</span>
          {user && user.id === comment.user_id && (
            <button
              onClick={() => handleDelete(comment.id)}
              className="text-red-400 hover:text-red-600 ml-auto"
            >
              删除
            </button>
          )}
        </div>
        <p className="text-sm">{comment.content}</p>
        {user && (
          <button
            onClick={() =>
              setReplyTo(replyTo === comment.id ? null : comment.id)
            }
            className="text-xs text-indigo-500 hover:text-indigo-700 mt-1"
          >
            回复
          </button>
        )}
        {replyTo === comment.id && (
          <div className="mt-2 flex gap-2">
            <input
              type="text"
              value={replyContent}
              onChange={(e) => setReplyContent(e.target.value)}
              placeholder="写下你的回复..."
              className="flex-1 px-2 py-1 text-sm border rounded focus:outline-none focus:ring-1 focus:ring-indigo-400"
            />
            <button
              onClick={() => handleSubmit(comment.id)}
              className="px-2 py-1 text-xs bg-indigo-600 text-white rounded hover:bg-indigo-700"
            >
              发送
            </button>
          </div>
        )}
      </div>
      {comment.replies?.map((reply) => renderComment(reply, depth + 1))}
    </div>
  );

  return (
    <div>
      <h2 className="text-lg font-semibold mb-3">💬 评论</h2>

      {error && (
        <div className="bg-red-50 text-red-600 p-2 rounded text-sm mb-3">
          {error}
        </div>
      )}

      {user ? (
        <div className="flex gap-2 mb-4">
          <input
            type="text"
            value={newComment}
            onChange={(e) => setNewComment(e.target.value)}
            placeholder="发表评论..."
            className="flex-1 px-3 py-2 text-sm border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-400"
          />
          <button
            onClick={() => handleSubmit(null)}
            className="px-4 py-2 bg-indigo-600 text-white text-sm rounded-lg hover:bg-indigo-700"
          >
            发送
          </button>
        </div>
      ) : (
        <p className="text-sm text-gray-400 mb-4">
          请登录后发表评论
        </p>
      )}

      {loading ? (
        <p className="text-sm text-gray-400">加载中...</p>
      ) : comments.length === 0 ? (
        <p className="text-sm text-gray-400">暂无评论，抢个沙发吧</p>
      ) : (
        comments.map((c) => renderComment(c))
      )}
    </div>
  );
}
