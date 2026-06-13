"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";

export default function PitVoter({ pitId, upVotes, downVotes, userId }: {
  pitId: number; upVotes: number; downVotes: number; userId: string | null;
}) {
  const [ups, setUps] = useState(upVotes);
  const [downs, setDowns] = useState(downVotes);
  const router = useRouter();
  const supabase = createClient();

  const vote = async (type: "up" | "down") => {
    if (!userId) return;
    const { error } = await supabase.rpc("vote_pit", { p_pit_id: pitId, p_vote_type: type } as never);
    if (!error) { router.refresh(); }
  };

  return (
    <div className="flex items-center gap-3 mt-3">
      <button onClick={() => vote("up")}
        className={`px-3 py-1 rounded text-sm ${!userId ? "text-gray-300 cursor-not-allowed" : "hover:bg-green-50 text-green-600"}`}>
        👍 {ups}
      </button>
      <button onClick={() => vote("down")}
        className={`px-3 py-1 rounded text-sm ${!userId ? "text-gray-300 cursor-not-allowed" : "hover:bg-red-50 text-red-500"}`}>
        👎 {downs}
      </button>
    </div>
  );
}
