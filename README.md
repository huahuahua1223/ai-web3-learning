# AI x Web3 Learning

[AI x Web3 School](https://aiweb3.school/) Cohort 0 个人学习日志与任务证明。

## Week 1 Proof-of-Work Pack

> 对应 WCB 任务：Submit Your Week 1 Proof-of-Work Pack（taskId `cmp3jyrjn07skn301qopx9rwe`）。
> 一周下来在 AI 与 Web3 两条线上完成的全部 PoW（按 WCB 提交指引的 6 类材料组织）。

| # | 类别 | 链接 |
|---|---|---|
| 1 | **AI 概念卡**（LLM / Prompt / Context / Agent / RAG / AI Coding） | [Week 1｜AI 基础概念卡片](https://www.yuque.com/u44160610/pwi8fh/wxudpztrawmwgenb) |
| 2 | **Learning Agent 实战记录**（Claude Code 启动 / 仓库初始化 / Prompt 编排） | [tasks/week1-learning-agent-setup.md](tasks/week1-learning-agent-setup.md) |
| 3a | **Web3 概念卡**（Wallet / Signature / Tx / Gas / SmartContract / Testnet / Explorer） | [Week 1｜Web3 基础概念卡片](https://www.yuque.com/u44160610/pwi8fh/vyosfkmst7ukrm68) |
| 3b | **Web3 进阶**（EOA vs 智能账户 vs 多签） | [Week 1｜比较 EOA、智能账户、多签账户的权限差异](https://www.yuque.com/u44160610/pwi8fh/oao7gi33rwd4wtgy) |
| 4a | **Sepolia 测试网交易**（ETH 转账） | tx `0x2e13...0a82` → [Etherscan](https://sepolia.etherscan.io/tx/0x2e13e37794e76385c7fc8078bc2afc7ec166ee57abb8fb2382e68549e0ec0a82) |
| 4b | **Sepolia 智能合约**（Week1Note：部署 + setNote 写入） | 合约 `0x1d7d...d4C0` → [Etherscan 验证源码](https://sepolia.etherscan.io/address/0x1d7d2E0bea1dE798Ad84D0E7fD57a33F8E6ed4C0#code) · [写入 tx](https://sepolia.etherscan.io/tx/0xfe3bdb957047bfb6495ba0879fc4c6920a5d9082216272369651197453b219f6) |
| 5a | **AI × Web3 跨界小实验**（合约可读化助手 Demo） | [Demo](https://week1-contract-reader.vercel.app/) · [Repo](https://github.com/huahuahua1223/week1-contract-reader) · [任务证明](tasks/week1-ai-interactive-artifact.md) |
| 5b | **AI × Web3 Workflow 图**（Agent → 人工确认 → 钱包 → 链上验证） | [experiments/agent-wallet-workflow.md](experiments/agent-wallet-workflow.md) |
| 6 | **本周问题 + 人工修正记录**（8 条 AI vs 人工分工案例） | [tasks/week1-ai-interactive-artifact.md § 5 人工复核记录](tasks/week1-ai-interactive-artifact.md#5-人工复核--修正--拒绝记录) |

**对照 WCB 第 4 点（AI 生成 vs 人工修改/验证）** — 节选 8 条人工修正记录（完整版见上表 #6）：

1. 拒绝 AI 给的蓝紫渐变配色 → 改为工程师工具风格（参考 Etherscan / GitHub / Linear）
2. 把「主桌面 + 移动凑合」单视图 → 拆成桌面 / 平板 / 移动三档断点
3. 补充离线 fixture（USDC + 简化 ERC20）兜底 Etherscan 速率限制
4. 拒绝引第三方 marked.js → 自写极简 Markdown 渲染器，保持纯静态
5. 拒绝 Plan agent 直接 `git push` → 要求人工确认（对齐 CLAUDE.md 工作规范）
6. Etherscan V1 已 deprecated → 切到 V2 unified endpoint（典型 LLM 训练数据陈旧 → 真机验证发现）
7. LLM 错误提示从泛化「网络错误」拆成 4 条具体诊断（OpenAI vs Anthropic 在 401 时 CORS header 行为不同）
8. 增加 OpenAI 兼容 provider（智增增 + 美团 LongCat 免费）让中国大陆学员开箱可用

**其他相关 PoW**：

- 学员画像 [profile.md](profile.md) · 学习计划 [learning-plan.md](learning-plan.md)
- 每日学习日志 [daily/](daily/)（5/18 初始化 + 5/19 工程详尽版）
- 残酷共学打卡笔记 [intensivecolearning/ai-web3-school](https://github.com/intensivecolearning/ai-web3-school/blob/main/notes/huahuahua1223.md)
- X / Twitter 起点贴：<https://x.com/hujny218119/status/2056275185653964940>
- 已提交 16/38 WCB 任务（截至 2026-05-19，全部 `SUBMITTED` 待审）
- 打卡 workflow SOP（[CLAUDE.md](CLAUDE.md)）+ 自动拉打卡原料的 [scripts/wcb-checkin-prep.sh](scripts/wcb-checkin-prep.sh)

## 关于 AI x Web3 School

AI x Web3 School 是面向 builders 的开源学习计划。Handbook 覆盖 AI 与 Web3 真正交叉时的核心问题：模型能力、Agent 工作流、工具调用、钱包、签名、支付、身份、权限、安全执行、治理协作和可验证记录。

## 链接

- Handbook：https://aiweb3.school/zh/handbook/
- WCB 课程页：https://web3career.build/zh/programs/AI-Web3-School
- WCB Learning：https://web3career.build/zh/programs/AI-Web3-School#tab=learning

## 隐私提醒

本仓库为 **公开仓库**，请勿提交以下内容：

- API Key、Token、Secret
- 私钥或助记词
- `.env` 文件
- 未公开的会议链接
- 他人个人数据

## 目录结构

```
README.md                  # 本文件
profile.md                 # 学员画像
learning-plan.md           # 个人学习计划
daily/                     # 每日学习笔记与打卡草稿
tasks/                     # 任务记录与完成证明
experiments/               # 代码实验与原型
handbook-feedback/         # Handbook 反馈与建议
hackathon/                 # Hackathon 准备与项目构思
submissions/               # 任务提交记录
templates/                 # 笔记模板
  daily-note.md            # 每日笔记模板
  task-note.md             # 任务笔记模板
```

## 初始化说明

本仓库由 AI Learning Agent（Claude Code）辅助初始化，遵循 [Learning Agent 启动 Prompt](https://aiweb3.school/learning-agent.zh.txt)。所有文件创建、commit 和 push 操作均经人工确认。
