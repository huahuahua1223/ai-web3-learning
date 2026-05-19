# Week 1 课程大纲｜共学营：AI 与 Web3 基础知识

> **同步来源**：WCB Agent API · `program.getById{idOrSlug:"AI-Web3-School"}` → `metadata.curriculumWeekI18n.en["cmoy1hces012app01kp9ci5gb:0"].description`
> **拉取时间**：2026-05-19（Week 1 进行中）
> **语言**：WCB 平台目前只有英文一种语言，网页上的中文是前端翻译插件实时渲染。本文件本地补充了中文摘要 + 链接清单。
> **互补关系**：与 [../learning-plan.md](../learning-plan.md) 互补——learning-plan 是「我计划做什么」、本文件是「平台推荐怎么做 + 资源清单 + 我的对应进度」。

## 中文摘要

### 本周学习目标
1. 理解 LLM / prompt / workflow / agent / tool use / AI coding 的基本区别
2. 理解账户 / 钱包 / 签名 / 交易 / Gas / 合约 / 测试网 / 区块浏览器如何串成一条链上操作链
3. 至少完成一次 AI 工具实战、一次测试网交互、一个 AI × Web3 最小交叉实验
4. 初步建立权限、安全、人工确认、日志、验证材料、失败恢复的意识
5. 为 Week 2 的支付、身份、权限、安全隐私、治理协作打好共同语言基础

### 建议学习顺序
1. 先判断自己的已有基础：偏 AI、偏 Web3、还是两边都新
2. 优先补短板：Web3 背景先补 AI 基础；AI 背景先补 Web3 基础
3. 完成两个方向各一个最小实战：AI 工具任务 + 测试网/合约交互任务
4. 再做一个最小交叉实验，把 AI 输出 + 人工复核 + 钱包确认 + 链上执行 + 验证记录串起来
5. 最后整理概念说明与过程记录，给后续项目方向讨论提供材料

### 模块结构
- **Module A**｜AI 基础：从 LLM 到 agent workflow（8 个核心概念 + 13 个推荐资源 + Task 1-3）
- **Module B**｜Web3 基础：账户 / 钱包 / 签名 / 链上执行（10 个核心概念 + 9 个推荐资源 + 5 个实战任务）
- **Module C**｜最小交叉实验：从 AI 输出到链上执行（4 个实验方向 + 本周交付物）
- **进阶赛道**（可选）：A. Agent Workflows + ETH Skills · B. Web3 工程与链上执行 · C. AI 模型适配 / 微调 · D. 区块链协议与执行环境 · E. 升级最小交叉实验
- **通用任务**：行业观察 + Industry Follow List

## 推荐学习资源清单（可勾选）

