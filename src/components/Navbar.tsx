"use client";

import { useState, useEffect, useRef } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import type { User } from "@/types/database";

export default function Navbar() {
 const router = useRouter();
 const [epNum, setEpNum] = useState("");
 const [lookupMsg, setLookupMsg] = useState("");
 const [user, setUser] = useState<User | null>(null);
 const [profile, setProfile] = useState<{ username: string; avatar_url: string } | null>(null);
 const [mounted, setMounted] = useState(false);
 const [menuOpen, setMenuOpen] = useState(false);
 const [dark, setDark] = useState(false);
 const supabaseRef = useRef<ReturnType<typeof createClient> | null>(null);

 const getSupabase = () => {
  if (!supabaseRef.current) {
   try { supabaseRef.current = createClient(); }
   catch { return null; }
  }
  return supabaseRef.current;
 };

 const loadProfile = async (userId: string) => {
  const supabase = getSupabase();
  if (!supabase) { setProfile(null); return; }
  try {
   const { data: d } = await supabase.from("user_profiles").select("username,avatar_url").eq("id", userId).single() as { data: { username: string; avatar_url: string } | null; error: unknown };
   setProfile(d);
  } catch { setProfile(null); }
 };

 const toggleTheme = () => {
  const next = !dark;
  setDark(next);
  document.documentElement.setAttribute("data-theme", next ? "dark" : "light");
  try { localStorage.setItem("theme", next ? "dark" : "light"); } catch {}
 };

 useEffect(() => {
  setMounted(true);
  setDark(document.documentElement.getAttribute("data-theme") === "dark");
 }, []);

 useEffect(() => {
  if (!mounted) return;
  const supabase = getSupabase();
  if (!supabase) return;
  supabase.auth.getUser().then(({ data }) => {
   setUser(data.user);
   if (data.user) loadProfile(data.user.id);
  });
  const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
   setUser(session?.user ?? null);
   if (session?.user) loadProfile(session.user.id);
   else setProfile(null);
  });
  return () => subscription.unsubscribe();
 }, [mounted]);

 const handleLookup = async (num: string) => {
  if (!num.trim()) { setLookupMsg(""); return; }
  const n = parseInt(num, 10);
  if (isNaN(n) || n <= 0) { setLookupMsg("请输入有效数字"); return; }
  const supabase = getSupabase();
  if (!supabase) { setLookupMsg("连接失败"); return; }
  try {
   const { data, error } = await supabase
    .from("episodes")
    .select("episode_number")
    .eq("episode_number", n)
    .limit(1) as unknown as { data: { episode_number: number }[] | null; error: { message: string } | null };
   if (error) { setLookupMsg("查询失败: " + error.message); return; }
   if (data && data.length > 0) {
    router.push("/episodes/" + n);
    setEpNum(""); setLookupMsg("");
   } else {
    setLookupMsg("没有找到 #" + n + "，");
   }
  } catch (e) {
   setLookupMsg("查询失败: " + (e instanceof Error ? e.message : String(e)));
  }
 };


 const handleLogout = async () => {
  const supabase = getSupabase();
  if (!supabase) return;
  await supabase.auth.signOut();
  router.refresh();
 };

 return (
  <nav className="navbar-glass sticky top-0 z-50">
   <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 h-14 flex items-center justify-between gap-3">
    {/* Logo */}
    <Link href="/" className="flex items-center gap-2 shrink-0 group">
     <span className="text-xl font-bold text-ink-900 dark:text-ink-700">
      原样WIKI
     </span>
     <span className="hidden sm:inline text-xs text-warm-400 font-medium bg-warm-100 px-2 py-0.5 ">
      β
     </span>
    </Link>

    {/* Nav links - desktop */}
    <div className="hidden md:flex items-center gap-1 text-sm">
     <Link href="/episodes/new" className="btn btn-ghost text-xs">+ 提节目</Link>
     <Link href="/pits" className="btn btn-ghost text-xs">🕳 坑</Link>
     <Link href="/topics" className="btn btn-ghost text-xs">📋 选题</Link>
     <Link href="/collections" className="btn btn-ghost text-xs">📚 合集</Link>
          <Link href="/about" className="btn btn-ghost text-xs">关于</Link>
    </div>

    {/* 期号直达 */}
    <div className="relative flex-1 max-w-[160px]">
     <input
      type="text"
      inputMode="numeric"
      placeholder="# 期号"
      value={epNum}
      onChange={(e) => { setEpNum(e.target.value.replace(/\D/g, "")); setLookupMsg(""); }}
      onKeyDown={(e) => { if (e.key === "Enter") handleLookup(epNum); }}
      className="w-full px-3 py-1.5 text-sm bg-white border-2 border-ink-300 dark:bg-[#1a1a1a] dark:border-[#525252] focus:outline-none focus:border-ink-700 focus:outline-2 focus:outline-ink-700 transition-all text-center font-mono"
     />
     {lookupMsg && (
      <div className="absolute top-full mt-1.5 left-1/2 -translate-x-1/2 bg-white dark:bg-[#0d0d0d] border border-ink-100 dark:border-slate-600 shadow-glass p-3 text-xs text-center animate-scale-in whitespace-nowrap">
       {lookupMsg}
       {lookupMsg.includes("没有找到") && (
        <Link href="/episodes/new" className="text-brand-500 hover:text-brand-600 font-medium ml-1">现在创建？</Link>
       )}
      </div>
     )}
    </div>

    {/* Theme toggle */}
    <button
     onClick={toggleTheme}
     className="p-1.5 hover:bg-ink-100 dark:hover:bg-slate-700 transition-colors text-ink-500 shrink-0"
     aria-label="切换暗色模式"
    >
     {mounted ? (
      dark ? (
       <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z" />
       </svg>
      ) : (
       <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z" />
       </svg>
      )
     ) : (
      <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
       <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z" />
      </svg>
     )}
    </button>

    {/* User area - desktop */}
    <div className="hidden md:flex items-center gap-2 text-sm shrink-0">
     {user ? (
      <div className="flex items-center gap-2">
       <Link href="/profile" className="flex items-center gap-2 px-2 py-1 hover:bg-ink-50 dark:hover:bg-slate-700 transition-colors">
        {profile?.avatar_url ? (
         <img src={profile.avatar_url} alt="" className="w-6 h-6 object-cover " onError={e=>{(e.target as HTMLImageElement).style.display="none"}} />
        ) : (
         <div className="w-6 h-6 bg-brand-100 flex items-center justify-center text-xs text-brand-600 font-medium">
          {(profile?.username || user.email || "?")[0]}
         </div>
        )}
        <span className="text-ink-600 text-xs max-w-[100px] truncate">{profile?.username || user.email?.split("@")[0]}</span>
       </Link>
       <button onClick={handleLogout} className="btn btn-ghost text-xs text-ink-400 hover:text-red-500">退出</button>
      </div>
     ) : (
      <Link href="/login" className="btn btn-primary text-xs">登录</Link>
     )}
    </div>

    {/* Mobile menu toggle */}
    <button className="md:hidden p-1.5 hover:bg-ink-50 dark:hover:bg-slate-700" onClick={() => setMenuOpen(!menuOpen)}>
     <svg className="w-5 h-5 text-ink-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
      {menuOpen ? (
       <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
      ) : (
       <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 12h16M4 18h16" />
      )}
     </svg>
    </button>
   </div>

   {/* Mobile menu dropdown */}
   {menuOpen && (
    <div className="md:hidden border-t border-ink-200 dark:border-[#333333] bg-white dark:bg-[#0d0d0d] animate-scale-in">
     <div className="px-4 py-3 space-y-2">
      <Link href="/episodes/new" className="block px-3 py-2 hover:bg-ink-50 dark:hover:bg-slate-700 text-sm" onClick={()=>setMenuOpen(false)}>+ 提节目</Link>
      <Link href="/pits" className="block px-3 py-2 hover:bg-ink-50 dark:hover:bg-slate-700 text-sm" onClick={()=>setMenuOpen(false)}>🕳 坑</Link>
      <Link href="/topics" className="block px-3 py-2 hover:bg-ink-50 dark:hover:bg-slate-700 text-sm" onClick={()=>setMenuOpen(false)}>📋 选题库</Link>
      <Link href="/collections" className="block px-3 py-2 hover:bg-ink-50 dark:hover:bg-slate-700 text-sm" onClick={()=>setMenuOpen(false)}>📚 合集</Link>
      <button onClick={() => { toggleTheme(); }} className="w-full text-left px-3 py-2 hover:bg-ink-50 dark:hover:bg-slate-700 text-sm">
       {dark ? "☀️ 亮色模式" : "🌙 暗色模式"}
      </button>
      {user ? (
       <>
        <Link href="/profile" className="block px-3 py-2 hover:bg-ink-50 dark:hover:bg-slate-700 text-sm" onClick={()=>setMenuOpen(false)}>
         👤 {profile?.username || user.email}
        </Link>
        <button onClick={()=>{handleLogout();setMenuOpen(false);}} className="w-full text-left px-3 py-2 hover:bg-red-50 dark:hover:bg-red-900/30 text-red-500 text-sm">退出</button>
       </>
      ) : (
       <Link href="/login" className="block px-3 py-2 bg-ink-700 text-white text-center dark:bg-ink-600 text-sm" onClick={()=>setMenuOpen(false)}>登录</Link>
      )}
     </div>
    </div>
   )}
  </nav>
 );
}

