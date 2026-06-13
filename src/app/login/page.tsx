"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";

export default function LoginPage() {
 const router = useRouter();
 const [isRegister, setIsRegister] = useState(false);
 const [email, setEmail] = useState("");
 const [password, setPassword] = useState("");
 const [error, setError] = useState("");
 const [loading, setLoading] = useState(false);

 const handleSubmit = async (e: React.FormEvent) => {
  e.preventDefault();
  setError("");
  setLoading(true);

  const supabase = createClient();
  if (isRegister) {
   const { error } = await supabase.auth.signUp({ email, password });
   if (error) { setError(error.message); }
   else { setError("注册成功！请检查邮箱确认链接。"); }
  } else {
   const { error } = await supabase.auth.signInWithPassword({ email, password });
   if (error) { setError(error.message); }
   else { router.push("/"); router.refresh(); }
  }
  setLoading(false);
 };

 return (
  <div className="min-h-[70vh] flex items-center justify-center animate-fade-in-up">
   <div className="w-full max-w-sm">
    <div className="text-center mb-8">
     <h1 className="text-2xl font-bold text-ink-800 mb-1">
      {isRegister ? "注册" : "登录"}
     </h1>
     <p className="text-sm text-ink-400">
      {isRegister ? "加入原样WIKI知识库" : "欢迎回来"}
     </p>
    </div>

    {error && (
     <div className={`p-3 text-sm mb-4 ${
      error.includes("成功") ? "bg-green-100 text-green-600 border-2 border-green-300" : "bg-red-100 text-red-600 border-2 border-red-300"
     }`}>
      {error}
     </div>
    )}

    <form onSubmit={handleSubmit} className="space-y-4">
     <div>
      <label className="block text-sm font-medium text-ink-600 mb-1.5">邮箱</label>
      <input type="email" required value={email} onChange={(e) => setEmail(e.target.value)}
       placeholder="your@email.com" className="input" />
     </div>
     <div>
      <label className="block text-sm font-medium text-ink-600 mb-1.5">密码</label>
      <input type="password" required value={password} onChange={(e) => setPassword(e.target.value)}
       placeholder="至少6位" minLength={6} className="input" />
     </div>
     <button type="submit" disabled={loading} className="btn btn-primary w-full">
      {loading ? "处理中..." : isRegister ? "注册" : "登录"}
     </button>
    </form>

    <p className="text-sm text-center mt-5 text-ink-400">
     {isRegister ? "已有账号？" : "没有账号？"}
     <button onClick={() => { setIsRegister(!isRegister); setError(""); }}
      className="text-brand-500 hover:text-brand-600 font-medium ml-1">
      {isRegister ? "去登录" : "去注册"}
     </button>
    </p>
   </div>
  </div>
 );
}