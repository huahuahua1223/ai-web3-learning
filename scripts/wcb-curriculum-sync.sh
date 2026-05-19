#!/usr/bin/env bash
# 同步 WCB 平台课程大纲到 curriculum/weekN.md
#
# 用法：
#   bash scripts/wcb-curriculum-sync.sh
#
# 行为（安全优先：绝不覆盖人工编辑过的文件）：
#   - 拉 program.getById metadata.curriculumWeekI18n.en
#   - 遍历每个 weekN：
#     * weekN.md 不存在 → 创建骨架（含英文原文 + 中文摘要/资源/进度占位）
#     * 已存在 → 跳过，并把当前英文原文 dump 到 curriculum/.cache/weekN.en.md
#       供人工 diff 检查是否需要更新（避免误覆盖已写的中文摘要 / 资源清单 / 进度表）
#   - 骨架生成后，中文摘要 / 资源清单 / 进度映射需要人工补全（参考 week1.md）
#
# 前置：macOS Keychain 里有 WCB_AGENT_SECRET_API_KEY

set -uo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROGRAM_SLUG="AI-Web3-School"

err() { printf '\033[31m%s\033[0m\n' "$*" >&2; }
ok()  { printf '\033[32m%s\033[0m\n' "$*" >&2; }
info() { printf '\033[36m%s\033[0m\n' "$*" >&2; }

for cmd in curl python3 jq; do
  command -v "$cmd" >/dev/null 2>&1 || { err "❌ 缺少 $cmd"; exit 1; }
done

KEY=$(security find-generic-password -a "$USER" -s "WCB_AGENT_SECRET_API_KEY" -w 2>/dev/null || true)
if [ -z "$KEY" ]; then
  err "❌ Keychain 里没有 WCB_AGENT_SECRET_API_KEY"
  err "   先在 WCB profile 创建 key，然后运行："
  err '     security add-generic-password -a "$USER" -s "WCB_AGENT_SECRET_API_KEY" -w'
  exit 1
fi

info "📡 拉取 program metadata..."
PROG_JSON=$(curl -s -X POST https://web3career.build/api/agent/call \
  -H "Authorization: Bearer $KEY" \
  -H "Content-Type: application/json" \
  -d "{\"procedure\":\"program.getById\",\"input\":{\"idOrSlug\":\"${PROGRAM_SLUG}\"}}")

if ! echo "$PROG_JSON" | jq -e '.ok == true' >/dev/null; then
  err "❌ 获取 program 失败"
  echo "$PROG_JSON" | jq -r '.error.message // .' >&2
  exit 1
fi

# 把整个 program JSON 写到临时文件交给 python 处理
TMP=$(mktemp -t wcb-curr-XXXXXX)
echo "$PROG_JSON" > "$TMP"

python3 - "$TMP" "$REPO_ROOT" <<'PY'
import json, sys, os, datetime, re

with open(sys.argv[1]) as f:
    data = json.load(f)
repo_root = sys.argv[2]

weeks = data.get('result', {}).get('metadata', {}).get('curriculumWeekI18n', {}).get('en', {})
if not weeks:
    print("⚠️  metadata.curriculumWeekI18n.en 为空，跳过")
    sys.exit(0)

curriculum_dir = os.path.join(repo_root, 'curriculum')
cache_dir = os.path.join(curriculum_dir, '.cache')
os.makedirs(curriculum_dir, exist_ok=True)
os.makedirs(cache_dir, exist_ok=True)

today = datetime.date.today().isoformat()
created, skipped = 0, 0

for key, week in sorted(weeks.items()):
    # key 形如 "cmoy1hces012app01kp9ci5gb:0" — 后面的数字是周序号（0-based）
    parts = key.rsplit(':', 1)
    week_idx = int(parts[1]) if len(parts) == 2 and parts[1].isdigit() else 0
    week_num = week_idx + 1

    desc = week.get('description', '').strip()
    if not desc:
        print(f"  ⚠️  week{week_num} description 为空，跳过")
        continue

    target = os.path.join(curriculum_dir, f'week{week_num}.md')
    # 永远把最新英文原文 dump 到 cache，方便人工 diff 检查
    cache_file = os.path.join(cache_dir, f'week{week_num}.en.md')
    with open(cache_file, 'w') as f:
        f.write(desc)

    if os.path.exists(target):
        print(f"  ✓ week{week_num}.md 已存在，跳过（最新英文原文已缓存到 {os.path.relpath(cache_file, repo_root)}）")
        skipped += 1
        continue

    created += 1

    skeleton = f"""# Week {week_num} 课程大纲

> **同步来源**：WCB Agent API · `program.getById{{idOrSlug:"AI-Web3-School"}}` → `metadata.curriculumWeekI18n.en["{key}"].description`
> **拉取时间**：{today}
> **语言**：WCB 平台目前只有英文一种语言。下面的中文摘要 / 资源清单 / 进度映射**需要人工补全**（参考 `week1.md` 模板）。

## 中文摘要

### 本周学习目标
（待人工补全：从下方折叠英文原文 "Weekly Learning Goals" 翻译/总结）

### 建议学习顺序
（待人工补全）

### 模块结构
（待人工补全）

## 推荐学习资源清单（可勾选）

（待人工提取所有 reference link 并按模块分组，参考 week1.md）

## 我在本周的对应进度

（待人工填表：平台任务 ↔ 自己已完成的 PoW）

## 英文原文（来自 WCB API，权威版本）

<details>
<summary>展开 Week {week_num} 完整原文（{len(desc):,} 字符）</summary>

{desc}

</details>
"""
    with open(target, 'w') as f:
        f.write(skeleton)

print(f"\n✅ 处理 {len(weeks)} 个 weekN：新建 {created} / 已存在跳过 {skipped}")

if created:
    print("\n📝 新建文件需要人工补全：")
    print("  1. 中文摘要 / 资源清单 / 进度映射 — 参考 curriculum/week1.md 模板")
    print("  2. commit 用：docs(curriculum): sync week N from WCB API")

if skipped:
    print(f"\n💡 已存在文件的最新英文原文已缓存到 curriculum/.cache/weekN.en.md")
    print(f"   如怀疑 WCB 平台更新过，跑 diff 检查：")
    print(f"     diff <(sed -n '/<details>/,/<\\/details>/p' curriculum/weekN.md) curriculum/.cache/weekN.en.md")
    print(f"   .cache/ 目录已加入 .gitignore（不进 git）")
PY

rm -f "$TMP"
