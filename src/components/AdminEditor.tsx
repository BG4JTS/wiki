"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import type { Episode, Timeline } from "@/types/database";

interface Props {
  episodes: Pick<Episode, "id" | "episode_number" | "title">[];
}

type Payload = Record<string, unknown>;
type ErrResult = { error: { message: string } | null };

export default function AdminEditor({ episodes }: Props) {
  const router = useRouter();
  const supabase = createClient();
  const [tab, setTab] = useState<"episode" | "timeline">("episode");
  const [editId, setEditId] = useState<number | null>(null);
  const [message, setMessage] = useState("");
  const [loading, setLoading] = useState(false);

  const [epNum, setEpNum] = useState("");
  const [title, setTitle] = useState("");
  const [publishDate, setPublishDate] = useState("");
  const [duration, setDuration] = useState("");
  const [description, setDescription] = useState("");
  const [transcript, setTranscript] = useState("");

  const [timelineEpId, setTimelineEpId] = useState("");
  const [tlTimestamp, setTlTimestamp] = useState("");
  const [tlTitle, setTlTitle] = useState("");
  const [tlDescription, setTlDescription] = useState("");
  const [tlList, setTlList] = useState<Timeline[]>([]);

  const handleLoadEpisode = async (id: number) => {
    setEditId(id);
    const result = await (supabase
      .from("episodes")
      .select("*")
      .eq("id", id)
      .single()) as unknown as { data: Episode | null; error: unknown };
    if (result.data) {
      setEpNum(String(result.data.episode_number));
      setTitle(result.data.title);
      setPublishDate(result.data.publish_date);
      setDuration(String(result.data.duration));
      setDescription(result.data.description);
      setTranscript(result.data.transcript);
    }
    setTab("episode");
  };

  const handleReset = () => {
    setEditId(null);
    setEpNum(""); setTitle(""); setPublishDate("");
    setDuration(""); setDescription(""); setTranscript("");
  };

  const handleSaveEpisode = async () => {
    if (!title.trim()) return;
    setLoading(true);
    setMessage("");
    const payload: Payload = {
      episode_number: parseInt(epNum) || 0,
      title: title.trim(),
      publish_date: publishDate || new Date().toISOString().split("T")[0],
      duration: parseInt(duration) || 0,
      description: description.trim(),
      transcript: transcript.trim(),
    };
    let err;
    if (editId) {
      // @ts-expect-error supabase generic
      ({ error: err } = await (supabase.from("episodes").update(payload).eq("id", editId)) as unknown as ErrResult);
    } else {
      // @ts-expect-error supabase generic
      ({ error: err } = await (supabase.from("episodes").insert(payload)) as unknown as ErrResult);
    }
    if (err) { setMessage("保存失败：" + err.message); }
    else {
      setMessage(editId ? "更新成功！" : "创建成功！");
      if (!editId) handleReset();
      router.refresh();
    }
    setLoading(false);
  };

  const handleDeleteEpisode = async (id: number) => {
    if (!confirm("确定删除此节目？")) return;
    const { error: err } = await (supabase.from("episodes").delete().eq("id", id)) as unknown as ErrResult;
    if (err) { setMessage("删除失败：" + err.message); }
    else { setMessage("删除成功！"); router.refresh(); }
  };

  const handleLoadTimelines = async (epId: number) => {
    setTimelineEpId(String(epId));
    const result = await (supabase
      .from("timelines")
      .select("*")
      .eq("episode_id", epId)
      .order("timestamp_sec")) as unknown as { data: Timeline[] | null; error: unknown };
    setTlList(result.data ?? []);
    setTab("timeline");
  };

  const handleAddTimeline = async () => {
    if (!tlTitle.trim() || !timelineEpId) return;
    setLoading(true);
    // @ts-expect-error supabase generic
    const { error: err } = await (supabase.from("timelines").insert({
      episode_id: parseInt(timelineEpId),
      timestamp_sec: parseInt(tlTimestamp) || 0,
      title: tlTitle.trim(),
      description: tlDescription.trim(),
    })) as unknown as ErrResult;
    if (err) { setMessage("添加失败：" + err.message); }
    else { setTlTimestamp(""); setTlTitle(""); setTlDescription(""); handleLoadTimelines(parseInt(timelineEpId)); }
    setLoading(false);
  };

  const handleDeleteTimeline = async (id: number) => {
    const { error: err } = await (supabase.from("timelines").delete().eq("id", id)) as unknown as ErrResult;
    if (!err) handleLoadTimelines(parseInt(timelineEpId));
  };

  return (
    <div>
      <h1 className="text-2xl font-bold mb-6">管理后台</h1>
      {message && (
        <div className={`p-3 rounded text-sm mb-4 ${message.includes("成功") ? "bg-green-50 text-green-600" : "bg-red-50 text-red-600"}`}>
          {message}
        </div>
      )}
      <div className="mb-6">
        <h2 className="text-lg font-semibold mb-2">节目列表</h2>
        <div className="bg-white border rounded-lg divide-y max-h-80 overflow-y-auto">
          {episodes.length === 0 ? (
            <p className="p-4 text-sm text-gray-400">暂无节目</p>
          ) : (
            episodes.map((ep) => (
              <div key={ep.id} className="flex items-center justify-between px-4 py-2.5">
                <span className="text-sm">
                  <span className="text-indigo-600 font-mono">#{ep.episode_number}</span>{" "}
                  {ep.title}
                </span>
                <div className="flex gap-2">
                  <button onClick={() => handleLoadEpisode(ep.id)} className="text-xs text-indigo-600 hover:underline">编辑节目</button>
                  <button onClick={() => handleLoadTimelines(ep.id)} className="text-xs text-indigo-600 hover:underline">时间轴</button>
                  <button onClick={() => handleDeleteEpisode(ep.id)} className="text-xs text-red-500 hover:underline">删除</button>
                </div>
              </div>
            ))
          )}
        </div>
      </div>
      <div className="bg-white border rounded-lg p-4">
        <div className="flex gap-4 mb-4 border-b pb-2">
          <button onClick={() => setTab("episode")} className={`text-sm font-medium pb-1 border-b-2 ${tab === "episode" ? "border-indigo-600 text-indigo-600" : "border-transparent text-gray-500"}`}>编辑节目</button>
          <button onClick={() => setTab("timeline")} className={`text-sm font-medium pb-1 border-b-2 ${tab === "timeline" ? "border-indigo-600 text-indigo-600" : "border-transparent text-gray-500"}`}>编辑时间轴</button>
        </div>
        {tab === "episode" ? (
          <div className="space-y-3">
            <div className="grid grid-cols-3 gap-3">
              <div><label className="block text-xs font-medium mb-1">期号</label><input type="number" value={epNum} onChange={(e) => setEpNum(e.target.value)} className="w-full px-2 py-1.5 text-sm border rounded focus:outline-none focus:ring-1 focus:ring-indigo-400" /></div>
              <div><label className="block text-xs font-medium mb-1">发布日期</label><input type="date" value={publishDate} onChange={(e) => setPublishDate(e.target.value)} className="w-full px-2 py-1.5 text-sm border rounded focus:outline-none focus:ring-1 focus:ring-indigo-400" /></div>
              <div><label className="block text-xs font-medium mb-1">时长(秒)</label><input type="number" value={duration} onChange={(e) => setDuration(e.target.value)} className="w-full px-2 py-1.5 text-sm border rounded focus:outline-none focus:ring-1 focus:ring-indigo-400" /></div>
            </div>
            <div><label className="block text-xs font-medium mb-1">标题</label><input type="text" value={title} onChange={(e) => setTitle(e.target.value)} className="w-full px-2 py-1.5 text-sm border rounded focus:outline-none focus:ring-1 focus:ring-indigo-400" /></div>
            <div><label className="block text-xs font-medium mb-1">简介</label><textarea value={description} onChange={(e) => setDescription(e.target.value)} rows={2} className="w-full px-2 py-1.5 text-sm border rounded focus:outline-none focus:ring-1 focus:ring-indigo-400 resize-none" /></div>
            <div><label className="block text-xs font-medium mb-1">文稿（全文）</label><textarea value={transcript} onChange={(e) => setTranscript(e.target.value)} rows={15} className="w-full px-2 py-1.5 text-sm border rounded focus:outline-none focus:ring-1 focus:ring-indigo-400 font-mono" /></div>
            <div className="flex gap-2">
              <button onClick={handleSaveEpisode} disabled={loading} className="px-4 py-2 bg-indigo-600 text-white text-sm rounded hover:bg-indigo-700 disabled:opacity-50">{editId ? "更新节目" : "创建节目"}</button>
              {editId && <button onClick={handleReset} className="px-4 py-2 bg-gray-100 text-sm rounded hover:bg-gray-200">新建</button>}
            </div>
          </div>
        ) : (
          <div className="space-y-3">
            <div>
              <label className="block text-xs font-medium mb-1">关联节目</label>
              <select value={timelineEpId} onChange={(e) => handleLoadTimelines(parseInt(e.target.value))} className="w-full px-2 py-1.5 text-sm border rounded focus:outline-none focus:ring-1 focus:ring-indigo-400">
                <option value="">选择节目...</option>
                {episodes.map((ep) => (<option key={ep.id} value={ep.id}>#{ep.episode_number} {ep.title}</option>))}
              </select>
            </div>
            {timelineEpId && (
              <div>
                <h3 className="text-sm font-medium mb-2">时间轴条目</h3>
                <div className="space-y-2 mb-3 max-h-60 overflow-y-auto">
                  {tlList.length === 0 ? (
                    <p className="text-sm text-gray-400">暂无时间轴</p>
                  ) : (
                    tlList.map((tl) => (
                      <div key={tl.id} className="flex items-center justify-between bg-gray-50 p-2 rounded text-sm">
                        <div><span className="font-mono text-indigo-500 text-xs">{formatTime(tl.timestamp_sec)}</span><span className="ml-2">{tl.title}</span></div>
                        <button onClick={() => handleDeleteTimeline(tl.id)} className="text-xs text-red-500 hover:underline">删除</button>
                      </div>
                    ))
                  )}
                </div>
                <div className="border-t pt-3 space-y-2">
                  <div className="flex gap-2">
                    <input type="number" value={tlTimestamp} onChange={(e) => setTlTimestamp(e.target.value)} placeholder="秒数" className="w-24 px-2 py-1.5 text-sm border rounded focus:outline-none focus:ring-1 focus:ring-indigo-400" />
                    <input type="text" value={tlTitle} onChange={(e) => setTlTitle(e.target.value)} placeholder="章节标题" className="flex-1 px-2 py-1.5 text-sm border rounded focus:outline-none focus:ring-1 focus:ring-indigo-400" />
                  </div>
                  <input type="text" value={tlDescription} onChange={(e) => setTlDescription(e.target.value)} placeholder="说明（可选）" className="w-full px-2 py-1.5 text-sm border rounded focus:outline-none focus:ring-1 focus:ring-indigo-400" />
                  <button onClick={handleAddTimeline} disabled={loading} className="px-4 py-2 bg-indigo-600 text-white text-sm rounded hover:bg-indigo-700 disabled:opacity-50">添加时间点</button>
                </div>
              </div>
            )}
          </div>
        )}
      </div>
    </div>
  );
}

function formatTime(sec: number): string {
  const h = Math.floor(sec / 3600);
  const m = Math.floor((sec % 3600) / 60);
  const s = sec % 60;
  if (h > 0) return h + ":" + String(m).padStart(2, "0") + ":" + String(s).padStart(2, "0");
  return m + ":" + String(s).padStart(2, "0");
}
