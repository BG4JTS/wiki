"use client";

import { useState } from "react";

export default function TranscriptViewer({ transcript }: { transcript: string }) {
  const [keyword, setKeyword] = useState("");
  const [showSearch, setShowSearch] = useState(false);

  const renderTranscript = () => {
    if (!transcript) return <p className="text-ink-400 text-sm">暂无文稿</p>;

    const paragraphs = transcript.split("\n");

    if (!keyword.trim()) {
      return paragraphs.map((p, i) => (
        <p key={i} className="mb-3 leading-relaxed text-sm text-ink-700">{p || "\u00A0"}</p>
      ));
    }

    const escaped = keyword.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
    const regex = new RegExp("(" + escaped + ")", "gi");

    return paragraphs.map((p, i) => {
      if (!p) return <p key={i} className="mb-3 leading-relaxed text-sm">{"\u00A0"}</p>;
      const parts = p.split(regex);
      return (
        <p key={i} className="mb-3 leading-relaxed text-sm text-ink-700">
          {parts.map((part, j) =>
            regex.test(part) ? (
              <mark key={j} className="bg-brand-200 text-ink-800 px-0.5 rounded">{part}</mark>
            ) : (part)
          )}
        </p>
      );
    });
  };

  return (
    <div>
      <div className="flex items-center justify-between mb-4">
        <h2 className="section-title">📄 文稿</h2>
        <button onClick={() => setShowSearch(!showSearch)} className="btn btn-ghost text-xs">
          {showSearch ? "收起" : "🔍 高亮搜索"}
        </button>
      </div>
      {showSearch && (
        <input type="text" placeholder="输入关键词高亮..." value={keyword}
          onChange={(e) => setKeyword(e.target.value)} className="input mb-4" />
      )}
      <div className="card p-6 max-h-[600px] overflow-y-auto whitespace-pre-wrap text-sm leading-relaxed">
        {renderTranscript()}
      </div>
    </div>
  );
}