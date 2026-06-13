// 在 exFAT/Ventoy 文件系统上，fs.readlink 对普通文件抛 EISDIR 而非 EINVAL
// 此文件在 Node.js 启动时通过 --require 预加载，在所有模块之前运行
const fs = require("fs");

function wrapEISDIR(err) {
  if (err && err.code === "EISDIR") {
    const e = new Error("EINVAL: not a symlink");
    e.code = "EINVAL";
    return e;
  }
  return err;
}

// Patch 异步版本
const origReadlink = fs.readlink;
fs.readlink = function (path, options, callback) {
  if (typeof options === "function") {
    callback = options;
    options = undefined;
  }
  if (typeof callback === "function") {
    return origReadlink(path, options, function (err, ...args) {
      callback(wrapEISDIR(err), ...args);
    });
  }
  try {
    return origReadlink(path, options, callback);
  } catch (err) {
    throw wrapEISDIR(err);
  }
};

// Patch 同步版本
const origReadlinkSync = fs.readlinkSync;
fs.readlinkSync = function (path, options) {
  try {
    return origReadlinkSync(path, options);
  } catch (err) {
    throw wrapEISDIR(err);
  }
};

// Patch fs.promises.readlink
if (fs.promises && fs.promises.readlink) {
  const origPromisesReadlink = fs.promises.readlink;
  fs.promises.readlink = async function (path, options) {
    try {
      return await origPromisesReadlink(path, options);
    } catch (err) {
      throw wrapEISDIR(err);
    }
  };
}