import { notFound } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import TranscriptViewer from "@/components/TranscriptViewer";
import TimelineViewer from "@/components/TimelineViewer";
import CommentsSection from "@/components/CommentsSection";
import UserContributions from "@/components/UserContributions";

// ---- 类型定义 ----
interface EpisodeData {
  id: number;
  episode_number: number;
  title: string;
  publish_date: string;
  duration: number;
  description: string;
  transcript: string;
}

interface TimelineData {
  id: number;
  episode_id: number;
  timestamp_sec: number;
  title: string;
  description: string;
}

// ---- 静态路径 ----
export const dynamic = 'force-dynamic';

// ---- 页面组件 ----
export default async function EpisodePage({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const { id } = await params;
  const supabase = await createClient();

  let episode: EpisodeData | null = null;
  let timelines: TimelineData[] = [];
  try {
    const epResult = await supabase
      .from("episodes")
      .select("*")
      .eq("id", id)
      .single();
    episode = epResult.data as EpisodeData | null;

    const tlResult = await supabase
      .from("timelines")
      .select("*")
      .eq("episode_id", id)
      .order("timestamp_sec");
    timelines = (tlResult.data ?? []) as TimelineData[];
  } catch {
    // query failed, show not found
  }
  if (!episode) notFound();

  return (
    <div>
      <div className="mb-8">
        <div className="flex items-baseline gap-3 mb-2">
          <span className="text-indigo-600 font-mono">
            #{episode.episode_number}
          </span>
          <h1 className="text-2xl font-bold">{episode.title}</h1>
        </div>
        <div className="flex gap-4 text-sm text-gray-500 mb-3">
          <span>{episode.publish_date}</span>
          <span>{Math.floor(episode.duration / 60)} 分钟</span>
        </div>
        <p className="text-gray-600">{episode.description}</p>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        <div className="lg:col-span-2 space-y-8">
          {timelines.length > 0 && <TimelineViewer timelines={timelines} />}
          <TranscriptViewer transcript={episode.transcript} />
          <CommentsSection episodeId={episode.id} />
        </div>
        <div className="lg:col-span-1">
          <UserContributions episodeId={episode.id} />
        </div>
      </div>
    </div>
  );
}
