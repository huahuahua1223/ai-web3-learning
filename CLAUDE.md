# CLAUDE.md

## 项目概述

AI x Web3 School Cohort 0 个人学习仓库。用于学习日志、任务证明、代码实验、Handbook 反馈和 Hackathon 准备。

## 学员画像

- AI 工具熟悉，无 Agent 开发经验（重点补齐方向）
- Web3 熟悉，能独立开发
- 目标：AI Agent 开发 + Web3 集成 + Hackathon
- 每天 3+ 小时，自主节奏

## 关键链接

- Handbook：https://aiweb3.school/zh/handbook/
- WCB 课程：https://web3career.build/zh/programs/AI-Web3-School
- WCB Learning：https://web3career.build/zh/programs/AI-Web3-School#tab=learning
- Learning Agent Prompt：https://aiweb3.school/learning-agent.zh.txt

## 目录约定

- `daily/YYYY-MM-DD.md` — 每日学习笔记，模板见 `templates/daily-note.md`
- `tasks/` — 任务记录，模板见 `templates/task-note.md`
- `experiments/` — 代码实验与原型
- `curriculum/weekN.md` — WCB 平台课程大纲本地化（同步自 API，含中文摘要 + 资源清单 + 进度映射）
- `handbook-feedback/YYYY-MM-DD-主题.md` — Handbook 反馈，格式见 `handbook-feedback/README.md`
- `hackathon/` — Hackathon 项目准备
- `submissions/` — 任务提交记录
- `scripts/` — 自动化助手脚本（`wcb-checkin-prep.sh` 拉打卡原料 / `wcb-curriculum-sync.sh` 拉课程大纲）
- `learning-plan.md` — 学习计划与 Handbook 阅读进度追踪

## 工作规范

- 默认用中文
- 这是 public 仓库，绝对不要写入 API Key、私钥、助记词、token、.env 或未公开会议链接
- 涉及 commit、push 等操作需人工确认
- 每日笔记和任务笔记按模板格式填写
- Handbook 反馈要包含页面链接、问题描述、建议改法

## 两仓库职责区分

学员的学习足迹分布在**两个 GitHub 仓库**，不要弄混：

| 仓库 | 学员权限 | 用途 | 调性 |
|---|---|---|---|
| `huahuahua1223/ai-web3-learning`（**本仓库**） | 可读写 | PoW 工作区：`daily/`、`tasks/`、`experiments/`、`handbook-feedback/`、`hackathon/` | 工程详尽（commit hash、API 调用、bug 修复细节都写）|
| `intensivecolearning/ai-web3-school` | **只读** | 残酷共学打卡同步，`notes/huahuahua1223.md` 单文件按日期分段 | 第一人称口语反思、单一主题、~800 字 |

残酷共学仓库**只能通过残酷共学网页编辑器（WCB 首页「去残酷共学打卡」按钮）更新**，不要尝试 git push 该仓库。`notes/huahuahua1223.md` 的每段必须用 `<!-- DAILY_CHECKIN_YYYY-MM-DD_START -->...END` 注释包裹，平台据此解析。**水笔记会判未学习**，单周缺卡 ≥3 次淘汰。

## 每日打卡 SOP

当学员让 Claude Code 帮写打卡，按这 5 步：

1. **跑 `scripts/wcb-checkin-prep.sh`** — 拿到当日 WCB 进度 + 残酷共学最新 3 天笔记 + 本地 git log（输出落 `/tmp/wcb-checkin-YYYY-MM-DD.md`）
2. **读 `/tmp/wcb-checkin-YYYY-MM-DD.md`** 这一份原料文件，再加上最近 1-3 天的 `daily/`
3. **起草本地详尽版 `daily/YYYY-MM-DD.md`** — 工程细节、commit 链路、明日计划，对齐 `templates/daily-note.md`
4. **起草残酷共学反思版**（~800 字）— 第一人称、围绕单一主题、避免技术文档腔；用 `<!-- DAILY_CHECKIN_YYYY-MM-DD_START -->...END` 包裹；以代码块形式给学员，方便整段复制
5. 学员确认后：本地版按 conventional commits 英文 commit；残酷共学版**学员手动**去残酷共学编辑器替换，不要尝试自动提交

