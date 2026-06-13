"use client";

import { useState, useEffect } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import { parseTimeInput, formatTimeInput } from "@/lib/time";
import type { Episode, Timeline } from "@/types/database";

interface PitItem { id: number; title: string; status: string; up_votes: number; down_votes: number; }
interface AdminEpisodeItem { id: number; episode_number: number; title: string; status: string; }

interface Props { episodes: AdminEpisodeItem[]; pits: PitItem[]; }

type ErrResult = { error: { message: string } | null };

export default function AdminEditor({ episodes, pits }: Props) {
 const router = useRouter(); const supabase = createClient();
 const [tab, setTab] = useState<"episode" | "timeline" | "pits" | "review" | "settings">("review");
 const [editId, setEditId] = useState<number | null>(null);
 const [message, setMessage] = useState(""); const [loading, setLoading] = useState(false);

 const [epNum, setEpNum] = useState(""); const [title, setTitle] = useState("");
 const [publishDate, setPublishDate] = useState(""); const [durationDisplay, setDurationDisplay] = useState("");
 const [description, setDescription] = useState(""); const [transcript, setTranscript] = useState("");

 const [timelineEpId, setTimelineEpId] = useState(""); const [tlDisplay, setTlDisplay] = useState("");
 const [tlTitle, setTlTitle] = useState(""); const [tlDescription, setTlDescription] = useState("");
 const [tlList, setTlList] = useState<Timeline[]>([]);

 const [pitFilter, setPitFilter] = useState("");
 const [autoApprove, setAutoApprove] = useState(false);
 const [settingsLoaded, setSettingsLoaded] = useState(false);

 useEffect(() => {
  if (tab === "settings" && !settingsLoaded) loadSettings();
 }, [tab]);
 const fp = pitFilter ? pits.filter(p => p.status === pitFilter) : pits;

 const pendingEps = episodes.filter(ep => ep.status === "pending");
 const draftEps = episodes.filter(ep => ep.status === "draft");
 const publishedEps = episodes.filter(ep => ep.status === "published" || !ep.status);

 const handleLoadEpisode = async (id: number) => {
  setEditId(id);
  const r = await supabase.from("episodes").select("*").eq("id", id).single() as unknown as { data: Episode | null; error: unknown };
  if (r.data) { setEpNum(String(r.data.episode_number)); setTitle(r.data.title); setPublishDate(r.data.publish_date); setDurationDisplay(formatTimeInput(r.data.duration)); setDescription(r.data.description); setTranscript(r.data.transcript); }
  setTab("episode");
 };
 const handleReset = () => { setEditId(null); setEpNum(""); setTitle(""); setPublishDate(""); setDurationDisplay(""); setDescription(""); setTranscript(""); };

 const handleSaveEpisode = async () => {
  if (!title.trim()) return; setLoading(true); setMessage("");
  const payload: Record<string,unknown> = { episode_number: parseInt(epNum)||0, title:title.trim(), publish_date:publishDate||new Date().toISOString().split("T")[0], duration:parseTimeInput(durationDisplay), description:description.trim(), transcript:transcript.trim() };
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

 const handleRejectEpisode = async (id: number) => {
  const { error: err } = await (supabase.from("episodes").update({ status: "draft" } as never).eq("id", id)) as unknown as ErrResult;
  if (err) setMessage("驳回失败：" + err.message); else { setMessage("已驳回"); router.refresh(); }
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
  const { error: err } = await (supabase.from("timelines").insert({ episode_id:parseInt(timelineEpId), timestamp_sec:parseTimeInput(tlDisplay), title:tlTitle.trim(), description:tlDescription.trim() } as never)) as unknown as ErrResult;
  if(err) setMessage("添加失败："+err.message); else { setTlDisplay(""); setTlTitle(""); setTlDescription(""); handleLoadTimelines(parseInt(timelineEpId)); }
  setLoading(false);
 };
 const handleDeleteTimeline = async (id: number) => {
  const { error: err } = await (supabase.from("timelines").delete().eq("id",id)) as unknown as ErrResult;
  if(!err) handleLoadTimelines(parseInt(timelineEpId));
 };
 const handleUpdatePitStatus = async (pitId: number, status: string) => {
  const { error: err } = await (supabase.from("pits").update({ status } as never).eq("id", pitId)) as unknown as ErrResult;
  if(err) setMessage("更新失败："+err.message); else { setMessage("已更新！"); router.refresh(); }
 };
 const handleDeletePit = async (pitId: number) => {
  if(!confirm("确定删除？")) return;
  const { error: err } = await (supabase.from("pits").delete().eq("id", pitId)) as unknown as ErrResult;
  if(err) setMessage("删除失败："+err.message); else { setMessage("已删除！"); router.refresh(); }
 };

 const loadSettings = async () => {
  const r = await supabase.from("site_settings").select("key,value") as unknown as { data: {key:string;value:string}[] | null; error: unknown };
  if (r.data) { const m = new Map(r.data.map((s: {key:string;value:string}) => [s.key, s.value])); setAutoApprove(m.get("auto_approve_episodes") === "true"); }
  setSettingsLoaded(true);
 };
 const saveSetting = async (key: string, value: string) => {
  await supabase.from("site_settings").upsert({ key, value } as never) as unknown as ErrResult;
 };
 const handleAutoApproveToggle = async () => {
  const next = !autoApprove; setAutoApprove(next);
  await saveSetting("auto_approve_episodes", String(next));
  setMessage(next ? "自动审核已开启" : "自动审核已关闭");
 };
 const handleClearAllData = async () => {
  if (!confirm("警告：此操作将清空全部节目、坑、选题、评论、时间轴、BGM等所有数据！")) return;
  if (!confirm("再次确认：数据不可恢复！确定要清空吗？")) return;
  const name = prompt("请输入 DELETE ALL DATA 确认：");
  if (name !== "DELETE ALL DATA") { setMessage("取消：确认文本不匹配"); return; }
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const r = await (supabase.rpc as any)("clear_all_data") as { error: { message: string } | null; data: string | null };
  if (r.error) { setMessage("清空失败：" + r.error.message); return; }
  setMessage("所有数据已清空"); router.refresh();
 };

 const tabBtn = (t: typeof tab, label: string) => (
  <button onClick={() => setTab(t)}
   className={`text-sm px-4 py-1.5 font-medium transition-all ${
    tab===t ? "bg-ink-700 text-white dark:bg-ink-600 " : "text-ink-500 hover:bg-ink-100"
   }`}>{label}</button>
 );

 return (
 <div>
  <h1 className="text-2xl font-bold text-ink-800 mb-6">管理后台</h1>

  <div className="flex gap-2 mb-6 flex-wrap">
   {tabBtn("review", "审核")}
   {tabBtn("episode", "节目")}
   {tabBtn("timeline", "时间轴")}
   {tabBtn("pits", "坑管理")}
   {tabBtn("settings", "设置")}
  </div>

  {message && <div className={`p-2.5 text-sm mb-4 ${message.includes("成功")||message.includes("已")?"bg-green-100 text-green-600 border-2 border-green-300":"bg-red-100 text-red-600 border-2 border-red-300"}`}>{message}</div>}

  {tab==="settings" && <>
   {!settingsLoaded ? (
    <p className="text-sm text-ink-400">加载中...</p>
   ) : (
    <div className="space-y-6">
     <div className="doc-section">
      <h3 className="doc-section-title">节目设置</h3>
      <div className="flex items-center justify-between py-2">
       <div>
        <p className="font-semibold text-ink-700">自动审核节目</p>
        <p className="text-xs text-ink-400 mt-0.5">开启后新提交的节目直接发布，无需管理员手动审核</p>
       </div>
       <button onClick={handleAutoApproveToggle}
        className={"w-12 h-6 flex items-center transition-colors relative " + (autoApprove ? "bg-ink-700" : "bg-ink-200")}>
        <span className={"w-5 h-5 bg-white border-2 border-ink-300 absolute transition-transform " + (autoApprove ? "translate-x-6" : "translate-x-0")} />
       </button>
      </div>
     </div>
     <div className="doc-section" style={{borderColor:"#dc2626"}}>
      <h3 className="doc-section-title" style={{color:"#dc2626",borderBottomColor:"#dc2626"}}>危险操作</h3>
      <p className="text-sm text-ink-500 mb-3">清空站点所有数据，包括节目、坑、选题、评论、时间轴、BGM等。此操作不可恢复。</p>
      <button onClick={handleClearAllData} style={{background:"#dc2626",borderColor:"#dc2626",color:"#fff"}} className="btn hover:bg-white hover:text-red-600">
       清空全部数据
      </button>
     </div>
    </div>
   )}
  </>}

  {tab==="review" && <>
   <h2 className="section-title mb-3">待审核 ({pendingEps.length})</h2>
   {pendingEps.length===0?<p className="text-sm text-ink-400 mb-6">没有待审核节目</p>:pendingEps.map(ep=>(
    <div key={ep.id} className="card p-3 mb-2 flex items-center justify-between">
     <div>
      <span className="font-mono text-sm text-brand-500 mr-2">#{ep.episode_number}</span>
      <span className="text-sm font-medium">{ep.title}</span>
     </div>
     <div className="flex gap-2">
      <button onClick={()=>handlePublishEpisode(ep.id)} className="btn btn-primary text-xs">通过</button>
      <button onClick={()=>handleRejectEpisode(ep.id)} className="btn btn-ghost text-xs">驳回</button>
     </div>
    </div>
   ))}

   <h2 className="section-title mb-3 mt-8">草稿 ({draftEps.length})</h2>
   {draftEps.length===0?<p className="text-sm text-ink-400 mb-6">没有草稿</p>:draftEps.map(ep=>(
    <div key={ep.id} className="card p-3 mb-2 flex items-center justify-between">
     <div>
      <span className="font-mono text-sm text-brand-500 mr-2">#{ep.episode_number}</span>
      <span className="text-sm">{ep.title}</span>
     </div>
     <button onClick={()=>handleLoadEpisode(ep.id)} className="btn btn-ghost text-xs">编辑</button>
    </div>
   ))}

   <h2 className="section-title mb-3 mt-8">已发布 ({publishedEps.length})</h2>
   {publishedEps.length===0?<p className="text-sm text-ink-400">没有已发布节目</p>:publishedEps.map(ep=>(
    <div key={ep.id} className="card p-3 mb-2 flex items-center justify-between">
     <div>
      <span className="font-mono text-sm text-brand-500 mr-2">#{ep.episode_number}</span>
      <span className="text-sm">{ep.title}</span>
     </div>
     <button onClick={()=>handleLoadEpisode(ep.id)} className="btn btn-ghost text-xs">编辑</button>
    </div>
   ))}
  </>}

  {(tab==="pits") && <>
   <h2 className="section-title mb-3">坑管理</h2>
   <div className="flex gap-2 mb-4">
    {["","open","pending","filled"].map(s=>(
     <button key={s} onClick={()=>setPitFilter(s)}
      className={`text-xs px-3 py-1 transition-all ${s===pitFilter?"bg-ink-700 text-white dark:bg-ink-600":"bg-white border border-ink-200 text-ink-500 hover:border-brand-200"}`}>
      {s||"全部"}
     </button>
    ))}
   </div>
   {fp.length===0?<p className="text-sm text-ink-400">无匹配项</p>:fp.map(p=>(
    <div key={p.id} className="card p-3 mb-2 flex items-center justify-between flex-wrap gap-2">
     <div>
      <span className={`badge text-xs ${p.status==="open"?"badge-brand":p.status==="pending"?"badge-pending":"badge-published"}`}>{p.status}</span>
      <span className="ml-2 text-sm">{p.title}</span>
      <span className="ml-2 text-xs text-ink-400">👍{p.up_votes} 👎{p.down_votes}</span>
     </div>
     <div className="flex gap-1">
      <select value={p.status} onChange={(e)=>handleUpdatePitStatus(p.id, e.target.value)}
       className="text-xs border border-ink-200 px-2 py-1 bg-white text-ink-500">
       <option value="open">开放</option>
       <option value="pending">待填</option>
       <option value="filled">已填</option>
      </select>
      <button onClick={()=>handleDeletePit(p.id)} className="btn btn-ghost text-xs text-red-400">删除</button>
     </div>
    </div>
   ))}
  </>}

  {tab==="episode" && <>
   <div className="space-y-3 mb-6">
    <h2 className="section-title">选择节目编辑</h2>
    <div className="card p-3 space-y-1 max-h-64 overflow-y-auto">
     {episodes.map(ep=>(
      <div key={ep.id} className="flex items-center justify-between py-1">
       <span onClick={()=>handleLoadEpisode(ep.id)} className="cursor-pointer hover:text-brand-500 text-sm">
        <span className="font-mono text-brand-500">#{ep.episode_number}</span>{" "+ep.title}
       </span>
       <div className="flex gap-2">
        <button onClick={()=>handleLoadEpisode(ep.id)} className="btn btn-ghost text-xs">编辑</button>
        <button onClick={()=>handleLoadTimelines(ep.id)} className="btn btn-ghost text-xs">时间轴</button>
        <button onClick={()=>handleDeleteEpisode(ep.id)} className="btn btn-ghost text-xs text-red-400">删除</button>
       </div>
      </div>
     ))}
    </div>
   </div>
   <div className="card p-5 space-y-4">
    <div className="grid grid-cols-3 gap-3">
     <div><label className="block text-xs font-medium text-ink-500 mb-1">期号</label><input type="number" value={epNum} onChange={e=>setEpNum(e.target.value)} className="input" /></div>
     <div><label className="block text-xs font-medium text-ink-500 mb-1">日期</label><input type="date" value={publishDate} onChange={e=>setPublishDate(e.target.value)} className="input" /></div>
     <div><label className="block text-xs font-medium text-ink-500 mb-1">时长（分:秒）</label><input type="text" value={durationDisplay} onChange={e=>setDurationDisplay(e.target.value)} placeholder="12:34" className="input" /></div>
    </div>
    <div><label className="block text-xs font-medium text-ink-500 mb-1">标题</label><input type="text" value={title} onChange={e=>setTitle(e.target.value)} className="input" /></div>
    <div><label className="block text-xs font-medium text-ink-500 mb-1">简介</label><textarea value={description} onChange={e=>setDescription(e.target.value)} rows={2} className="input resize-none" /></div>
    <div><label className="block text-xs font-medium text-ink-500 mb-1">文稿</label><textarea value={transcript} onChange={e=>setTranscript(e.target.value)} rows={15} className="input font-mono resize-none" /></div>
    <div className="flex gap-2">
     <button onClick={handleSaveEpisode} disabled={loading} className="btn btn-primary">{editId?"更新":"创建"}</button>
     {editId&&<button onClick={handleReset} className="btn btn-outline">新建</button>}
    </div>
   </div>
  </>}

  {tab==="timeline" && <>
   <div className="space-y-3">
    <div>
     <label className="block text-sm font-medium text-ink-600 mb-1.5">关联节目</label>
     <select value={timelineEpId} onChange={e=>handleLoadTimelines(parseInt(e.target.value))} className="input">
      <option value="">选择...</option>
      {episodes.map(ep=><option key={ep.id} value={ep.id}>{"#"+ep.episode_number+" "+ep.title}</option>)}
     </select>
    </div>
    {timelineEpId && (<div>
     <h3 className="text-sm font-medium text-ink-600 mb-3">时间轴</h3>
     <div className="space-y-2 mb-4 max-h-60 overflow-y-auto">
      {tlList.length===0?<p className="text-sm text-ink-400">暂无</p>:tlList.map(tl=>(
       <div key={tl.id} className="card px-3 py-2 flex items-center justify-between text-sm">
        <div><span className="font-mono text-brand-500 text-xs bg-brand-50 px-1.5 py-0.5 rounded">{formatTime(tl.timestamp_sec)}</span><span className="ml-2 text-ink-700">{tl.title}</span></div>
        <button onClick={()=>handleDeleteTimeline(tl.id)} className="btn btn-ghost text-xs text-red-400">删除</button>
       </div>
      ))}
     </div>
     <div className="border-t border-ink-200 pt-4 space-y-2">
      <div className="flex gap-2">
       <input type="text" value={tlDisplay} onChange={e=>setTlDisplay(e.target.value)} placeholder="12:34" className="input w-24" />
       <input type="text" value={tlTitle} onChange={e=>setTlTitle(e.target.value)} placeholder="标题" className="input flex-1" />
      </div>
      <input type="text" value={tlDescription} onChange={e=>setTlDescription(e.target.value)} placeholder="说明" className="input" />
      <button onClick={handleAddTimeline} disabled={loading} className="btn btn-primary text-sm">添加</button>
     </div>
    </div>)}
   </div>
  </>}
 </div>);
}

function formatTime(sec:number):string{const h=Math.floor(sec/3600),m=Math.floor((sec%3600)/60),s=sec%60;return h>0?h+":"+String(m).padStart(2,"0")+":"+String(s).padStart(2,"0"):m+":"+String(s).padStart(2,"0")}