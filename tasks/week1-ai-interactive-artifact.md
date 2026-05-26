# Week 1 | AI 向任务 | 完成 AI 可交互学习产物

> 任务来源：WCB Week 1（30 学分）
> 提交时间：2026-05-18
> 状态：已完成

本文档严格按照 WCB 提交指引的 5 项要求组织，并对应附 5 点 ↔ 章节映射表（见文末）。

---

## 1. 选择的工具 / 技术栈

**纯静态 Web demo**：HTML + 原生 ES Module JavaScript + Etherscan API + Anthropic（默认）/ OpenAI（备选）LLM API。

仓库结构：

```
week1-contract-reader/
├── index.html         # 单页 UI（响应式：桌面 2 栏 / 移动端单列）
├── styles.css         # 工程师工具风格（灰阶 + 单一绿色强调，无渐变、无 emoji 装饰）
├── script.js          # state / Etherscan / LLM / parser / render
├── prompts.js         # SYSTEM_PROMPT_ZH + buildUserPrompt
├── samples/           # 离线 fixture（Etherscan 速率限制时的回退）
├── screenshots/       # 提交截图
├── README.md / SECURITY.md / .gitignore
└── .claude/launch.json  # 本地 python3 -m http.server 启动配置
```

选择理由：

- **零构建**：python3 -m http.server 8765 就能跑，符合「网页应该简单」的偏好
- **可直接部署 GitHub Pages**：不需要 server，main 分支根目录就是 demo
- **Public repo 安全**：所有 Key 用户在前端粘贴，存 localStorage，**绝不进 repo**；.gitignore 显式排除 .env / *.key / private/
- **直接命中学习短板**：用户 Web3 已熟悉，落脚点在 Agent **Tool Use** 思维（拉 Etherscan 源码 → 喂 LLM → 解释），对应 Handbook 高优先级章节 `Bridge > Web3 Tool Use` 与 `AI > Prompt`

---

## 2. 协助完成的学习任务

本 Demo 解决的学习问题：

> **新手在链上遇到一个陌生合约（DeFi 协议、空投合约、NFT 合约……）时，往往面对几百行 Solidity 不知道在做什么，也不知道是否安全。本工具用 LLM 把源码翻译成 5 段结构化中文，把审计师常看的几个风险点（owner、可升级、收税、暂停、mint 上限、selfdestruct）显式列出，给普通用户一个快速判断框架。**

它帮助我学到的几件事：

1. **Agent Tool Use 范式**：LLM 不是单纯 chat，而是被「编排」去做特定任务——前端先调 Etherscan 工具拉源码，再把结构化数据喂给 LLM，最后把 LLM 输出解析回结构化 UI。这是 Agent 工作流的最小骨架。
2. **Prompt 工程的工程化**：把 system / user prompt 独立成文件（`prompts.js`），让它可 review、可版本控制、可与代码解耦。Prompt 里把「检查清单」显式写出来（owner / proxy / tax / pause / mint / selfdestruct），等于让 LLM 按工程师的清单逐项核对，输出稳定性大幅提升。
3. **浏览器直调 LLM 的工程边界**：CORS、`anthropic-dangerous-direct-browser-access` header、API Key 不能进 repo 的硬约束——这是「让 demo 跑起来」之外，第二层要真正消化的知识。
4. **代理合约阅读**：USDC 这种最常见的稳定币其实是个 Proxy，真正逻辑在 implementation 地址。Demo 让 LLM 显式识别这一点并提示用户，把抽象的「Account Abstraction / Proxy」概念变成可触摸的输出。

对应 Handbook 章节：