### 日界划分原则（重要）

**一份 daily 的"今日内容"由它写完时刻当截止线，而不是日历日期。** 学员习惯在凌晨写"昨天的"daily（文件名按被打卡那一天命名，文件 mtime 通常落在该日凌晨 00:00-03:00），这意味着同一日历日里发生在 daily 写完之后的活动（下午的提交、晚上的直播、夜里的 commit）**不会被那份 daily 覆盖**——它们顺位计入下一份 daily。

**判定步骤**（每次起草前必做）：
1. 看上一份 daily 的 mtime 或 commit 时间（如 `git log -1 --pretty=format:'%ad' --date=iso -- daily/上一日期.md`），这是上份的**截止线**
2. 从 `/tmp/wcb-checkin-${DATE}.md` 原料里筛出**截止线之后**的活动：WCB 提交时间戳（注意 UTC → UTC+8 换算）、本地 git commit 时间、`experiments/` / `tasks/` 文件 mtime
3. 这批"上份 daily 收尾后"的活动 → 全部顺位计入**当前要写的 daily**，在「今日目标」段单独列一组「上份 daily 写完后额外完成（顺位计入今天）」

**示例**（2026-05-20 实战）：5/19 daily 文件 mtime 5/19 01:10（凌晨写完）。5/19 当天后续发生但未被覆盖的：15:18 commit a1689ce 两个进阶任务、15:21/15:22 WCB 提交 Restricted + Industry、15:46/16:34 commits 78889f2/d8ee0b5（SOP 工程化）、22:55 WCB 提交 Hermes 直播签到。这一整批全部归入 [daily/2026-05-20.md](daily/2026-05-20.md)。

**易混点**：
- 不要按"日历日期"硬切——会漏记 5/19 daily 收尾后到 5/20 凌晨之间的活动
- 不要按"WCB 平台提交时间戳的日期"硬切——平台时间戳是 UTC，需先 +8 换算成北京时间
- 截止线**精确到分钟**，不是日期边界——5/19 01:10 之前的归 5/19，01:10 之后的归 5/20

规则：
- 不主动提交，commit/push 前等学员确认（沿用「工作规范」）
- 不动 `intensivecolearning/ai-web3-school` 仓库
- 残酷共学版必须有自己的反思，不要堆技术日志

## WCB Agent API 速查

平台叫 Web3 Career Build（WCB），是 AI x Web3 School 的母平台，提供 tRPC 风格的 Agent API。

- **Base**：`https://web3career.build`
- **主入口**：`POST /api/agent/call`，body `{"procedure":"...","input":{...}}`
- **完整文档**：<https://web3career.build/llms.txt>（curl 可直拉）
- **Catalog**：`GET /api/agent/catalog`
- **认证**：从 macOS Keychain 现取 → `security find-generic-password -a "$USER" -s "WCB_AGENT_SECRET_API_KEY" -w` → `Authorization: Bearer <key>`
- **学员的 programId**（AI x Web3 School）：`cmnx791nl008sru0167pzp4ki`
- **本地命令模板**：

  ```bash
  KEY=$(security find-generic-password -a "$USER" -s "WCB_AGENT_SECRET_API_KEY" -w 2>/dev/null)
  curl -s -X POST https://web3career.build/api/agent/call \
    -H "Authorization: Bearer $KEY" \
    -H "Content-Type: application/json" \
    -d '{"procedure":"users.getProfile","input":{}}'
  ```

学员常用 procedure：

