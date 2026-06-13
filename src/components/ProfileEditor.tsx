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
  <div className="card p-5 space-y-4">
   {avatarUrl && (
    <div className="flex justify-center">
     <img src={avatarUrl} alt="头像" className="w-20 h-20 object-cover " onError={(e) => { (e.target as HTMLImageElement).style.display = "none"; }} />
    </div>
   )}
   <div>
    <label className="block text-sm font-medium text-ink-600 mb-1.5">头像 URL（图床链接）</label>
    <input type="url" value={avatarUrl} onChange={e => setAvatarUrl(e.target.value)}
     placeholder="https://your-image-host.com/avatar.jpg" className="input" />
   </div>
   <div>
    <label className="block text-sm font-medium text-ink-600 mb-1.5">邮箱</label>
    <input type="text" value={user.email} disabled className="input bg-ink-50 text-ink-400" />
   </div>
   <div>
    <label className="block text-sm font-medium text-ink-600 mb-1.5">用户名</label>
    <input type="text" value={username} onChange={e => setUsername(e.target.value)}
     placeholder="设置你的用户名" className="input" />
   </div>
   <div>
    <label className="block text-sm font-medium text-ink-600 mb-1.5">简介</label>
    <textarea value={bio} onChange={e => setBio(e.target.value)} rows={3}
     placeholder="介绍一下你自己..." className="input resize-none" />
   </div>
   {message && <div className={`text-sm p-2.5 ${message.includes("成功")?"bg-green-50 text-green-600":"bg-red-50 text-red-600"}`}>{message}</div>}
   <button onClick={handleSave} disabled={loading} className="btn btn-primary w-full">
    {loading?"保存中...":"保存"}
   </button>
  </div>
 );
}