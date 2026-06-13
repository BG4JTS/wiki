"use client";

import type { Timeline } from "@/types/database";

export default function TimelineViewer({
 timelines,
}: {
 timelines: Timeline[];
}) {
 return (
  <div>
   <h2 className="section-title mb-4">⏱ 时间轴</h2>
   <div className="card p-5">
    {timelines.map((tl, i) => (
     <div key={tl.id} className="flex gap-3">
      <div className="flex flex-col items-center">
       <div className="timeline-dot" />
       {i < timelines.length - 1 && <div className="timeline-line" />}
      </div>
      <div className={`${i < timelines.length - 1 ? "pb-4" : ""}`}>
       <span className="text-xs font-mono text-brand-500 font-medium">
        {formatTime(tl.timestamp_sec)}
       </span>
       <h4 className="text-sm font-medium text-ink-700 mt-0.5">{tl.title}</h4>
       {tl.description && (
        <p className="text-xs text-ink-400 mt-0.5 leading-relaxed">{tl.description}</p>
       )}
      </div>
     </div>
    ))}
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