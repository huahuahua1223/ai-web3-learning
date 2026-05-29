# Week 2 课程大纲

> **同步来源**：WCB Agent API · `program.getById{idOrSlug:"AI-Web3-School"}` → `metadata.curriculumWeekI18n.en["cmoy1hces012app01kp9ci5gb:1"].description`
> **拉取时间**：2026-05-25
> **语言**：WCB 平台目前只有英文一种语言，网页上的中文是前端翻译插件实时渲染。本文件本地补充了中文摘要 + 资源清单 + 进度映射，参照 [week1.md](./week1.md) 三段式。
> **互补关系**：与 [../learning-plan.md](../learning-plan.md) 互补——learning-plan 是「我计划做什么」、本文件是「平台推荐怎么做 + 资源清单 + 我的对应进度」。

## 中文摘要

### 本周定位

Week 2 = 共学营第二阶段，对应旧版 Week 3「交叉研究」。**不再堆工具**——Week 1 已经把 learning agent / repo / 钱包 / 测试网 / 最小交叉实验跑通了，本周转入 AI × Web3 的**问题空间判断**：

- Week 1 回答的是「我能不能用 AI 和 Web3 做出最小动作」
- Week 2 回答的是「**哪些问题值得用 AI × Web3 方式继续做，为什么值得做，风险与边界在哪**」

最终产出**问题地图 + Proposal 初稿**，给 Week 3 Hackathon 收敛方向。

### 本周学习目标

1. 建立 AI × Web3 **问题空间地图**，而非只记几个热门项目或标准名词
2. 理解 6 个交叉方向（payment / commerce、identity / reputation、capability / interoperability、wallet / permission、privacy / security、governance / coordination）各自要解决的问题
3. 会拆解一个交叉方向中的：**任务发起方、执行方、付款方、验证方、风险承担方、治理 / 仲裁方**
4. 能判断 **AI 在方案中承担的角色**：理解 / 生成 / 规划 / 工具调用 / 自动化 / 监控 / 总结 / 协作
5. 能判断 **Web3 在方案中提供的机制**：支付 / 身份 / 权限 / 开放状态 / 可验证记录 / 结算 / 抗审查 / 协作机制
6. 形成初步 Proposal / 研究方向声明，给 Week 3 进一步打磨

### 统一评估框架（7 问，所有方向都用这一套）

> 每个候选方向都用下面 7 问跑一遍，避免「在标题里放 AI 和 Web3」的概念拼贴

1. **没有 AI 这个问题还存在吗？AI 实际提供什么能力？**
2. **没有 Web3 这个问题还存在吗？Web3 实际提供什么机制？**
3. **谁发起 / 执行 / 付款 / 接受结果 / 承担失败 / 治理仲裁？**（六个角色全标清楚）
4. **哪些动作可以自动化？哪些必须人工确认？**
5. **如何验证结果？验证成本是否低于人工协调成本？**
6. **更接近哪一层？** 应用体验 / Dev Tooling / 协议标准 / 权限系统 / 安全机制 / 治理协作
7. **如果失败，最可能是因为：** 需求不存在 / 信任建不起来 / 成本太高 / 接口不成熟 / 权限风险 / 用户不愿改流程

### 建议学习顺序

1. **Module A**：先扫 6 个方向各写 1 句「真实用户是谁」
2. 从 6 个里选 **2 个**写「为什么不是纯 AI / 纯 Web3 问题」
3. 收敛到 **1 个主方向**，其他放进 Direction Backlog
4. 围绕主方向跑 **7 问评估框架**
5. 形成 **Proposal 初稿**（5 要素：目标用户 / 真实场景 / 最小功能 / 验证方法 / 风险边界）
6. 主方向**深挖包**：1 流程图 + 1 典型场景 + 1 反例 + 1 关键风险集 + 1 最小验证方案
7. 选做 Module B 的 **x402 + CAW 进阶实践**（+40pt，跟 Hackathon 方向耦合）

### 模块结构

- **Module A**｜问题空间与方向地图（评估框架 7 问 / 6 方向扫描 / 方向选择四步）
- **Module B**｜Payment / Commerce / Settlement（Cobo CAW Pact 案例 + **x402 Paywall + CAW Agent 进阶任务**，6 条资源）
- **Module C**｜Identity / Reputation / Capability / Interoperability（MCP / A2A / ERC-8004 / MPP 横向对比，4 条资源）
- **Module D**｜Wallet / Permission / Safe Execution（MPC 原理 + 任务级授权 Pact + 从授权到可恢复执行 9 条资源）
- **Module E**｜**Agent DeFi Execution**（Cobo sponsor 应用层路径，Uniswap / Aave / Polymarket / Hyperliquid / Lido / Jito，不是第 7 个基础方向）
- **Module F**｜Privacy / Security / Sovereignty（威胁模型 + 五类风险，4 条资源）
- **Module G**｜Governance / Coordination / Public Goods（AI 助手边界，5 条资源）

### 跟 Hackathon 候选方向的对接

当前主方向：**Dev Tooling / Agent Workflow**。这个方向已经在 [tasks/week2-problem-map-main-direction.md](../tasks/week2-problem-map-main-direction.md) 中正式锁定，基础仍来自 contract-reader Demo + Hermes 实装 + WCB Agent API 集成经验三块材料。Week 2 任务对应：

