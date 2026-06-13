import { notFound } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import PitVoter from "@/components/PitVoter";
import FillSection from "@/components/FillSection";

interface PitData {
  id: number; episode_id: number | null; user_id: string;
  title: string; description: string;
  status: string; up_votes: number; down_votes: number; created_at: string;
}
interface FillData {
  id: number; pit_id: number; episode_id: number | null; user_id: string;
  description: string; up_votes: number; down_votes: number; created_at: string;
}

export const dynamic = "force-dynamic";

export default async function PitDetailPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  const supabase = await createClient();

  let pit: PitData | null = null;
  let fills: FillData[] = [];
  let episodeTitle = "";
  const fillEpisodes: Map<number, string> = new Map();

  try {
    const pResult = await supabase.from("pits").select("*").eq("id", id).single() as { data: PitData | null; error: unknown };
    pit = pResult.data;
    if (!pit) notFound();

    if (pit.episode_id) {
      const epResult = await supabase.from("episodes").select("title").eq("id", pit.episode_id).single() as { data: { title: string } | null; error: unknown };
      if (epResult.data) episodeTitle = epResult.data.title;
    }

    const fResult = await supabase.from("pit_fills").select("*").eq("pit_id", id).order("up_votes", { ascending: false }) as { data: FillData[] | null; error: unknown };
    fills = fResult.data ?? [];

    const epIds = [...new Set(fills.filter(f => f.episode_id).map(f => f.episode_id!))];
    if (epIds.length > 0) {
      const epsResult = await supabase.from("episodes").select("id, title").in("id", epIds) as { data: { id: number; title: string }[] | null; error: unknown };
      if (epsResult.data) epsResult.data.forEach(e => fillEpisodes.set(e.id, e.title));
    }
  } catch { notFound(); }

  const { data: { user } } = await supabase.auth.getUser();
  const statusLabel: Record<string, string> = { open: "🕳 开放", pending: "⏳ 待填", filled: "✅ 已填" };
  const statusColor: Record<string, string> = { open: "bg-gray-100 text-gray-600", pending: "bg-yellow-100 text-yellow-700", filled: "bg-green-100 text-green-700" };

  return (
    <div>
      <div className="mb-6">
        <span className={`text-xs px-2 py-0.5 rounded-full ${statusColor[pit.status]}`}>{statusLabel[pit.status]}</span>
        <h1 className="text-2xl font-bold mt-2">{pit.title}</h1>
        {episodeTitle && <p className="text-sm text-indigo-500 mt-1">📄 {episodeTitle}</p>}
        {pit.description && <p className="text-gray-600 mt-2">{pit.description}</p>}
        <PitVoter pitId={pit.id} upVotes={pit.up_votes} downVotes={pit.down_votes} userId={user?.id ?? null} />
      </div>

      <FillSection pitId={pit.id} pitStatus={pit.status} fills={fills} fillEpisodes={fillEpisodes} userId={user?.id ?? null} />
    </div>
  );
}
