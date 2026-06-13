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
  status: string; up_votes: number; down_votes: number; best_fill_id: number | null; created_at: string;
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
  const [pitAuthor, setPitAuthor] = useState<{username:string;avatar_url:string}|null>(null);
  const [fillEps, setFillEps] = useState<Map<number, string>>(new Map());
  const [userId, setUserId] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);

  const load = async () => {
    const { data: u } = await supabase.auth.getUser();
    setUserId(u.user?.id ?? null);

    const r = await supabase.from("pits").select("*").eq("id", id).single() as { data: PitData | null; error: unknown };
    if (!r.data) { notFound(); return; }
    setPit(r.data);
    if (r.data.user_id) {
      supabase.from("user_profiles").select("username,avatar_url").eq("id",r.data.user_id).single()
        .then(({data:pd})=>{if(pd)setPitAuthor(pd as {username:string;avatar_url:string})});
    }

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

  const setBestFill = async (fillId: number) => {
    await (supabase.from("pits").update({ best_fill_id: fillId } as never).eq("id", id)) as unknown as { error: unknown };
    load();
  };

  const handleStatusChange = (newStatus: string) => {
    if (pit) setPit({ ...pit, status: newStatus });
  };

  const handleFillVoted = () => load();

  if (loading) return (
    <div className="animate-fade-in space-y-4">
      <div className="skeleton h-6 w-20 rounded-full" />
      <div className="skeleton h-8 w-64" />
      <div className="skeleton h-4 w-48" />
      <div className="skeleton h-20 w-full rounded-xl" />
    </div>
  );
  if (!pit) return null;

  const statusLabel: Record<string, string> = { open: "🕳 开放", pending: "⏳ 待填", filled: "✅ 已填" };
  const sc: Record<string, string> = { open: "badge-brand", pending: "badge-pending", filled: "badge-published" };

  return (
    <div className="animate-fade-in-up">
      <div className="mb-8">
        <span className={`badge ${sc[pit.status]} mb-3`}>{statusLabel[pit.status]}</span>
        <h1 className="text-2xl font-bold text-ink-800 mt-2">{pit.title}</h1>
        {pitAuthor && (
          <div className="flex items-center gap-1.5 mt-2 text-xs text-ink-400">
            <img src={pitAuthor.avatar_url||""} alt="" className="w-4 h-4 rounded-full object-cover" onError={e=>{(e.target as HTMLImageElement).style.display="none"}} />
            <span>{pitAuthor.username}</span>
          </div>
        )}
        <div className="flex flex-wrap gap-x-4 gap-y-1 text-sm mt-2 text-ink-500">
          {episodeTitle && (
            <span className="flex items-center gap-1">
              📄 <Link href={`/episodes/${pit.episode_id}`} className="text-brand-500 hover:text-brand-600 font-medium">{episodeTitle}</Link>
            </span>
          )}
          {pit.timestamp_sec != null && (
            <span className="flex items-center gap-1">⏱ {formatTime(pit.timestamp_sec)}</span>
          )}
        </div>
        {pit.description && <p className="text-ink-500 text-sm mt-3 leading-relaxed">{pit.description}</p>}
        <PitVoter pitId={pit.id} upVotes={pit.up_votes} downVotes={pit.down_votes} userId={userId} onVoted={handleStatusChange} />
      </div>

      <FillSection pitId={pit.id} pitStatus={pit.status} fills={fills}
        fillEpisodes={fillEps} userId={userId} ownerId={pit.user_id} bestFillId={pit.best_fill_id}
        onSetBest={setBestFill} onVoted={handleFillVoted} />
    </div>
  );
}