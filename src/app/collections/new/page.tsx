"use client";

import { useState } from "react";
import { createClient } from "@/lib/supabase/client";
import { useRouter } from "next/navigation";

export default function NewCollectionPage() {
  const router = useRouter();
  const [collName, setCollName] = useState("");
  const [collDesc, setCollDesc] = useState("");
  const [loading, setLoading] = useState(false);
  const [errorText, setErrorText] = useState("");

  const handleCreate = async () => {
    if (!collName.trim()) { setErrorText("合集名称不能为空"); return; }
    setLoading(true); setErrorText("");
    const supabase = createClient();
    const result = await supabase
      .from("collections")
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      .insert({ name: collName.trim(), description: collDesc.trim() } as any)
      .select("id")
      .single();
    if (result.error) { setErrorText(result.error.message); setLoading(false); return; }
    const inserted = result.data as { id: number } | null;
    if (inserted) router.push("/collections/" + inserted.id);
  };

  return (
    <div className="animate-fade-in-up max-w-lg mx-auto">
      <h1 className="text-2xl font-bold text-ink-800 mb-6">创建合集</h1>
      {errorText && <div className="border-2 border-red-500 p-3 text-sm text-red-600 mb-4">{errorText}</div>}
      <div className="space-y-4">
        <div>
          <label className="block text-sm font-semibold text-ink-600 mb-1">合集名称 *</label>
          <input type="text" value={collName} onChange={(e) => setCollName(e.target.value)} className="w-full border-2 border-ink-200 p-2 text-sm" placeholder="例如：太阳系漫游指南" />
        </div>
        <div>
          <label className="block text-sm font-semibold text-ink-600 mb-1">简介</label>
          <textarea value={collDesc} onChange={(e) => setCollDesc(e.target.value)} className="w-full border-2 border-ink-200 p-2 text-sm min-h-[80px]" placeholder="描述这个系列的内容..." />
        </div>
        <button onClick={handleCreate} disabled={loading} className="btn btn-primary text-sm">
          {loading ? "创建中..." : "创建合集"}
        </button>
      </div>
    </div>
  );
}