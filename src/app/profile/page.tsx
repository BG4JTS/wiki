import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import ProfileEditor from "@/components/ProfileEditor";

interface ProfileData {
  id: string;
  username: string;
  avatar_url: string;
  bio: string;
}

interface CommentItem {
  id: number;
  content: string;
  created_at: string;
  episode: { title: string } | null;
}

export default async function ProfilePage() {
  const supabase = await createClient();
  const { data } = await supabase.auth.getUser();
  const user = data.user;

  if (!user) redirect("/login");

  const profileResult = await supabase
    .from("user_profiles")
    .select("*")
    .eq("id", user.id)
    .single();
  const profile = profileResult.data as ProfileData | null;

  const commentResult = await supabase
    .from("comments")
    .select("id, content, created_at, episode:episodes(title)")
    .eq("user_id", user.id)
    .order("created_at", { ascending: false })
    .limit(20);
  const comments = (commentResult.data ?? []) as CommentItem[];

  return (
    <div>
      <h1 className="text-2xl font-bold mb-6">个人中心</h1>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
        <div>
          <h2 className="text-lg font-semibold mb-3">个人资料</h2>
          <ProfileEditor user={user} profile={profile} />
        </div>

        <div>
          <h2 className="text-lg font-semibold mb-3">我的评论</h2>
          {comments.length === 0 ? (
            <p className="text-sm text-gray-400">暂无评论</p>
          ) : (
            <div className="space-y-2">
              {comments.map((c) => (
                <div key={c.id} className="bg-white border rounded-lg p-3 text-sm">
                  <p className="text-xs text-gray-500 mb-1">
                    {new Date(c.created_at).toLocaleString("zh-CN")}
                  </p>
                  <p>{c.content}</p>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
