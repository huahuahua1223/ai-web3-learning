#!/usr/bin/env bash
# 每日打卡原料采集：把今天打卡需要的全部上下文（本地 commit、WCB 进度、
# 残酷共学最近笔记、daily 状态）拼成一份 Markdown 给 Claude 读。
#
# 用法：
#   bash scripts/wcb-checkin-prep.sh
# 输出：
#   /tmp/wcb-checkin-YYYY-MM-DD.md
#
# 前置：
#   - macOS Keychain 里有 WCB_AGENT_SECRET_API_KEY（用 security add-generic-password 添加）
#   - 已 gh auth login
#   - curl / jq 已安装（macOS 默认有 curl，jq 需要 brew install jq）

set -uo pipefail

DATE=$(date +%F)
OUT="/tmp/wcb-checkin-${DATE}.md"

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WORKSPACE_ROOT="$(cd "${REPO_ROOT}/.." && pwd)"

PROGRAM_ID="cmnx791nl008sru0167pzp4ki"   # AI x Web3 School
PROGRAM_SLUG="AI-Web3-School"
ICL_REPO="intensivecolearning/ai-web3-school"
ICL_NOTE_PATH="notes/huahuahua1223.md"

# 颜色（仅输出到 stderr，不污染 Markdown）
err() { printf '\033[31m%s\033[0m\n' "$*" >&2; }
ok()  { printf '\033[32m%s\033[0m\n' "$*" >&2; }
info() { printf '\033[36m%s\033[0m\n' "$*" >&2; }

require_cmd() {
  if ! command -v "$1" >/dev/null 2>&1; then
    err "❌ 缺少命令: $1"
    err "   $2"
    exit 1
  fi
}

require_cmd curl "macOS 自带，理论上不会缺。"
require_cmd jq "运行 brew install jq 安装。"
require_cmd gh "GitHub CLI 用于拉残酷共学笔记。运行 brew install gh 后 gh auth login。"

# 从 keychain 现取 WCB key（不放任何文件）
KEY=$(security find-generic-password -a "$USER" -s "WCB_AGENT_SECRET_API_KEY" -w 2>/dev/null || true)
if [ -z "$KEY" ]; then
  err "❌ Keychain 里没有 WCB_AGENT_SECRET_API_KEY。"
  err "   先在 WCB profile 创建 key，然后运行："
  err '     security add-generic-password -a "$USER" -s "WCB_AGENT_SECRET_API_KEY" -w'
  exit 1
fi

info "📡 拉取 WCB 进度 + 残酷共学笔记（约 10 秒）..."

wcb_call() {
  local procedure="$1"
  local input="${2-}"
  # 显式判断，避免 ${2:-{}} 的 `}` 被 bash 默认值语法吞掉一个，导致 body 多余 `}`
  [ -z "$input" ] && input='{}'
  curl -s -X POST "https://web3career.build/api/agent/call" \
    -H "Authorization: Bearer $KEY" \
    -H "Content-Type: application/json" \
    -d "{\"procedure\":\"${procedure}\",\"input\":${input}}"
}

# 1. 验证 key + 拿 profile（精简字段）
PROFILE=$(wcb_call "users.getProfile" "{}")
if ! echo "$PROFILE" | jq -e '.ok == true' >/dev/null; then
  err "❌ WCB API 鉴权失败："
  err "$(echo "$PROFILE" | jq -r '.error.message // .' )"
  exit 1
fi
PROFILE_NAME=$(echo "$PROFILE" | jq -r '.result.name')
PROFILE_GITHUB=$(echo "$PROFILE" | jq -r '.result.githubUsername')
ok "✓ 已登录为 ${PROFILE_NAME} (GitHub: ${PROFILE_GITHUB})"

# 2. 拿 program metadata + taskI18n 提取所有 taskId 与 title
PROGRAM=$(wcb_call "program.getById" "{\"idOrSlug\":\"${PROGRAM_SLUG}\"}")
if ! echo "$PROGRAM" | jq -e '.ok == true' >/dev/null; then
  err "❌ 获取 program 失败: $(echo "$PROGRAM" | jq -r '.error.message // .')"
  exit 1
fi

TASKS_TSV=$(echo "$PROGRAM" | jq -r '.result.metadata.taskI18n.en | to_entries[] | [.key, .value.title] | @tsv')
TASK_COUNT=$(echo "$TASKS_TSV" | wc -l | tr -d ' ')
ok "✓ AI x Web3 School 共 ${TASK_COUNT} 个任务"

# 3. 批量查每个 task 的提交历史
info "🔍 查询每个任务的提交状态（${TASK_COUNT} 次串行调用）..."
SUBMITTED=()
NOT_SUBMITTED=()
while IFS=$'\t' read -r tid title; do
  [ -z "$tid" ] && continue
  HIST=$(wcb_call "tasks.myTaskHistory" "{\"taskId\":\"${tid}\"}")
  COUNT=$(echo "$HIST" | jq -r '.result | if type=="array" then length else 0 end' 2>/dev/null || echo 0)
  # 防御：jq 失败或非数字时按 0 处理
  case "$COUNT" in ''|*[!0-9]*) COUNT=0 ;; esac
  if [ "$COUNT" -gt 0 ]; then
    LATEST_AT=$(echo "$HIST" | jq -r '.result[0].createdAt // ""')
    LATEST_STATUS=$(echo "$HIST" | jq -r '.result[0].status // "?"')
    LATEST_REVIEWED=$(echo "$HIST" | jq -r '.result[0].reviewedAt // "null"')
    SUBMITTED+=("- [${LATEST_STATUS}] reviewed=${LATEST_REVIEWED} @ ${LATEST_AT}  ${title}")
  else
    NOT_SUBMITTED+=("- ${title}  (taskId=${tid})")
  fi