- [AI > Prompt](https://aiweb3.school/zh/handbook/ai/prompt/) — system / user prompt 的设计
- [Bridge > Web3 Tool Use](https://aiweb3.school/zh/handbook/bridge/web3-tool-use/) — Agent 如何调用 Etherscan 这类 RPC / API 工具
- [Web3 > Account Abstraction](https://aiweb3.school/zh/handbook/web3/account-abstraction/) — 代理合约与升级机制

---

## 3. 关键 Prompt 与配置

### 3.1 System Prompt（中文，定稿）

完整内容见 `week1-contract-reader/prompts.js`。要点：

- 角色：资深 Solidity 审计师 + Web3 教学助手
- 规则 1：只解释源码与 ABI 中**真实存在**的内容，不发明函数 / 变量 / 地址
- 规则 2：用「人话」描述，首次出现的术语括注英文原名（例：`所有者(owner)`）
- 规则 3：不确定项必须前缀 `⚠️ 未验证`
- 规则 4：严格按 5 个二级标题输出 Markdown，标题文字一字不差，每段 ≤150 字
- 规则 5：**风险点必须显式核对清单**：
  - `owner / Ownable / onlyOwner`
  - `upgradeable / proxy / delegatecall`
  - `transfer fee / tax / blacklist / maxTx`
  - `Pausable / paused / whenNotPaused`
  - `mint 函数及总量上限`
  - `selfdestruct`
- 规则 6：禁止投资建议，只给「与合约交互前应注意」的技术建议
- 规则 7：源码被截断时（用户提示出现 `[TRUNCATED]`），必须在总结声明「⚠️ 源码已被截断」
- 规则 8：保持中立克制，不夸张，不使用 emoji 装饰（`⚠️` 除外）

### 3.2 User Prompt 模板

```text
请解读下方智能合约。

【合约元信息】
- 地址：{address}
- 网络：{network}
- 合约名：{contractName}
- 编译器：{compilerVersion}
- 是否代理：{isProxy}
- 实现地址：{implementation}

【ABI 函数签名摘要】
{abiSummary}

【源码（Solidity，{chars} 字符{truncatedFlag}）】
```solidity
{sourceCode}
```

请严格按以下 5 个二级标题输出 Markdown：

## 合约一句话总结
## 主要函数（人话）
## 关键状态变量
## 风险点
## 普通用户互动建议
```

### 3.3 模型与参数

| 参数 | 值 | 说明 |
|---|---|---|
| 默认 Provider | Anthropic | 与学员已有的 Claude Code 工具链一致 |
| 默认模型 | `claude-opus-4-7` | 大型合约解读对推理质量要求高 |
| 温度 | 0.2 | 低温让风险点清单输出稳定 |
| max_tokens | 4096 | 足够 5 段中文输出 |
| 备选 Provider | OpenAI | 模型默认 `gpt-4o` |
| Anthropic 额外 header | `anthropic-dangerous-direct-browser-access: true` | 浏览器直调必需 |

### 3.4 localStorage 与隐私

- 命名空间：`cr.v1.settings`
- 仅在用户勾选「保存到本地」时落盘，否则只在内存
- 「清除全部 Key」按钮永久可见
- LLM 请求只发：源码 + ABI + 元信息，无任何用户标识
- 详见 `week1-contract-reader/SECURITY.md`

---

## 4. 一次成功输出记录

### 4.1 输入

- **合约地址**：`0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48`（USDC）
- **网络**：Ethereum Mainnet
- **Provider / 模型**：Anthropic / claude-opus-4-7
- 数据获取方式：因 Etherscan 公共速率限制，使用项目内置离线样本 `samples/usdc-mainnet.json`（包含 USDC FiatTokenV2_1 节选源码 + ABI）

### 4.2 期望输出结构

LLM 严格按 5 个二级标题输出，渲染成 5 张卡片：

| # | 卡片标题 | 期望覆盖要点 |
|---|---|---|
| 1 | 合约一句话总结 | USDC 是 Centre 发行的美元稳定币，FiatTokenProxy 代理 → FiatTokenV2_1 实现 |
| 2 | 主要函数（人话） | `transfer / approve / mint / burn / pause / blacklist / configureMinter / updatePauser` 等核心方法的人话解释 |
| 3 | 关键状态变量 | `_totalSupply / balances / allowed / minters / minterAllowed / blacklisted / pauser / blacklister / masterMinter` |
| 4 | 风险点 | ✅ 是 Proxy（可升级）/ ✅ 有 owner+pauser+blacklister+masterMinter 多重权限角色 / ✅ 有 mint 且无硬上限（受 minterAllowed 限制）/ ✅ 有 pause / ✅ 有 blacklist / ❌ 无 selfdestruct / ❌ transfer 不收税 |
| 5 | 普通用户互动建议 | 与 USDC 交互前应了解：1) 合约可升级 2) 你的余额可被 blacklist 冻结 3) 合约可被 pause 暂停 |

### 4.3 截图

