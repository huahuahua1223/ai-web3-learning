# AI × Web3 项目拆解：Hermes Agent vs week1-contract-reader

> Week 1 综合进阶任务：Analyze 1–2 AI × Web3 Projects or Builders（taskId `cmp9wlt0p0s4nmw01ypoa45tk`）。
> 选两个调性截然不同的 Agent 项目作对照——一个「长期运行的自动化助手」（Hermes Agent），
> 一个「按需触发的只读分析工具」（自己做的 contract-reader）。
> 把它们放一起对比，能看清 AI × Web3 里 Agent 的两种典型形态。

## 项目 1：Hermes Agent

### 它解决什么问题

为个人开发者 / builder 提供「长期运行 + 工具调用 + 多平台触达」的 Agent 基础设施——你不用每次都自己开浏览器跟 LLM 对话，Agent 7×24 在 VPS / 本地跑着，从 Telegram / CLI / Webhook 接收意图，调用工具（含 RPC、合约、API），把结果回传。

### AI 部分

- 多模型 backbone（Claude / GPT / Gemini）
- Skill 系统：把每种任务能力（监控某地址 / 定时拉某合约事件）封装为可复用 skill
- 上下文持久化：跨会话记住项目、用户偏好

### Web3 部分

- RPC 调用：链上数据读取
- 钱包 / 合约交互（需要明确的人工确认机制）
- 链上 receipt 解析

### 可验证材料

- AI x Web3 School 官方介绍 + 5/19 直播《AI Agent Intro: Hermes from 0 to 1》
- ⚠️ 目前还没有 Hermes 的具体代码 / 部署经验，本节主要从 AI x Web3 School 介绍信息 + 5/18 残酷共学笔记里的对比推断

### 我学到的 / 还有的问题

**学到的**：Hermes 这类「长期运行 Agent」对 Web3 场景特别有意义——链上事件是异步的（事件发生时 → 通知用户 → Agent 准备 calldata → 用户确认），需要一个永远在线的助手。这跟我做的 contract-reader 这种「按需触发的浏览器工具」是两种正交形态，互补而不是替代。

**还没解决的疑问**：

1. Hermes 如何处理「长期持有 Key」的安全风险？是用 KMS / HSM？还是设置一个只能花小额的 hot wallet + cold wallet 隔离？文档里没看到细节。
2. Agent 跨会话记忆怎么避免污染？我在某 DeFi 投资决策里用过的上下文，会不会被 Agent 在另一个不相关任务里误用？
3. Hermes 的 skill 系统跟 Anthropic 的 skill 体系（`~/.claude/skills/` 那套）是否在协议层兼容？还是各自独立？

## 项目 2：week1-contract-reader（自做）

### 它解决什么问题

普通 Web3 用户面对陌生合约时，难以快速判断「这合约是否安全、主要做什么」。已有工具（Etherscan、Solidity 源码）面向开发者，普通用户看不懂。本助手用 LLM 把合约源码翻译成 5 段结构化中文，并把审计师常看的 6 类风险（owner / 可升级 / 收税 / 暂停 / mint 上限 / selfdestruct）显式列出。

### AI 部分

- 5 段结构化中文解读（合约一句话总结 / 主要函数 / 关键状态变量 / 风险点 / 普通用户互动建议）
- 风险点检查清单写进 system prompt 强制 LLM 逐项核对
- 三类 provider：Anthropic / OpenAI / OpenAI 兼容（智增增 + 美团 LongCat ¥0 免费）

### Web3 部分

- Etherscan V2 API：拉 verified 源码 + ABI
- 双 chain 路由：mainnet / sepolia

### 可验证材料

- Demo：<https://week1-contract-reader.vercel.app/>
- Repo：<https://github.com/huahuahua1223/week1-contract-reader>
- 任务证明（含 5 章节 8 条人工修正记录）：[tasks/week1-ai-interactive-artifact.md](../tasks/week1-ai-interactive-artifact.md)

### 我学到的 / 还有的问题

**学到的**：

1. **AI 协作开发里「LLM 训练数据陈旧」是真实问题**——LLM 默认写 Etherscan V1 endpoint（已被 deprecated），必须真机跑一次才能撞到这个墙。这条已经写进 8 条人工修正记录。
2. **浏览器直调 LLM 的 CORS 边界**——OpenAI 在 401 时不返回 CORS header，错误信息会被浏览器误报成「网络错误」，要靠两家行为对比才能区分清楚。
3. **国内用户能用的 LLM 中转方案**——智增增中转 OpenAI 兼容协议 + 美团 LongCat 全系免费，让 Demo 从「要科学上网才能跑」变成「国内开箱可用」。

**还有的疑问**：

1. 怎么把 contract-reader 跟 Hermes 这类长期 Agent 协作？比如让 Hermes 定时监控某地址的新合约部署，触发 contract-reader 自动解读、推送 Telegram？
2. Proxy 合约的 implementation 解析怎么自动化？目前还要手动二次输入。
3. 5 段输出格式是否要再细化？比如「风险点」一段可以拆成「确定有」「可能有」「未发现」三档。

## 两个项目对比

| 维度 | Hermes Agent | week1-contract-reader |
|---|---|---|
| **形态** | 长期运行（VPS / 本地）| 按需触发（浏览器）|
| **入口** | Telegram / CLI / Webhook | Web UI |
| **状态** | 持久化（跨会话）| 无状态（每次重新加载）|
| **Web3 写操作** | 支持（需谨慎权限）| 不支持（只读）|
| **典型场景** | 链上监控 / 定时任务 / 跨平台触达 | 单次合约解读 |
| **Key 管理** | 长期持 Key（需 KMS / hot wallet 隔离）| 用户每次自带，存 localStorage |
| **安全风险面** | 长期在线 → 攻击面广 | 浏览器单次 → 风险局部化 |
| **学习曲线** | 部署 + 维护 + skill 编排 | 打开 URL 即用 |

## 对 Hackathon 方向的启发

这两个项目代表 AI × Web3 的两种基本拼图，可以组合：

- **Dev Tooling 方向（我倾向）**：扩展 contract-reader → 加 proxy 自动追踪 → 加 calldata 准备 + 钱包签名 → 形成一个「合约交互前必读 + 准备好交易、用户一键签」的工具。目标用户：普通 DeFi 用户。
- **Agentic Commerce 方向**：让 Hermes 这类长期 Agent 自动监控某些链上信号（清算、套利机会、新合约部署），把意图喂给 contract-reader 这种「只读但能准备 tx」的轻工具，用户在 Telegram 一键确认。两个 Agent 形成 pipeline。

下周 Week 2 我会先深挖 Hermes 部署（5/19 直播 + 直播回放 + 自己跑一次最小例子），看清「长期 Agent + 钱包 + 链上验证」的真实工程边界，再决定 Hackathon 切哪个方向。
