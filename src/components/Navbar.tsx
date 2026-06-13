"use client";

import { useState, useEffect, useRef } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import type { User } from "@/types/database";

interface SearchResult {
  id: number;
  title: string;
  episode_number: number;
}

export default function Navbar() {
  const router = useRouter();
  const [query, setQuery] = useState("");
  const [results, setResults] = useState<SearchResult[]>([]);
  const [isOpen, setIsOpen] = useState(false);
  const [user, setUser] = useState<User | null>(null);
  const [profile, setProfile] = useState<{ username: string; avatar_url: string } | null>(null);
  const [mounted, setMounted] = useState(false);
  const [menuOpen, setMenuOpen] = useState(false);
  const [dark, setDark] = useState(false);
  const supabaseRef = useRef<ReturnType<typeof createClient> | null>(null);
  const timerRef = useRef<ReturnType<typeof setTimeout>>(undefined);

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
    // 从 DOM 读取当前主题 (layout 脚本已设置)
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

  const handleSearch = async (searchQuery: string) => {
    if (searchQuery.length < 2) { setResults([]); return; }
    const supabase = getSupabase();
    if (!supabase) return;
    const result = await supabase
      .from("episodes")
      .select("id, title, episode_number")
      .or(`title.ilike.%${searchQuery}%,transcript.ilike.%${searchQuery}%`)
      .limit(5) as { data: SearchResult[] | null; error: unknown };
    setResults(result.data ?? []);
  };

  useEffect(() => {
    if (!mounted) return;
    clearTimeout(timerRef.current);
    timerRef.current = setTimeout(() => handleSearch(query), 300);
    return () => clearTimeout(timerRef.current);
  }, [query, mounted]);

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
          <span className="text-xl font-bold bg-gradient-to-r from-brand-400 to-brand-600 bg-clip-text text-transparent">
            原样WIKI
          </span>
          <span className="hidden sm:inline text-xs text-warm-400 font-medium bg-warm-100 px-2 py-0.5 rounded-full">
            β
          </span>
        </Link>

        {/* Nav links - desktop */}
        <div className="hidden md:flex items-center gap-1 text-sm">
          <Link href="/episodes/new" className="btn btn-ghost text-xs">+ 提节目</Link>
          <Link href="/pits" className="btn btn-ghost text-xs">🕳 坑</Link>
        </div>

        {/* Search */}
        <div className="relative flex-1 max-w-sm">
          <div className="relative">
            <svg className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-ink-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
            </svg>
            <input type="text" placeholder="搜索节目..." value={query}
              onChange={(e) => { setQuery(e.target.value); setIsOpen(true); }}
              onFocus={() => setIsOpen(true)}
              onBlur={() => setTimeout(() => setIsOpen(false), 200)}
              className="w-full pl-9 pr-3 py-1.5 text-sm bg-white/60 dark:bg-slate-800/60 border border-ink-200 rounded-xl focus:outline-none focus:border-brand-400 focus:ring-2 focus:ring-brand-400/15 transition-all" />
          </div>
          {isOpen && results.length > 0 && (
            <div className="absolute top-full mt-1.5 w-full bg-white/95 dark:bg-slate-800/95 backdrop-blur-md border border-ink-100 dark:border-slate-600 rounded-xl shadow-glass overflow-hidden animate-scale-in">
              {results.map((ep) => (
                <Link key={ep.id} href={"/episodes/"+ep.id} className="flex items-center gap-2 px-3 py-2.5 text-sm hover:bg-brand-50 dark:hover:bg-slate-700 transition-colors">
                  <span className="text-xs font-mono text-brand-500 shrink-0">#{ep.episode_number}</span>
                  <span className="truncate">{ep.title}</span>
                </Link>
              ))}
            </div>
          )}
        </div>

        {/* Theme toggle */}
        <button
          onClick={toggleTheme}
          className="p-1.5 rounded-lg hover:bg-ink-100 dark:hover:bg-slate-700 transition-colors text-ink-500 shrink-0"
          aria-label="切换暗色模式"
          title={dark ? "切换到亮色模式" : "切换到暗色模式"}
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
              <Link href="/profile" className="flex items-center gap-2 px-2 py-1 rounded-lg hover:bg-ink-50 dark:hover:bg-slate-700 transition-colors">
                {profile?.avatar_url ? (
                  <img src={profile.avatar_url} alt="" className="w-6 h-6 rounded-full object-cover ring-2 ring-brand-100" onError={e=>{(e.target as HTMLImageElement).style.display="none"}} />
                ) : (
                  <div className="w-6 h-6 rounded-full bg-brand-100 flex items-center justify-center text-xs text-brand-600 font-medium">
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
        <button className="md:hidden p-1.5 rounded-lg hover:bg-ink-50 dark:hover:bg-slate-700" onClick={() => setMenuOpen(!menuOpen)}>
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
        <div className="md:hidden border-t border-ink-100 dark:border-slate-700 bg-white/95 dark:bg-slate-800/95 backdrop-blur-md animate-scale-in">
          <div className="px-4 py-3 space-y-2">
            <Link href="/episodes/new" className="block px-3 py-2 rounded-lg hover:bg-ink-50 dark:hover:bg-slate-700 text-sm" onClick={()=>setMenuOpen(false)}>+ 提节目</Link>
            <Link href="/pits" className="block px-3 py-2 rounded-lg hover:bg-ink-50 dark:hover:bg-slate-700 text-sm" onClick={()=>setMenuOpen(false)}>🕳 坑</Link>
            <button onClick={() => { toggleTheme(); }} className="w-full text-left px-3 py-2 rounded-lg hover:bg-ink-50 dark:hover:bg-slate-700 text-sm">
              {dark ? "☀️ 亮色模式" : "🌙 暗色模式"}
            </button>
            {user ? (
              <>
                <Link href="/profile" className="block px-3 py-2 rounded-lg hover:bg-ink-50 dark:hover:bg-slate-700 text-sm" onClick={()=>setMenuOpen(false)}>
                  👤 {profile?.username || user.email}
                </Link>
                <button onClick={()=>{handleLogout();setMenuOpen(false);}} className="w-full text-left px-3 py-2 rounded-lg hover:bg-red-50 dark:hover:bg-red-900/30 text-red-500 text-sm">退出</button>
              </>
            ) : (
              <Link href="/login" className="block px-3 py-2 rounded-lg bg-brand-500 text-white text-center text-sm" onClick={()=>setMenuOpen(false)}>登录</Link>
            )}
          </div>
        </div>
      )}
    </nav>
  );
}