- 凌晨 Hermes 实装的「红线被 wizard 默认值绕过」收获 → **Module D / Wallet 任务**的真实演练
- 5/19 写的 [restricted-web3-assistant-design.md](../experiments/restricted-web3-assistant-design.md) → **Module F / Security 威胁模型任务**的草稿基础
- [contract-reader](https://github.com/huahuahua1223/week1-contract-reader) → **Dev Tooling 方向**候选

Module A 已完成本地产物，下一步直接围绕这条主线继续补 Module D / F / Final Deliverable。

## 推荐学习资源清单（可勾选）

### Module A · 问题空间与方向地图（6 条）
- [ ] [Ethereum Developer Documentation Overview](https://ethereum.org/developers/docs/) — Web3 机制基础入口
- [ ] [x402 Official Homepage](https://www.x402.org/) — 机器 / Agent 支付入口
- [ ] [Model Context Protocol](https://modelcontextprotocol.io/docs/getting-started/intro) / [A2A](https://github.com/a2aproject/A2A) — Agent ↔ 工具 / Agent ↔ Agent 协作接口
- [ ] [MPP introduction (Stripe)](https://stripe.com/blog/machine-payments-protocol) — Machine Payments Protocol 背景
- [ ] [GLM 5.1 Agentic Coding Guide](https://docs.z.ai/guides/llm/glm-5.1#agentic-coding) — GLM 5.1 在规划 / 工具调用 / coding 的定位（**5.28 Z.AI 1st 直播预读**，原日程 5.29 已改期）
- [ ] [Z.ai Chat Completion API](https://docs.z.ai/api-reference/llm/chat-completion) + [Web Search Tool](https://docs.z.ai/api-reference/tools/web-search) — OpenAI 兼容，5 分钟首个 function calling 请求

### Module B · Payment / Commerce / Settlement（4 条 + Cobo CAW 2 条）
- [ ] [x402 Docs](https://docs.x402.org/introduction) — 开放支付 + 机器支付框架
- [ ] [ERC-8004](https://eips.ethereum.org/EIPS/eip-8004) / [ERC-8183](https://eips.ethereum.org/EIPS/eip-8183) — Agent 信任 / job / escrow / evaluator 协议方向
- [ ] [Olas](https://olas.network/) — Agent 经济 / 自主服务方向参考
- [ ] [MPP Official Documentation (Stripe)](https://docs.stripe.com/payments/machine/mpp) — 机器支付协议文档入口
- [ ] [Cobo CAW Introduction](https://www.cobo.com/products/agentic-wallet/manual/start-here/introduction) — sponsor 案例：Pact 机制做预算 / 权限边界
- [ ] [Cobo CAW Index Page](https://cobo.com/products/agentic-wallet/manual/llms.txt) — LLM 可读索引

### Module C · Identity / Reputation / Capability / Interoperability(4 条)
- [ ] [MCP Official Documentation](https://modelcontextprotocol.io/docs/getting-started/intro) — 工具上下文 + Agent-工具接口
- [ ] [A2A Official Repository](https://github.com/a2aproject/A2A) — Agent-to-Agent 协作协议
- [ ] [ERC-8004](https://eips.ethereum.org/EIPS/eip-8004) / [ERC-8183](https://eips.ethereum.org/EIPS/eip-8183) — Agent 信任 / job / evaluator 方向
- [ ] [MPP Official Documentation](https://docs.stripe.com/payments/machine/mpp) — 机器支付与 Agent 经济活动接口

### Module D · Wallet / Permission / Safe Execution（9 条）
- [ ] [ERC-4337 Documentation](https://docs.erc4337.io/) — 账户抽象 + 智能账户基础
- [ ] [Ethereum Account Abstraction Roadmap](https://ethereum.org/roadmap/account-abstraction/) — 路线图背景
- [ ] [What Is Safe](https://docs.safe.global/home/what-is-safe) / [Safe Smart Account Guards](https://docs.safe.global/advanced/smart-account-guards) — 多签 / 智能账户 / Guard 策略
- [ ] [ERC-4337 Official EIP](https://eips.ethereum.org/EIPS/eip-4337) — 账户抽象基础协议
- [ ] [ERC-7702 Official EIP](https://eips.ethereum.org/EIPS/eip-7702) — EOA 临时获取智能账户能力
- [ ] [Coinbase Policy Engine](https://help.coinbase.com/en/prime/onchain-wallet/onchain-policy-engine) — 可配置交易策略例子
- [ ] [Cobo Agentic Wallet Developer Quickstart](https://www.cobo.com/products/agentic-wallet/manual/developer/quickstart-overview) — 原生 agent 钱包集成
- [ ] [MetaMask Design Server Wallets for AI Agents (ERC-8004)](https://docs.metamask.io/tutorials/design-server-wallets/) — Agent 身份 + 后端 signer + 钱包执行的生产架构
- [ ] [LI.FI Agents Overview](https://docs.li.fi/agents/overview) — Agent 查询链 / token / tx 状态 + 跨链执行

### Module E · Agent DeFi Execution（Cobo sponsor 路径，3 条安全 + 协议清单见英文原文）
- [ ] [Understanding Prompt Injection Attacks (OpenAI)](https://openai.com/index/prompt-injections/) — Prompt 注入攻击
- [ ] [Sensitive Information Disclosure (OWASP)](https://genai.owasp.org/llmrisk/llm022025-sensitive-information-disclosure/) — 敏感信息泄露风险
- [ ] [Excessive Agency (OWASP)](https://genai.owasp.org/llmrisk/llm062025-excessive-agency/) — Agent 过度授权风险

典型协议（按需展开）：Uniswap / Aave 重点；Polymarket / Hyperliquid / Lido / Jito 补充。详见英文原文 Module E。

### Module F · Privacy / Security / Sovereignty（4 条）
- [ ] [Ethereum Developer Documentation Overview](https://ethereum.org/developers/docs/) — 链上状态 / 交易 / 合约执行的公开性
- [ ] [Safe Smart Account Guards](https://docs.safe.global/advanced/smart-account-guards) — 约束执行 + 权限控制
- [ ] [ERC-4337 Documentation](https://docs.erc4337.io/) — 账户抽象的安全边界
- [ ] [Fileverse documentation](https://docs.fileverse.io/d/0200015f0008#k=xSLRzkvhNF0YVBb8CpGH0X1qJtd6_obOC5odV0dcWzU) — 隐私 / 数据所有权 / 用户控制协作上下文

### Module G · Governance / Coordination / Public Goods（5 条）
- [ ] [Ethereum Governance Basics](https://ethereum.org/governance/) — Ethereum 治理基础
- [ ] [Decentralized Autonomous Organizations (DAOs)](https://ethereum.org/dao/) — DAO 基础
- [ ] [Snapshot Documentation](https://docs.snapshot.box/) — 链下投票 / 提案 / 策略
- [ ] [OpenZeppelin Governor Documentation](https://docs.openzeppelin.com/contracts/5.x/api/governance) — 链上执行治理合约模式
- [ ] [Gitcoin Funding Mechanisms](https://gitcoin.co/mechanisms) — 公共物品资助机制

## 我在本周的对应进度

按 2026-05-29 提权运行 `bash scripts/wcb-checkin-prep.sh` 的 Agent API 结果核对：WCB 当前共 **67** 个 task，累计 **35 / 67** 已提交。结合 task title 与本地 `daily/` 记录，Week 2 已确认提交 **6 项**；其中 1 项（5.26 Cobo 直播）在本次 API 返回里 title 为空，但时间戳与 [daily/2026-05-26.md](../daily/2026-05-26.md) 的签到记录一致，因此按该任务回填。

**已确认已提交**

- `5.25 Co-learning Live`：✅ `SUBMITTED`，5/25 22:02 提交，proof「已参加」+ 截图
- `5.25 Long-term Memory for AI Agents` 直播：✅ `SUBMITTED`，5/25 22:38 提交，proof「已参加」+ 截图
- `5.26 Cobo Agentic Wallet PM` 直播：✅ `SUBMITTED`，北京时间 2026-05-26 21:22 提交；本次 API title 为空，但时间戳与本地 daily 记录一致
- `5.27 Co-learning Live`：✅ `SUBMITTED`，北京时间 2026-05-27 17:15 提交，proof「已参加」+ 截图
- `5.27 Neo-Cypherpunk Privacy` 直播：✅ `SUBMITTED`，北京时间 2026-05-27 23:35 提交，proof「已参加」+ 截图
- `5.28 Co-learning Live`：✅ `SUBMITTED`，北京时间 2026-05-28 23:25 提交，proof「已参加」+ 截图

| 平台任务 | 状态 | 我的 PoW |
|---|---|---|
| Week 2 Weekly Review Sharing · 5.29 Live Reflection or Hackathon Idea (+5) | ⏸ 待 5/29-30 | 跟 5.29 Week 2 例会 / Hackathon 方向反思捆绑 |
| Module A · 方向研究｜AI × Web3 问题地图与主方向选择 (+20) | 📝 本地产物已完成，待 WCB 提交 | [tasks/week2-problem-map-main-direction.md](../tasks/week2-problem-map-main-direction.md) |
| Module B · Payment / Commerce 最小流程拆解 (+20) | ⏸ | - |
| Module B · **进阶**｜x402 Paywall + CAW Agent 自主支付闭环 (+40) | ⏸ Hackathon 方向收敛后再决定 | - |
| Module C · Agent Identity Profile 与能力声明草图 (+20) | ⏸ | - |
| Module D · Wallet / Permission 权限策略 (+20) | 📝 本地产物已完成，待 WCB 提交 | [restricted-web3-assistant-design.md](../experiments/restricted-web3-assistant-design.md) 正式版：task-level authorization / budget / expiry / revoke / audit |
| Module F · Security / Privacy · Agent Workflow Threat Model (+20) | 📝 本地产物已完成，待 WCB 提交 | [agent-workflow-threat-model.md](../experiments/agent-workflow-threat-model.md) 正式版：assets / permissions / data / tool calls / dependencies / failure consequences |
| Module G · Governance / Coordination 流程草图 (+20) | ⏸ | - |
| **本周综合交付**｜方向深挖包 + Proposal 初稿 (+40) | ⏸ 5/26-5/29 收敛 + 5/29 起草 | - |
| Online Session · 5.27 Neo-Cypherpunk Privacy 直播 (+20) | ✅ `SUBMITTED` | 2026-05-27 23:35 提交，Module F 直接对口 |
| Online Session · 5.27 Neo-Cypherpunk Privacy 回放 (+10) | ⏸ | - |
| Online Session · 5.29 Women Builders in AI × Web3 直播 (+20) | ⏸ | - |
| Online Session · 5.29 Women Builders in AI × Web3 回放 (+10) | ⏸ | - |
| Online Session · 5.29 Week 2 例会直播 (+20) | ⏸ 5/29 20:00 | 含下周预告 |
| Online Session · 5.29 Week 2 例会回放 (+10) | ⏸ | - |
| Online Session · 5.28 Co-learning Live (+20) | ✅ `SUBMITTED` | 2026-05-28 23:25 提交 |
| Week 2 自组织分享｜办一场你的 Twitter Space / Workshop (+20) | ⏸ | - |

**API 里仍存在且当前未提交**

- `Week 2｜Online Session｜Attend 5.28 Live｜Z.AI 1st`
- `Week 2｜Online Session｜Watch 5.28 Recording｜Z.AI 1st`
- `Week 2｜Z.AI Bonus Task｜Submit 3 Useful Notes`

以上 3 项在 2026-05-29 的 WCB Agent API 核对结果里仍然存在，且当前都还没有提交记录。

**主方向已锁定**：**Dev Tooling / Agent Workflow**。三块经验基础：

- [contract-reader Demo](https://github.com/huahuahua1223/week1-contract-reader)（Week 1 PoW）
- Hermes Agent 实装（凌晨完成，[daily/2026-05-25.md](../daily/2026-05-25.md) 实验段）
- WCB Agent API 调用经验（5/22 综合任务提交 + 课程同步脚本）

主方向的 6 方向扫描、2 个候选方向对比和 7 问简版评估，已落在 [tasks/week2-problem-map-main-direction.md](../tasks/week2-problem-map-main-direction.md)。

## 英文原文（来自 WCB API，权威版本）

<details>
<summary>展开 Week 2 完整原文（33,004 字符）</summary>

# Week 2 | Bootcamp: AI × Web3 Research and Direction Selection

> Week 2 corresponds to “Cross-domain Research” in the previous Week 3. After Week 1’s foundation building, learning agent, repo setup, and minimal practice, this week no longer continues with tool onboarding. Instead, it enters the AI × Web3 problem space: deciding which directions genuinely require AI and Web3 to appear together, which are only conceptual mashups, and preparing a proposal that narrows the project direction before Week 3 / the Hackathon.

## This Week’s Positioning

The focus this week is not to keep piling on tools, nor to immediately build a complete project, but to create a problem map that can be discussed. Learners should turn Week 1 experience with agents, repos, wallets, and testnets into judgment across areas such as payment, identity, capability, permission, privacy, security, and coordination.

If Week 1 answered “Can I use AI and Web3 to perform a minimal action?”, Week 2 answers “Which problems are worth continuing through an AI × Web3 approach, why are they worth doing, and where are the risks and boundaries?”

***

## Learning Goals for This Week

- Build a map of the AI × Web3 problem space instead of only memorizing a few hot projects or standard terms.

- Understand the problems addressed by payment / commerce, identity / reputation, capability / interoperability, wallet / permission, privacy / security, and related directions.

- Learn to break down the task initiator, executor, payer, verifier, risk bearer, and governance / arbitration party in a cross-domain direction.

- Be able to judge whether AI is responsible for understanding, generation, planning, tool use, automation, monitoring, summarization, or collaboration in a solution.

- Be able to judge whether Web3 provides payment, identity, permissioning, open state, verifiable records, settlement, censorship resistance, or coordination mechanisms in a solution.

- Form an initial project proposal or research direction statement that can be refined further in Week 3.

***

## Unified Evaluation Framework

Use the same set of questions to evaluate every direction, so a project does not merely put the words AI and Web3 in the same title.

1. Would this problem still exist without AI? What capability does AI actually provide?

1. Would this problem still exist without Web3? What mechanism does Web3 actually provide?

1. Who initiates the task, who executes it, who pays, who accepts the result, who bears the cost of failure, and who handles governance or arbitration?

1. Which actions can be automated, and which actions require human confirmation?

1. How can the result be verified? Is the cost of verification lower than the cost of human coordination?

1. Is it closer to an application-layer experience, developer tooling, protocol / standard, permission system, security mechanism, or governance coordination process?

1. If this direction fails, is it most likely because demand does not exist, trust cannot be established, costs are too high, interfaces are immature, permission risk is too high, or users are unwilling to change their workflow?

***

## Module A｜Problem Space and Direction Map

### Core Concepts

- Cross-domain directions can be understood through problem domains such as payment / commerce, identity / reputation, capability / interoperability, wallet / permission, privacy / security, governance / coordination, and related areas.

- Whether a direction is valid depends not on how many new terms it uses, but on whether AI capabilities and Web3 mechanisms are both indispensable.

- Truly valuable problems usually sit at the intersection of “machine execution + economic exchange + permission control + verifiable records.”

- An early proposal does not need a complete implementation, but it must clearly explain the target users, real scenario, minimal functionality, validation method, and risk boundaries.

### Direction Overview: See the Whole Landscape First, Then Choose a Main Thread

The focus of Module A is to quickly scan the major cross-domain areas in AI × Web3, then choose one main direction to explore in depth. Learners do not need to turn every direction on this page into a project, but they should understand each direction’s core problem, typical entry point, suitable learner profile, and whether it is more likely to land at the product, tooling, protocol, or research layer.

- Payment / Commerce / Settlement: focuses on how machines or agents buy APIs, data, compute, and services, and how quoting, acceptance, escrow, dispute handling, and settlement form a closed loop. Suitable for learners interested in commercial loops, payments, standards, and protocols.

- Identity / Reputation / Capability / Interoperability: focuses on how agents are discovered, described, invoked, verified, and coordinated. Suitable for learners interested in MCP, A2A, ERC-8004, registry, agent profiles, and capability claims.

- Wallet / Permission / Safe Execution: focuses on permission layering, automation boundaries, human confirmation, revocation, and auditing when agents interact with wallets, signatures, budgets, and on-chain actions. Suitable for learners interested in account abstraction, Safe, policy, guard, and session keys.

- Privacy / Security / Sovereignty: focuses on prompt injection, tool abuse, sensitive data, dependency on model providers, private key / API key exposure, local execution, and user sovereignty. Suitable for learners interested in security, privacy, trusted execution, auditing, and risk control.

- Dev Tooling / Agent Workflow: focuses on whether AI can genuinely improve Web3 builder workflows, such as docs-to-agent, contract reading, transaction explanation, deployment assistants, test scripts, and automated repo maintenance. Suitable for learners who want to build tools, developer experience, or workflows.

- Governance / Coordination / Public Goods: focuses on how AI can help DAOs, communities, and public goods projects with proposal summaries, meeting action items, contribution records, budget checklists, and transparent execution. Suitable for learners interested in community collaboration, public goods, and organizational processes.

Framework note: Agent DeFi Execution remains Module E and is positioned as a sponsor-defined applied path. It is not a new seventh foundational direction; instead, it tests Payment / Commerce, Wallet / Permission, and Privacy / Security in a concrete DeFi on-chain execution scenario, and can serve as the priority Cobo-related Hackathon / workshop path.

### How to Choose a Main Direction

1. First choose 2 directions of interest from the 6 directions, and write one sentence for each: who is the real user in this direction?

1. Then write one sentence: why is this problem hard to solve without AI, and what is missing without Web3?

1. Then judge whether it is more suitable as a product demo, developer tooling, protocol / standard, risk model, or research memo.

1. Finally, choose only 1 main direction as the object of deeper Week 2 exploration. Put the other directions into the backlog; do not open too many threads at once.

### Direction Evaluation Matrix

- Structural demand: does this problem exist over the long term, or only because a hot project appeared?

- Verifiability: can it be validated through a demo, flowchart, transaction records, logs, user interviews, or a reference implementation?

- Minimal entry point: can you produce a problem breakdown, flowchart, mock, repo skeleton, or minimal prototype within one week?

- Risk boundaries: does it involve private keys, signatures, funds, identity, sensitive data, governance power, or irreversible actions?

- Follow-through: can it naturally feed into the Week 3 proposal, a Hackathon challenge, or a long-term handbook / research backlog?

### Recommended Learning Materials

- [Ethereum Developer Documentation Overview](https://ethereum.org/developers/docs/): a foundational entry point for understanding Web3 mechanisms.

- [x402 Official Homepage](https://www.x402.org/): understand the entry point for machine / agent payments.

- [Model Context Protocol](https://modelcontextprotocol.io/docs/getting-started/intro) / [A2A](https://github.com/a2aproject/A2A): understand collaboration interfaces between agents and tools / agents.

- [MPP introduction](https://stripe.com/blog/machine-payments-protocol): understand the problem background of Machine Payments Protocol (MPP).

- [GLM 5.1 Agentic Coding Guide](https://docs.z.ai/guides/llm/glm-5.1#agentic-coding): gives you a sense of where GLM 5.1 lands on planning, tool use, and coding, which is exactly what you need to answer the Week 2 question of what the AI is actually doing in a given agent workflow

- [Chat Completion API](https://docs.z.ai/api-reference/llm/chat-completion): the core GLM 5.1 endpoint, OpenAI compatible with messages, tools, and tool_choice; you can fire off your first function calling request in five minutes and use it as the skeleton for capability manifests, agent profiles, or payment flows

- [Web Search Tool](https://docs.z.ai/api-reference/tools/web-search): built in web search so you don't have to wire up your own search API, perfect for spinning up agent demos that need external context, such as reading docs, looking up contracts, or explaining transactions

### Tasks / Challenges

- Draw an AI × Web3 problem map that includes at least 5 directions, and explain the AI role and Web3 mechanism in each direction.

- Choose 2 directions from the map and write, for each one, “why this is not a pure AI problem / why this is not a pure Web3 problem.”

- Choose one direction as your Week 2 main thread, and use it as the focus for the breakdowns in later modules.

***

## Module B｜Payment / Commerce / Settlement

### Core Questions

Agent economic activity is not a simple extension of ordinary payments. The real difficulty is not “whether money can be transferred,” but how quoting, budgeting, authorization, delivery, verification, escrow, dispute handling, receipts, and settlement connect into a controllable flow.

- When an AI agent acts as a consumer or service provider, the budget, payment conditions, delivery standards, and failure remedies must be clear.

- Payment is only one segment of the flow; commerce also includes service discovery, price negotiation, task execution, result acceptance, dispute handling, and settlement.

- On-chain records can provide receipts, state, and a basis for settlement, but they cannot automatically solve service quality, arbitration, and trust issues.

### Deep Exploration Path: From Scenario to Protocol

- Scenario layer: first clarify what the agent is actually buying—API calls, data queries, compute tasks, human services, content generation, or on-chain execution. Different services require different acceptance methods.

- Process layer: draw the flow “service discovery → quote → budget authorization → task execution → result delivery → acceptance → payment / refund / dispute.”

- Verification layer: judge whether delivery can be automatically verified. If not, specify who accepts the result, what the acceptance criteria are, and how disputes are handled.

- Protocol layer: then judge whether the problem needs checkout, invoice, receipt, escrow, reputation, evaluator, or a more complete marketplace / settlement layer.

- Counterexample: if an agent merely helps a user click a traditional payment button, without budget control, proof of delivery, verifiable records, or dispute handling, it is closer to ordinary automation and may not be a strong AI × Web3 direction.

### Case: Cobo CAW in the Agent Commerce Flow

- Budget and permission control: in agent commerce, users should not give an agent a vague “can pay” permission. They need to limit how much it can spend, which on-chain actions it can take, which contracts it can call, and within what time window. Cobo CAW’s Pact mechanism can be used as a case: the user approves a budget and execution scope around a specific task, and the agent can only operate within the boundaries defined by the Pact; actions outside the scope are rejected.

- Audit and verifiable records: after an agent completes a transaction or task, the system needs traceable records, including the authorization content, execution actions, on-chain transactions, state changes, and exception logs. Cobo CAW’s audit capability can be used as a case to show that agent commerce is not just “payment succeeded”; it also needs verifiable, accountable, and reviewable execution records.

- Boundary note: CAW is closer to the wallet and execution-safety layer, suitable for budget control, permission constraints, and audit problems. A complete agent commerce system still needs product or protocol-layer capabilities such as quoting, delivery, acceptance, escrow, evaluators, reputation, and dispute resolution.

- CAW introduction docs: https://www.cobo.com/products/agentic-wallet/manual/start-here/introduction

- Index page: https://cobo.com/products/agentic-wallet/manual/llms.txt

### Task: x402 Paywall + CAW Agent Autonomous Payment Loop

Build a simple x402 paywall service, such as a paid data API or AI inference API. When the server receives a request, it returns a payment requirement. On the consumer side, an agent connected to Cobo CAW automatically recognizes the payment condition and completes the payment within a pre-approved Pact / policy / budget scope, then obtains the result.

The goal is to run a minimal autonomous agent payment loop:

- Service provider: provide an API or AI inference service protected by x402.

- Consumer side: an agent initiates the request, recognizes the payment requirement, and completes payment.

- Permission control: use CAW / Pact to limit budget, action scope, and time window.

- On-chain settlement: complete payment settlement and keep auditable records.

- Result retrieval: after successful payment, the agent automatically receives the API response.

The key point is to understand that agent commerce is not “automatic payment,” but “automatic transaction under explicit authorization, budget control, and auditable records.”

### Recommended Learning Materials

- [x402 Docs](https://docs.x402.org/introduction): open payment entry points and machine payment framing.

- [ERC-8004](https://eips.ethereum.org/EIPS/eip-8004) / [ERC-8183](https://eips.ethereum.org/EIPS/eip-8183): references for protocol directions such as agent trust, jobs, escrow, and evaluators.

- [Olas](https://olas.network/): reference for the agent economy / autonomous services direction.

- [MPP Official Documentation](https://docs.stripe.com/payments/machine/mpp): documentation entry point for Machine Payments Protocol (MPP).

### Tasks / Challenges

- Choose a scenario where an agent helps someone complete a task and receives payment. Break down the full process: who places the order, who executes, who accepts the result, who pays, and who arbitrates.

- Design a minimal payment / commerce flow: quote, execution, acceptance, payment, failure handling, and proof of record.

- Compare any two of x402, MPP, ERC-8004, and ERC-8183, and explain which segment each addresses among payment, verification, identity, settlement, or arbitration.

***

## Module C｜Identity / Reputation / Capability / Interoperability

### Core Questions

An agent is not just “a program that can execute.” It also needs a capability layer for being discovered, described, verified, and coordinated. This module separates what identity, capability claims, communication protocols, task collaboration, and reputation accumulation each solve.

- Identity answers “who are you,” capability answers “what can you do,” and reputation answers “why should others trust you.”

- Interoperability focuses on how different agents, tools, services, and systems exchange context, tasks, and results.

- MCP, A2A, ERC-8004, and MPP are not the same kind of thing: they sit at different layers and address different problems and constraints.

- The truly valuable direction is not giving an agent a DID name, but forming a complete flow of discovery, collaboration, invocation, and verification.

### Deep Exploration Path: From Agent Profile to Collaboration Network

- Profile: describe who the agent is, who maintains it, what it can do, what its inputs and outputs are, how it charges, and who bears responsibility for failures.

- Capability: break “can do things” into concrete capabilities, such as reading documents, calling APIs, deploying contracts, explaining transactions, generating reports, and executing payments.

- Interoperability: judge whether it needs to work with tools, another agent, or an on-chain contract / registry / payment layer. Different layers correspond to different interfaces such as MCP, A2A, ERC-8004, and MPP.

- Reputation: reputation is not an avatar or a name; it is historical tasks, delivery records, reviews, stake, slashing, verifiable evidence, or third-party endorsements.

- Counterexample: if a system only issues an NFT business card to an agent, without capability claims, invocation interfaces, delivery records, or verification methods, it usually does not form a complete identity / reputation direction.

### Recommended Learning Materials

- [MCP Official Documentation](https://modelcontextprotocol.io/docs/getting-started/intro): tool context and agent-tool interfaces.

- [A2A Official Repository](https://github.com/a2aproject/A2A): reference for agent-to-agent collaboration protocols.

- [ERC-8004](https://eips.ethereum.org/EIPS/eip-8004) / [ERC-8183](https://eips.ethereum.org/EIPS/eip-8183): references for agent trust / job / evaluator directions.

- [MPP Official Documentation](https://docs.stripe.com/payments/machine/mpp): reference for interfaces between machine payments and agent economic activity.

### Tasks / Challenges

- Choose an agent or workflow you know well, and clearly describe its identity, capability, inputs and outputs, collaboration partners, and failure points.

- Compare any two of MCP, A2A, ERC-8004, and MPP, and explain what types of collaboration, payment, or interface problems each is suited to solve.

- Design a draft agent profile: what it can do, how it can be invoked, how it charges, how it is verified, and how failures are handled.

***

## Module D｜Wallet / Permission / Safe Execution

### Basic Principles

- MPC principle: the private key does not exist in full form on any single device; signing requires multi-party collaboration, so compromise of any single point does not directly compromise the asset.

- Institutional wallets: MPC solutions for enterprises and teams usually combine a policy engine and audit capability; Cobo is one representative product in this direction.

### Core Questions

When an agent participates in on-chain actions, the most important question is not “how to call a signing API,” but how permissions are granted, limited, revoked, audited, and recovered.

- When an agent participates in on-chain actions, distinguish between steps that can be automated and steps that require human confirmation.

- Authorization is not a one-time action; it is a combination of budget, scope, time, operation type, and failure handling.

- Account abstraction, smart accounts, multisigs, and guard / policy mechanisms can provide finer-grained control for agent execution, but they also increase system complexity.

On this basis, task-level authorization can also be introduced: instead of giving an agent a long-term permission, generate a temporary authorization around one concrete task. For example, Cobo CAW’s Pact lets the user first confirm the agent’s task intent, budget, operation scope, time window, and failure-handling strategy. The agent can only execute within the boundaries defined by that Pact, and the permission expires when the task ends.

Relationship to Module E: this module covers general wallet, permission, and recoverable-execution principles. Concrete DeFi actions such as swap / approve / deposit / borrow are handled in Module E, rather than repeated here as scenario details.

### Deep Exploration Path: From Authorization to Recoverable Execution

- Authorization subject: on whose behalf is the agent allowed to act? A user wallet, team multisig, project treasury, test wallet, or read-only API?

- Authorization scope: limit callable contracts, functions, amounts, frequency, time windows, networks, tokens, counterparties, and maximum loss.

- Execution strategy: low-risk actions can be automated, while high-risk actions must pause. High-risk actions include signing, transfers, approvals, deployment, upgrades, governance voting, and key handling.

- Recovery mechanisms: design pause, revocation, rollback, alerts, logs, post-incident audits, and human takeover. Automation without recovery mechanisms should not enter real-asset scenarios.

- Counterexample: if an AI wallet can only show “send transactions in natural language,” but cannot explain permission limits, failure handling, and audit methods, it is closer to a dangerous demo than a reliable product direction.

### Recommended Learning Materials

- [ERC-4337 Documentation](https://docs.erc4337.io/): foundations of account abstraction and smart accounts.

- [Ethereum Account Abstraction](https://ethereum.org/roadmap/account-abstraction/): background on the account abstraction roadmap.

- [What Is Safe](https://docs.safe.global/home/what-is-safe) / [Safe Smart Account Guards](https://docs.safe.global/advanced/smart-account-guards): references for multisigs, smart accounts, and guard / policy mechanisms.

- [ERC-4337 Official EIP](https://eips.ethereum.org/EIPS/eip-4337): the base protocol for account abstraction.

- [ERC-7702 Official EIP](https://eips.ethereum.org/EIPS/eip-7702): understand how standard externally owned accounts can temporarily gain smart-account-like capabilities.

- [Coinbase Policy Engine](https://help.coinbase.com/en/prime/onchain-wallet/onchain-policy-engine): an example of configurable transaction policies.

- [Cobo Agentic Wallet Developer Assistant](https://www.cobo.com/products/agentic-wallet/manual/developer/quickstart-overview): how to integrate a native agent wallet.

- [MetaMask — Design Server Wallets for AI Agents with ERC-8004](https://docs.metamask.io/tutorials/design-server-wallets/): understand a production architecture combining agent identity, backend signer, and wallet execution.

- [LI.FI Agents Overview](https://docs.li.fi/agents/overview): understand how agents can query chains, tokens, transaction status, and execute cross-chain actions.

### Tasks / Challenges

- Draw the execution flow of an “agent-initiated on-chain action,” marking which steps can be automated and which steps must be confirmed by a human.

- Design a permission strategy for an agent wallet scenario: budget, callable contracts, executable actions, human confirmation thresholds, revocation method, and logging.

- Explain why ERC-4337, Safe, and guard / policy mechanisms matter, and what type of risk they address.

***

## Module E｜Agent DeFi Execution: From Intent to Safe On-Chain Execution

### Core Questions

- When an agent participates in DeFi operations, what on-chain actions is it actually executing?

- How should the agent’s budget, protocols, tokens, contracts, time window, and maximum loss be limited?

- What are the risks of actions such as swap, approve, deposit, borrow, withdraw, and redeem?

- Which actions can be automatically executed within a Pact / policy scope?

- Which actions must pause and request human confirmation?

- After execution, how can tx records and audit logs be used for verification, review, and accountability?

### Typical Protocols

- Uniswap: suitable for discussing DEX swaps, slippage, allowance, MEV, token allowlists, and pre-trade simulation.

- Aave: suitable for discussing deposits, borrowing, health factor, liquidation risk, oracle risk, and automated monitoring.

Supplemental learning, while avoiding excessive scope expansion or compliance risk:

- Polymarket: suitable for discussing prediction-market positions, redemption, event settlement, dispute handling, and compliance boundaries.

- Hyperliquid: suitable for discussing on-chain perpetuals, order types (market / limit / TWAP / stop-loss), cross and isolated margin, funding rates, liquidation risk, and authorization boundaries for agents in high-leverage scenarios.

- Lido / Jito: suitable for discussing liquid staking, yield receipts, redemption delays, depeg risk, and protocol allowlists.

### Recommended Learning Materials

- [Understanding Prompt Injection Attacks](https://openai.com/index/prompt-injections/): OpenAI’s introduction to prompt injection attacks.

- [Sensitive Information Disclosure](https://genai.owasp.org/llmrisk/llm022025-sensitive-information-disclosure/): basic knowledge of sensitive information disclosure risks.

- [Excessive Agency](https://genai.owasp.org/llmrisk/llm062025-excessive-agency/): basic knowledge of excessive-agency risks when agents can take actions.

***

## Module F｜Privacy / Security / Sovereignty

### Core Questions

Once an agent holds context, credentials, API keys, private keys, or a budget, security is no longer a side issue; it is a system prerequisite.

- Common risks include at least five categories: prompt injection, tool abuse, unauthorized execution, sensitive data leakage, and dependency on model providers. In concrete systems, these may further expand into attack surfaces such as unauditable operations, forged tool returns, phishing links, and model hallucinations.

- Security design must answer: what can the agent see, what can it call, how much can it spend, on whose behalf can it make decisions, and who is responsible when something goes wrong?

- Privacy / sovereignty is not just the four words “local model”; it also involves data boundaries, provider dependency, portability, auditing, and user control.

Relationship to Module E: this module covers the general threat model and security boundaries. Concrete attack surfaces, policy checks, and audit records for DeFi execution are treated as the applied scenario in Module E.

### Deep Exploration Path: From Threat Model to Security Boundaries

- Asset inventory: list what the system holds—private keys, API keys, session tokens, user data, transaction permissions, budgets, sensitive documents, or governance permissions.

- Attack surfaces: prompt injection, malicious web pages / documents, polluted tool returns, forged transaction descriptions, phishing links, model hallucinations, and provider failures.

- Controls: least privilege, read-only first, human-in-the-loop, allowlists, budget limits, sandboxes, logs, simulated execution, and anomaly alerts.

- Sovereignty questions: can users export data, switch models, switch execution environments, revoke authorization, and continue using core assets without relying on a single provider?

- Counterexample: if a system requires users to entrust private keys, full transaction permissions, and complete context to a black-box agent, it must be marked high-risk and should not be the default learning path.

### Recommended Learning Materials

- [Ethereum Developer Documentation Overview](https://ethereum.org/developers/docs/): understand the public nature of on-chain state, transactions, and contract execution.

- [Safe Smart Account Guards](https://docs.safe.global/advanced/smart-account-guards): reference for constrained execution and permission control.

- [ERC-4337 Documentation](https://docs.erc4337.io/): reference for the security boundaries of account abstraction.

- [Fileverse documentation](https://docs.fileverse.io/d/0200015f0008#k=xSLRzkvhNF0YVBb8CpGH0X1qJtd6_obOC5odV0dcWzU): reference for privacy, data ownership, and user-controlled collaboration contexts.

### Tasks / Challenges

- Simulate attacks against an agent with CAW installed, including prompt injection, forged tool returns, and unauthorized instructions. Observe whether CAW’s policy checks can intercept these attacks at the infrastructure layer, and record which attacks are blocked and which are not.

- Write a threat model for an agent workflow: assets, permissions, data, tool calls, external dependencies, and failure consequences.

- Design a “low-risk automation / high-risk human confirmation” strategy, and explain the conditions that trigger human confirmation.

- Find an AI × Web3 idea that looks exciting but is high-risk, and explain why it should not be directly automated right now.

***

## Module G｜Governance / Coordination / Public Goods

### Core Questions

AI can help DAOs, communities, and public goods projects organize information, track contributions, generate action items, and support transparent execution, but governance power, budget actions, and final judgment must have clear boundaries.

- Parts suitable for AI assistance: proposal summaries, organizing discussion threads, turning meetings into action items, contribution records, budget execution checklists, and community Q&A.

- Parts not suitable for direct delegation to AI: value judgments, budget approvals, punishment / incentive decisions, and initiating irreversible actions on behalf of the community.

- What Web3 provides is not “a livelier community tool,” but mechanisms for public records, verifiable contributions, transparent budgets, and open collaboration.

### Deep Exploration Path: From Community Process to Verifiable Coordination

- Information organization: AI can summarize proposals, meetings, discussion threads, and task status, but it must preserve source links and uncertainties.

- Action conversion: turn meeting notes into action items, owners, deadlines, dependencies, budget impact, and public records.

- Contribution records: Web3 can help record contributions, funding, votes, execution status, and public accountability, but contribution quality still requires human judgment.

- Governance boundaries: AI can assist with explanation and reminders, but cannot replace the community in making value judgments, approving budgets, imposing penalties, or making final governance decisions.

- Counterexample: if a governance assistant automatically generates and passes budget proposals without human confirmation, public discussion, and accountability mechanisms, it is not an efficiency improvement; it is a governance risk.

### Tasks / Challenges

- Choose a DAO / community process, and break down the steps where AI can assist and the steps that must be confirmed by people or a governance process.

- Sketch a proposal summarizer, meeting-to-action workflow, contribution tracker, or budget execution checklist.

- Mark which conclusions are only AI summaries, and which actions require human confirmation or approval through a governance process.

### Recommended Learning Materials

- [Ethereum Governance Basics](https://ethereum.org/governance/): basic knowledge of Ethereum governance.

- [Decentralized Autonomous Organizations (DAOs)](https://ethereum.org/dao/): basic knowledge of DAOs.

- [Snapshot Documentation](https://docs.snapshot.box/): offchain voting, proposals, spaces, strategies, and common DAO governance tooling.

- [OpenZeppelin Governor Documentation](https://docs.openzeppelin.com/contracts/5.x/api/governance): onchain execution-oriented governance contracts and patterns.

- [Gitcoin Funding Mechanisms](https://gitcoin.co/mechanisms): public-goods funding mechanisms.

***

## This Week’s Final Deliverables

- An AI × Web3 problem map: cover at least 5 directions and mark the AI role and Web3 mechanism in each.

- A direction selection note: choose 1 main direction and explain why it is not a pure AI or pure Web3 problem.

- A problem breakdown: stakeholders, process, AI role, Web3 mechanism, automation boundaries, human confirmation points, verification method, and main risks.

- An initial project proposal: target users, real scenario, minimal functionality, validation method, main risks, possible track, and next steps for Week 3.

- A reference list: at least 5 projects, standards, protocols, tools, or cases, and an explanation of what each source helps you evaluate.

- A main-direction deep-dive package: around your chosen 1 main direction, add at least 1 flowchart, 1 typical scenario, 1 counterexample, 1 set of key risks, and 1 minimal validation plan.

- Direction backlog: record 2–3 directions you did not choose and explain why they are not selected for now, so later discussions do not keep swinging back and forth.

> If, by the end of Week 2, learners are still only listing hot terms and cannot explain the AI role, Web3 mechanism, verification method, and risk boundaries within a direction, then this week has not truly been completed.

***

Full Notion source: https://ethpanda.notion.site/Week-2-Bootcamp-AI-Web3-Research-and-Direction-Selection-355bbd63be87816ca4b6f4113b4c42ef?pvs=74

</details>
