# Sponsor Workshop Notes and Alignment

This note is written for the Week 3 sponsor-workshop tasks. It does not pretend that every sponsor capability will be integrated in Week 4. Its goal is to decide which sponsor resources are realistically useful for `Cat-Agent`.

## 1. Relevant Workshop Selection

### 1.1 Why `Z.AI` Is Relevant

`Cat-Agent` needs a model layer that can:

- interpret noisy multimodal context
- keep a multi-step state machine stable
- revise confidence after confirmation feedback
- produce a human-readable decision summary

That maps directly to a long-horizon task workflow.

### 1.2 Why `Cobo` Is Relevant

If `Cat-Agent` ever influences spending, the dangerous step is not perception. It is bounded execution. The project needs a future-facing answer to:

- how spending requests are scoped
- how long approval lives
- what fields must be auditable
- how to separate recommendation from execution

That is exactly where a wallet-policy sponsor matters.

### 1.3 Why These Two Sponsors Beat a Generic "Open Track" Framing

Without sponsor alignment, the project could look like:

- just a pet-device UX concept
- or a broad AIoT narrative with weak Web3 relevance

With sponsor alignment:

- `Z.AI` grounds the core agent workflow
- `Cobo` grounds the bounded commerce and audit layer

## 2. Relevant Workshop Notes

### 2.1 Notes for `Z.AI`

- The core win is not just model quality. It is multi-step task stability.
- A good hackathon scope is one that can show plan -> tool call -> explanation -> correction, not only one final answer.
- `Cat-Agent` should therefore expose intermediate states:
  - initial trigger
  - reasoning hypothesis
  - confirmation result
  - rule-engine output
  - owner-facing explanation

### 2.2 Notes for `Cobo`

- The right question is not "Can the agent pay?" but "Under what exact boundary can it ever pay?"
- A future wallet layer should be task-scoped rather than session-wide.
- The policy object must be inspectable by the owner and ideally easy to revoke.
- For Week 4, a mock policy object or a testnet audit event is a valid stepping stone if full wallet integration is too heavy.

### 2.3 Notes for the Broader Week 3 Track Practice

- The best Week 4 demos are narrow and verifiable.
- Demo value comes from one convincing loop, not a giant product surface.
- Anything that smells like "full marketplace integration" should be deprioritized unless it is already almost done.

## 3. Cobo Track Alignment

### 3.1 Why `Cat-Agent` Fits

`Cat-Agent` is not a trading bot, but it still creates commerce-intent objects. That means it has a clear bounded-execution problem:

- one pet request should not become unlimited spending
- one product category should not silently generalize to all categories
- one approval should not persist forever

### 3.2 Where `Cobo` Can Enter the Architecture

- after the owner approves a recommendation
- before any external purchase or settlement action
- as a policy or wallet guard layer for:
  - target merchant or settlement endpoint
  - budget cap
  - category
  - expiry
  - audit fields

### 3.3 Week 4 Realistic Scope

Minimum:

- define a `purchase_intent` object
- define a `policy_check` object
- show approve / reject paths in the demo

Stretch:

- connect the approved intent to a testnet wallet-policy or a policy-shaped adapter

### 3.4 Cobo-Specific Risk

If the wallet layer is added too early, it will consume hackathon time without improving the main AI demo. Therefore, Cobo stays as a bounded layer after the core workflow is already visible.

## 4. Z.AI Track Alignment

### 4.1 Why `Cat-Agent` Fits

The project is a long-horizon task with branching:

1. detect candidate need
2. decide whether to trigger confirmation
3. revise confidence from new evidence
4. run a rule engine
5. decide whether to ask the owner
6. explain the outcome

That is a better fit for a task-planning and tool-use track than a single-shot classifier demo.

### 4.2 Where `Z.AI` Can Enter the Architecture

- orchestrating the state machine
- generating structured explanations
- summarizing evidence for the owner view
- deciding what next step should happen after each confirmation round

### 4.3 Week 4 Realistic Scope

Minimum:

- use one model provider interface for:
  - event interpretation
  - confidence explanation
  - action recommendation

Stretch:

- allow the agent to revise the plan after unexpected confirmation feedback

### 4.4 Z.AI-Specific Risk

If the model is used only as a fancy text generator, the sponsor fit becomes weak. The Week 4 demo must show that the model is part of the workflow controller, not just the narration layer.

## 5. Sponsor SDK / API Integration Plan

| Sponsor | Capability | Planned Use in Week 4 | Fallback |
|---|---|---|---|
| Z.AI | long-horizon reasoning / tool orchestration | event interpretation, state update, owner-facing explanation | provider-agnostic model adapter if direct access is delayed |
| Cobo | bounded wallet / policy concepts | policy-shaped spending object, optional testnet guard or audit flow | local policy schema + testnet event logger |

### 5.1 Integration Order

1. Build provider-agnostic interfaces first.
2. Prove the core demo path with mock or default adapters.
3. Swap in sponsor-specific adapters only where they change the story materially.

### 5.2 API / SDK Decisions

- The project should not hardwire itself to one sponsor too early.
- Each sponsor should enter through an adapter boundary:
  - `reasoning_adapter`
  - `policy_adapter`

This keeps the Week 4 implementation simple and prevents sponsor integration from exploding the architecture.

## 6. Submission Reuse

This file can support the following Week 3 tasks:

- `Relevant Workshop Notes`
- `Cobo Track Alignment`
- `Z.AI Track Alignment`
- `Sponsor SDK / API Integration Plan`
