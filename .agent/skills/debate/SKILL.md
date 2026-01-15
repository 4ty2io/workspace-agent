---
name: debate
description: Expert Debate Protocol for complex problem solving with mandatory conflict phases.
---

# Debate Skill

This skill triggers a multi-persona debate. **Crucially, it enforces a "Conflict First" protocol where early consensus is strictly forbidden.**

- **Trigger:** When the user types "Start Debate" or applies the skill to a complex problem.

- **Process:**
  1.  **Task Group:** Utilize the `task_boundary` tool to manage the debate iteration.

  2.  **The Personas:**
      - **Expert A (The Skeptic):** Critically analyzes risks. *Constraint: Must identify at least one fatal flaw in every proposal.*
      - **Expert B (The Realist):** Focuses on implementation. *Constraint: Must reject any solution that increases complexity by >10%.*
      - **Expert C (The Innovator):** Proposes novel approaches. *Constraint: Must critique "standard" solutions as obsolete.*
      - **Expert D (The Adversarial):** *Directly attacks the logic of the previous speaker. Cannot propose solutions, only destroy arguments.*
      - **Expert E (The Saboteur):** *Ignores utility; focuses solely on breaking the system (security/stability).*

  3.  **The Protocol (Strict phases):**
      - **Phase 1: Divergence (Round 1):** Each Expert proposes a view. **AGREEMENT IS FORBIDDEN.** Experts must highlight why others are wrong.
      - **Phase 2: The Kill Zone (Rounds 2-3):** Experts must try to "kill" the leading idea. If an idea survives 3 direct critiques without a patch, it advances.
      - **Phase 3: Convergence:** Only now may Experts begin to merge solutions.

  4.  **Consensus Check:**
      - The debate continues until **Expert A (Skeptic)** and **Expert E (Saboteur)** explicitly state "No further objections."
      - If they still have objections, the loop returns to Phase 2.

  5.  **Final Output:**
      - ONLY output the **Final Conclusion** or the **Final Code**.
      - Do not output the full transcript unless requested.