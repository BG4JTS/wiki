/* eslint-disable @typescript-eslint/no-explicit-any */
import type { NextConfig } from "next";
import * as fs from "node:fs";

// exFAT 文件系统: fs.readlink 对普通文件抛 EISDIR 而非 EINVAL
// 将 EISDIR 转为 EINVAL 以兼容 enhanced-resolve
const origReadlink = fs.readlink;
(fs as any).readlink = (...args: any[]) => {
  const callback = typeof args[args.length - 1] === "function" ? args.pop() : undefined;
  const cb = callback
    ? (err: NodeJS.ErrnoException | null, ...res: any[]) => {
        if (err?.code === "EISDIR") {
          const e: any = new Error("EINVAL: not a symlink");
          e.code = "EINVAL";
          callback(e, ...res);
        } else {
          callback(err, ...res);
        }
      }
    : undefined;
  try {
    const result = cb ? origReadlink(...args as [any], cb) : origReadlink(...args as [any]);
    return result;
  } catch (err: any) {
    if (err?.code === "EISDIR") {
      const e: any = new Error("EINVAL: not a symlink");
      e.code = "EINVAL";
      throw e;
    }
    throw err;
  }
};

const nextConfig: NextConfig = {};

export default nextConfig;
