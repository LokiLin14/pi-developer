# Record discussions; approve implementation plans

## Requirements

Documentation should preserve conclusions reached with the user so they survive beyond the session. Filling out documents must not dictate or slow down exploratory discussion. Before implementation, the user needs a concrete, reviewable account of the work required to complete a task.

## Final Decision

Write decisions and tasks after discussion to capture the agreed session context:

- A decision records the choice, its requirements/context, and alternatives with tradeoffs. It has no proposed/accepted status field.
- A task records the agreed outcome, relevant decisions, a short checkbox queue with verifiable completion checks, and exclusions.
- A plan is the detailed implementation proposal, written before building and presented for explicit user approval. It records the linked task, concrete file/symbol changes, validation, risks, and approval state.

Keep template guidance brief. Decisions and tasks are records of agreement, not procedural forms; they do not need approval machinery or review logs. Plans remain the implementation approval gate.

An "okay" to a short conversational proposal approves the direction, not implementation. Next, record or update a task only if needed to preserve agreed context, and always write or update a concrete plan document and present it for separate approval before building. Reuse relevant existing documents rather than creating duplicates. This applies to natural-language requests as well as skill commands. Approval of the presented concrete plan document permits implementation; it does not require another documentation-only approval round.

Use `State: PROPOSED` instead of `State: PENDING` for the initial plan state. Transition to `APPROVED` only after the full written plan has been presented to the user and they explicitly approve that version. A user cannot approve a plan they have not seen; earlier agreement to a summary cannot be applied retroactively. Material revisions return the plan to `PROPOSED` for renewed approval. Keep IN PROGRESS, BLOCKED, and COMPLETE for execution tracking; none substitutes for approval.

The user agreed to this direction in discussion and requested these records and a plan for separate approval. This does not approve implementation of the plan.

## Alternatives considered

### Workflow-complete forms for every document

Adding lifecycle statuses, probe fields, approval records, and review logs throughout the templates would make each workflow step explicit, but would burden iteration and duplicate evidence. Rejected in favor of concise discussion records and one detailed implementation plan.

### Keep the existing illustrative templates

The existing templates are lightweight, but the plan's fictional interface/class example does not explain the information needed for a reviewable implementation proposal. Short fill-in guidance can clarify expectations without prescribing the discussion.

## Related work

- [Task: clarify documentation templates](../tasks/00-clarify-documentation-templates.md)
- [Plan: clarify documentation templates](../plans/00-clarify-documentation-templates.md)
