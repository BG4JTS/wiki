"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import type { Episode, Timeline } from "@/types/database";

interface PitItem { id: number; title: string; status: string; up_votes: number; down_votes: number; }
interface AdminEpisodeItem { id: number; episode_number: number; title: string; status: string; }

interface Props { episodes: AdminEpisodeItem[]; pits: PitItem[]; }

type ErrResult = { error: { message: string } | null };

export default function AdminEditor({ episodes, pits }: Props) {
  const router = useRouter(); const supabase = createClient();
  const [tab, setTab] = useState<"episode" | "timeline" | "pits">("episode");
  const [editId, setEditId] = useState<number | null>(null);
  const [message, setMessage] = useState(""); const [loading, setLoading] = useState(false);

  const [epNum, setEpNum] = useState(""); const [title, setTitle] = useState("");
  const [publishDate, setPublishDate] = useState(""); const [duration, setDuration] = useState("");
  const [description, setDescription] = useState(""); const [transcript, setTranscript] = useState("");

  const [timelineEpId, setTimelineEpId] = useState(""); const [tlTimestamp, setTlTimestamp] = useState("");
  const [tlTitle, setTlTitle] = useState(""); const [tlDescription, setTlDescription] = useState("");
  const [tlList, setTlList] = useState<Timeline[]>([]);

  const [pitFilter, setPitFilter] = useState("");
  const fp = pitFilter ? pits.filter(p => p.status === pitFilter) : pits;

  const handleLoadEpisode = async (id: number) => {
    setEditId(id);
    const r = await supabase.from("episodes").select("*").eq("id", id).single() as unknown as { data: Episode | null; error: unknown };
    if (r.data) { setEpNum(String(r.data.episode_number)); setTitle(r.data.title); setPublishDate(r.data.publish_date); setDuration(String(r.data.duration)); setDescription(r.data.description); setTranscript(r.data.transcript); }
    setTab("episode");
  };
  const handleReset = () => { setEditId(null); setEpNum(""); setTitle(""); setPublishDate(""); setDuration(""); setDescription(""); setTranscript(""); };

  const handleSaveEpisode = async () => {
    if (!title.trim()) return; setLoading(true); setMessage("");
    const payload: Record<string,unknown> = { episode_number: parseInt(epNum)||0, title:title.trim(), publish_date:publishDate||new Date().toISOString().split("T")[0], duration:parseInt(duration)||0, description:description.trim(), transcript:transcript.trim() };
    let err;
    if (editId) ({ error: err } = await (supabase.from("episodes").update(payload as never).eq("id",editId)) as unknown as ErrResult);
    else ({ error: err } = await (supabase.from("episodes").insert(payload as never)) as unknown as ErrResult);
    if (err) setMessage("保存失败："+err.message);
    else { setMessage(editId?"更新成功！":"创建成功！"); if(!editId) handleReset(); router.refresh(); }
    setLoading(false);
  };

  const handlePublishEpisode = async (id: number) => {
    const { error: err } = await (supabase.from("episodes").update({ status: "published" } as never).eq("id", id)) as unknown as ErrResult;
    if (err) setMessage("发布失败：" + err.message); else { setMessage("已发布！"); router.refresh(); }
  };

  const handleDeleteEpisode = async (id: number) => {
    if(!confirm("确定删除？")) return;
    const { error: err } = await (supabase.from("episodes").delete().eq("id",id)) as unknown as ErrResult;
    if(err) setMessage("删除失败："+err.message); else { setMessage("删除成功！"); router.refresh(); }
  };
  const handleLoadTimelines = async (epId: number) => {
    setTimelineEpId(String(epId));
    const r = await supabase.from("timelines").select("*").eq("episode_id",epId).order("timestamp_sec") as unknown as { data:Timeline[]|null; error:unknown };
    setTlList(r.data??[]); setTab("timeline");
  };
  const handleAddTimeline = async () => {
    if(!tlTitle.trim()||!timelineEpId) return; setLoading(true);
    const { error: err } = await (supabase.from("timelines").insert({ episode_id:parseInt(timelineEpId), timestamp_sec:parseInt(tlTimestamp)||0, title:tlTitle.trim(), description:tlDescription.trim() } as never)) as unknown as ErrResult;
    if(err) setMessage("添加失败："+err.message); else { setTlTimestamp(""); setTlTitle(""); setTlDescription(""); handleLoadTimelines(parseInt(timelineEpId)); }
    setLoading(false);
  };
  const handleDeleteTimeline = async (id: number) => { const { error: err } = await (supabase.from("timelines").delete().eq("id",id)) as unknown as ErrResult; if(!err) handleLoadTimelines(parseInt(timelineEpId)); };

  const handlePitStatus = async (id:number, s:string) => {
    const { error: err } = await (supabase.from("pits").update({ status:s } as never).eq("id",id)) as unknown as ErrResult;
    if(err) setMessage("失败："+err.message); else { setMessage("已更新"); router.refresh(); }
  };
  const handlePitVotes = async (id:number, up:number, down:number) => {
    const { error: err } = await (supabase.from("pits").update({ up_votes:up, down_votes:down } as never).eq("id",id)) as unknown as ErrResult;
    if(err) setMessage("失败："+err.message); else { setMessage("已更新"); router.refresh(); }
  };
  const handleDeletePit = async (id: number) => {
    if(!confirm("确定删除？")) return;
    const { error: err } = await (supabase.from("pits").delete().eq("id",id)) as unknown as ErrResult;
    if(err) setMessage("失败："+err.message); else { setMessage("已删除"); router.refresh(); }
  };

  return (<div>
    {message&&<div className="fixed top-4 right-4 z-50 bg-indigo-600 text-white text-sm px-4 py-2 rounded shadow-lg">{message}</div>}
    <div className="flex gap-2 mb-4">
      {(["episode","timeline","pits"] as const).map(t=>(<button key={t} onClick={()=>setTab(t)} className={"px-4 py-2 text-sm rounded "+(tab===t?"bg-indigo-600 text-white":"bg-gray-100 hover:bg-gray-200")}>{t==="episode"?"节目":t==="timeline"?"时间轴":"坑管理"}</button>))}
    </div>

    {tab==="pits" ? (<>
      <div className="flex gap-2 mb-2">
        {["","open","pending","filled"].map(s=>(<button key={s} onClick={()=>setPitFilter(s)} className={"text-xs px-2 py-1 rounded "+(pitFilter===s?"bg-indigo-600 text-white":"bg-gray-100 hover:bg-gray-200")}>{s||"全部"}</button>))}
      </div>
      <div className="bg-white border rounded-lg divide-y max-h-96 overflow-y-auto">
        {fp.length===0?<p className="p-4 text-sm text-gray-400">暂无</p>:fp.map(p=>(
          <div key={p.id} className="flex items-center justify-between px-4 py-2.5">
            <span className="text-sm">{p.title}</span>
            <div className="flex items-center gap-2">
              <span className={"text-xs px-2 py-0.5 rounded "+(p.status==="pending"?"bg-yellow-100":p.status==="filled"?"bg-green-100":"bg-gray-100")}>
                {p.status==="open"?"开放":p.status==="pending"?"待填":"已填"}
              </span>
              <span className="text-xs text-gray-400">{"👍"+p.up_votes+" 👎"+p.down_votes}</span>
              <select defaultValue="" onChange={e=>{if(e.target.value)handlePitStatus(p.id,e.target.value)}} className="text-xs border rounded px-1">
                <option value="">状态</option><option value="open">开放</option><option value="pending">待填</option><option value="filled">已填</option>
              </select>
              <button onClick={()=>{const u=prompt("顶",String(p.up_votes));const d=prompt("踩",String(p.down_votes));if(u&&d)handlePitVotes(p.id,parseInt(u),parseInt(d))}} className="text-xs text-indigo-500 hover:underline">票数</button>
              <button onClick={()=>handleDeletePit(p.id)} className="text-xs text-red-500 hover:underline">删除</button>
            </div>
          </div>
        ))}
      </div>
    </>) : tab==="episode" ? (<>
      <div className="mb-6">
        <h2 className="text-lg font-semibold mb-2">节目列表</h2>
        <div className="bg-white border rounded-lg divide-y max-h-80 overflow-y-auto">
          {episodes.length===0?<p className="p-4 text-sm text-gray-400">暂无</p>:episodes.map(ep=>(
            <div key={ep.id} className="flex items-center justify-between px-4 py-2.5">
              <span className="text-sm">
                <span className="text-indigo-600 font-mono">{"#"+ep.episode_number}</span>{" "+ep.title}
                {ep.status==="draft"&&<span className="ml-2 text-xs px-1.5 py-0.5 rounded bg-yellow-100 text-yellow-700">草稿</span>}
              </span>
              <div className="flex gap-2">
                <button onClick={()=>handleLoadEpisode(ep.id)} className="text-xs text-indigo-600 hover:underline">编辑</button>
                <button onClick={()=>handleLoadTimelines(ep.id)} className="text-xs text-indigo-600 hover:underline">时间轴</button>
                {ep.status==="draft"&&<button onClick={()=>handlePublishEpisode(ep.id)} className="text-xs text-green-600 hover:underline">发布</button>}
                <button onClick={()=>handleDeleteEpisode(ep.id)} className="text-xs text-red-500 hover:underline">删除</button>
              </div>
            </div>
          ))}
        </div>
      </div>
      <div className="bg-white border rounded-lg p-4 space-y-3">
        <div className="grid grid-cols-3 gap-3">
          <div><label className="block text-xs font-medium mb-1">期号</label><input type="number" value={epNum} onChange={e=>setEpNum(e.target.value)} className="w-full px-2 py-1.5 text-sm border rounded focus:outline-none focus:ring-1 focus:ring-indigo-400"/></div>
          <div><label className="block text-xs font-medium mb-1">日期</label><input type="date" value={publishDate} onChange={e=>setPublishDate(e.target.value)} className="w-full px-2 py-1.5 text-sm border rounded focus:outline-none focus:ring-1 focus:ring-indigo-400"/></div>
          <div><label className="block text-xs font-medium mb-1">时长(秒)</label><input type="number" value={duration} onChange={e=>setDuration(e.target.value)} className="w-full px-2 py-1.5 text-sm border rounded focus:outline-none focus:ring-1 focus:ring-indigo-400"/></div>
        </div>
        <div><label className="block text-xs font-medium mb-1">标题</label><input type="text" value={title} onChange={e=>setTitle(e.target.value)} className="w-full px-2 py-1.5 text-sm border rounded focus:outline-none focus:ring-1 focus:ring-indigo-400"/></div>
        <div><label className="block text-xs font-medium mb-1">简介</label><textarea value={description} onChange={e=>setDescription(e.target.value)} rows={2} className="w-full px-2 py-1.5 text-sm border rounded focus:outline-none focus:ring-1 focus:ring-indigo-400 resize-none"/></div>
        <div><label className="block text-xs font-medium mb-1">文稿</label><textarea value={transcript} onChange={e=>setTranscript(e.target.value)} rows={15} className="w-full px-2 py-1.5 text-sm border rounded focus:outline-none focus:ring-1 focus:ring-indigo-400 font-mono"/></div>
        <div className="flex gap-2"><button onClick={handleSaveEpisode} disabled={loading} className="px-4 py-2 bg-indigo-600 text-white text-sm rounded hover:bg-indigo-700 disabled:opacity-50">{editId?"更新":"创建"}</button>{editId&&<button onClick={handleReset} className="px-4 py-2 bg-gray-100 text-sm rounded hover:bg-gray-200">新建</button>}</div>
      </div>
    </>) : (<>
      <div className="space-y-3">
        <div><label className="block text-xs font-medium mb-1">关联节目</label>
          <select value={timelineEpId} onChange={e=>handleLoadTimelines(parseInt(e.target.value))} className="w-full px-2 py-1.5 text-sm border rounded focus:outline-none focus:ring-1 focus:ring-indigo-400">
            <option value="">选择...</option>
            {episodes.map(ep=><option key={ep.id} value={ep.id}>{"#"+ep.episode_number+" "+ep.title}</option>)}
          </select>
        </div>
        {timelineEpId && (<div>
          <h3 className="text-sm font-medium mb-2">时间轴</h3>
          <div className="space-y-2 mb-3 max-h-60 overflow-y-auto">
            {tlList.length===0?<p className="text-sm text-gray-400">暂无</p>:tlList.map(tl=>(<div key={tl.id} className="flex items-center justify-between bg-gray-50 p-2 rounded text-sm"><div><span className="font-mono text-indigo-500 text-xs">{formatTime(tl.timestamp_sec)}</span><span className="ml-2">{tl.title}</span></div><button onClick={()=>handleDeleteTimeline(tl.id)} className="text-xs text-red-500 hover:underline">删除</button></div>))}
          </div>
          <div className="border-t pt-3 space-y-2">
            <div className="flex gap-2"><input type="number" value={tlTimestamp} onChange={e=>setTlTimestamp(e.target.value)} placeholder="秒" className="w-24 px-2 py-1.5 text-sm border rounded"/><input type="text" value={tlTitle} onChange={e=>setTlTitle(e.target.value)} placeholder="标题" className="flex-1 px-2 py-1.5 text-sm border rounded"/></div>
            <input type="text" value={tlDescription} onChange={e=>setTlDescription(e.target.value)} placeholder="说明" className="w-full px-2 py-1.5 text-sm border rounded"/>
            <button onClick={handleAddTimeline} disabled={loading} className="px-4 py-2 bg-indigo-600 text-white text-sm rounded hover:bg-indigo-700">添加</button>
          </div>
        </div>)}
      </div>
    </>)}
  </div>);
}

function formatTime(sec:number):string{const h=Math.floor(sec/3600),m=Math.floor((sec%3600)/60),s=sec%60;return h>0?h+":"+String(m).padStart(2,"0")+":"+String(s).padStart(2,"0"):m+":"+String(s).padStart(2,"0")}