### Module A · AI 基础（13 条）
- [ ] [What is a Large Language Model?（视频）](https://www.youtube.com/watch?v=LPZh9BOjkQs) — 建立 LLM 最小心智模型
- [ ] [Hugging Face LLM Course Chapter 1](https://huggingface.co/learn/llm-course/chapter1/1) — 系统理解 LLM 工作原理
- [ ] [LLM API Getting Started（视频）](https://www.youtube.com/watch?v=mnJJPltybBM) — 跟着写第一个 API 请求
- [ ] [Anthropic: Building with the Claude API](https://anthropic.skilljar.com/claude-with-the-anthropic-api) — 官方 API 全流程课
- [ ] [Z.ai API Developer Docs](https://docs.z.ai/api-reference/introduction) — GLM MaaS API 入门，OpenAI 兼容
- [ ] [Z.ai Coding Plan](https://z.ai/subscribe) — 解锁 GLM 全家桶调用配额
- [ ] [Claude Code 101](https://anthropic.skilljar.com/claude-code-101) — AI coding 工具速通
- [ ] [AI Agent Fundamentals（视频）](https://www.youtube.com/watch?v=FwOTs4UxQS4) — Agent 基础概念
- [ ] [Microsoft: AI Agents for Beginners](https://github.com/microsoft/ai-agents-for-beginners) — 从概念到代码，端到端构建 agent 直觉
- [ ] [OpenAI Agents SDK Intro](https://openai.github.io/openai-agents-python/) — Agent 框架如何组织模型、工具、执行
- [ ] [LangGraph Overview](https://langchain-ai.github.io/langgraph/) — Agent 编排结构
- [ ] [Hermes Agent Docs](https://hermes-agent.nousresearch.com/docs/) — Agent / 工具调用 / skills / 记忆 / 长期执行
- [ ] [Zread.ai · OpenClaw](https://zread.ai/openclaw/openclaw) / [Hermes](https://zread.ai/NousResearch/hermes-agent) — Agent 进入执行层时的架构变化

### Module B · Web3 基础（9 条）
- [ ] [Ethereum Accounts docs](https://ethereum.org/developers/docs/accounts/) — 账户与地址
- [ ] [MetaMask Getting Started](https://support.metamask.io/start/getting-started-with-metamask/) — 钱包使用与安全责任
- [ ] [Ethereum Development Documentation](https://ethereum.org/developers/docs/) — 以太坊学习路径主入口
- [ ] [How Web3 Works（PPT）](https://docs.google.com/presentation/d/1NUeO115bLnz0V8aejx9bYqQTaDrznTjhgbCkn-pK1a0/edit?usp=sharing) — Week 1 Web3 基础补充材料
- [ ] [Remix IDE](https://remix.ethereum.org/) — 最小合约交互入口
- [ ] [Sepolia Faucet](https://cloud.google.com/application/web3/faucet/ethereum/sepolia) — 拿测试币
- [ ] [Hardhat Getting Started](https://hardhat.org/docs/getting-started) / [Foundry](https://github.com/foundry-rs/foundry) — 工程化合约开发
- [ ] [OpenZeppelin Contracts](https://docs.openzeppelin.com/contracts) — 可复用合约组件与安全实践
- [ ] [Safe Overview](https://docs.safe.global/home/overview) / [ERC-4337 docs](https://docs.erc4337.io/) — 智能账户、多签、权限控制
- [ ] [viem](https://viem.sh/) / [wagmi](https://wagmi.sh/) — 前端 + 脚本的链上读写

### 进阶赛道

**A. Agent Workflows + ETH Skills**
- [ ] [OpenClaw repo](https://github.com/openclaw-ai/OpenClaw)
- [ ] [Hermes Agent Docs](https://hermes-agent.nousresearch.com/docs/) / [repo](https://github.com/NousResearch/hermes-agent)
- [ ] [OpenAI Agents SDK](https://openai.github.io/openai-agents-python/)

**B. Web3 工程**
- [ ] [Hardhat Getting Started](https://hardhat.org/docs/getting-started) / [Foundry](https://github.com/foundry-rs/foundry)
- [ ] [viem](https://viem.sh/) / [wagmi](https://wagmi.sh/)
- [ ] [OpenZeppelin Contracts](https://docs.openzeppelin.com/contracts)

**C. AI 模型适配 / 微调**
- [ ] [Transformers Training](https://huggingface.co/docs/transformers/training)
- [ ] [PEFT docs](https://huggingface.co/docs/peft/index)
- [ ] [Unsloth Docs](https://unsloth.ai/docs)

**D. 区块链协议**
- [ ] [Intro to Ethereum](https://ethereum.org/developers/docs/intro-to-ethereum/) / [Blocks](https://ethereum.org/developers/docs/blocks/) / [PoS](https://ethereum.org/developers/docs/consensus-mechanisms/pos/)
- [ ] [EVM docs](https://ethereum.org/developers/docs/evm/) / [Gas and fees](https://ethereum.org/developers/docs/gas/)

## 我在本周的对应进度

把 WCB 平台推荐的任务 ↔ 我已完成的 PoW 对照起来：

| 平台任务 | 状态 | 我的 PoW |
|---|---|---|
| Module A · Task 1 Build Learning Agent | ✅ | Claude Code 配置 → [tasks/week1-learning-agent-setup.md](../tasks/week1-learning-agent-setup.md) |
| Module A · Task 2 Personal GitHub Repo | ✅ | [huahuahua1223/ai-web3-learning](https://github.com/huahuahua1223/ai-web3-learning) |
| Module A · Task 3 Interactive Learning Artifact | ✅ | [week1-contract-reader](https://github.com/huahuahua1223/week1-contract-reader) + Vercel demo |
| Module B · 创建测试钱包 + 测试网交易 | ✅ | Sepolia ETH 转账 tx + 钱包 `0x04A3...Aa77` |
| Module B · 部署最小合约 + 读写 | ✅ | Week1Note `0x1d7d...d4C0` + setNote 写入 tx |
| Module B · 进阶（EOA vs 智能账户 vs 多签） | ✅ | [Yuque 笔记](https://www.yuque.com/u44160610/pwi8fh/oao7gi33rwd4wtgy) |
| Module C · 最小交叉实验 + workflow 图 | ✅ | [experiments/agent-wallet-workflow.md](../experiments/agent-wallet-workflow.md) + 合约可读化助手 Demo |
| 本周交付物 · PoW Pack | ✅ | [README#week-1-proof-of-work-pack](../README.md#week-1-proof-of-work-pack) |
| 进阶 A · 三种方式同任务对比（pure prompt / AI coding / agent + skills） | ⏸ 已用 contract-reader 间接覆盖 | 可选深化 |
| 进阶 A · 设计 / 调用一个 ETH skill | ⏸ | Week 2 再做 |
| 进阶 B · Hardhat / Foundry 最小开发流程 | ⏸ 用 Remix 完成基础版 | 可选用 Hardhat 重做 |
| 进阶 B · viem/wagmi 最小交互页面 | ⏸ | 已写进 [restricted-web3-assistant-design.md Phase 2](../experiments/restricted-web3-assistant-design.md) |
| 进阶 C · 微调方法对比 | ❌ | 不在本期重点，跳过 |
| 进阶 D · 区块、共识、EVM、Gas 短解释 | ⏸ | 可选补 |
| 进阶 E · 升级最小交叉实验 | ✅ 部分 | [restricted-web3-assistant-design.md](../experiments/restricted-web3-assistant-design.md) 已设计 |
| 通用任务 · Industry Observation | ✅ | WCB 任务「Build Your AI × Web3 Industry Follow List」已提交 + 5/18 残酷共学笔记里的 Hermes/Claude Code/Cowork 对比 |
| 周学习总结发布 | ⏸ 排到 5/22 | [learning-plan.md Week 1 收尾排程](../learning-plan.md) |

## 英文原文（来自 WCB API，权威版本）

<details>
<summary>展开 Week 1 完整原文（23,855 字符 / 199 行）</summary>

## Weekly Learning Goals

* Understand the basic differences among LLMs, prompts, workflows, agents, tool use, and AI coding.
* Understand how accounts, wallets, signatures, transactions, Gas, contracts, testnets, and block explorers form an on-chain operation flow.
* Complete one AI tool exercise, one testnet interaction, and one minimal AI × Web3 crossover experiment.
* Build an initial awareness of permissions, security, human confirmation, logs, verification materials, and failure recovery.
* Establish shared vocabulary for Week 2 topics such as payments, identity, permissions, security and privacy, governance, and collaboration.

## Suggested Learning Sequence

1. First assess your current background: are you stronger in AI, stronger in Web3, or new to both?
2. Prioritize your weak side: if you come from Web3, fill in AI fundamentals first; if you come from AI, fill in Web3 fundamentals first.
3. Complete two minimal exercises: one AI tool task and one testnet / contract interaction task.
4. Then run a minimal crossover experiment that puts AI output, human review, wallet confirmation, on-chain execution, and verification records into one workflow.
5. Finally, organize a concept explanation and process record to support later discussions on project directions.

***

## Module A | AI Fundamentals: From LLMs to Agent Workflows

**Goal:** Build an understanding of what models are and how agent workflows operate, then get hands-on with API calls and mainstream AI coding tools.

### Core Concepts

1. **How LLMs work at a basic level:** LLMs generate text probabilistically based on context: given an input, the model predicts the most likely next sequence of tokens. They excel at language understanding, code generation, and reasoning, but are poor at accurate factual recall, deterministic computation, and maintaining state across sessions.
2. **The four control layers:** Context window is the model's "working memory" and controls how much information the model can see at any given time. System instructions set identity, tone, and behavioral boundaries. Prompt conveys the intent of the current task. Tool calling transforms the model from a talker into a doer.
3. **Calling the LLM API hands-on:** MaaS lets you call top-tier models via API key on a per-token basis, no GPU required. Core parameters: `model`, `messages`, `temperature`, `max_tokens`. Start with the Quick Start guides from OpenAI, Anthropic, or GLM and get your first request.
4. **The boundary between Prompt, Workflow, and Agent:** Prompt is letting the model answer, with the human making the decisions. Workflow is a predefined task pipeline where the model is one node and the path is fixed. Agent is the model planning autonomously, calling tools dynamically, and managing state across turns. These three differ fundamentally in failure modes, risk exposure, and debuggability.
5. **The value and limits of AI coding tools:** Claude Code, Codex CLI, and Cursor can rapidly generate boilerplate, explain unfamiliar libraries, and accelerate prototyping. Code review, test design, and architectural decisions, however, cannot be delegated to them.
6. **Why AI output must always be validated:** Factual errors are the most common trap: models fabricate information with full confidence, so critical facts must be verified externally. Models are equally unreliable with references, routinely inventing paper titles, URLs, and data sources, so never trust a link a model gives you. In longer contexts, reasoning drift becomes a risk where the logical chain quietly breaks down and conclusions diverge from the original premises, making segment-by-segment validation essential. When agents are involved, two additional failure modes emerge: execution overreach, where the agent acts beyond its authorized scope (requiring guardrails and human-in-the-loop checkpoints), and tool misuse, where the model invokes the wrong tool or passes incorrect parameters (requiring tracing to monitor execution).
7. **Core technical components of an Agent:** State management: multiple nodes share read/write access to the same State object. Long-term memory: store and retrieve information across sessions. MCP: a unified connectivity protocol between LLMs and external tools. Skills: reusable high-level instruction sets supporting auto-discovery and dynamic generation. Tool calling: the model emits a structured request; the framework executes it and returns the result. Tracing: visualize the agent's execution chain. Guardrails: input/output validation rules; execution halts if violated. Handoff: transfer control after a subtask completes. Error recovery: retry, rollback, or escalate to human intervention on failure.
8. **When do you actually need an agent?:** Use an agent when the goal is open-ended, multiple tools must collaborate, intermediate results determine the next step, or state must persist across sessions. Stick to simpler solutions when it's a one-off Q\&A (use a prompt), the process is fixed (use a script), compliance is strict (use a human review node), or data determinism is critical (use a database query). The higher the complexity and risk, the more cautious you should be about over-agentifying.

### Recommended Materials / Reference Links

1. [What is a Large Language Model?](https://www.youtube.com/watch?v=LPZh9BOjkQs) (Video): Build the minimal mental model of LLMs
2. [Hugging Face LLM Course Chapter 1](https://huggingface.co/learn/llm-course/chapter1/1): Systematic understanding of how LLMs work
3. [LLM API Getting Started](https://www.youtube.com/watch?v=mnJJPltybBM) (Video): Follow along and write your first API call
4. [Anthropic: Building with the Claude API](https://anthropic.skilljar.com/claude-with-the-anthropic-api): Official end-to-end API onboarding course
5. [Z.ai API Developer Docs](https://docs.z.ai/api-reference/introduction): GLM MaaS API intro; OpenAI-compatible; first request in 5 minutes
6. [Z.ai Coding Plan](https://z.ai/subscribe): Unlock full call quota across the GLM model family
7. [Claude Code 101](https://anthropic.skilljar.com/claude-code-101): AI coding tool quick-start
8. [AI Agent Fundamentals](https://www.youtube.com/watch?v=FwOTs4UxQS4) (Video): Foundational agent concepts
9. [Microsoft: AI Agents for Beginners](https://github.com/microsoft/ai-agents-for-beginners): From concept to code; builds end-to-end agent intuition
10. [OpenAI Agents SDK Intro](https://openai.github.io/openai-agents-python/): Understand how an agent framework organizes models, tools, and execution
11. [LangGraph Overview](https://langchain-ai.github.io/langgraph/): Understand how agents are structured and orchestrated
12. [Hermes Agent Docs](https://hermes-agent.nousresearch.com/docs/): Agents, tool calling, skills, memory, and long-running execution
13. [Zread.ai: OpenClaw](https://zread.ai/openclaw/openclaw) / [Hermes](https://zread.ai/NousResearch/hermes-agent): Understand the architectural shifts agents bring at the execution layer

### Practice Tasks / Challenges

💡 The main task in this module is not just to try an AI tool once, but to start building your own learning agent from Day 1: use Claude Code, Codex, or Hermes to connect course learning, reading materials, experiment logs, demo generation, and GitHub repo maintenance into a sustainable learning workflow.

### Task 1 | Build Your Own Learning Agent

* Choose Claude Code, Codex, or Hermes Agent as your main Week 1 tool. Complete basic installation, login / API configuration, and run one real learning task end to end.
* If you already have an OpenAI / ChatGPT or Claude subscription: connect your account directly in the corresponding tool first, and use it to organize course materials, generate code, create notes, and ask follow-up questions.
* If you do not have an OpenAI / Claude subscription: go directly to Z.ai / GLM to request an API key and top up as needed. This course currently prioritizes Alibaba Cloud Model Studio free credits, the ModelScope community, and GLM as the low-cost alternative path.
* Complete at least one conversational learning task: give the Week 1 outline and recommended materials to the agent, and ask it to generate a personal study plan, key concept explanations, a completion checklist, and a list of open questions.

### Task 2 | Create a Personal GitHub Repo as Your Learning Workspace

* Starting in Week 1, create a public or private GitHub repo as the unified home for all later course experiments, study notes, demos, prompts, agent configurations, and retrospectives.
* Suggested repo structure: `README.md`, `notes/`, `prompts/`, `demos/`, `logs/`, `resources.md`. Continue updating weekly tasks in this repo instead of scattering them across chat histories or temporary documents.
* Submit proof of completion for this week: repo link, README screenshot or commit history, learning agent configuration notes, and one log showing agent-assisted learning / coding / material organization.

### Task 3 | Use an Agent to Generate an Interactive Learning Artifact

* Choose one Week 1 concept, such as LLM / workflow / agent, wallet / signature / transaction, or Gas / contract execution. Ask the agent to help you generate an interactive artifact: a small page, CLI, flowchart, quiz, concept cards, or minimal demo.
* Put the artifact into your GitHub repo, and explain in the README: what you asked the agent to do, what you manually changed, which outputs were unreliable, and how you plan to improve it next.
* Advanced challenge: use at least two tools among Claude Code / Codex / Hermes on the same learning task, and compare their differences in code generation, context retention, material organization, tool calling, and long-term learning records.

### Model and Tool Selection Decision Tree

* Already have an OpenAI / Claude subscription → use Codex / Claude Code or the corresponding subscription capabilities directly. Reduce configuration cost first and spend more time on learning outputs.
* No OpenAI / Claude subscription → use Z.ai / GLM API directly to request an API key, top up, and connect to a GLM model. First get a low-cost learning agent running end to end.
* Want to manage the course learning process continuously → use Hermes Agent to turn course materials, task breakdown, notes, repo updates, and follow-up questions into a long-running workflow.
* Do not want to write code for now → you still need to complete at least the repo, study plan, notes, and proof-of-work. The interactive artifact can start with a quiz, concept cards, or a flowchart.

***

## Module B | Web3 Fundamentals: Accounts, Wallets, Signatures, and On-Chain Execution

### Core Concepts

* The relationship among accounts, addresses, and wallets: a wallet is not an ordinary account; it is the entry point to private keys, security responsibility, and on-chain actions.
* What seed phrases, private keys, and addresses are, and why seed phrases and private keys must never be exposed.
* Privacy and security baselines for AI × Web3 builders: an address is not the same as anonymity, a signature is not the same as ordinary login, and authorization is not the same as transfer; AI agents should not directly touch private keys / seed phrases, and actions involving signatures, approvals, transfers, or contract writes must keep human confirmation.
* The relationship between signatures and transactions: signing is not simply "clicking confirm"; it authorizes a specific action.
* What Gas is, and why on-chain execution has costs, can fail, and requires waiting for confirmation.
* L1 / L2 and execution costs.
* How smart contracts differ from ordinary backend logic: state is public, execution is public, upgrade permissions can be checked, and some contracts cannot be changed.
* The difference between mainnets and testnets: learning and experiments should be completed on testnets first.
* How block explorers, wallet prompts, and transaction receipts help you understand on-chain behavior.
* Advanced extension: account abstraction, smart accounts, multisig, Safe, ERC-4337, and OpenZeppelin Contracts, and why they become key infrastructure for AI × Web3.
* From wallets to AI-native accounts: recovery, authorization, and security boundaries, including private keys, seed phrases, social recovery, email recovery, account abstraction, session keys, permission limits, and human confirmation.

### Recommended Materials / Reference Links

* [Ethereum Accounts docs](https://ethereum.org/developers/docs/accounts/): understand accounts and addresses.
* [MetaMask Getting Started](https://support.metamask.io/start/getting-started-with-metamask/): understand wallet usage and security responsibilities.
* [Ethereum Development Documentation](https://ethereum.org/developers/docs/): the main entry point for Ethereum learning paths.
* [How Web3 Works](https://docs.google.com/presentation/d/1NUeO115bLnz0V8aejx9bYqQTaDrznTjhgbCkn-pK1a0/edit?usp=sharing): Week 1 supplemental Web3 fundamentals material that helps students understand how accounts, transactions, Gas, contract execution, and on-chain state jointly make up Web3 operations.
* [Remix IDE](https://remix.ethereum.org/): entry point for minimal contract interaction.
* [Sepolia Faucet](https://cloud.google.com/application/web3/faucet/ethereum/sepolia): get test tokens.
* [Hardhat Getting Started](https://hardhat.org/docs/getting-started) / [Foundry](https://github.com/foundry-rs/foundry): more engineering-oriented entry points for contract development.
* [OpenZeppelin Contracts](https://docs.openzeppelin.com/contracts): reusable contract components and security practices.
* [Safe Overview](https://docs.safe.global/home/overview) / [ERC-4337 docs](https://docs.erc4337.io/): understand smart accounts, multisig, and permission control.
* [viem](https://viem.sh/) / [wagmi](https://wagmi.sh/): entry points for on-chain reads and writes from frontends and scripts.

### Practice Tasks / Challenges

* Create a test wallet and explain what the address, seed phrase, and private key are, and why they must never be exposed; do not record, upload, or screenshot real seed phrases / private keys in submission materials.
* Switch to the specified testnet, claim test tokens, and send one test transaction.
* Find the transaction result in a block explorer and record the transaction hash, status, Gas, and block height.
* Use Remix / Hardhat / Foundry to deploy at least one minimal smart contract, complete one read and one write, and save the contract address, transaction hash, and block explorer link.
* Advanced challenge: compare the differences among EOAs, smart accounts, and multisigs in permission control and automated execution.

***

## Module C | Minimal Crossover Experiment: From AI Output to On-Chain Execution

This module places AI and Web3 into the same task chain. The focus is not to build a complex project, but to see for the first time how AI output, human review, wallet confirmation, on-chain execution, and verification records connect with one another.

### Experiment Directions

* Have AI generate contract interaction instructions or a script, review it manually, and then execute it on a testnet.
* Have AI help explain a transaction or contract ABI, then manually check it and organize it into a learning record.
* Have AI generate a task plan, but require a pause and human confirmation whenever signing, transfers, or contract writes are involved.
* Draw a flowchart for "AI generation → human review → wallet confirmation → on-chain execution → block explorer verification."

### This Week's Deliverables

* Learning agent and GitHub repo deliverables: configuration records for Claude Code / Codex / Hermes, model / API path notes (OpenAI / Claude subscription, or Z.ai / GLM API), personal course repo link, at least one log of agent-assisted learning or coding, and corresponding commit / screenshot / README proof.
* Web3 testnet practice record: wallet address, testnet transaction hash, deployed smart contract address, at least one contract read/write result, block explorer links, and issues encountered.
* Basic concept explanation: explain LLMs, workflows, agents, wallets, signatures, transactions, and contracts within one task chain.
* Minimal crossover experiment write-up: complete and record at least one path, such as AI coding → contract deployment, agent workflow → wallet confirmation, or governance assistant → human review and public record. Explain the process, boundaries, risks, and verification materials.

***

## Advanced Track / Advanced Topics and Challenges (Optional)

This set of content was migrated from the previous "Week 2 | Tool Practice and Advanced Exploration" and now serves as an advanced supplement for Week 1. It is not required for everyone. It is intended for students who already have some AI, Web3, or engineering background and want to go deeper after completing the learning agent, GitHub repo, basic wallet, and testnet tasks.

### A. Agent Workflows and ETH Skills

* Advanced concept: the relationship between agent systems and skills; why reusable skills, tool calls, and state management move a system from "able to answer" to "able to execute a class of tasks."
* Advanced concept: how the difference between workflows and agents appears in real tasks—multi-turn organization, state management, tool calling, logging, or single-shot generation.
* Advanced concept: the closer a system gets to execution, the more it needs observability, logs, rollback strategies, and human confirmation.
* [OpenClaw repo](https://github.com/openclaw-ai/OpenClaw): good for understanding what changes when agents move into the execution layer.
* [Hermes Agent Docs](https://hermes-agent.nousresearch.com/docs/) / [Hermes repo](https://github.com/NousResearch/hermes-agent): good for understanding how agents, tool calls, skills, and long-running execution are organized.
* [OpenAI Agents SDK](https://openai.github.io/openai-agents-python/): good for understanding agent primitives such as handoff, guardrails, and tracing.
* Advanced challenge: complete the same task in three ways—"pure prompting," "AI coding tool / workflow," and "agent + skills"—and compare the differences.
* Advanced challenge: design or invoke an Ethereum-related skill (ETH skills) that lets AI help you complete a fixed class of tasks, and record where it is reliable and where it is not.

### B. Web3 Engineering and On-Chain Execution

* Advanced concept: once higher permissions, more funds, or more complex account structures are involved, execution boundaries escalate quickly.
* Advanced concept: basic on-chain interaction is only the entry point; the real difficulty lies in permission design, error recovery, and risk control.
* Advanced concept: testnets, explorers, wallet prompts, transaction hashes, Gas, and contract addresses should connect into a complete feedback loop.
* [Hardhat Getting Started](https://hardhat.org/docs/getting-started) / [Foundry](https://github.com/foundry-rs/foundry): for minimal contract development, testing, and deployment.
* [viem](https://viem.sh/) / [wagmi](https://wagmi.sh/): suitable for students with frontend skills to build a minimal interaction page.
* [OpenZeppelin Contracts](https://docs.openzeppelin.com/contracts): a security-infrastructure entry point for permissions, tokens, and contract reuse.
* Advanced challenge: use Hardhat or Foundry to complete minimal contract development, testing, and deployment, and write the contract address, transaction hash, and test records into your repo.
* Advanced challenge: if you already have frontend skills, try building a minimal interaction page with viem / wagmi, and explain which steps must be confirmed manually.

### C. Advanced AI: Model Adaptation, Fine-Tuning, and Controllability

* Advanced concept: fine-tuning usually does not mean training from scratch; it adapts capabilities, adjusts style, or aligns tasks on top of an existing model.
* Advanced concept: methods such as LoRA / PEFT lower the barrier to model adaptation, but data quality, evaluation methods, and overfitting risk directly affect the result.
* Advanced concept: local models, fine-tuned models, and hosted models each have trade-offs in cost, controllability, performance, and maintenance complexity.
* [Transformers Training](https://huggingface.co/docs/transformers/training): understand the basic training / fine-tuning workflow.
* [PEFT docs](https://huggingface.co/docs/peft/index): understand parameter-efficient fine-tuning.
* [Unsloth Docs](https://unsloth.ai/docs): understand a lightweight fine-tuning path that is closer to hands-on practice.
* Advanced challenge: choose a fine-tuning method (such as LoRA / PEFT) and explain what problems it is suitable for and what problems it is not suitable for.
* Advanced challenge: compare the capability boundaries of "only changing the prompt" and "adapting the model," and produce a short explanation.

### D. Advanced Web3: Blockchain Fundamentals, Protocols, and Execution Environments

* Advanced concept: the consensus mechanism determines who confirms state and how the system reduces forks and malicious behavior.
* Advanced concept: the EVM is not an application-layer feature but a contract execution environment; Gas is not merely a transaction fee, but a pricing and constraint mechanism for compute resources and execution.
* Advanced concept: the protocol layer, execution layer, account layer, and application layer solve different problems and should not be flattened into one level.
* [Intro to Ethereum](https://ethereum.org/developers/docs/intro-to-ethereum/) / [Blocks](https://ethereum.org/developers/docs/blocks/) / [Proof of Stake](https://ethereum.org/developers/docs/consensus-mechanisms/pos/): fill in the background on blocks, consensus, and the overall system.
* [EVM](https://ethereum.org/developers/docs/evm/) / [Gas and fees](https://ethereum.org/developers/docs/gas/): understand the execution environment and Gas mechanism.
* Advanced challenge: write a short explanation of what problems blocks, consensus, the EVM, and Gas each solve in the system.
* Advanced challenge: based on this week's testnet experience, explain why on-chain execution cannot be understood simply as an "ordinary backend call."

### E. Upgrading the Minimal Crossover Experiment

* Advanced challenge: break "AI generation → human review → wallet confirmation → on-chain execution" into a describable workflow, and mark logs, failure points, rollback strategies, and human confirmation nodes.
* Advanced challenge: compare the differences and risks for the same task under three modes: "fully manual," "AI-assisted," and "more automated workflow."
* Advanced challenge: build a constrained Web3 assistant or small workflow, such as documentation Q\&A, transaction explanation, or interaction scaffolding. You must explain which high-risk actions it cannot execute automatically.

### General Tasks / Industry Observation

* Industry observation and information sources: follow representative speakers, researchers, developers, and project teams in AI × Web3 / Ethereum / Crypto AI, and organize your own follow list.
* Each week, choose 3–5 pieces of high-quality content and write brief notes on what problem the author is discussing, the underlying technical / product / market trend, how it relates to this week's course theme, and what you still do not understand.
* Choose 1–2 projects or people from your follow list and summarize their positioning, users, tech stack, representative views, and possible AI × Web3 intersections.
* Finalize an "Industry Observation Checklist" that includes information sources, key links, observation notes, questions to verify, and directions for deeper follow-up research.

</details>
