# WCB Proof Drafts

Use this file as a copy-and-edit base for WCB submissions.  
These links will work after the new files are committed and pushed.

Base repo link:

`https://github.com/huahuahua1223/ai-web3-learning/tree/main/hackathon/cat-agent`

## 1. Hackathon Direction Card

I prepared a dedicated Week 3 direction card for `Cat-Agent`, a multimodal pet-needs copilot for cat owners. The project direction, target user, primary / secondary track choice, MVP path, and AI x Web3 rationale are collected in:

- `https://github.com/huahuahua1223/ai-web3-learning/blob/main/hackathon/cat-agent/docs/week3-ready-pack.md`

Relevant sections:

- Hackathon Direction Card
- Track Selection Rationale

## 2. Project One-liner

Project one-liner:

> Cat-Agent helps cat owners understand real pet needs through multimodal AI, confirm intent with low-stress interaction, and approve budget-guarded purchase decisions instead of blind automation.

Repo proof:

- `https://github.com/huahuahua1223/ai-web3-learning/blob/main/hackathon/cat-agent/README.md`

## 3. Team / Solo Status

Current participation mode is `Solo`. I wrote down the current role split I am covering myself, the outside help that would be useful, and the Week 4 execution strategy in:

- `https://github.com/huahuahua1223/ai-web3-learning/blob/main/hackathon/cat-agent/README.md`

Relevant section:

- Team / Solo Status

## 4. Repo Skeleton

I created a dedicated `hackathon/cat-agent/` workspace in my repo with separate folders for:

- edge trigger
- cloud orchestration
- owner app
- optional contracts
- demo assets
- data fixtures
- documentation

Repo proof:

- `https://github.com/huahuahua1223/ai-web3-learning/tree/main/hackathon/cat-agent`
- `https://github.com/huahuahua1223/ai-web3-learning/blob/main/hackathon/cat-agent/README.md`

## 5. Week 4 Sprint Plan

I compressed the project into a one-week sprint plan with exact dates from `2026-06-08` to `2026-06-14`, including scope freeze, edge trigger stub, cloud reasoning, owner dashboard, optional Web3 guardrail layer, demo recording, and final submission polish.

Proof:

- `https://github.com/huahuahua1223/ai-web3-learning/blob/main/hackathon/cat-agent/docs/week3-ready-pack.md`

Relevant section:

- Week 4 Sprint Plan

## 6. Week 1-2 Gap Diagnosis

I reviewed what is already strong in the project (PRD, slide deck, target user, trust boundary) and what is still missing before Week 4 (repo slice, sponsor integration points, technical validation, smaller demo scope). I also documented how the scope is being compressed for the sprint.

Proof:

- `https://github.com/huahuahua1223/ai-web3-learning/blob/main/hackathon/cat-agent/docs/week3-ready-pack.md`

Relevant section:

- Week 1-2 Gap Diagnosis

## 7. Proposal Memo

I rewrote the project into a concise proposal memo covering:

- target user
- real scenario
- minimum feature set
- validation method
- main risks
- why the AI x Web3 combination is necessary

Proof:

- `https://github.com/huahuahua1223/ai-web3-learning/blob/main/hackathon/cat-agent/docs/week3-ready-pack.md`

Relevant section:

- Proposal Memo

## 8. Scope Review

I documented what must ship by `2026-06-14`, what is only nice to have, and what is explicitly out of scope for Week 4. The main scope cut is to use a responsive web dashboard plus recorded or mocked inputs instead of trying to ship full native app + real commerce + full hardware in one sprint.

Proof:

- `https://github.com/huahuahua1223/ai-web3-learning/blob/main/hackathon/cat-agent/docs/week3-ready-pack.md`

Relevant section:

- Scope Review

## 9. Sponsor / Mentor Questions

I prepared a Week 3 question pool tailored to the `Cat-Agent` direction, including:

- Cobo questions on bounded spending policy
- Z.AI questions on long-horizon workflow stability
- mentor questions on Web3 layer strength, scope cut, and ethics framing

Proof:

- `https://github.com/huahuahua1223/ai-web3-learning/blob/main/hackathon/cat-agent/docs/sponsor-mentor-questions.md`

## 10. Risk / Assumption Memo

