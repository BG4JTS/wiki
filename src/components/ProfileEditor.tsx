"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import type { User, UserProfile } from "@/types/database";

export default function ProfileEditor({ user, profile }: { user: User; profile: UserProfile | null }) {
  const router = useRouter();
  const supabase = createClient();
  const [username, setUsername] = useState(profile?.username || "");
  const [bio, setBio] = useState(profile?.bio || "");
  const [avatarUrl, setAvatarUrl] = useState(profile?.avatar_url || "");
  const [loading, setLoading] = useState(false);
  const [message, setMessage] = useState("");

  const handleSave = async () => {
    setLoading(true); setMessage("");
    const { error } = await supabase.from("user_profiles").upsert({
      id: user.id, username, bio, avatar_url: avatarUrl.trim(),
    } as never, { onConflict: "id" });
    if (error) { setMessage("保存失败：" + error.message); }
    else { setMessage("保存成功！"); router.refresh(); }
    setLoading(false);
  };

  return (
    <div className="bg-white border rounded-lg p-4 space-y-3">
      {avatarUrl && (
        <div className="flex justify-center">
          <img src={avatarUrl} alt="头像" className="w-20 h-20 rounded-full object-cover border-2 border-indigo-200" onError={(e) => { (e.target as HTMLImageElement).style.display = "none"; }} />
        </div>
      )}
      <div>
        <label className="block text-sm font-medium mb-1">头像 URL（图床链接）</label>
        <input type="url" value={avatarUrl} onChange={e => setAvatarUrl(e.target.value)}
          placeholder="https://your-image-host.com/avatar.jpg"
          className="w-full px-3 py-2 border rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-indigo-400" />
      </div>
      <div><label className="block text-sm font-medium mb-1">邮箱</label>
        <input type="text" value={user.email} disabled className="w-full px-3 py-2 bg-gray-100 border rounded-lg text-gray-500" /></div>
      <div><label className="block text-sm font-medium mb-1">用户名</label>
        <input type="text" value={username} onChange={e => setUsername(e.target.value)}
          placeholder="设置你的用户名" className="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-400" /></div>
      <div><label className="block text-sm font-medium mb-1">简介</label>
        <textarea value={bio} onChange={e => setBio(e.target.value)} rows={3}
          placeholder="介绍一下你自己..." className="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-400 resize-none" /></div>
      {message && <div className={"text-sm p-2 rounded "+(message.includes("成功")?"bg-green-50 text-green-600":"bg-red-50 text-red-600")}>{message}</div>}
      <button onClick={handleSave} disabled={loading} className="w-full py-2 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700 disabled:opacity-50">
        {loading?"保存中...":"保存"}
      </button>
    </div>
  );
}
