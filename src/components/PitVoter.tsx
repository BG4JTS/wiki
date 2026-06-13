"use client";

import { useState } from "react";
import { createClient } from "@/lib/supabase/client";

export default function PitVoter({ pitId, upVotes, downVotes, userId, onVoted }: {
  pitId: number; upVotes: number; downVotes: number; userId: string | null;
  onVoted?: (newStatus: string) => void;
}) {
  const [ups, setUps] = useState(upVotes);
  const [downs, setDowns] = useState(downVotes);
  const supabase = createClient();

  const vote = async (type: "up" | "down") => {
    if (!userId) return;
    await supabase.rpc("vote_pit", { p_pit_id: pitId, p_vote_type: type } as never);
    const { data } = await supabase.from("pits").select("up_votes, down_votes, status").eq("id", pitId).single() as { data: { up_votes: number; down_votes: number; status: string } | null; error: unknown };
    if (data) { setUps(data.up_votes); setDowns(data.down_votes); onVoted?.(data.status); }
  };

  return (
    <div className="flex items-center gap-3 mt-4">
      <button onClick={() => vote("up")}
        className={`inline-flex items-center gap-1 px-3 py-1.5 rounded-lg text-sm font-medium transition-all ${
          !userId ? "text-ink-300 cursor-default" : "hover:bg-green-50 text-green-600 hover:scale-105"
        }`}>
        👍 {ups}
      </button>
      <button onClick={() => vote("down")}
        className={`inline-flex items-center gap-1 px-3 py-1.5 rounded-lg text-sm font-medium transition-all ${
          !userId ? "text-ink-300 cursor-default" : "hover:bg-red-50 text-red-500 hover:scale-105"
        }`}>
        👎 {downs}
      </button>
    </div>
  );
}