done <<< "$TASKS_TSV"

# 4. 拉残酷共学笔记，提取最近 3 个 DAILY_CHECKIN 段
info "📖 拉取残酷共学笔记..."
ICL_NOTE=$(gh api "repos/${ICL_REPO}/contents/${ICL_NOTE_PATH}" --jq '.content' 2>/dev/null | base64 -d 2>/dev/null || true)
if [ -z "$ICL_NOTE" ]; then
  err "⚠️  无法拉取残酷共学笔记（gh auth login？）。继续输出其他部分。"
  ICL_NOTE="(未能拉取)"
fi

# 5. 本地仓库最近 commit
LEARNING_LOG=$(git -C "$REPO_ROOT" log --oneline --since="3 days ago" 2>/dev/null || echo "(git log 失败)")

# 收集 workspace 下其他子项目的近期 commit
SUBPROJECT_LOGS=""
for d in "$WORKSPACE_ROOT"/*/; do
  name=$(basename "$d")
  [ "$name" = "ai-web3-learning" ] && continue
  if [ -d "${d}.git" ]; then
    sub=$(git -C "$d" log --oneline --since="3 days ago" 2>/dev/null || true)
    if [ -n "$sub" ]; then
      SUBPROJECT_LOGS="${SUBPROJECT_LOGS}\n### ${name}\n\`\`\`\n${sub}\n\`\`\`\n"
    fi
  fi
done

# 6. 本地 daily 状态
DAILY_LIST=$(ls -1 "$REPO_ROOT/daily/" 2>/dev/null | grep -E '^2026-' | tail -5 || true)
TODAY_DAILY_EXISTS="否"
[ -f "$REPO_ROOT/daily/${DATE}.md" ] && TODAY_DAILY_EXISTS="是（${REPO_ROOT}/daily/${DATE}.md）"

# 7. 写出 Markdown
{
  echo "# WCB 打卡原料 · ${DATE}"
  echo
  echo "> 由 \`scripts/wcb-checkin-prep.sh\` 自动生成。仅作起草上下文，不进 git。"
  echo
  echo "学员：${PROFILE_NAME} (GitHub: ${PROFILE_GITHUB})"
  echo
  echo "---"
  echo
  echo "## 1. 本地仓库最近 commit"
  echo
  echo "### ai-web3-learning"
  echo '```'
  echo "$LEARNING_LOG"
  echo '```'
  if [ -n "$SUBPROJECT_LOGS" ]; then
    printf "%b" "$SUBPROJECT_LOGS"
  fi
  echo
  echo "---"
  echo
  echo "## 2. WCB Week 1 进度"
  echo
  echo "- 已提交：${#SUBMITTED[@]} / ${TASK_COUNT}"
  echo "- 未提交：${#NOT_SUBMITTED[@]} / ${TASK_COUNT}"
  echo
  echo "### ✅ 已提交"
  echo
  for line in "${SUBMITTED[@]}"; do echo "$line"; done
  echo
  echo "### ⏸ 未提交"
  echo
  for line in "${NOT_SUBMITTED[@]}"; do echo "$line"; done
  echo
  echo "---"
  echo
  echo "## 3. 残酷共学最近笔记（${ICL_REPO}/${ICL_NOTE_PATH}）"
  echo
  # 提取所有 DAILY_CHECKIN 段，按出现顺序保留最近 3 个
  echo "$ICL_NOTE" | awk '
    /<!-- DAILY_CHECKIN_.*_START -->/ { inblock=1; segments[++n] = $0; next }
    /<!-- DAILY_CHECKIN_.*_END -->/   { segments[n] = segments[n] "\n" $0; inblock=0; next }
    inblock                          { segments[n] = segments[n] "\n" $0 }
    END {
      start = (n > 3) ? n - 2 : 1
      for (i = start; i <= n; i++) print segments[i] "\n"
    }
  '
  echo
  echo "---"
  echo
  echo "## 4. 本地 daily 状态"
  echo
  echo "今日 \`daily/${DATE}.md\` 是否存在：${TODAY_DAILY_EXISTS}"
  echo
  echo "最近 5 个 daily 文件："
  echo '```'
  echo "$DAILY_LIST"
  echo '```'
  echo
  echo "---"
  echo
  echo "## 起草提示（给 Claude）"
  echo
  echo "1. 对比 \"已提交\" 列表 vs 昨天的 daily/，找出今天的实质新动作"
  echo "2. 起草本地详尽版 \`daily/${DATE}.md\`（工程细节、commit 链路、明日计划）"
  echo "3. 起草残酷共学反思版（~800 字、第一人称、单一主题），用 \`<!-- DAILY_CHECKIN_${DATE}_START -->...END\` 包裹"
  echo "4. 给学员展示后等确认；本地版 commit（conventional commits 英文），残酷共学版**学员手动**去残酷共学编辑器替换"
} > "$OUT"

ok ""
ok "✅ 已生成 ${OUT}"
ok "   (${#SUBMITTED[@]}/${TASK_COUNT} 已提交，今日 daily 存在：${TODAY_DAILY_EXISTS})"
