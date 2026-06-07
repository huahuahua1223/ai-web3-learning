# Cat-Agent

> AI x Web3 School Week 3 Hackathon workspace for the `Cat-Agent` project.  
> Snapshot date: 2026-06-07

## Project Summary

`Cat-Agent` is a multimodal pet-commerce copilot for cat owners. It observes behavior signals such as location, posture, sound, and time context, confirms intent through gentle interaction, and lets the owner approve a budget-guarded purchase flow.

PRD naming uses `Cat-Agent`; the current slide deck uses the softer visual name `Pet-Agent`. For Week 4, the repo keeps `Cat-Agent` as the official project name and treats `Pet-Agent` as a presentation-layer alias.

## Project One-liner

> Cat-Agent helps cat owners understand real pet needs through multimodal AI, confirm intent with low-stress interaction, and approve budget-guarded purchase decisions instead of blind automation.

Shorter pitch version:

> A multimodal AI copilot that helps a cat express needs and helps the owner make safe purchase decisions.

## Problem

- Existing smart pet devices execute preset commands, but they do not confirm whether the pet really wants food, toys, or interaction right now.
- Busy owners are often away for 8-10 hours and must guess from incomplete signals.
- Fully automatic commerce is hard to trust without clear risk controls, audit trails, and manual override.

## Track Selection

- Primary track: `Z.AI｜Web3 × Long-Horizon Task`
- Secondary track: `Cobo｜Agentic Economy × Cobo Agentic Wallet`

Why this split:

- The core Week 4 challenge is a multi-step agent workflow: detect signals, reason over context, decide whether to confirm, run a rule engine, produce an explainable recommendation, and generate a simulated order event.
- The Web3 layer is meaningful, but it is not the first slice to prove. The most realistic on-chain use in Week 4 is a testnet spending-policy or audit-log layer, not full autonomous payment.

## Team / Solo Status

- Mode: `Solo`
- Builder: `huahua`
- Current self-owned roles:
  - product and scope control
  - research and sponsor alignment
  - system design and workflow definition
  - demo scripting and repo documentation
- External help that would be useful but is not required for Week 4:
  - hardware assembly review
  - animal-behavior / ethics review
  - mentor feedback on sponsor integration feasibility

## Week 4 Demo Goal

By `2026-06-14`, the minimum credible demo is:

1. Ingest one recorded or live cat-behavior event.
2. Run a trigger stage plus a cloud reasoning stage.
3. Show a two-step confirmation simulation.
4. Run a budget / cooldown / category risk engine.
5. Display an owner approval view.
6. Generate a simulated order record.
7. Optionally emit a testnet audit event or a Cobo-policy-shaped request object.

## Repo Skeleton

```text
hackathon/cat-agent/
├── README.md
├── app/          # owner dashboard / control panel
├── cloud/        # orchestration, rule engine, APIs
├── contracts/    # optional testnet guardrails / audit log
├── data/         # sample clips, annotations, mock events
├── demo/         # scripts, runbook, recording plan
├── docs/         # week 3 proof materials and research pack
└── edge/         # camera / audio trigger pipeline
```

## Quick Links

- [Week 3 Ready Pack](./docs/week3-ready-pack.md)
- [Sponsor Workshop Notes and Alignment](./docs/sponsor-workshop-notes.md)
- [Sponsor and Mentor Questions](./docs/sponsor-mentor-questions.md)
- [Deep Research Pack](./docs/deep-research-pack.md)
- [WCB Week 3 Task Map](./docs/wcb-week3-task-map.md)
- [WCB Proof Drafts](./docs/wcb-proof-drafts.md)

## Implementation Strategy

- `Mock-first`: recorded clips and mocked product/order data are acceptable for the first demo.
- `Risk-first`: owner approval stays in the loop; no real autonomous purchase in Week 4.
- `Explainability-first`: every recommendation must show input evidence, confidence, and rule-engine outcome.
- `Web3-as-guardrail`: if on-chain appears in Week 4, it should serve auditability or bounded execution, not hype.
