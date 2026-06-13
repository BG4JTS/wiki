import type { Metadata } from 'next';
import './globals.css';
import Navbar from '@/components/Navbar';

export const metadata: Metadata = {
  title: '原样WIKI — 播客知识百科',
  description: '基于文字稿的播客讨论平台，不存储音频、零成本运行。大家一起补充、讨论、挖坑填坑。',
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang='zh-CN'>
      <body className='min-h-screen page-bg text-ink'>
        <Navbar />
        <main className='max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 py-6 sm:py-10'>
          {children}
        </main>
      </body>
    </html>
  );
}
