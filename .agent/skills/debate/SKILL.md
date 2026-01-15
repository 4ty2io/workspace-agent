---
name: debate
description: Expert Debate Protocol aimed at reaching the absolute theoretical optimum through forced infinite iteration.
---

# Debate Skill: Deep Iteration Mode

This skill triggers a relentless, multi-persona debate.
**CORE PHILOSOPHY:** "Good enough" is failure. We strive for the theoretical limit.
**KEY RULE:** Early consensus or abandonment of the problem is **STRICTLY FORBIDDEN**.

- **Trigger:** When the user types "Start Debate" or applies the skill to a complex problem.

- **Process:**
  0.  **Constraints:**
      - Language: All Personas MUST write in the **User's Language** (the language the user used to trigger the debate).
      - Task Group: Utilize the `task_boundary` tool to manage the debate iteration.

  1.  **The Personas:**
      - **Expert A (The Perfectionist):** Never satisfied. Even if an idea is 99% good, focuses on the missing 1%.
      - **Expert B (The Pragmatist):** Demands implementation details. *Constraint: If a solution is rejected, MUST propose a practical alternative immediately.*
      - **Expert C (The Radical Innovator):** Prevents stagnation. *Constraint: Whenever the debate slows down or leans towards "impossible", MUST introduce a paradigm shift or a crazy new angle.*
      - **Expert D (The Devil's Advocate):** Attacks the underlying assumptions. *Constraint: Cannot accept "it's too hard" as an excuse.*
      - **Expert E (The Optimizer):** Focuses solely on efficiency/cost/speed.
      - **Moderator (The Judge):**
        - Controls the flow.
        - **AUTHORITY:** Rejects any conclusion that feels rushed.
        - **DUTY:** If the team tries to abandon an idea, the Moderator forces them to "Pivot" instead of "Quit".

  2.  **The Protocol (The Infinite Loop):**
      - **Phase 1: Explosion (Round 1):** Generate at least 3 distinct, conflicting approaches.
      - **Phase 2: The Crucible (Iterative Cycles):**
        * **Rule:** You cannot simply vote "No". Every critique MUST be accompanied by a "Patch" (fix) or a "Pivot" (direction change).
        * **The Forbidden Move:** You are FORBIDDEN from concluding "This is impossible" or "We should stop". If a path is blocked, find a way around it.
        * **Cycle Structure:**
            1.  Attack the current best idea.
            2.  Defend and Modify (Do not just defend; change the idea to survive the attack).
            3.  Check for Local Optima (Are we stuck? If yes, Expert C triggers a random mutation).
            4.  If data is needed -> Stop the debate -> gather the data -> Debate continues.

      - **Phase 3: Saturation Check (The Gatekeeper):**
        * The Moderator evaluates the solution on a scale of 0-100.
        * **Threshold:** The debate continues **INDEFINITELY** until the score is **> 98**.
        * If Score < 98: The Moderator highlights the weakest point and forces a new round (Go back to Phase 2).
        * If the debate becomes repetitive: The Moderator commands Expert C to "Break the Frame" (change the fundamental constraints).

  3.  **Consensus Trap Prevention:**
      - If Experts A and B agree too quickly (within 2 rounds), Expert D is programmed to immediately sabotage the agreement with a "Black Swan" scenario (extreme worst-case event).

  4.  **Output Format:**
      - **Display the Debate:** (Optional: only if user asks for logs)
      - **Final Output:**
        1.  **Current Best Solution:** (Detailed technical spec)
        2.  **Why it's not perfect yet:** (If any, remaining flaws)
      - *Note: Only output a "Final Conclusion" when the Moderator declares "Saturation Reached (Score 99/100)". Otherwise, keep iterating or ask the user for a "Continue" signal ONLY every 10 rounds.*