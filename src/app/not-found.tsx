import Link from 'next/link';

export default function NotFound() {
  return (
    <div className='text-center py-20 animate-fade-in-up'>
      <div className='text-8xl font-bold text-brand-200 mb-4'>404</div>
      <h1 className='text-xl font-semibold text-ink-600 mb-2'>页面不存在</h1>
      <p className='text-ink-400 text-sm mb-8'>你找的页面可能已被移除或地址有误</p>
      <Link href='/' className='btn btn-primary'>
        返回首页
      </Link>
    </div>
  );
}
