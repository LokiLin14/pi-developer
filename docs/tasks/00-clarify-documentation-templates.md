# Align repository guidance with discussion-first documentation

## Short Description

Align the templates, onboarding documentation, shared session instructions, and skills with [discussion-first documentation](../decisions/00-discussion-first-documentation.md): concise decisions/tasks preserving agreed context, and a concrete implementation plan submitted before building.

Implementation is complete; validation evidence and passing independent feature/style reviews are recorded in the [plan](../plans/00-clarify-documentation-templates.md).

## Queue

- [x] Clarify the decision template: brief prompts for context/requirements, the choice, and alternatives/tradeoffs; no lifecycle status or approval form.
- [x] Clarify the task template: agreed outcome, relevant links, a short checkbox queue with observable completion checks, and exclusions; no procedural logs.
- [x] Replace the plan's fictional code example with guidance for a single-PR goal, linked task, approval state, ordered concrete edits, validation, and risks.
- [x] Align `readme.md`, `.pi/README.md`, and `.pi/APPEND_SYSTEM.md` on decisions/tasks as records of agreed discussion and plans as the pre-implementation approval gate.
- [x] Align all four skills, especially `/grill` document timing and `/check` handling of unsettled choices; retain implementation and publishing safeguards.
- [x] Make agreement to a short conversational proposal a documentation step, not implementation authorization: create/update a task only if needed, always write/update and present a concrete plan document, and wait for its explicit approval. Apply this to natural-language requests and skill invocations without requiring duplicate documents or repeated approval after the concrete plan is approved.
- [x] Replace the initial plan state `PENDING` with `PROPOSED` consistently. Permit `APPROVED` only after explicit approval of the full written plan presented to the user, never retroactively from agreement to a summary. Material revisions require renewed presentation and approval.
- [x] Audit all four prompt shortcuts and remaining first-party configuration/launcher files for contradictory guidance; keep compatible files unchanged.
- [x] Validate the complete first-party guidance against the agreed decision using representative workflow scenarios, check Markdown paths/formatting, and record validation and feature/style review results in the plan.

## Out of scope

- New workflow stages, decision/task lifecycle statuses, or mandatory forms governing discussion.
- Launcher behavior changes, dependency/configuration changes, automated documentation tooling, or unrelated cleanup.
- Editing installed third-party packages, generated files, or private session traces.

Repository-wide alignment is limited to this documentation standard. Preserve existing user changes, and report unrelated findings rather than fixing them opportunistically.
