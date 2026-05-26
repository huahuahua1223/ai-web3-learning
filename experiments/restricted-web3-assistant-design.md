# 受限 Web3 助手设计（合约可读化助手 → 交易增强版）

> Week 1 综合进阶任务：Design a Restricted Web3 Assistant or Workflow（taskId `cmp9wlsuo0s4lmw01u8h0og3t`）。
> 基于 [week1-contract-reader](https://github.com/huahuahua1223/week1-contract-reader) 这个已上线的「只读」AI 助手，
> 设计在加入「交易能力」时如何**通过权限边界与人工确认点防止 Agent 越权**。
> 同时是 [experiments/agent-wallet-workflow.md](agent-wallet-workflow.md) 流程图的工程细化。

## 1. 解决什么问题

新手用户跟陌生合约交互时，面对两类卡点：

① 不知道这函数干啥（合约可读化助手已解决）
② 知道要调啥但不会准备 calldata + 不会估 gas + 不敢按签名（本设计要解决）

本助手目标：**在不放权的前提下**扩展「帮你准备好、你点确认」这一能力。

绝对约束：**助手永远不持有私钥，永远不自动广播**。

## 2. 输入示例与输出示例

### 输入示例

- 自然语言意图："给 0xAlice... 转 0.1 Sepolia ETH"
- 或结构化：合约地址 + 方法名 + 参数

### AI 输出示例（不发起任何链上动作）

```
意图解析：转账
- 目标地址：0xAlice...（来自你的"我的常用地址"白名单 ✓）
- 金额：0.1 ETH（Sepolia）
- 类型：原生 ETH 转账（非合约调用）

calldata 预览：0x（empty，原生转账）
gas 估算：21,000 × 1.2 gwei ≈ 0.0000252 ETH
nonce：47

风险检查：
✓ 目标在白名单
✓ 金额低于单笔阈值 0.5 ETH
✓ 当前 nonce 与链上一致

下一步：在 MetaMask 弹窗里**用你的眼睛核对**目标地址与金额，确认后签名。
```

### 钱包层（人工）

MetaMask 弹窗显示同样的 calldata / 目标 / 金额 → 用户点 Confirm 才广播。

## 3. AI / 人工分工

| 步骤 | AI / Agent | 人工 |
|---|---|---|
| 解析意图 → calldata | ✅ | — |
| 拉源码 + 风险分析 | ✅ | — |
| 估 gas + 模拟（eth_call） | ✅ | — |
| **签名** | ❌ 绝对不能 | ✅ MetaMask 二次确认 |
| **广播** | ❌ | ✅ |
| receipt 解析 + expected vs actual 校验 | ✅（自动）| ✅ 看到不一致告警时人工裁决 |

## 4. 人工确认点（不能跳过）

1. **钱包 UI 显示 calldata 与目标地址**——用户用自己的眼睛核对（不是看 AI 的总结，看钱包原生显示）
2. **大额阈值倒计时**——> 0.5 ETH 触发 5 秒倒计时再开 Confirm 按钮，防肌肉记忆
3. **无限 approve 强制弹提示**——`approve(spender, MAX_UINT256)` 必须人工选择「无限授权」或填具体额度

## 5. 风险与限制（≥3 条）

1. **Agent 篡改 calldata** — 恶意/错误地把转账目标改了。
   **缓解**：calldata 在浏览器本地计算 + 与钱包显示交叉校验；关键参数白名单（目标地址限定在用户预设列表）；signing 永远在钱包原生 UI，Agent 不能代签。

2. **代理合约误读** — USDC 这类 proxy 的实际逻辑在 implementation 地址。
   **缓解**：AI 必须显式标注「这是 proxy → 真实逻辑在 0x...」，并把 implementation 也跑一遍解读。

3. **LLM 训练数据陈旧** — 合约接口/calldata 编码方式可能已更新（Etherscan V1 → V2 就是真实案例）。
   **缓解**：永远通过 Etherscan getsourcecode 拉**最新**源码，不依赖 LLM 内存里的 ABI。

4. **Key 泄漏** — Key 进 `.env`、prompt、log 都可能泄。
   **缓解**：keychain / 钱包原生签名；Agent 不接触私钥；AGENTS.md 已编入「不写 Key 到任何文件」规则。

5. **疲劳点确认** — 多次签名后用户变成肌肉反射，6 类风险检查被跳过。
   **缓解**：钱包 UI 高亮关键参数；大额延时；定期统计「今日已签 N 次，平均确认时间 X 秒」让用户自审。

## 6. 结果如何被验证

- **链上 tx hash → Etherscan 公开验证**（任何人可复算）
- **AI 自动解析事件日志**，把实际状态变化 vs 预期意图自动比对（如：转账金额对不对、目标地址对不对）
- **不一致时主动报警**——AI 不能默默吞掉异常

## 7. 与现有 Demo 的对应关系

| 步骤 | 现状 | 实现位置 |
|---|---|---|
| 1-3 拉源码 + LLM 解读 + 风险检查 | ✅ 已上线 | [week1-contract-reader](https://github.com/huahuahua1223/week1-contract-reader) |
| 4 估 gas + 模拟 | ⬜ 设计中 | 计划用 ethers.js + JSON-RPC |
| 5 钱包签名 | ⬜ 设计中 | 计划接 wagmi/viem + MetaMask |
| 6 receipt 解析 | ⬜ 设计中 | tx receipt + event parser |
| 7-8 验证 | ✅ 钱包 + Etherscan 已在 [Week 1 Web3 任务](https://sepolia.etherscan.io/tx/0x2e13e37794e76385c7fc8078bc2afc7ec166ee57abb8fb2382e68549e0ec0a82) 独立完成 | Sepolia tx |

## 8. 实现路线（不在本周范围）

- **Phase 1**：contract-reader 加 `prepareCalldata()` 模块（纯前端 ethers.js 编码，不广播）
- **Phase 2**：接 wagmi/viem 让用户连 MetaMask、签 + 广播
- **Phase 3**：receipt 解析 + expected vs actual 校验告警
- **Phase 4**：白名单地址簿 + 大额延时确认

对应 Handbook 章节：[Bridge > Agent Wallet](https://aiweb3.school/zh/handbook/bridge/agent-wallet/)（Agent 权限、额度限制和撤销机制）。
