"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";

export default function NewTopicPage() {
  const router = useRouter();
  const supabase = createClient();
  const [title, setTitle] = useState("");
  const [description, setDescription] = useState("");
  const [message, setMessage] = useState("");
  const [loading, setLoading] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!title.trim()) return;
    setLoading(true); setMessage("");

    const { data: { user } } = await supabase.auth.getUser();
    if (!user) { setMessage("请先登录"); setLoading(false); return; }

    const { error } = await supabase.from("topics").insert({
      user_id: user.id,
      title: title.trim(),
      description: description.trim(),
    } as never);
    if (error) { setMessage("提交失败：" + error.message); }
    else { router.push("/topics"); router.refresh(); }
    setLoading(false);
  };

  return (
    <div className="animate-fade-in-up max-w-lg mx-auto">
      <h1 className="text-2xl font-bold text-ink-800 mb-2">📋 提选题</h1>
      <p className="text-sm text-ink-400 mb-6">告诉大家你想听什么，让大家投票决定优先级</p>

      {message && (
        <div className={`p-3 rounded-lg text-sm mb-4 ${message.includes("失败")?"bg-red-50 text-red-600 border border-red-100":"bg-green-50 text-green-600 border border-green-100"}`}>
          {message}
        </div>
      )}

      <form onSubmit={handleSubmit} className="space-y-4">
        <div>
          <label className="block text-sm font-medium text-ink-600 mb-1.5">选题标题 *</label>
          <input type="text" required value={title} onChange={e=>setTitle(e.target.value)}
            placeholder="例如：量子计算对普通人的影响" className="input" maxLength={200} />
        </div>
        <div>
          <label className="block text-sm font-medium text-ink-600 mb-1.5">详细描述</label>
          <textarea value={description} onChange={e=>setDescription(e.target.value)}
            placeholder="补充说明你想听到的内容方向..." rows={4} className="input resize-none" maxLength={2000} />
        </div>
        <div className="flex gap-3">
          <button type="submit" disabled={loading} className="btn btn-primary">
            {loading ? "提交中..." : "提交选题"}
          </button>
          <button type="button" onClick={()=>router.back()} className="btn btn-outline">取消</button>
        </div>
      </form>
    </div>
  );
}