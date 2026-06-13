import Link from "next/link";

export default function AboutPage() {
  return (
    <div className="max-w-2xl mx-auto animate-fade-in-up space-y-10">
      {/* 关于节目 */}
      <div className="doc-section">
        <h3 className="doc-section-title">关于节目</h3>
        <p className="text-ink-600 leading-relaxed">
          《原来是这样?!》（It&apos;s That?!）是一档由上海SMG东方广播中心科学节目主持人旭岽主创的科普脱口秀。2014年3月8日在喜马拉雅FM首播，每周五更新，至今已播出550+期。
        </p>
        <div className="grid grid-cols-2 gap-3 my-4 text-sm">
          <div className="border-2 border-ink-200 p-3">
            <span className="text-ink-400 text-xs">累计播放</span>
            <p className="text-xl font-bold text-ink-800">3.61 亿</p>
          </div>
          <div className="border-2 border-ink-200 p-3">
            <span className="text-ink-400 text-xs">粉丝数</span>
            <p className="text-xl font-bold text-ink-800">77.2 万</p>
          </div>
        </div>
        <p className="text-ink-500 text-sm leading-relaxed">
          节目以套娃式提问串联人类学、生物学、心理学、天文学等多学科知识，从&ldquo;人为什么笑&rdquo;到&ldquo;我是谁&rdquo;，从&ldquo;蚊子挑血型吗&rdquo;到&ldquo;穿越时空的可能性&rdquo;。听众覆盖3岁到80岁，形成了独特的&ldquo;原二代&rdquo;现象——老听众的子女成长为新一代粉丝。
        </p>
        <p className="text-brand-600 text-sm font-medium mt-3">
          &ldquo;原来是这样，就是这样。&rdquo;
        </p>
      </div>

      {/* 关于主播 */}
      <div className="doc-section">
        <h3 className="doc-section-title">主播团队</h3>
        <div className="space-y-4">
          <div>
            <h4 className="font-semibold text-ink-700">旭岽</h4>
            <p className="text-sm text-ink-500">SMG东方广播中心科学节目主持人，业余科学爱好者。传统媒体与新媒体的&ldquo;骑墙派&rdquo;，自称&ldquo;科学知识的翻译官&rdquo;。2020年登上喜马拉雅年度最具商业价值主播榜。</p>
          </div>
          <div>
            <h4 className="font-semibold text-ink-700">子凌</h4>
            <p className="text-sm text-ink-500">东广新闻台主持人，常驻搭档。</p>
          </div>
          <div>
            <h4 className="font-semibold text-ink-700">姜雯 · 水兄 · 冰枫 · 洁羽</h4>
            <p className="text-sm text-ink-500">各具专长的客座主播，覆盖天文、生物、心理等领域。</p>
          </div>
        </div>
      </div>


      {/* 赞助 */}
      <div className="doc-section" style={{borderColor: "#f59e0b"}}>
        <h3 className="doc-section-title" style={{color: "#b45309", borderBottomColor: "#f59e0b"}}>⚡ 赞助服务器</h3>
        <p className="text-sm text-ink-500 leading-relaxed mb-4">
          本站由 <a href="https://bg4jts.cn" target="_blank" rel="noopener noreferrer" className="text-ink-700 font-semibold underline underline-offset-2">BG4JTS</a> 独立开发维护，
          与《原来是这样?!》节目及上海SMG东方广播中心<strong>无任何从属关系</strong>。
          你的赞助<strong>不会</strong>到达旭岽或节目团队，将全部用于服务器续费、域名和咖啡。
        </p>
        <a
          href="https://blog.bg4jts.cn/support"
          target="_blank"
          rel="noopener noreferrer"
          className="btn inline-flex text-sm font-bold"
          style={{background:"#f59e0b", borderColor:"#f59e0b", color:"#1a1a1a"}}
        >
          💛 赞助 BG4JTS
        </a>
        <p className="text-ink-300 text-xs mt-4 leading-relaxed">
          本站由 <a href="https://deepseek.com" target="_blank" rel="noopener noreferrer" className="underline underline-offset-2">DeepSeek V4</a> 协助开发 —
          你看到的这个页面，有 87.3% 的代码是它在凌晨 3 点写的。
          剩下 12.7% 是我改 bug 改到凌晨 4 点。
        </p>
      </div>

      {/* 关于本站 */}
      <div className="doc-section">
        <h3 className="doc-section-title">关于本站</h3>
        <p className="text-ink-600 leading-relaxed">
          原样WIKI 是《原来是这样》的文字稿知识库。这里不只是节目存档——每一位听众都可以参与编辑文稿、补充时间轴、<Link href="/pits" className="text-ink-700 font-medium underline underline-offset-2">挖坑填坑</Link>、<Link href="/topics" className="text-ink-700 font-medium underline underline-offset-2">提交选题</Link>、推荐BGM。
        </p>
        <p className="text-ink-500 text-sm mt-3 leading-relaxed">
          我们相信集体智慧能让知识更完整。节目听众通过提问和文案投稿拓展选题方向，粉丝深度参与文案撰写与音乐制作——这个WIKI正是这种精神的延续。
        </p>

        <div className="border-t-2 border-ink-200 mt-5 pt-4 space-y-1 text-sm text-ink-400">
          <p>📚 配套图书：《我们为什么这么臭》(2019)、《生命的战争》(2022)</p>
          <p>📻 收听平台：<a href="https://www.ximalaya.com/album/246038/" target="_blank" rel="noopener noreferrer" className="text-ink-600 underline underline-offset-2">喜马拉雅FM</a></p>
          <p>🛠 本站基于 Next.js + Supabase 构建，部署于 Vercel。当前为测试版 (β)。</p>
        </div>
      </div>
    </div>
  );
}
