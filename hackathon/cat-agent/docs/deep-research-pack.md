# Deep Research Pack

This pack narrows the research surface to the pieces that matter for the Week 4 `Cat-Agent` demo.

## 1. Research Focus

The project has four research pillars:

1. multimodal pet-intent inference
2. long-horizon workflow orchestration
3. bounded commerce / policy enforcement
4. ethics and trust framing

## 2. Research Item A: Edge-Cloud Multimodal Pipeline

### What It Solves

It separates fast local filtering from slower, richer cloud reasoning.

### Why It Matters for `Cat-Agent`

- avoids sending every raw frame to the cloud
- keeps the first trigger responsive
- fits the Week 4 need for a believable architecture without building full hardware production software

### What We Borrow

- edge trigger for location + sound threshold
- cloud stage for confidence and explanation
- deterministic scenario fixtures for testing

### Boundary

This is not a claim that the model truly "understands cats." It is a design for a bounded decision-support loop.

## 3. Research Item B: Long-Horizon Agent Workflow

### What It Solves

It gives the project a way to control multi-step state transitions:

- observe
- hypothesize
- confirm
- revise
- decide
- explain

### Why It Matters for `Cat-Agent`

Without this layer, the project becomes either:

- a classifier demo with weak product meaning
- or a hand-scripted decision tree with weak AI meaning

### What We Borrow

- stateful step orchestration
- structured outputs
- explicit cancellation / retry paths

### Boundary

If the model is only writing pretty summaries, it is not doing the job. The workflow controller must actually influence the next action.

## 4. Research Item C: Bounded Wallet / Policy Layer

### What It Solves

It creates a credible bridge between recommendation and execution without granting open-ended authority.

### Why It Matters for `Cat-Agent`

The project touches commerce. Even in a simulated flow, it must show:

- what one approval allows
- what it does not allow
- how the owner remains in control

### What We Borrow

- policy-shaped purchase objects
- expiry and amount caps
- audit fields
- testnet logging as a minimal proof layer

### Boundary

This should remain an optional or secondary layer in Week 4. If it dominates the sprint, the core demo will suffer.

## 5. Research Item D: Pet Ethics and Decision Framing

### What It Solves

It prevents the product from making claims it cannot support.

### Why It Matters for `Cat-Agent`

The biggest narrative risk is overselling:

- "AI understands cat language"
- "the pet consented to buy"
- "autonomous shopping for pets"

### What We Borrow

- decision-support framing
- visible uncertainty
- human approval boundary
- no pressure / no over-stimulation positioning

### Boundary

If the demo story depends on pretending the system knows the cat's internal state perfectly, it is too weak to defend.

## 6. Synthesis

The project becomes strongest when all four research pillars stay in balance:

- multimodal inference makes it feel real
- long-horizon orchestration makes it feel agentic
- bounded policy makes it feel AI x Web3 instead of generic AIoT
- ethics framing makes it defensible

## 7. Research Conclusions for Week 4

### Keep

- two-stage trigger -> reasoning architecture
- confirmation-based confidence update
- owner-visible rules and approval
- optional policy / audit layer

### Cut

- real commerce integrations
- multi-pet ambition
- production hardware polish
- claims about true autonomous pet intent

## 8. Reference Directions

These are the reference directions the project should continue to watch, even if not all are fully implemented in Week 4:

- sponsor wallet-policy patterns
- long-horizon task orchestration patterns
- lightweight edge multimodal detection stacks
- pet welfare and low-stress interaction guidance
