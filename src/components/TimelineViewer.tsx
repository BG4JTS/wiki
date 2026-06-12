"use client";

import type { Timeline } from "@/types/database";

export default function TimelineViewer({
  timelines,
}: {
  timelines: Timeline[];
}) {
  return (
    <div>
      <h2 className="text-lg font-semibold mb-3">⏱ 时间轴</h2>
      <div className="bg-white rounded-lg border p-4 space-y-0">
        {timelines.map((tl, i) => (
          <div key={tl.id} className="flex gap-3 py-2">
            {/* 时间线竖线 */}
            <div className="flex flex-col items-center">
              <div className="w-2 h-2 rounded-full bg-indigo-400 mt-1.5 shrink-0" />
              {i < timelines.length - 1 && (
                <div className="w-0.5 h-full bg-gray-200 mt-1" />
              )}
            </div>
            <div className="pb-3">
              <span className="text-xs font-mono text-indigo-500">
                {formatTime(tl.timestamp_sec)}
              </span>
              <h4 className="text-sm font-medium mt-0.5">{tl.title}</h4>
              {tl.description && (
                <p className="text-xs text-gray-500 mt-0.5">
                  {tl.description}
                </p>
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
  if (h > 0) return `${h}:${String(m).padStart(2, "0")}:${String(s).padStart(2, "0")}`;
  return `${m}:${String(s).padStart(2, "0")}`;
}
