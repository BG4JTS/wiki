import { redirect } from 'next/navigation';
import { createClient } from '@/lib/supabase/server';
import AdminEditor from '@/components/AdminEditor';

export default async function AdminPage() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) redirect('/login');

  const adminEmail = process.env.ADMIN_EMAIL;
  if (adminEmail && user.email !== adminEmail) {
    return (
      <div className='text-center py-20'>
        <p className='text-lg text-gray-500'>无权访问管理后台</p>
      </div>
    );
  }

  const { data: episodes } = await supabase
    .from('episodes')
    .select('id, episode_number, title')
    .order('episode_number', { ascending: false });

  return <AdminEditor episodes={episodes || []} />;
}
