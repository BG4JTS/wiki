import { notFound } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import TranscriptViewer from "@/components/TranscriptViewer";
import TimelineViewer from "@/components/TimelineViewer";
import CommentsSection from "@/components/CommentsSection";
import UserContributions from "@/components/UserContributions";
import PitSection from "@/components/PitSection";
import BGMPlaylist from "@/components/BGMPlaylist";
import WikiEditor from "@/components/WikiEditor";
import CollectionSection from "@/components/CollectionSection";

interface EpisodeData {
 id: number;
 episode_number: number;
 title: string;
 publish_date: string;
 duration: number;
 description: string;
 transcript: string;
 status: string;
}

interface TimelineData {
 id: number;
 episode_id: number;
 timestamp_sec: number;
 title: string;
 description: string;
}

export const dynamic = "force-dynamic";

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
  // query failed
 }
 if (!episode) notFound();

 const isDraft = episode.status === "draft";

 return (
  <div className="animate-fade-in-up">
   <div className="mb-8">
    {isDraft && (
     <span className="badge badge-draft mb-3">草稿 — 欢迎补充完善</span>
    )}
    {episode.status === "pending" && (
     <span className="badge badge-pending mb-3">审核中</span>
    )}
    <div className="flex items-baseline gap-3 mb-2 flex-wrap">
     <span className="text-ink-600 dark:text-ink-400 font-mono text-lg font-medium">
      #{episode.episode_number}
     </span>
     <h1 className="text-2xl sm:text-3xl font-bold text-ink-800 tracking-tight">
      {episode.title}
     </h1>
    </div>
    <div className="flex items-center gap-4 text-sm text-ink-400 mb-3">
     <span className="flex items-center gap-1">
      <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
       <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
      </svg>
      {episode.publish_date}
     </span>
     <span className="flex items-center gap-1">
      <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
       <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
      </svg>
      {Math.floor(episode.duration / 60)} 分钟
     </span>
    </div>
    {episode.description && (
     <p className="text-ink-500 text-sm leading-relaxed max-w-2xl">{episode.description}</p>
    )}
   </div>

   <WikiEditor episode={episode} />

   <div className="grid grid-cols-1 lg:grid-cols-3 gap-8 mt-6">
    <div className="lg:col-span-2 space-y-10">
     {timelines.length > 0 && <TimelineViewer timelines={timelines} />}
     <BGMPlaylist episodeId={episode.id} />
     <TranscriptViewer transcript={episode.transcript} />
     <CommentsSection episodeId={episode.id} />
    </div>
    <div className="lg:col-span-1 space-y-6">
     <CollectionSection episodeId={episode.id} />
     <UserContributions episodeId={episode.id} />
     <PitSection episodeId={episode.id} />
    </div>
   </div>
  </div>
 );
}