I listed the main assumptions behind the project, what could fail if those assumptions are wrong, and how I plan to mitigate that in the Week 4 sprint. The memo focuses on weak signal quality, ethics framing, and over-scoping risk.

Proof:

- `https://github.com/huahuahua1223/ai-web3-learning/blob/main/hackathon/cat-agent/docs/week3-ready-pack.md`

Relevant section:

- Risk / Assumption Memo

## 11. Relevant Workshop Notes

I prepared Week 3 sponsor-workshop-relevant notes for `Cat-Agent`, focusing on why `Z.AI` is the right primary workflow sponsor and why `Cobo` is the right secondary bounded-execution sponsor.

Proof:

- `https://github.com/huahuahua1223/ai-web3-learning/blob/main/hackathon/cat-agent/docs/sponsor-workshop-notes.md`

Relevant sections:

- Relevant Workshop Selection
- Relevant Workshop Notes

## 12. Cobo Track Alignment

I wrote a specific Cobo alignment note explaining how `Cat-Agent` can use bounded policy objects or an optional testnet guard layer for purchase intents, while still keeping the wallet layer secondary to the core AI demo.

Proof:

- `https://github.com/huahuahua1223/ai-web3-learning/blob/main/hackathon/cat-agent/docs/sponsor-workshop-notes.md`

Relevant section:

- Cobo Track Alignment

## 13. Z.AI Track Alignment

I wrote a specific Z.AI alignment note explaining why `Cat-Agent` is fundamentally a long-horizon, multi-step agent workflow rather than just a classifier or device concept. The note covers where the model should control the workflow and what a realistic Week 4 scope looks like.

Proof:

- `https://github.com/huahuahua1223/ai-web3-learning/blob/main/hackathon/cat-agent/docs/sponsor-workshop-notes.md`

Relevant section:

- Z.AI Track Alignment

## 14. Sponsor SDK / API Integration Plan

I defined a concrete sponsor integration plan for Week 4:

- `Z.AI` as the reasoning / orchestration adapter
- `Cobo` as the bounded policy or audit adapter

I also documented the fallback plan if direct sponsor access is delayed.

Proof:

- `https://github.com/huahuahua1223/ai-web3-learning/blob/main/hackathon/cat-agent/docs/sponsor-workshop-notes.md`

Relevant section:

- Sponsor SDK / API Integration Plan

## 15. Deep Research Pack

I prepared a focused research pack around four pillars:

- edge-cloud multimodal pipeline
- long-horizon workflow control
- bounded wallet / policy layer
- pet ethics and trust framing

Proof:

- `https://github.com/huahuahua1223/ai-web3-learning/blob/main/hackathon/cat-agent/docs/deep-research-pack.md`

## 16. Project Flow Diagram

I added a flow diagram that shows the main demo path:

`pet behavior -> edge trigger -> cloud reasoning -> confirmation -> risk engine -> owner review -> simulated order -> optional testnet audit`

Proof:

- `https://github.com/huahuahua1223/ai-web3-learning/blob/main/hackathon/cat-agent/docs/week3-ready-pack.md`

Relevant section:

- Project Flow Diagram

## 17. Technical Validation Plan

I documented the main hypotheses, three scenario test cases, acceptance criteria, and the exact evidence to collect during Week 4, including screen recordings, screenshots, expected outputs, and optional testnet traces.

Proof:

- `https://github.com/huahuahua1223/ai-web3-learning/blob/main/hackathon/cat-agent/docs/week3-ready-pack.md`

Relevant section:

- Technical Validation Plan

## 18. Complete Week 4 Ready Pack

I consolidated the current Week 4 readiness state, including what is already fixed, what still blocks implementation, and what final deliverables need to exist before the final showcase.

Proof:

- `https://github.com/huahuahua1223/ai-web3-learning/blob/main/hackathon/cat-agent/docs/week3-ready-pack.md`

Relevant section:

- Week 4 Ready Pack

## 19. Weekly Review Sharing｜6.05 Live Reflection or Hackathon Idea

I prepared a short hackathon-idea reflection explaining the key design decision behind `Cat-Agent`: not adding more automation, but making the automation boundary explicit. The note also explains how AI and Web3 each contribute to the project.

Proof:

- `https://github.com/huahuahua1223/ai-web3-learning/blob/main/hackathon/cat-agent/docs/week3-ready-pack.md`

Relevant section:

- Weekly Review Sharing Summary
