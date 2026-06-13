import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import AdminEditor from "@/components/AdminEditor";

interface PitItem { id: number; title: string; status: string; up_votes: number; down_votes: number; }

interface AdminEpisodeItem {
  id: number;
  episode_number: number;
  title: string;
  status: string;
}

export default async function AdminPage() {
  const supabase = await createClient();
  const { data } = await supabase.auth.getUser();
  const user = data.user;

  if (!user) redirect("/login");

  const adminEmail = process.env.ADMIN_EMAIL;
  if (adminEmail && user.email?.toLowerCase().trim() !== adminEmail.toLowerCase().trim()) {
    return (
      <div className="text-center py-20">
        <p className="text-lg text-gray-500">无权访问管理后台</p>
      </div>
    );
  }

  let episodes: AdminEpisodeItem[] = [];
  try {
    const epResult = await supabase
      .from("episodes")
      .select("id, episode_number, title, status")
      .order("episode_number", { ascending: false });
    episodes = (epResult.data ?? []) as AdminEpisodeItem[];
  } catch {
    episodes = [];
  }

  let pits: PitItem[] = [];
  try {
    const pResult = await supabase.from("pits").select("id, title, status, up_votes, down_votes").order("created_at", { ascending: false }).limit(50) as { data: PitItem[] | null; error: unknown };
    pits = pResult.data ?? [];
  } catch { /* */ }

  return <AdminEditor episodes={episodes} pits={pits} />;
}
