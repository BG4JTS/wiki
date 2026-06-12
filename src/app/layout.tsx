import type { Metadata } from 'next';
import './globals.css';
import Navbar from '@/components/Navbar';

export const metadata: Metadata = {
  title: '原样WIKI - 播客讨论平台',
  description: '基于文字稿的播客讨论平台，不存储音频、零成本运行',
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang='zh-CN'>
      <body className='min-h-screen bg-gray-50 text-gray-900'>
        <Navbar />
        <main className='max-w-5xl mx-auto px-4 py-8'>
          {children}
        </main>
      </body>
    </html>
  );
}
