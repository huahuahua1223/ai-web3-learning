# Week 1 | AI 向任务 | 完成 Learning Agent Setup

> 任务来源：WCB Week 1（20 学分）
> 提交时间：2026-05-18
> 状态：已完成

本文档严格按照 WCB 提交指引的 5 项要求组织。

---

## 1. 选择的 Agent / AI 工具

**Claude Code**（模型 `claude-opus-4-7`，Anthropic 官方 CLI）。

选择理由：

- **终端原生集成**：直接在 macOS 终端运行，无需切换到独立 IDE 或浏览器
- **完整文件操作能力**：内置 Read / Edit / Write 工具，无需复制粘贴代码
- **内置 git 与 gh CLI 工具链调用**：可以引导仓库创建、commit、push 等流程
- **支持仓库级上下文**：通过 `AGENTS.md` 可以让后续会话自动加载学员画像、目录约定和工作规范
- **明确的安全边界**：默认对 push、写 secret 等敏感操作要求人工确认，与启动 Prompt 的「人工确认」原则天然契合

---

## 2. Agent 协助完成的学习任务

本次 Agent 实际帮我完成以下事项：

1. **读取并解析启动材料**
   - 通过 curl 拉取 [Learning Agent 启动 Prompt](https://aiweb3.school/learning-agent.zh.txt) 全文
   - 通过 Chrome MCP 渲染并提取 [Handbook 首页](https://aiweb3.school/zh/handbook/) 完整中文内容（共 2088 字）
   - 提取 Handbook 全部子目录链接（AI 11 章 / Web3 10 章 / Bridge 15 章 / Tracks 6 章）

2. **学员画像采集**
   - 分两轮使用结构化选项询问，共 6 个问题：
     - 第一轮：AI 基础 / Web3 基础 / 编程能力 / 目标方向
     - 第二轮：每日时间 / 打卡提醒
   - 汇总形成学员画像并写入 `profile.md`

3. **仓库初始化**
   - 通过 `gh repo create` 创建 public 仓库 `ai-web3-learning`
   - 创建完整目录结构（daily/, tasks/, experiments/, handbook-feedback/, hackathon/, submissions/, templates/）
   - 为空目录添加 `.gitkeep` 以确保 git 追踪

4. **核心文档生成**
   - `README.md`：学校简介、关键链接、隐私提醒、目录说明
   - `profile.md`：学员画像
   - `learning-plan.md`：Week 1 任务清单 + 4 阶段个性化路径 + Handbook 阅读追踪
   - `AGENTS.md`：仓库级 Agent 项目上下文（`CLAUDE.md` 为兼容入口）
   - `templates/daily-note.md` / `templates/task-note.md`：笔记模板
   - `handbook-feedback/README.md`：Handbook 反馈格式指引
   - `daily/2026-05-18.md`：今日打卡草稿

5. **路径设计**
   - 基于 Handbook 四层地图（AI 基础 / Web3 基础 / Bridge / 前沿探索）
   - 结合学员画像（AI 工具熟悉但无 Agent 开发经验 / Web3 已熟悉 / 全栈 / 目标 Hackathon）
   - 生成 6 行优先级表，明确高/中/低/探索四档

6. **Git 流程引导**
   - 引导每次 commit 与 push 操作
   - 提交后用 `git filter-branch` 把所有 commit message 重写为 conventional commits 英文格式

---

## 3. 关键 Prompt 与配置

### 3.1 启动 Prompt（来源）

完整启动 Prompt 来源：**https://aiweb3.school/learning-agent.zh.txt**

核心引用（设计原则一段）：

> - 轻量优先：先让学员今天能行动，而不是一次性规划所有未来。
> - 人工确认：涉及账号、repo、写文件、打卡、WCB 提交、secret 配置的步骤必须确认。
> - 开源沉淀：repo 是 proof-of-work workspace，不只是笔记。
> - 隐私安全：public repo 不放敏感信息。
> - Handbook 反馈闭环：学员问题要能回流到 Handbook feedback。
> - 平台边界清楚：Agent 辅助生成和提醒，正式提交以 WCB / 打卡平台为准。

启动方式：把启动 Prompt 链接 + Handbook 链接 + 一句话指令发送给 Claude Code，Agent 即按照 Prompt 中的 8 步流程（确认画像 / 引导 gh / 创建 repo / 初始化结构 / 每日打卡 / Handbook feedback / WCB API / 最终输出）执行。

### 3.2 仓库级 Agent 上下文：`AGENTS.md`

放在仓库根目录的 `AGENTS.md` 是当前的权威 Agent 上下文文件；为兼容旧入口，同目录 `CLAUDE.md` 仅保留跳转壳。Week 1 初始化时的基础版本如下：

```markdown
# AGENTS.md

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
- `handbook-feedback/YYYY-MM-DD-主题.md` — Handbook 反馈
- `hackathon/` — Hackathon 项目准备
- `submissions/` — 任务提交记录
- `learning-plan.md` — 学习计划与 Handbook 阅读进度追踪

## 工作规范
- 默认用中文
- 这是 public 仓库，绝对不要写入 API Key、私钥、助记词、token、.env 或未公开会议链接
- 涉及 commit、push 等操作需人工确认
- 每日笔记和任务笔记按模板格式填写
- Handbook 反馈要包含页面链接、问题描述、建议改法
```

---

## 4. 一次成功输出记录

最有代表性的输出 = `learning-plan.md` 中的**个性化学习路径优先级表**。

### 输入

学员画像（来自第 2 章采集）：
- AI 工具熟悉，**无 Agent 开发经验**
- Web3 熟悉
- 全栈开发
- 目标：开发 + Hackathon

### Agent 输出

```markdown
| 优先级 | 主题 | 原因 |
|--------|------|------|
| 高 | Agent、MCP、Prompt Engineering | 补齐 Agent 开发核心技能 |
| 高 | Agent Workflow、Web3 Tool Use、Agent Wallet | AI x Web3 交叉核心 |
| 中 | Frameworks、Vibe Coding、Context | 扩展 Agent 开发工具链 |
| 中 | Account Abstraction、Dev Stack | 补齐 Web3 开发侧 |
| 探索 | Dev Tooling、Agentic Commerce | Hackathon 方向参考 |
```

### 评价

- **精准识别短板**：将「Agent 开发」相关 Handbook 章节（AI > Agent、MCP；Bridge > Agent Workflow、Web3 Tool Use、Agent Wallet）全部置于「高」档
- **避免重复学习**：已熟悉的 Web3 基础章节降到「低/中」档
- **对齐目标**：将 Hackathon 相关 Tracks（Dev Tooling、Agentic Commerce）单独列「探索」档
- **可直接执行**：表格可直接映射到 4 阶段（第 1-3 天 / 第 3-5 天 / 第 5-6 天 / 第 7 天）的每日学习排程

---

## 5. 人工复核 / 修正 / 拒绝记录

| 序号 | Agent 原建议 | 人工决定 | 类型 | 原因 |
|------|-------------|---------|------|------|
| 1 | 仓库名沿用启动 Prompt 默认值 `ai-web3-school-cohort-0` | 改为 `ai-web3-learning` | **修正** | 个人偏好更简洁的命名 |
| 2 | 初版所有文件用英文撰写 | 全部改为中文 | **修正** | 符合个人语言偏好，与社区中文学员对齐 |
| 3 | 初版 commit message 用中文（例：`将所有文件内容改为中文`） | 重写为 conventional commits 英文格式（例：`docs: rewrite all files in Chinese`） | **修正** | 标准化，便于自动化工具解析 |
| 4 | 准备初始化完成后直接 `git push` | **拒绝**，要求 Agent 等待人工确认后再 push | **拒绝** | 启动 Prompt 明确要求「涉及 push 等操作必须人工确认」 |
| 5 | Agent 未主动建议添加 `CLAUDE.md` | 人工主动提出添加，由 Agent 实现 | **补充** | 让后续 Claude Code 会话自动加载学员画像与约定 |

### 关键决策说明

第 4 条「拒绝自动 push」尤为重要：Claude Code 的内置 Auto Mode Classifier 也识别出 `git push origin main` 违反「Push to Default Branch」规则，主动阻止了执行。这与启动 Prompt 的「人工确认」原则形成**双重保险**。

---

## 6. 仓库链接与 commit 历史

- **Repo**: https://github.com/huahuahua1223/ai-web3-learning
- **当前 commit 历史**（截至本任务提交前）：

```
4ba4bcb docs: add CLAUDE.md project context
8c00ceb docs: rewrite all files in Chinese
b10d635 feat: initialize AI x Web3 School learning repo
```

本任务提交后会新增：

```
xxxxxxx docs: add week1 learning agent setup task record
```

---

## 敏感信息检查

✅ 本文档不包含 API Key、token、私钥、助记词、.env 文件或任何敏感信息。
