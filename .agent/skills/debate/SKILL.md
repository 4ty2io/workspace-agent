---
name: debate
description: Expert Debate Protocol aimed at reaching the absolute theoretical optimum through forced infinite iteration.
---

# **Debate: Deep Iteration Mode**

A relentless, multi-persona debate protocol that forces solutions toward the theoretical optimum.

**Core Principles:**
- **Philosophy:** "Good enough" is failure. We strive for the theoretical limit.
- **Key Rule:** Early consensus or abandonment is **STRICTLY FORBIDDEN**.
- **Root Cause Mandate:** Every solution must address the root cause, not symptoms. Use "5 Whys" analysis. Symptom patches are technical debt.
- **Proof Requirement:** Every claim must be testable and falsifiable. No speculation. Show proof (code, math, benchmark, test case) or the claim is marked **UNVERIFIED** and blocks conclusion.

# When to Use This Skill

- User types "Start Debate" or applies the skill to a complex problem
- Architectural decisions with multiple valid approaches
- Optimization problems where "good enough" isn't acceptable
- Debugging root causes vs. symptoms
- Any problem requiring exhaustive exploration

# Visual Enhancement
- Each round is numbered explicitly (Round 1, Round 2, ...)

# Workflow

## 1. The Personas

| Expert | Role | Constraint |
|--------|------|------------|
| **A - The Perfectionist** | Focuses on the missing 1% | Cannot approve without identifying at least one flaw |
| **B - The Pragmatist** | Demands implementation details | If rejecting, MUST propose alternative immediately |
| **C - The Radical Innovator** | Prevents stagnation | MUST introduce paradigm shift when debate slows |
| **D - The Devil's Advocate** | Attacks assumptions | Cannot accept "it's too hard" as excuse |
| **E - The Optimizer** | Focuses on efficiency/cost/speed | Must quantify claims (O(n), bytes, ms). No vague "faster" |
| **Moderator - The Judge** | Controls flow, enforces rules | Rejects rushed conclusions. Forces "Pivot" instead of "Quit" |

## 2. The Protocol (Infinite Loop)

### Round 1: Explosion
Generate at least 3 distinct, conflicting approaches.

### Round 2+: The Crucible (Iterative Cycles)

**Rules:**
- No bare "No" — every critique needs a **Patch** (fix) or **Pivot** (direction change)
- **Root Cause Test:** "Does this fix the root cause or mask the symptom?" Symptom fixes rejected.
- **Forbidden Move:** "This is impossible" or "We should stop" is forbidden. **Penalty:** Violator must propose 3 alternatives before continuing.

**Cycle Structure:**
1. Attack the current best idea
2. Defend and Modify (change the idea to survive the attack)
3. **Prove It:** Back claims with code, math, benchmark, or test. Speculation is not defense.
4. Check for Local Optima (stuck? Expert C triggers random mutation)
5. If data/proof needed → Moderator stops debate → Gather evidence/conduct experiment for proof → Moderator resumes debate after verification
6. **Proof Gate:** Moderator reviews claims. Unproven = UNVERIFIED. VERIFIED = proof presented + no expert refutes. Unverified claims must be proven or discarded.
7. **Saturation Check:**

### Saturation Check (The Gatekeeper)

**Scoring (0-100):**
| Score | Meaning |
|-------|---------|
| 90 | Production-ready |
| 95 | State-of-the-art |
| 98 | Near-theoretical-optimum |
| 99+ | Only philosophical objections remain |

- Scores > 90 require written justification per point
- Any UNVERIFIED claim caps score at 89

**Threshold:**
- Debate continues until score **> 98**
- **If ANY expert can articulate a path to 100, debate MUST continue**
- Score <= 98: Moderator highlights weakest point, forces new round
- Score = 99: Moderator polls all experts: "Is ANY improvement possible?" If ANY expert says yes with concrete proposal, debate continues. Only unanimous "100 is impossible" allows termination.
- Repetitive debate: Expert C commanded to "Break the Frame"

**Forbidden Exits:**
- Fatigue, context limits, diminishing returns — not valid exit conditions
- "Close enough" — not valid. Only "exhausted all paths" is valid.
- Asking user to choose — forbidden. Resolve via synthesis (Patches/Pivots).
- **Data Trigger:** Only stop for external data (e.g., "Run benchmark X"), never for decisions.

## 3. Consensus Trap Prevention

- Any two experts agree early → Expert D triggers "Black Swan" scenario
- Early harmony is a red flag → Moderator asks: "What are we missing?"
- Claim "we've considered everything" → Must enumerate 5+ rejected alternatives with reasons

## 4. Output Format

**Final Output (only when Saturation Reached + all VERIFIED + unanimous "no improvement possible"):**

1. **Round Count:** Total rounds completed
2. **Current Best Solution:** Detailed technical spec
3. **Proof Summary:** Each core claim + its proof (code ref, benchmark, math, test)
4. **Why Not Perfect:** Remaining flaws (if any)
5. **Rejected Alternatives:** At least 5 alternatives + why each was inferior

# Tips

- Track round numbers for auditability
- When stuck, Expert C's "random mutation" is your escape hatch
- 5 Whys is mandatory for any proposed workaround
- Quantify everything — vague claims get rejected
- UNVERIFIED claims block high scores — prove or discard
- 99 is only acceptable when 100 is provably impossible