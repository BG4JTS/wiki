"use client";

import { useState, useEffect } from "react";
import Link from "next/link";
import { createClient } from "@/lib/supabase/client";

interface TopicItem { id: number; user_id: string; title: string; description: string; status: string; up_votes: number; down_votes: number; created_at: string; }

type SortKey = "up_votes" | "created_at";

export default function TopicsPage() {
  const supabase = createClient();
  const [topics, setTopics] = useState<TopicItem[]>([]);
  const [tab, setTab] = useState<"all" | "open" | "closed">("all");
  const [sort, setSort] = useState<SortKey>("up_votes");
  const [profiles, setProfiles] = useState<Map<string,{username:string;avatar_url:string}>>(new Map());
  const [loading, setLoading] = useState(true);
  const [userId, setUserId] = useState<string | null>(null);
  const [myVotes, setMyVotes] = useState<Map<number,string>>(new Map());

  useEffect(() => { init(); }, []);

  const init = async () => {
    const { data: { user } } = await supabase.auth.getUser();
    if (user) setUserId(user.id);

    const r = await supabase.from("topics").select("*").order("up_votes",{ascending:false}).limit(100) as unknown as { data: TopicItem[] | null; error: unknown };
    const data = r.data ?? [];

    const uids = [...new Set(data.map((t: TopicItem) => t.user_id).filter(Boolean))];
    if (uids.length) {
      const pr = await supabase.from("user_profiles").select("id,username,avatar_url").in("id",uids) as unknown as { data: { id: string; username: string; avatar_url: string }[] | null; error: unknown };
      if (pr.data) setProfiles(new Map(pr.data.map(p => [p.id, p])));
    }

    if (user) {
      const vr = await supabase.from("topic_votes").select("topic_id,vote_type").eq("user_id", user.id) as unknown as { data: { topic_id: number; vote_type: string }[] | null; error: unknown };
      if (vr.data) setMyVotes(new Map(vr.data.map(v => [v.topic_id, v.vote_type])));
    }

    setTopics(data);
    setLoading(false);
  };

  const handleVote = async (topicId: number, voteType: "up" | "down") => {
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const r = await (supabase.rpc as any)("vote_topic", { p_topic_id: topicId, p_vote_type: voteType }) as { error: { message: string } | null };
    if (r.error) { alert(r.error.message); return; }
    setTopics(prev => prev.map(t => {
      if (t.id !== topicId) return t;
      const prevVote = myVotes.get(topicId);
      let up = t.up_votes, down = t.down_votes;
      if (!prevVote) {
        if (voteType === "up") up++; else down++;
      } else if (prevVote === voteType) {
        if (voteType === "up") up = Math.max(0, up - 1); else down = Math.max(0, down - 1);
      } else {
        if (voteType === "up") { up++; down = Math.max(0, down - 1); }
        else { down++; up = Math.max(0, up - 1); }
      }
      return { ...t, up_votes: up, down_votes: down };
    }));
    setMyVotes(prev => {
      const next = new Map(prev);
      const prevVote = prev.get(topicId);
      if (!prevVote) next.set(topicId, voteType);
      else if (prevVote === voteType) next.delete(topicId);
      else next.set(topicId, voteType);
      return next;
    });
  };

  const filtered = topics.filter(t => tab === "all" ? true : t.status === tab).sort((a, b) => {
    if (sort === "up_votes") return b.up_votes - a.up_votes;
    return new Date(b.created_at).getTime() - new Date(a.created_at).getTime();
  });

  const tabsList: Array<{ key: typeof tab; label: string }> = [
    { key: "all", label: "全部" }, { key: "open", label: "开放" }, { key: "closed", label: "已关闭" }
  ];

  if (loading) return (
    <div className="animate-fade-in space-y-4">
      <div className="skeleton h-9 w-32" />
      <div className="flex gap-2">
        {[1, 2, 3].map(i => <div key={i} className="skeleton h-7 w-16 rounded-full" />)}
      </div>
      {[1, 2, 3, 4, 5].map(i => <div key={i} className="skeleton h-20 w-full rounded-xl" />)}
    </div>
  );

  return (
    <div className="animate-fade-in-up">
      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold text-ink-800">📋 选题库</h1>
        <Link href="/topics/new" className="btn btn-primary text-sm">+ 提选题</Link>
      </div>

      <div className="flex items-center justify-between mb-4 flex-wrap gap-2">
        <div className="flex gap-1">
          {tabsList.map(t => (
            <button key={t.key} onClick={() => setTab(t.key)}
              className={`text-xs px-3 py-1.5 rounded-full font-medium transition-all ${tab === t.key ? "bg-brand-500 text-white shadow-sm" : "bg-white text-ink-500 border border-ink-100 hover:border-brand-200"
                }`}>
              {t.label}
            </button>
          ))}
        </div>
        <select value={sort} onChange={e => setSort(e.target.value as SortKey)} className="text-xs border border-ink-200 rounded-lg px-3 py-1.5 bg-white text-ink-500">
          <option value="up_votes">👍 票数排序</option>
          <option value="created_at">🕐 时间排序</option>
        </select>
      </div>

      {filtered.length === 0 ? (
        <div className="text-center py-20">
          <div className="text-4xl mb-3">📋</div>
          <p className="text-ink-400">{tab === "all" ? "暂无选题，来提第一个吧" : "此分类暂无选题"}</p>
        </div>
      ) : (
        <div className="space-y-3">
          {filtered.map(topic => {
            const pp = profiles.get(topic.user_id);
            const myVote = userId ? myVotes.get(topic.id) : null;
            const score = topic.up_votes - topic.down_votes;
            return (
              <div key={topic.id} className="card card-interactive p-4 flex items-start gap-3">
                <span className={`badge shrink-0 mt-0.5 ${topic.status === "open" ? "badge-brand" : "badge-draft"}`}>
                  {topic.status === "open" ? "📋 开放" : "🔒 已关闭"}
                </span>
                <div className="min-w-0 flex-1">
                  <h3 className="font-semibold text-sm text-ink-800">{topic.title}</h3>
                  {topic.description && <p className="text-xs text-ink-400 mt-0.5 line-clamp-1">{topic.description}</p>}
                  {pp && (
                    <span className="inline-flex items-center gap-1 text-xs text-ink-400 mt-1">
                      {pp.avatar_url ? <img src={pp.avatar_url} alt="" className="w-3.5 h-3.5 rounded-full object-cover" onError={e => { (e.target as HTMLImageElement).style.display = "none" }} /> : null}
                      {pp.username}
                    </span>
                  )}
                </div>
                <div className="flex items-center gap-1 shrink-0">
                  <button onClick={() => handleVote(topic.id, "up")}
                    className={`px-2 py-1 rounded text-xs font-medium transition-all ${myVote === "up" ? "bg-brand-500 text-white" : "bg-ink-50 text-ink-400 hover:bg-brand-50 hover:text-brand-500"
                      }`}>
                    👍 {topic.up_votes}
                  </button>
                  <button onClick={() => handleVote(topic.id, "down")}
                    className={`px-2 py-1 rounded text-xs font-medium transition-all ${myVote === "down" ? "bg-red-500 text-white" : "bg-ink-50 text-ink-400 hover:bg-red-50 hover:text-red-500"
                      }`}>
                    👎 {topic.down_votes}
                  </button>
                  {score !== 0 && (
                    <span className={`text-xs font-mono ml-1 ${score > 0 ? "text-brand-500" : "text-red-400"}`}>
                      {score > 0 ? "+" + score : score}
                    </span>
                  )}
                </div>
              </div>
            );
          })}
        </div>
      )}
    </div>
  );
}