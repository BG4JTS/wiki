/**
 * 时间输入工具 — 秒数与 mm:ss / hh:mm:ss 互转
 * 用户输入 "12:34" 或 "1:23:45"，内部换算为秒数
 */

/** "mm:ss" 或 "hh:mm:ss" → 秒 */
export function parseTimeInput(val: string): number {
  const trimmed = val.trim();
  if (!trimmed) return 0;
  const parts = trimmed.split(":").map(Number);
  if (parts.some(isNaN)) return parseInt(trimmed) || 0;
  if (parts.length === 3) return parts[0] * 3600 + parts[1] * 60 + (parts[2] || 0);
  if (parts.length === 2) return parts[0] * 60 + (parts[1] || 0);
  return parts[0] || 0;
}

/** 秒 → "mm:ss" 或 "hh:mm:ss" */
export function formatTimeInput(sec: number): string {
  if (!sec || sec <= 0) return "";
  const h = Math.floor(sec / 3600);
  const m = Math.floor((sec % 3600) / 60);
  const s = sec % 60;
  if (h > 0) return h + ":" + String(m).padStart(2, "0") + ":" + String(s).padStart(2, "0");
  return m + ":" + String(s).padStart(2, "0");
}
