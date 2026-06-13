"use client";

import { useState, useEffect } from "react";
import { createClient } from "@/lib/supabase/client";
import type { User, BgmSong } from "@/types/database";

export default function BGMPlaylist({ episodeId }: { episodeId: number }) {
  const supabase = createClient();
  const [songs, setSongs] = useState<BgmSong[]>([]);
  const [user, setUser] = useState<User | null>(null);
  const [loading, setLoading] = useState(true);
  const [showForm, setShowForm] = useState(false);
  const [tsSec, setTsSec] = useState("");
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
    const uids=[...new Set((data??[]).map((s:BgmSong)=>s.user_id||"").filter(Boolean))];if(uids.length){const pr=await supabase.from("user_profiles").select("id,username,avatar_url").in("id",uids)as{data:{id:string;username:string;avatar_url:string}[]|null;error:unknown};if(pr.data)setProfiles(new Map(pr.data.map(p=>[p.id,p])));}
    setLoading(false);
  };

  const handleAdd = async () => {
    if (!title.trim() || !user) return;
    setMessage("");
    const { error } = await supabase.from("bgm_playlist").insert({
      episode_id: episodeId,
      timestamp_sec: parseInt(tsSec) || 0,
      title: title.trim(),
      artist: artist.trim(),
    } as never);
    if (error) { setMessage(error.message); return; }
    setTsSec(""); setTitle(""); setArtist(""); setShowForm(false);
    loadSongs();
  };

  const handleDelete = async (id: number) => {
    await supabase.from("bgm_playlist").delete().eq("id", id);
    loadSongs();
  };

  if (loading) return <p className="text-sm text-gray-400">加载中...</p>;

  return (
    <div>
      <div className="flex items-center justify-between mb-3">
        <h2 className="text-lg font-semibold">🎵 BGM 歌单</h2>
        {user && (
          <button onClick={() => setShowForm(!showForm)} className="text-xs text-indigo-600 hover:underline">
            {showForm ? "取消" : "+ 添加"}
          </button>
        )}
      </div>

      {showForm && (
        <div className="bg-white border rounded-lg p-3 mb-3 space-y-2">
          <div className="flex gap-2">
            <input type="number" value={tsSec} onChange={e => setTsSec(e.target.value)}
              placeholder="秒" className="w-24 px-2 py-1.5 text-sm border rounded focus:outline-none focus:ring-1 focus:ring-indigo-400" />
            <input type="text" value={title} onChange={e => setTitle(e.target.value)}
              placeholder="曲名 *" className="flex-1 px-2 py-1.5 text-sm border rounded focus:outline-none focus:ring-1 focus:ring-indigo-400" />
          </div>
          <input type="text" value={artist} onChange={e => setArtist(e.target.value)}
            placeholder="艺术家（选填）" className="w-full px-2 py-1.5 text-sm border rounded focus:outline-none focus:ring-1 focus:ring-indigo-400" />
          {message && <p className="text-xs text-red-500">{message}</p>}
          <button onClick={handleAdd} className="w-full py-2 bg-indigo-600 text-white text-sm rounded hover:bg-indigo-700">添加</button>
        </div>
      )}

      {songs.length === 0 ? (
        <p className="text-sm text-gray-400">{user ? "还没有歌曲，来添加第一首" : "暂无歌单"}</p>
      ) : (
        <div className="bg-white rounded-lg border divide-y">
          {songs.map((song) => (
            <div key={song.id} className="flex items-center justify-between px-3 py-2.5 group">
              <div className="flex items-center gap-3 min-w-0">
                <span className="text-xs font-mono text-indigo-500 shrink-0">
                  {formatTime(song.timestamp_sec)}
                </span>
                <div className="min-w-0">
                  <span className="text-sm font-medium">🎶 {song.title}</span>
                  {song.artist && (<span className="text-xs text-gray-400 ml-2">— {song.artist}</span>)}
                  {(()=>{const p=profiles.get(song.user_id||"");return p?<span className="inline-flex items-center gap-1 text-xs text-gray-400 ml-2"><img src={p.avatar_url||""} alt="" className="w-3 h-3 rounded-full object-cover" onError={e=>{(e.target as HTMLImageElement).style.display="none"}}/>{p.username}</span>:null})()}
                </div>
              </div>
              {user && (
                <button onClick={() => handleDelete(song.id)}
                  className="text-xs text-gray-300 hover:text-red-400 opacity-0 group-hover:opacity-100 transition-opacity shrink-0 ml-2">
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


