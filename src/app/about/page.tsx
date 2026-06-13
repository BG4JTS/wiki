import Link from "next/link";

export default function AboutPage() {
  return (
    <div className="max-w-2xl mx-auto animate-fade-in-up space-y-10">
      <div className="doc-section">
        <h3 className="doc-section-title">关于节目</h3>
        <p className="text-ink-600 leading-relaxed">
          原样是一档科普播客，用平实的语言拆解科学、技术、人文中的有趣话题。每一期都是一次探索，从量子计算到古典音乐，从宇宙大爆炸到日常心理学 — 我们相信好奇心是最好的老师。
        </p>
        <p className="text-ink-500 text-sm mt-3 leading-relaxed">
          节目每周更新，偶尔跳票。文字稿由听众共建维护，欢迎补充、纠错、讨论。
        </p>
      </div>

      <div className="doc-section">
        <h3 className="doc-section-title">关于主播</h3>
        <p className="text-ink-600 leading-relaxed">
          主播是几位对世界充满好奇的朋友。我们不是专家，只是喜欢问“为什么”并试着找到答案。在专业与有趣之间，我们倾向后者。
        </p>
        <p className="text-ink-500 text-sm mt-3 leading-relaxed">
          如果你有想听的选题，欢迎去
          <Link href="/topics" className="text-ink-700 font-medium underline underline-offset-2 mx-1">选题库</Link>
          投票告诉我们。
        </p>
      </div>

      <div className="doc-section">
        <h3 className="doc-section-title">关于本站</h3>
        <p className="text-ink-600 leading-relaxed">
          原样WIKI 是节目的文字稿知识库。这里不只是存档 — 每一位听众都可以参与编辑文稿、补充时间轴、挖坑填坑、提交选题、推荐BGM。我们相信集体智慧能让知识更完整。
        </p>
        <p className="text-ink-500 text-sm mt-3 leading-relaxed">
          本站开源，欢迎贡献。如果有任何问题或建议，请通过评论或 GitHub 与我们联系。
        </p>
        <p className="text-ink-400 text-xs mt-4">
          当前为测试版 (β)，功能持续完善中。数据存储在 Supabase，部署于 Vercel。
        </p>
      </div>
    </div>
  );
}