| procedure | 类型 | 用途 |
|---|---|---|
| `users.getProfile` | query | 验证 key + 取自己基本信息（含报名的 ICL programs）|
| `users.getMyPermissions` | query | 看自己有哪些权限 |
| `program.getById {idOrSlug:"AI-Web3-School"}` | query | 从返回的 `metadata` 拿到：① `taskI18n.en` 全部 taskId（2026-05-22 已 43 个，含 Week 1-4）② `curriculumWeekI18n.en` 每周课程大纲（已封装为 `scripts/wcb-curriculum-sync.sh`）③ `announcementI18n` 公告 |
| `tasks.myTaskHistory {taskId}` | query | 查某 task 提交记录（有提交则 result 非空数组）。`proof` 字段可能是字符串或 JSON（`{text, attachments[]}`），2026-05-22 实测提交综合任务时返回的 `proof` 类型 = `string` |
| `tasks.myTotalPoints` | ⚠️ FORBIDDEN | 对 agent 已关闭（2026-05-22 实测）。查总分走网页 UI 或者 `program.getById` 拿 task points 累加 |
| `tasks.submitEvidence {taskId, proof}` | **mutation** | 提交任务证明，**写入前必须展示 proof 全文 + 二次确认** |
| `events.listForLearner {programId, rangeStart, rangeEnd}` | query | 列出某 program 在时间窗内的会议 |

已知坑：
- `tasks.listForLearner` 不传 `trackId` 返回 `result: []`；`tracks.listForProgram` 和 `tasks.myTotalPoints` 都对 agent 关闭（FORBIDDEN，2026-05-22 实测）。绕路：先 `program.getById` 拿全部 taskId，再循环 `tasks.myTaskHistory`；总分目前没有 agent 入口，需走网页 UI。
- Claude Code 的 Bash 工具开新 shell 不会 source `~/.zshrc`，所以即使 `.zshrc` 里 `export` 了 key 也读不到。**统一从 keychain 现取**。
- `proof` 字段实际接受字符串（URL 或长 Markdown，2026-05-22 用多行 markdown 字符串 + 多个 URL 实测通过，submission ID `cmpgyf1uf9yzgmu0174gzog1r`）。提交综合任务时 proof 可放 GitHub README 链接、X URL、raw markdown URL，或自定义 markdown 串多个 PoW 链接。

## 课程大纲同步 SOP

WCB 平台的 Week N 课程大纲（含周目标、推荐学习资源 link、本周交付物、进阶赛道）存在 `program.getById` 返回的 `metadata.curriculumWeekI18n.en` 字段里。每开放新一周时同步一次。

跑：

```bash
bash scripts/wcb-curriculum-sync.sh
```

行为（安全优先，绝不覆盖人工编辑过的文件）：
- `curriculum/weekN.md` **不存在** → 创建骨架（含英文原文折叠 + 中文摘要/资源清单/进度映射的占位）
- `curriculum/weekN.md` **已存在** → 跳过，但把最新英文原文 dump 到 `curriculum/.cache/weekN.en.md`（.gitignore 已排除）供人工 diff 检查

骨架文件创建后必须人工补全：中文摘要、按模块分组的可勾选资源清单、自己的 PoW ↔ 平台任务进度映射表——参考 [curriculum/week1.md](curriculum/week1.md) 模板。

如怀疑 WCB 原文有更新：

```bash
diff <(sed -n '/<details>/,/<\/details>/p' curriculum/weekN.md) curriculum/.cache/weekN.en.md
```

## 残酷共学笔记格式约束

文件：`intensivecolearning/ai-web3-school/notes/huahuahua1223.md`（学员只读，平台同步）。

格式骨架：

```markdown
---
timezone: UTC+8
---

# huahua

**GitHub ID:** huahuahua1223
**Telegram:** @huahuahua1223

## Self-introduction
AI x Web3 School

## Notes

<!-- Content_START -->
# 2026-05-20
<!-- DAILY_CHECKIN_2026-05-20_START -->
（今天的内容，~800 字、第一人称、单一主题）
<!-- DAILY_CHECKIN_2026-05-20_END -->

# 2026-05-19
<!-- DAILY_CHECKIN_2026-05-19_START -->
...
<!-- DAILY_CHECKIN_2026-05-19_END -->

<!-- Content_END -->
```

新一天的内容必须放在新的 `_START/_END` 注释对里，且**追加在文件顶部最近一天的上方**（按时间倒序）。`<!-- Content_START -->` 与 `<!-- Content_END -->` 是文件级 marker，不要动。

调性参照：避免技术文档腔，写自己的认知更新与边界感。每天围绕**一个核心主题**展开（比如「不同 Agent 的定位差别」「Agent 第一次替我跟平台对话」），不要罗列工程清单。
