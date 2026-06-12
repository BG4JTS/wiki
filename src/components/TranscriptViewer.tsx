"use client";

import { useState } from "react";

export default function TranscriptViewer({ transcript }: { transcript: string }) {
  const [keyword, setKeyword] = useState("");
  const [showSearch, setShowSearch] = useState(false);

  const renderTranscript = () => {
    if (!transcript) return <p className="text-gray-400">暂无文稿</p>;

    const paragraphs = transcript.split("\n");

    if (!keyword.trim()) {
      return paragraphs.map((p, i) => (
        <p key={i} className="mb-3 leading-relaxed">
          {p || "\u00A0"}
        </p>
      ));
    }

    // 高亮关键词
    const escaped = keyword.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
    const regex = new RegExp(`(${escaped})`, "gi");

    return paragraphs.map((p, i) => {
      if (!p) return <p key={i} className="mb-3 leading-relaxed">{"\u00A0"}</p>;
      const parts = p.split(regex);
      return (
        <p key={i} className="mb-3 leading-relaxed">
          {parts.map((part, j) =>
            regex.test(part) ? (
              <mark key={j} className="bg-yellow-200 px-0.5 rounded">
                {part}
              </mark>
            ) : (
              part
            )
          )}
        </p>
      );
    });
  };

  return (
    <div>
      <div className="flex items-center justify-between mb-3">
        <h2 className="text-lg font-semibold">📄 文稿</h2>
        <button
          onClick={() => setShowSearch(!showSearch)}
          className="text-sm text-indigo-600 hover:text-indigo-800"
        >
          {showSearch ? "收起" : "🔍 高亮搜索"}
        </button>
      </div>
      {showSearch && (
        <input
          type="text"
          placeholder="输入关键词高亮..."
          value={keyword}
          onChange={(e) => setKeyword(e.target.value)}
          className="w-full px-3 py-1.5 text-sm border rounded-lg mb-3 focus:outline-none focus:ring-2 focus:ring-indigo-400"
        />
      )}
      <div className="bg-white rounded-lg border p-6 max-h-[600px] overflow-y-auto whitespace-pre-wrap text-sm leading-relaxed">
        {renderTranscript()}
      </div>
    </div>
  );
}
