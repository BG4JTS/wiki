"use client";

import { useEffect, useState } from "react";
import { createClient } from "@/lib/supabase/client";
import Link from "next/link";

interface CollectionInfo {
  id: number;
  name: string;
  description: string;
}

export default function CollectionSection({ episodeId }: { episodeId: number }) {
  const [collections, setCollections] = useState<CollectionInfo[]>([]);

  useEffect(() => {
    const supabase = createClient();
    supabase
      .from("collection_episodes")
      .select("collection_id, collections(id, name, description)")
      .eq("episode_id", episodeId)
      .order("added_at")
      .then(({ data }) => {
        if (data) {
          const list: CollectionInfo[] = [];
          data.forEach((row: Record<string, unknown>) => {
            const col = row.collections as CollectionInfo | undefined;
            if (col) list.push(col);
          });
          setCollections(list);
        }
      });
  }, [episodeId]);

  if (collections.length === 0) return null;

  return (
    <div className="border-2 border-ink-200 p-4">
      <h3 className="text-sm font-bold text-ink-700 mb-3 flex items-center gap-1.5">
        <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10" />
        </svg>
        所属合集
      </h3>
      <div className="space-y-2">
        {collections.map((c) => (
          <Link key={c.id} href={"/collections/" + c.id} className="block border border-ink-200 p-3 hover:bg-ink-50 transition-colors">
            <div className="text-sm font-semibold text-ink-700">{c.name}</div>
            {c.description && <div className="text-xs text-ink-400 mt-0.5 line-clamp-2">{c.description}</div>}
          </Link>
        ))}
      </div>
    </div>
  );
}