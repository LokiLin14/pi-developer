# Streamline planning revisions and completion handoffs

## Short Description

Reduce avoidable plan rewrites and ambiguous completion/publication handoffs in Pi Developer. This builds on [discussion-first documentation](../decisions/00-discussion-first-documentation.md) without weakening the written-plan approval gate or existing Git authorization safeguards.

The agreed focus comes from the pi-theory-tutor session review: repeated full plan rewrites while material scope choices were still unresolved, prerequisites discovered after proposal writing, future web-research work accumulating in a completed migration plan, and confusion between local main and remote main.

## Queue

- [x] Discuss material revisions before rewriting plan Markdown. Restate the requested change, surface remaining choices likely to cause another revision, and recommend a direction. Complete when representative scope-change scenarios settle those choices conversationally before the full written plan is updated and presented for approval. Do not reopen settled choices, require another approval just to draft, or delay straightforward corrections with unnecessary questions.
- [x] Check the small set of prerequisites supporting the proposed outcome before presenting an approval-ready plan: required files/dependencies, tools/services, and validation capabilities. Complete when missing prerequisites are surfaced together with an explicit fix-now, defer, or blocker choice rather than silently becoming implementation scope. Keep this targeted; investigation does not authorize installation, paid probes, or implementation.
- [x] Keep completed plans focused on their approved work, actual results, and limitations. Complete when future-work queues and investigation detail live in separate tasks/decisions as appropriate, with concise links or scope exclusions in the completed plan. Deferred work must not imply the completed goal remains unfinished, and moving it must not erase real validation limitations.
- [x] Make Git targets and handoff state explicit. Complete when instructions distinguish local main, remote main, a pushed work branch, and a merged PR; resolve material ambiguity before acting and report the actual resulting state. Check prerequisite commits absent from remote main before promising a migration-only PR diff. Preserve separate authorization for committing, pushing, and merging; clarification is not broader permission.
- [x] Review the updated instructions against concrete examples to confirm they support the agreed behavior without adding unnecessary steps or weakening implementation approval. Record the one-time checks and results in the implementation plan.

Implementation, one-time validation evidence, and passing independent feature-correctness/style reviews are recorded in [the completed plan](../plans/06-streamline-planning-and-handoffs.md). This verifies instruction consistency, not future model behavior.

## Out of scope

- Implementing these workflow changes before a concrete plan is presented and approved.
- Failure-diagnosis/retry policy, timeout defaults, tmux/test orchestration, or changes to independent review requirements; these reflection ideas remain separate work.
- Changing the prohibition on direct pushes to main, automatically granting publishing permissions, or selecting a new default interpretation of an ambiguous merge request without discussion.
- Changes to pi-theory-tutor, the subagents fork, or their completed implementation records.
- Mandatory questionnaires, exhaustive environment audits, new task/decision approval statuses, automated workflow tooling, or unrelated cleanup.

Preserve existing user work, including the untracked `thought.md`. The concrete proposal is in [the implementation plan](../plans/06-streamline-planning-and-handoffs.md).
