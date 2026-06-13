"use client";

import { useState, useEffect } from "react";
import { createClient } from "@/lib/supabase/client";
import type { UserContribution, User } from "@/types/database";

export default function UserContributions({
  episodeId,
}: {
  episodeId: number;
}) {
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
      .select("*, user_profile:user_profiles(username, avatar_url)")
      .eq("episode_id", episodeId)
      .order("votes", { ascending: false })
      .order("created_at", { ascending: false }) as { data: UserContribution[] | null; error: { message: string } | null };
    const data = result.data; const error = result.error;

    if (error) setError(error.message);
    else setContributions(data || []);
    setLoading(false);
  };

  const handleSubmit = async () => {
    if (!content.trim() || !user) return;
    const { error } = await supabase.from("user_contributions").insert({
      episode_id: episodeId,
      user_id: user.id,
      content_type: contentType,
      content: content.trim(),
      description: description.trim(),
    } as never);

    if (error) {
      setError(error.message);
    } else {
      setContent("");
      setDescription("");
      setShowForm(false);
      loadContributions();
    }
  };

  const handleVote = async (id: number) => {
    const { error } = await supabase.rpc("increment_votes", { contribution_id: id } as never);
    if (!error) loadContributions();
  };

  const typeLabels: Record<string, string> = {
    link: "🔗 链接",
    note: "📝 笔记",
    image_url: "🖼 图片",
  };

  return (
    <div>
      <div className="flex items-center justify-between mb-3">
        <h2 className="text-lg font-semibold">📌 用户补充</h2>
        {user && (
          <button
            onClick={() => setShowForm(!showForm)}
            className="text-sm text-indigo-600 hover:text-indigo-800"
          >
            + 添加
          </button>
        )}
      </div>

      {error && (
        <div className="bg-red-50 text-red-600 p-2 rounded text-sm mb-3">
          {error}
        </div>
      )}

      {showForm && (
        <div className="bg-white border rounded-lg p-3 mb-3 space-y-2">
          <div className="flex gap-2">
            {(["link", "note", "image_url"] as const).map((t) => (
              <button
                key={t}
                onClick={() => setContentType(t)}
                className={`px-2 py-1 text-xs rounded ${
                  contentType === t
                    ? "bg-indigo-600 text-white"
                    : "bg-gray-100 hover:bg-gray-200"
                }`}
              >
                {typeLabels[t]}
              </button>
            ))}
          </div>
          <input
            type="text"
            value={content}
            onChange={(e) => setContent(e.target.value)}
            placeholder={
              contentType === "link"
                ? "输入链接 URL"
                : contentType === "image_url"
                ? "输入图片 URL"
                : "输入笔记内容"
            }
            className="w-full px-2 py-1 text-sm border rounded focus:outline-none focus:ring-1 focus:ring-indigo-400"
          />
          <input
            type="text"
            value={description}
            onChange={(e) => setDescription(e.target.value)}
            placeholder="简短说明（可选）"
            maxLength={500}
            className="w-full px-2 py-1 text-sm border rounded focus:outline-none focus:ring-1 focus:ring-indigo-400"
          />
          <button
            onClick={handleSubmit}
            className="w-full py-1.5 text-sm bg-indigo-600 text-white rounded hover:bg-indigo-700"
          >
            提交
          </button>
        </div>
      )}

      {loading ? (
        <p className="text-sm text-gray-400">加载中...</p>
      ) : contributions.length === 0 ? (
        <p className="text-sm text-gray-400">暂无补充内容</p>
      ) : (
        <div className="space-y-2">
          {contributions.map((c) => (
            <div
              key={c.id}
              className="bg-white border rounded-lg p-3 text-sm"
            >
              <div className="flex items-center gap-2 text-xs text-gray-500 mb-1">
                <span>{typeLabels[c.content_type]}</span>
                <span className="font-medium text-gray-700">
                  {c.user_profile?.username || "匿名"}
                </span>
              </div>
              {c.content_type === "image_url" ? (
                <img
                  src={c.content}
                  alt={c.description || "补充图片"}
                  className="rounded max-h-40 object-cover my-1"
                />
              ) : c.content_type === "link" ? (
                <a
                  href={c.content}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="text-indigo-600 hover:underline break-all"
                >
                  {c.description || c.content}
                </a>
              ) : (
                <p>{c.content}</p>
              )}
              {c.content_type !== "note" && c.description && (
                <p className="text-gray-500 mt-0.5">{c.description}</p>
              )}
              <button
                onClick={() => handleVote(c.id)}
                className="text-xs text-gray-400 hover:text-indigo-600 mt-1"
              >
                👍 {c.votes}
              </button>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
