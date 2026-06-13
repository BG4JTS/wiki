"use client";

import { useState, useEffect } from "react";
import { useParams, notFound } from "next/navigation";
import Link from "next/link";
import { createClient } from "@/lib/supabase/client";
import PitVoter from "@/components/PitVoter";
import FillSection from "@/components/FillSection";

interface PitData {
  id: number; episode_id: number | null; timestamp_sec: number | null;
  user_id: string; title: string; description: string;
  status: string; up_votes: number; down_votes: number; created_at: string;
}
interface FillData {
  id: number; pit_id: number; episode_id: number | null; timestamp_sec: number | null;
  user_id: string; description: string; up_votes: number; down_votes: number; created_at: string;
}
interface EpMeta { id: number; title: string; }

function formatTime(sec: number | null): string {
  if (sec == null) return "";
  const m = Math.floor(sec / 60), s = sec % 60;
  return m + ":" + String(s).padStart(2, "0");
}

export default function PitDetailPage() {
  const { id } = useParams<{ id: string }>();
  const supabase = createClient();
  const [pit, setPit] = useState<PitData | null>(null);
  const [fills, setFills] = useState<FillData[]>([]);
  const [episodeTitle, setEpisodeTitle] = useState("");
  const [fillEps, setFillEps] = useState<Map<number, string>>(new Map());
  const [userId, setUserId] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);

  const load = async () => {
    const { data: u } = await supabase.auth.getUser();
    setUserId(u.user?.id ?? null);

    const r = await supabase.from("pits").select("*").eq("id", id).single() as { data: PitData | null; error: unknown };
    if (!r.data) { notFound(); return; }
    setPit(r.data);

    if (r.data.episode_id) {
      const ep = await supabase.from("episodes").select("title").eq("id", r.data.episode_id).single() as { data: EpMeta | null; error: unknown };
      if (ep.data) setEpisodeTitle(ep.data.title);
    }

    const fr = await supabase.from("pit_fills").select("*").eq("pit_id", id).order("up_votes", { ascending: false }) as { data: FillData[] | null; error: unknown };
    const fdata = fr.data ?? [];
    setFills(fdata);

    const eids = [...new Set(fdata.filter(f => f.episode_id).map(f => f.episode_id!))];
    if (eids.length > 0) {
      const epr = await supabase.from("episodes").select("id, title").in("id", eids) as { data: EpMeta[] | null; error: unknown };
      if (epr.data) setFillEps(new Map(epr.data.map(e => [e.id, e.title])));
    }
    setLoading(false);
  };

  useEffect(() => { load(); }, [id]);

  const handleStatusChange = (newStatus: string) => {
    if (pit) setPit({ ...pit, status: newStatus });
  };

  const handleFillVoted = () => load();

  if (loading) return <div className="text-center py-20 text-gray-400">加载中...</div>;
  if (!pit) return null;

  const statusLabel: Record<string, string> = { open: "🕳 开放", pending: "⏳ 待填", filled: "✅ 已填" };
  const sc: Record<string, string> = { open: "bg-gray-100 text-gray-600", pending: "bg-yellow-100 text-yellow-700", filled: "bg-green-100 text-green-700" };

  return (
    <div>
      <div className="mb-6">
        <span className={`text-xs px-2 py-0.5 rounded-full ${sc[pit.status]}`}>{statusLabel[pit.status]}</span>
        <h1 className="text-2xl font-bold mt-2">{pit.title}</h1>
        <div className="flex flex-wrap gap-x-4 gap-y-1 text-sm mt-1 text-gray-500">
          {episodeTitle && (
            <span>📄 <Link href={`/episodes/${pit.episode_id}`} className="text-indigo-500 hover:underline">{episodeTitle}</Link></span>
          )}
          {pit.timestamp_sec != null && (
            <span>⏱ {formatTime(pit.timestamp_sec)}</span>
          )}
        </div>
        {pit.description && <p className="text-gray-600 mt-2">{pit.description}</p>}
        <PitVoter pitId={pit.id} upVotes={pit.up_votes} downVotes={pit.down_votes} userId={userId} onVoted={handleStatusChange} />
      </div>

      <FillSection pitId={pit.id} pitStatus={pit.status} fills={fills}
        fillEpisodes={fillEps} userId={userId} onVoted={handleFillVoted} />
    </div>
  );
}
