export default function Loading() {
  return (
    <div className='space-y-6 animate-fade-in'>
      {/* 标题骨架 */}
      <div className='flex items-center justify-between'>
        <div className='skeleton h-8 w-40' />
        <div className='skeleton h-10 w-28 rounded-lg' />
      </div>
      {/* 标签栏骨架 */}
      <div className='flex gap-2'>
        <div className='skeleton h-7 w-16 rounded-full' />
        <div className='skeleton h-7 w-16 rounded-full' />
      </div>
      {/* 卡片骨架 */}
      {[1,2,3,4].map(i => (
        <div key={i} className='card p-5 space-y-3'>
          <div className='flex items-center gap-3'>
            <div className='skeleton h-4 w-12' />
            <div className='skeleton h-5 w-48' />
            <div className='skeleton h-5 w-16 rounded-full' />
          </div>
          <div className='skeleton h-4 w-full' />
          <div className='skeleton h-3 w-2/3' />
          <div className='flex gap-4'>
            <div className='skeleton h-3 w-20' />
            <div className='skeleton h-3 w-16' />
          </div>
        </div>
      ))}
    </div>
  );
}
