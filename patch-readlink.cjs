// 在 exFAT/Ventoy 文件系统上，fs.readlink 对普通文件抛 EISDIR 而非 EINVAL
// 此文件在 Node.js 启动时通过 --require 预加载，在所有模块之前运行
const fs = require("fs");
const origReadlink = fs.readlink;

fs.readlink = function (path, options, callback) {
  // 兼容 readlink(path, callback) 和 readlink(path, options, callback)
  if (typeof options === "function") {
    callback = options;
    options = undefined;
  }
  if (typeof callback === "function") {
    return origReadlink(path, options, function (err, ...args) {
      if (err && err.code === "EISDIR") {
        const e = new Error("EINVAL: not a symlink");
        e.code = "EINVAL";
        callback(e, ...args);
      } else {
        callback(err, ...args);
      }
    });
  }
  // 同步调用
  try {
    return origReadlink(path, options, callback);
  } catch (err) {
    if (err.code === "EISDIR") {
      const e = new Error("EINVAL: not a symlink");
      e.code = "EINVAL";
      throw e;
    }
    throw err;
  }
};