实际用美团 LongCat（智增增中转，免费 ¥0）+ Etherscan API Key 跑通后的产物，存于
[`week1-contract-reader/screenshots/`](https://github.com/huahuahua1223/week1-contract-reader/tree/main/screenshots)。

#### ① 真实合约解读（Mainnet · ERC20 + EIP-712 permit + 空投铸造）

输入一个真实 Mainnet 合约地址，LLM 输出 5 段中文：合约一句话总结、主要函数（`transfer/approve/permit/setClaimContractOnce/mintByClaim/transferOwnership`）、关键状态变量、风险点、互动建议。注意输出中的「⚠️ 源码已被截断」声明——这是 system prompt 第 7 条规则触发的截断告警，证明 prompt 工程化的约束生效。

![真实 ERC20+permit 合约解读](https://raw.githubusercontent.com/huahuahua1223/week1-contract-reader/main/screenshots/01-result-mainnet-erc20-permit.png)

#### ② Uniswap V2 Router 解读

输入 `0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D`。验证大型合约的截断逻辑 + 函数密度处理：LLM 正确识别 `addLiquidity / removeLiquidity / swapExactTokensForTokens / quote / SupportingFeeOnTransferTokens` 等核心函数族；风险点段「未发现 owner / 未发现代理 / 未发现 mint / 未发现 selfdestruct」全部命中 system prompt 检查清单。

![Uniswap V2 Router 解读](https://raw.githubusercontent.com/huahuahua1223/week1-contract-reader/main/screenshots/02-result-uniswap-v2-router.png)

#### ③ 人工复核栏导出的 Markdown

在每张卡片上勾选「AI 推断 / 已比对源码 / 存疑」三选一后，点「导出复核 Markdown」生成的文件。这一段是 **WCB 提交指引第 4 点（区分 AI vs 人工）的直接证据**：每段 LLM 输出都被人工标注了核对状态。

![复核 Markdown 导出](https://raw.githubusercontent.com/huahuahua1223/week1-contract-reader/main/screenshots/03-review-export-markdown.png)

#### ④ 移动端单列折叠

iPhone 视口（~375px）下，单列布局自动启用，设置面板默认收起，输入区、进度区、结果区纵向堆叠。验证响应式断点（`@media (max-width: 1024px)` 与 `@media (max-width: 640px)`）生效。

![移动端单列折叠](https://raw.githubusercontent.com/huahuahua1223/week1-contract-reader/main/screenshots/04-mobile-view.png)

本地验证已确认（不依赖 LLM Key）：

- ✅ 桌面（1280×800）：grid `320px + 724px` 两栏，设置面板自动展开
- ✅ 移动（375×812）：单列 block，设置面板默认折叠
- ✅ 示例 chip 一键填入地址 + 网络（USDC / Uniswap V2 Router / Sepolia LINK）
- ✅ 「使用离线样本」绕过 Etherscan，从 `samples/usdc-mainnet.json` 加载
- ✅ 进度状态机：validate → fetch → llm → render，每步状态独立切换
- ✅ 未填 LLM Key 时显示人话错误「未填写 LLM API Key，请在左侧设置面板粘贴」
- ✅ 深色模式自动适配（`prefers-color-scheme`）

---

## 5. 人工复核 / 修正 / 拒绝记录

> 这一节直接对应 WCB 提交指引第 4 点「哪部分由 AI 生成，哪部分由你人工修改 / 验证」。

### 5.1 设计阶段的人工拒绝与修正

| 序号 | AI（Plan agent）原建议 | 人工决定 | 类型 | 原因 |
|------|----------------------|---------|------|------|
| 1 | 默认配色方案 | **拒绝** AI 风格蓝紫渐变 | 拒绝 | 显式要求工程师工具风格，参考 Etherscan / GitHub / Linear |
| 2 | 「主桌面 + 移动凑合」单视图 | **修正** 为桌面 + 平板 + 移动三档断点 | 修正 | 移动端必须是一等公民 |
| 3 | 初版未规划离线 fixture | **补充** `samples/usdc-mainnet.json` 与 `samples/simple-erc20-sepolia.json` | 补充 | Etherscan 速率限制时仍能跑通 LLM 演示 |
| 4 | 用第三方 marked.js 渲染 Markdown | **修正** 改为自写极简 Markdown 渲染器 | 修正 | 减少外部依赖，让纯静态网页真正「打开就能跑」 |
| 5 | 直接 `git push` | **拒绝**，要求人工确认后再 push | 拒绝 | 对齐学习仓库 `AGENTS.md` 工作规范 |
| 6 | 初版使用 Etherscan V1 endpoint（`api.etherscan.io/api`）+ Etherscan Key 标为「可选」 | **修正** 为 V2 unified endpoint（`api.etherscan.io/v2/api?chainid=...`）+ Key 必填 + 申请链接 | 修正 | 真实跑 USDC 时返回「You are using a deprecated V1 endpoint」。LLM 编码时按训练数据写了 V1 接口，但 Etherscan 2025 起强制迁移 V2。**这正是 LLM 训练数据陈旧 → 真机验证发现 → 人工修正**的典型案例 |
| 7 | LLM 调用失败时仅提示「网络错误：Failed to fetch」 | **修正** 为四条具体诊断：① Key 错误（OpenAI 在 401 时不返回 CORS header）② Provider/Key 不匹配 ③ 浏览器扩展拦截 ④ 地区被屏蔽 | 修正 | 实测发现 Anthropic 与 OpenAI 在 401 时行为不同（Anthropic 返回 CORS header → 走 4xx 分支，OpenAI 不返回 → 走 catch 分支显示成 CORS 错），泛化错误信息会让用户在「网络问题」与「Key 错误」之间瞎猜 |
| 8 | 初版只支持 Anthropic + OpenAI，假定用户能科学上网 | **补充** 第三个 provider：`OpenAI 兼容（中转/国内）`，默认 endpoint 智增增 `https://api.zhizengzeng.com/v1/chat/completions`，模型下拉预设 MiniMax M2.7/M2.5/M2.1 + DeepSeek + Kimi | 补充 | 学员位于中国大陆，直连 Anthropic/OpenAI 会被 403 拒绝。智增增聚合了 MiniMax 等国内模型且兼容 OpenAI 协议，CORS preflight 通过（OPTIONS → 204），浏览器可直接 POST，无需后端转发。Endpoint URL 字段做成可编辑，未来能切到 DeepSeek 官方 / Kimi / 智谱等任意 OpenAI 兼容服务 |

### 5.2 运行阶段的人工复核（用 Demo 自带的「人工复核栏」）

用户用 Demo 内置的「AI 推断 / 已比对源码 / 存疑」三档单选，对 LLM 输出的每一段做人工核对。导出后的样本格式：

```markdown
## 主要函数（人话）

**复核状态：已比对源码 ✓**

LLM 输出的 `mint(address _to, uint256 _amount)` 描述：
> 由获得 minter 权限的地址（受 minterAllowed 上限约束）铸造 USDC...

人工核对：在 `samples/usdc-mainnet.json` 源码 line ~115 找到 `mint` 函数，
确认包含 `onlyMinters` modifier、`minterAllowed[msg.sender]` 上限检查、
`whenNotPaused` + `notBlacklisted` 三重 guard。LLM 描述准确。
```

每段复核后导出的 `*-review.md` 直接是 WCB 第 4 点要求的「AI/人工分工」证据。

### 5.3 「使用 Demo 解读 Demo 自己」反身验证

提交前用 Demo 解读自己依赖的合约（如 Sepolia LINK），生成的 5 段中文与 [LinkToken 已知文档](https://docs.chain.link/) 对照：

- ✅ 一句话总结、主要函数、状态变量准确
- ⚠️ 风险点关于「无总量上限」需要进一步核对源码（LINK 实际 1B 上限在 mint 调用方）
- → 由人工在「复核栏」标记为「存疑」并写入复核 Markdown

---

## 6. 仓库 / Demo / 截图

- **GitHub Repo**：<https://github.com/huahuahua1223/week1-contract-reader>
- **在线 Demo**：<https://week1-contract-reader.vercel.app/>（Vercel 部署，全球 CDN）
- **本地启动**：`cd workspace/week1-contract-reader && python3 -m http.server 8765`，然后 `open http://localhost:8765`
- **截图目录**：[`week1-contract-reader/screenshots/`](https://github.com/huahuahua1223/week1-contract-reader/tree/main/screenshots)

---

## 敏感信息检查

- ✅ 仓库无 `.env / *.key / private/`，`.gitignore` 已显式排除
- ✅ 源码中无 hardcoded API Key（grep `sk-ant-` / `sk-proj-` 均无）
- ✅ 提交前需用户人工 `git status` 二次确认
- ✅ 截图前已确认设置面板 Key 输入框为空或关闭后再截

---

## WCB 5 点 ↔ 本文章节映射

| WCB 提交指引 | 对应章节 |
|---|---|
| ① 它解决什么学习问题 | § 2 |
| ② 用户如何与它交互 | § 1（技术栈）+ § 6（本地启动）+ § 4.2（5 卡片结构）|
| ③ 输入示例和输出示例 | § 4.1（USDC 输入）+ § 4.2（期望输出表）|
| ④ 哪部分 AI 生成 / 哪部分人工修改验证 | § 5（设计阶段 + 运行阶段 + 反身验证）|
| ⑤ 限制与下一步改进 | `week1-contract-reader/README.md` 文末「已知限制 / 下一步改进」 |
