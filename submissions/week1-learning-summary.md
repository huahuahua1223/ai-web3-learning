# Week 1 学习总结｜AI × Web3 School Cohort 0

> **作者**：huahua（GitHub: [huahuahua1223](https://github.com/huahuahua1223)）
> **周次**：Week 1（2026-05-17 → 2026-05-22）
> **主仓库**：[huahuahua1223/ai-web3-learning](https://github.com/huahuahua1223/ai-web3-learning)
> **发布日期**：2026-05-22

---

## TL;DR

Week 1 我对 AI × Web3 的理解被 Handbook 推进了三个台阶：

1. **AI 概念**｜Agent 不是「会聊天的模型」，是**被约束的执行循环**——五要素缺一不可：目标、工具、状态、权限、停止条件。
2. **Web3 概念**｜smart account 的 **session key 中间档**是 Agent 实用化的核心层——我之前的设计直接从「模拟」跳到「签名硬卡死」，漏掉了「小额自动化通道」这一整层。
3. **AI × Web3 交叉**｜**「任何一道闸如果能被模型说服关掉，它就不是真的闸」**——Reflection 管质量，Simulation / Policy / Human-in-the-loop / Log 管风险，这两条不能混。

**本周交付**：合约可读化助手 Demo（[Vercel 在线](https://week1-contract-reader.vercel.app/)）、Sepolia 测试网交易 + Week1Note 合约部署、WCB Agent API 探索 + 两个自动化脚本、5/22 上麦分享。

**下周方向**：Hermes Agent 实装、session key 在 EIP 层的具体落地（ERC-7715 / ERC-4337 / EIP-7702）、Hackathon Dev Tooling 方向。

---

## 1. 一个我重新理解的 AI 概念｜Agent = 被约束的执行循环

进 Cohort 之前，我对 Agent 的理解是「能调用工具的 LLM」——能查天气、能 RAG、能跑代码就算 Agent。Week 1 读完 Handbook 的 [AI > Agent](https://aiweb3.school/zh/handbook/ai/agent/) 章节后，这层理解被推翻了一层。

**Handbook 的定义是：Agent 是被约束的执行循环**。五要素缺一不可——**目标、工具、状态、权限、停止条件**。关键不在「像人」，在「**明确权限和可审计流程里把建议推进到行动**」。

最颠覆我的是 **State 这一层**。我之前以为 state 就是「上下文里多塞几轮对话历史」，Handbook 明确说：**state 必须外置——可查询、可恢复、可审计**，不能只藏在模型上下文里。这听起来抽象，但落到我自己 Week 1 做的事上立刻具体：

- 我让 Claude Code 用 WCB Agent API 拉 Week 1 任务进度——state 不在 Claude 上下文里，在 `/tmp/wcb-checkin-YYYY-MM-DD.md` 这份外置文件里
- 我让 Claude 起草 daily/——state 不在对话里，在 `daily/2026-05-21.md` 这份 commit 历史里
- 我让 Claude 跨会话延续工作——state 在仓库根的 `CLAUDE.md` 里，新会话第一句话自动加载

之前我会把这套做法叫做「让 Agent 有记忆」，Handbook 给了这个直觉一个准确的名字：**State 外置**。

这个章节另一个让我印象很深的点是「**自我反思仍由模型完成，模型可能给自己错误找理由 …… 自我检查可以提高质量，确定性检查才能承载风险**」。我之前一直以为「加一道 reflection 步骤就能提质量」，Handbook 明确说 reflection 只能管「质量」，**不能管「风险」**。风险必须靠 simulation / policy / human-in-the-loop / log 这些**确定性的、跟模型无关的**机制来兜。

这两层认知合在一起，给了我一个简单可用的工程原则——也是我下一章交叉问题的核心：**任何一道闸，如果它能被模型说服关掉，它就不是真的闸**。

---

## 2. 一个我重新理解的 Web3 概念｜session key——Agent 实用化的中间档

进 Cohort 之前我对 Web3 的账户模型已经熟：EOA、smart account、多签、ERC-4337。但 Handbook 的 [Bridge > Web3 Tool Use](https://aiweb3.school/zh/handbook/bridge/web3-tool-use/) 给了我一个新角度——**从 Agent 视角看 Web3 账户的权限分层**。

5/19 我设计了一份「受限 Web3 助手」（[experiments/restricted-web3-assistant-design.md](https://github.com/huahuahua1223/ai-web3-learning/blob/main/experiments/restricted-web3-assistant-design.md)），把权限分成四层：**信息层（免审）→ 分析层（用户复核）→ 模拟层（强提示）→ 签名层（硬卡死）**。

5/21 读完 Handbook 后，我对照发现自己的设计**漏掉了一整层**：

| 我设计的四层 | Handbook 实际的五级 Tool Permission | 差异 |
|---|---|---|
| 信息层（免审） | 查询余额（自动） | 对齐 ✅ |
| 分析层（用户复核） | 生成交易草稿（自动） | Handbook 更准：草稿可自动，复核放在签名前 |
| —— **漏掉一整层** —— | **小额白名单（session key 自动）** | **完全漏了** |
| 模拟层（强提示） | Simulation **不是层，是必经 gate** | 我把它当层，Handbook 把它当门 |
| 签名层（硬卡死） | 大额转账或授权（人工）/ 任意合约调用（默认禁止） | Handbook 拆得更细 |

**关键认知**：**完全人工确认会让 Agent 失去自动化价值，完全放开又危险——session key + 额度白名单 + Smart Account policy 是工业级中间方案**。

举个具体例子：让 Agent 自动给 5 个白名单地址转账（每笔 ≤ 0.1 ETH，每天总额 ≤ 1 ETH），既不需要每笔签名打扰我，又不能让 Agent 把我钱包掏空——这就是 session key 解决的问题。

session key 不是一个具体协议，它是一类**能力**——具体落到 ERC-7715（permission requests）/ ERC-4337（account abstraction）/ EIP-7702（EOA 临时升级）哪个 EIP 上，我还没读细，是 Week 2 重点补的方向。

---

## 3. 一个 AI × Web3 交叉问题｜模型闸 vs 确定性闸

WCB 给的提示三选其一：「Agent 是否可以发起支付 / 哪些动作必须人工确认 / 如何验证 AI 执行结果」。我选了一个**统一三者的视角**——**什么样的闸是真的闸？**

我的答案来自 Handbook 那句让我反复琢磨的话：

> **自我反思仍由模型完成，模型可能给自己错误找理由 …… 自我检查可以提高质量，确定性检查才能承载风险。**

这句话翻译成可工程化的原则就一条：

> **任何一道闸，如果它能被模型说服关掉，它就不是真的闸。**

回到 WCB 的三个提示问题，每一个都能被这个原则统一回答：

### 「Agent 是否可以发起支付？」
**不能完全自主发起**。可以「准备交易草稿」（模型行为，不可信），但「签名 + 广播」必须经过**确定性闸**：
- session key 限额（policy 层，模型无法越权）
- 大额必须人工签（钱包原生 UI，模型无法代签）
- simulation 验证（链上 `eth_call` 模拟，确定性结果）

### 「哪些动作必须人工确认？」
**凡是动钱、动权限、动状态的，都必须有一道模型无法绕过的闸**：
- 大额转账 → 钱包原生签名
- 无限 approve → 钱包延时确认
- 合约升级权 → 多签

### 「如何验证 AI 执行结果？」
**不能问 AI 自己「你执行对了吗」**（模型自检不算确定性检查），必须用**确定性源**校验：
- 链上 tx hash → Etherscan 公开验证
- 事件日志解析 → 跟预期意图比对
- 不一致时由 policy 触发告警（**不能由模型自己决定要不要告警**）

---

我用这个原则回看自己 5/19 做的 [合约可读化助手](https://week1-contract-reader.vercel.app/)，发现这个 Demo 之所以「安全」，**不是因为我"小心"，而是因为它根本没有写权**：

- 它只调 Etherscan getsourcecode（确定性数据源）
- LLM 输出的解读永远标着 `⚠️ 未验证`（不假装是事实）
- 任何「合约可疑」结论都要用户自己点开源码验证

**它没有需要被「闸」住的能力，所以不需要闸**——这是 Agent 设计里另一个隐藏原则：**先收窄能力边界，再设计权限闸；能力本身就是最大的闸**。

---

## 4. 本周完成的 Proof-of-Work

**主仓库**：[huahuahua1223/ai-web3-learning](https://github.com/huahuahua1223/ai-web3-learning)（学习日志、任务证明、实验、Handbook 反馈）

### AI 向

- ✅ **Learning Agent 配置**（Claude Code + 仓库级 `CLAUDE.md` 上下文）→ [tasks/week1-learning-agent-setup.md](https://github.com/huahuahua1223/ai-web3-learning/blob/main/tasks/week1-learning-agent-setup.md)
- ✅ **合约可读化助手 Demo**（接入 Anthropic / OpenAI / 国内中转三种 LLM）→ [week1-contract-reader.vercel.app](https://week1-contract-reader.vercel.app/) · [GitHub repo](https://github.com/huahuahua1223/week1-contract-reader)
- ✅ **WCB Agent API 探索 + 两个自动化脚本**
  - [`scripts/wcb-checkin-prep.sh`](https://github.com/huahuahua1223/ai-web3-learning/blob/main/scripts/wcb-checkin-prep.sh)：自动拼一份打卡原料喂给 Claude 起稿
  - [`scripts/wcb-curriculum-sync.sh`](https://github.com/huahuahua1223/ai-web3-learning/blob/main/scripts/wcb-curriculum-sync.sh)：课程大纲自动同步
- ✅ **5/22 例会上麦分享**（5 分钟）「发现 WCB Agent API + Learning Agent 自动化打卡管线」

### Web3 向

- ✅ **Sepolia 测试网交易** — tx `0x2e13e37794e76385c7fc8078bc2afc7ec166ee57abb8fb2382e68549e0ec0a82`
- ✅ **Week1Note 合约部署 + setNote 写入** — 合约 `0x1d7d...d4C0`（Sepolia）
- ✅ **EOA vs Smart Account vs Multisig 对比** → [Yuque 笔记](https://www.yuque.com/u44160610/pwi8fh/oao7gi33rwd4wtgy)

### AI × Web3 交叉

- ✅ **Agent-Wallet-Contract 工作流图** → [experiments/agent-wallet-workflow.md](https://github.com/huahuahua1223/ai-web3-learning/blob/main/experiments/agent-wallet-workflow.md)
- ✅ **受限 Web3 助手设计** → [experiments/restricted-web3-assistant-design.md](https://github.com/huahuahua1223/ai-web3-learning/blob/main/experiments/restricted-web3-assistant-design.md)（5/23 准备按 Handbook 对照表修订）
- ✅ **AI × Web3 项目拆解** → [experiments/agent-project-analysis.md](https://github.com/huahuahua1223/ai-web3-learning/blob/main/experiments/agent-project-analysis.md)

### 学习日志

- 5 份本地详尽版 daily（[daily/](https://github.com/huahuahua1223/ai-web3-learning/tree/main/daily)）
- 5 份残酷共学反思版（[intensivecolearning/ai-web3-school · notes/huahuahua1223.md](https://github.com/intensivecolearning/ai-web3-school/blob/main/notes/huahuahua1223.md)）

### Handbook 通读

- [AI > Agent](https://aiweb3.school/zh/handbook/ai/agent/)（5/21 完成，本总结的认知 1 来源）
- [Bridge > Web3 Tool Use](https://aiweb3.school/zh/handbook/bridge/web3-tool-use/)（5/21 完成，本总结的认知 2 & 3 来源）

---

## 5. 下周想继续探索的方向

按优先级：

1. **实装 Hermes Agent**（5/23 周日，跟 @0xUSDHG 的 [Hermes 安装指南](https://github.com/USDHGwang/hermes-install-guide)）——终于从「读 install guide」走到「Agent 真占着我电脑的端口」这一步。装的时候警惕 Handbook 红线：「长期运行 + skills 沉淀 + 跨会话记忆」恰好是 Hermes 的默认形态，**不能把它放在能动钱的位置上**。
2. **session key 具体落在哪个 EIP**（ERC-7715 / ERC-4337 / EIP-7702）——Handbook 给了术语骨架，没展开具体协议。Week 2 准备读 [Bridge > Agent Wallet](https://aiweb3.school/zh/handbook/bridge/agent-wallet/) + [Web3 > Account Abstraction](https://aiweb3.school/zh/handbook/web3/account-abstraction/) 把这一条搞清楚。
3. **Multi-Agent 互检 vs Guardrails 的本质区别**——5/21 留下的开放问题。Handbook 明说「自我反思仍由模型完成」，那让"安全 Agent"做风险审查是不是仍有同质问题？guardrails 应该是确定性的，multi-agent 互检不是——这条边界 Week 2 验。
4. **`tasks.submitEvidence` proof 字段格式实战**——今晚提这份 Learning Summary 时实测，沉淀成 `scripts/wcb-task-submit.sh`。
5. **Hackathon 方向收敛**——当前倾向 **Dev Tooling 赛道**。从 5/19 WCB Agent API 探索的经验出发，做一个「学习平台 Agent 集成插件」可能是最近的射程。

---

## 致谢

- **AI × Web3 School Cohort 0 主办方**：[@LXDAO_Official](https://twitter.com/LXDAO_Official)、[@ETHPanda_Org](https://twitter.com/ETHPanda_Org)、[@aiweb3school](https://twitter.com/aiweb3school)、[@Zai_org](https://twitter.com/Zai_org)、[@web3careerbuild](https://twitter.com/web3careerbuild)
- 5/19 Hermes Agent 直播：draken 老师
- 同学 [@0xUSDHG](https://x.com/0xUSDHG) 整理的 [Hermes 安装指南](https://github.com/USDHGwang/hermes-install-guide)（5/20 反复读了三遍）

#AIxWeb3School
