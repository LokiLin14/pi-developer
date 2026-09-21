---
name: grill
description: Discuss a feature, bug fix, or refactor through focused questions, record agreed context when needed, then propose a concrete single-PR plan for human approval. Use before implementation.
---

# Grill

Treat the user's arguments as the proposed goal, not settled requirements.

1. Inspect relevant code and documentation. Summarize the current behavior and desired outcome; distinguish observations from assumptions. Do not ask questions the repository already answers.
2. Ask a small batch of high-value questions, then wait for answers. Challenge the problem before the solution: who needs this, what fails today, what observable result counts as success, and what is the smallest sufficient change?
3. Resolve constraints: API compatibility, inputs/outputs, error cases, security boundaries, performance, migration/rollback, dependencies, and testability where relevant. Ask for concrete examples and non-goals. Present tradeoffs and a recommendation rather than an unranked menu.
4. Separate facts from unverified library/API assumptions. Recommend `/skill:check` for assumptions that could invalidate the design. Do not claim an API works from documentation alone or select a hard-to-reverse dependency without discussing alternatives.
5. Break an oversized proposal into independently reviewable tasks. Agree on one concrete PR goal, exclusions, and completion checks through discussion before recording them. Defer adjacent refactors explicitly.
6. Record agreed choices in decisions when useful, and create/update a task only when needed; neither has an approval lifecycle. Keep unsettled choices in discussion or plan open questions. Always write/update `docs/plans/NN-<plan>.md` as `State: PROPOSED` with ordered file/symbol or document-section edits, exact validation commands/manual checks, risks, and acceptance criteria. Link relevant existing records; if no task is needed, capture outcome/scope in the plan. Flag unresolved assumptions; do not pretend a blocked plan is ready.
7. Present the full written plan, its path, and outstanding questions; ask for explicit approval of that version and stop before implementation. Agreement to an earlier short conversational proposal approves direction only, never an unseen plan retroactively. Only subsequent explicit approval permits `APPROVED` and `/skill:build`, without another planning round. Material revisions return to `PROPOSED` for renewed presentation and approval. This handoff also applies without a slash command; do not silently transition to building.

Done means the goal, exclusions, and completion checks are concrete and there is a reviewable plan, or a clearly documented blocker. Approval is a separate human action.
