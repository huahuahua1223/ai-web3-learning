# Sponsor and Mentor Questions

This note is the Week 3 question pool for the `Cat-Agent` direction. It is separate from any earlier Week 3 sponsor question submission that was written for a different project direction.

## 1. Questions for `Cobo`

### Q1. Minimal Task-Scoped Spending Boundary

- Question:
  - For a pet-commerce copilot that only wants to create tightly bounded, owner-approved purchase intents, what is the minimum safe policy granularity you would recommend?
- Background / blocker:
  - The project does not want open-ended wallet authority. It only needs enough structure to represent a single approved purchase intent with strong boundaries.
- What I hope to learn:
  - which fields must be explicit
  - which defaults are dangerous
  - how expiry and revocation should work

### Q2. Auditability vs UX

- Question:
  - In a lightweight consumer flow, what should live in the wallet-policy layer and what should remain in the app-level rule engine?
- Background / blocker:
  - The app already has budget, cooldown, and category checks. The open question is which of those boundaries meaningfully belong in a wallet-controlled layer.

## 2. Questions for `Z.AI`

### Q3. Long-Horizon State Stability

- Question:
  - For a workflow that revises confidence after each confirmation step, what is the best way to keep model reasoning stable across state transitions?
- Background / blocker:
  - The project needs the model to behave like a controller, not a narrator that changes its mind randomly.

### Q4. Structured Output for Multi-Step Decisions

- Question:
  - What output schema would you recommend for a long-horizon consumer workflow that must explain evidence, confidence, next action, and cancellation reasons at each step?
- Background / blocker:
  - A plain paragraph is not enough; the owner-facing UI needs structured fields.

## 3. Questions for Mentors

### Q5. Is the Web3 Layer Strong Enough?

- Question:
  - For an AI x Web3 hackathon, is "bounded spending policy + testnet audit log" a strong enough Web3 layer for Week 4, or should the demo include deeper on-chain execution?

### Q6. Demo Scope Cut

- Question:
  - If only one slice can be made convincing in one week, would you rather see:
    - a stronger multimodal + UX loop with mocked fulfillment
    - or a weaker UX loop with more explicit wallet / on-chain execution?

### Q7. Ethics Framing

- Question:
  - What is the cleanest way to frame this project so reviewers understand it as "owner decision support" instead of "pet autonomous shopping"?

## 4. Immediate Use

These questions are meant for:

- sponsor workshop Q&A
- mentor office hours
- README FAQ
- demo narration if reviewers challenge scope or trust boundaries
