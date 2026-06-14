import type { Metadata } from "next";
import "./globals.css";
import Navbar from "@/components/Navbar";

export const metadata: Metadata = {
  title: "原样WIKI — 播客知识百科",
  description: "基于文字稿的播客讨论平台，不存储音频、零成本运行。大家一起补充、讨论、挖坑填坑。",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="zh-CN" suppressHydrationWarning>
      <head>
        <script
          dangerouslySetInnerHTML={{
            __html: `
              (function() {
                try {
                  var theme = localStorage.getItem("theme");
                  if (theme === "dark" || (!theme && window.matchMedia("(prefers-color-scheme: dark)").matches)) {
                    document.documentElement.setAttribute("data-theme", "dark");
                  } else {
                    document.documentElement.setAttribute("data-theme", "light");
                  }
                } catch(e) {}
              })();
            `,
          }}
        />
      </head>
      <body className="min-h-screen page-bg text-ink flex flex-col">
        <Navbar />
        <main className="flex-1 max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 py-6 sm:py-10 w-full">
          {children}
        </main>
        <footer className="border-t border-ink/10 py-6 mt-auto">
          <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 text-center text-xs text-ink/40 space-y-1">
            <p>BG4JTS 保留部分权利</p>
            <p>与《原来是这样?!》节目及上海SMG东方广播中心无任何从属关系</p>
          </div>
        </footer>
      </body>
    </html>
  );
}
