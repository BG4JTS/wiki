import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import AdminEditor from "@/components/AdminEditor";

interface AdminEpisodeItem {
  id: number;
  episode_number: number;
  title: string;
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

  const epResult = await supabase
    .from("episodes")
    .select("id, episode_number, title")
    .order("episode_number", { ascending: false });
  const episodes = (epResult.data ?? []) as AdminEpisodeItem[];

  return <AdminEditor episodes={episodes} />;
}
