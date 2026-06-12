import { notFound } from 'next/navigation';
import { createClient } from '@/lib/supabase/server';
import TranscriptViewer from '@/components/TranscriptViewer';
import TimelineViewer from '@/components/TimelineViewer';
import CommentsSection from '@/components/CommentsSection';
import UserContributions from '@/components/UserContributions';

export async function generateStaticParams() {
  const supabase = await createClient();
  const { data } = await supabase.from('episodes').select('id');
  return (data || []).map((ep) => ({ id: String(ep.id) }));
}

export default async function EpisodePage({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const { id } = await params;
  const supabase = await createClient();

  const { data: episode } = await supabase
    .from('episodes')
    .select('*')
    .eq('id', id)
    .single();

  if (!episode) notFound();

  const { data: timelines } = await supabase
    .from('timelines')
    .select('*')
    .eq('episode_id', id)
    .order('timestamp_sec');

  return (
    <div>
      <div className='mb-8'>
        <div className='flex items-baseline gap-3 mb-2'>
          <span className='text-indigo-600 font-mono'>#{episode.episode_number}</span>
          <h1 className='text-2xl font-bold'>{episode.title}</h1>
        </div>
        <div className='flex gap-4 text-sm text-gray-500 mb-3'>
          <span>{episode.publish_date}</span>
          <span>{Math.floor(episode.duration / 60)} 分钟</span>
        </div>
        <p className='text-gray-600'>{episode.description}</p>
      </div>

      <div className='grid grid-cols-1 lg:grid-cols-3 gap-6'>
        <div className='lg:col-span-2 space-y-8'>
          {timelines && timelines.length > 0 && (
            <TimelineViewer timelines={timelines} />
          )}
          <TranscriptViewer transcript={episode.transcript} />
          <CommentsSection episodeId={episode.id} />
        </div>

        <div className='lg:col-span-1'>
          <UserContributions episodeId={episode.id} />
        </div>
      </div>
    </div>
  );
}
