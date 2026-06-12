"use client";

import { useState, useEffect, useCallback } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import type { Episode } from "@/types/database";

export default function Navbar() {
  const router = useRouter();
  const [query, setQuery] = useState("");
  const [results, setResults] = useState<Episode[]>([]);
  const [isOpen, setIsOpen] = useState(false);
  const [user, setUser] = useState<any>(null);
  const supabase = createClient();

  useEffect(() => {
    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange((_event, session) => {
      setUser(session?.user ?? null);
    });
    return () => subscription.unsubscribe();
  }, []);

  const handleSearch = useCallback(
    async (searchQuery: string) => {
      if (searchQuery.length < 2) {
        setResults([]);
        return;
      }
      const { data } = await supabase
        .from("episodes")
        .select("id, title, episode_number")
        .or(`title.ilike.%${searchQuery}%,transcript.ilike.%${searchQuery}%`)
        .limit(5);
      setResults(data || []);
    },
    [supabase]
  );

  useEffect(() => {
    const timer = setTimeout(() => handleSearch(query), 300);
    return () => clearTimeout(timer);
  }, [query, handleSearch]);

  const handleLogout = async () => {
    await supabase.auth.signOut();
    router.refresh();
  };

  return (
    <nav className="bg-white shadow-sm border-b sticky top-0 z-50">
      <div className="max-w-5xl mx-auto px-4 h-14 flex items-center justify-between gap-4">
        <Link href="/" className="text-xl font-bold text-indigo-600 shrink-0">
          原样WIKI
        </Link>

        <div className="relative flex-1 max-w-md">
          <input
            type="text"
            placeholder="搜索节目..."
            value={query}
            onChange={(e) => {
              setQuery(e.target.value);
              setIsOpen(true);
            }}
            onFocus={() => setIsOpen(true)}
            onBlur={() => setTimeout(() => setIsOpen(false), 200)}
            className="w-full px-3 py-1.5 text-sm border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-400"
          />
          {isOpen && results.length > 0 && (
            <div className="absolute top-full mt-1 w-full bg-white border rounded-lg shadow-lg overflow-hidden">
              {results.map((ep) => (
                <Link
                  key={ep.id}
                  href={`/episodes/${ep.id}`}
                  className="block px-3 py-2 text-sm hover:bg-indigo-50"
                >
                  #{ep.episode_number} {ep.title}
                </Link>
              ))}
            </div>
          )}
        </div>

        <div className="flex items-center gap-3 text-sm shrink-0">
          {user ? (
            <>
              <Link href="/profile" className="hover:text-indigo-600">
                {user.email}
              </Link>
              <button onClick={handleLogout} className="text-gray-400 hover:text-red-500">
                退出
              </button>
            </>
          ) : (
            <Link href="/login" className="text-indigo-600 hover:text-indigo-800">
              登录
            </Link>
          )}
        </div>
      </div>
    </nav>
  );
}
