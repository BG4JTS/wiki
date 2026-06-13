"use client";

import { useState, useEffect } from "react";
import { createClient } from "@/lib/supabase/client";
import { parseTimeInput } from "@/lib/time";
import type { User, BgmSong } from "@/types/database";

export default function BGMPlaylist({ episodeId }: { episodeId: number }) {
 const supabase = createClient();
 const [songs, setSongs] = useState<BgmSong[]>([]);
 const [user, setUser] = useState<User | null>(null);
 const [loading, setLoading] = useState(true);
 const [showForm, setShowForm] = useState(false);
 const [tsSecDisplay, setTsSecDisplay] = useState("");
 const [title, setTitle] = useState("");
 const [artist, setArtist] = useState("");
 const [profiles, setProfiles] = useState<Map<string,{username:string;avatar_url:string}>>(new Map());
 const [message, setMessage] = useState("");

 useEffect(() => {
  supabase.auth.getUser().then(({ data }) => setUser(data.user));
  loadSongs();
 }, [episodeId]);

 const loadSongs = async () => {
  const { data } = await supabase
   .from("bgm_playlist")
   .select("*")
   .eq("episode_id", episodeId)
   .order("timestamp_sec") as { data: BgmSong[] | null; error: unknown };
  setSongs(data ?? []);
  const uids=[...new Set((data??[]).map((s:BgmSong)=>s.user_id||"").filter(Boolean))];
  if(uids.length){
   const pr=await supabase.from("user_profiles").select("id,username,avatar_url").in("id",uids)as{data:{id:string;username:string;avatar_url:string}[]|null;error:unknown};
   if(pr.data)setProfiles(new Map(pr.data.map(p=>[p.id,p])));
  }
  setLoading(false);
 };

 const handleAdd = async () => {
  if (!title.trim() || !user) return;
  setMessage("");
  const { error } = await supabase.from("bgm_playlist").insert({
   episode_id: episodeId,
   timestamp_sec: parseTimeInput(tsSecDisplay),
   title: title.trim(),
   artist: artist.trim(),
  } as never);
  if (error) { setMessage(error.message); return; }
  setTsSecDisplay(""); setTitle(""); setArtist(""); setShowForm(false);
  loadSongs();
 };

 const handleDelete = async (id: number) => {
  await supabase.from("bgm_playlist").delete().eq("id", id);
  loadSongs();
 };

 if (loading) return <div className="space-y-2">{[1,2,3].map(i=><div key={i} className="skeleton h-10 w-full " />)}</div>;

 return (
  <div>
   <div className="flex items-center justify-between mb-4">
    <h2 className="section-title">🎵 BGM 歌单</h2>
    {user && (
     <button onClick={() => setShowForm(!showForm)} className="btn btn-ghost text-xs">
      {showForm ? "取消" : "+ 添加"}
     </button>
    )}
   </div>

   {showForm && (
    <div className="card p-4 mb-4 space-y-2">
     <div className="flex gap-2 items-end">
      <div className="w-28 shrink-0">
       <label className="block text-xs text-ink-400 mb-1">时间（分:秒）</label>
       <input type="text" value={tsSecDisplay} onChange={e => setTsSecDisplay(e.target.value)}
        placeholder="12:34" className="input" />
      </div>
      <div className="w-28 shrink-0">
       <label className="block text-xs text-ink-400 mb-1">艺术家</label>
       <input type="text" value={artist} onChange={e => setArtist(e.target.value)}
        placeholder="选填" className="input" />
      </div>
     </div>
     <div>
      <label className="block text-xs text-ink-400 mb-1">曲名 *</label>
      <input type="text" value={title} onChange={e => setTitle(e.target.value)}
       placeholder="输入曲名..." className="input" />
     </div>
     {message && <p className="text-xs text-red-500">{message}</p>}
     <button onClick={handleAdd} className="btn btn-primary w-full text-sm">添加</button>
    </div>
   )}

   {songs.length === 0 ? (
    <p className="text-sm text-ink-400">{user ? "还没有歌曲，来添加第一首" : "暂无歌单"}</p>
   ) : (
    <div className="card divide-y divide-ink-50">
     {songs.map((song) => (
      <div key={song.id} className="flex items-center justify-between px-4 py-3 group">
       <div className="flex items-center gap-3 min-w-0">
        <span className="text-xs font-mono text-brand-500 shrink-0 bg-brand-50 px-1.5 py-0.5 rounded">
         {formatTime(song.timestamp_sec)}
        </span>
        <div className="min-w-0">
         <span className="text-sm font-medium text-ink-700">🎶 {song.title}</span>
         {song.artist && (<span className="text-xs text-ink-400 ml-2">— {song.artist}</span>)}
         {(()=>{const p=profiles.get(song.user_id||"");return p?<span className="inline-flex items-center gap-1 text-xs text-ink-400 ml-2"><img src={p.avatar_url||""} alt="" className="w-3 h-3 object-cover" onError={e=>{(e.target as HTMLImageElement).style.display="none"}}/>{p.username}</span>:null})()}
        </div>
       </div>
       {user && (
        <button onClick={() => handleDelete(song.id)}
         className="text-xs text-ink-200 hover:text-red-400 opacity-0 group-hover:opacity-100 transition-opacity shrink-0 ml-2">
         删除
        </button>
       )}
      </div>
     ))}
    </div>
   )}
  </div>
 );
}

function formatTime(sec: number): string {
 const m = Math.floor(sec / 60);
 const s = sec % 60;
 return m + ":" + String(s).padStart(2, "0");
}