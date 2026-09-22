---
name: build
description: Implement a human-approved single-PR plan, manually or with a worker agent, then iterate through tests, feature review, and repository-style review with recorded evidence.
---

# Build

Arguments should identify a plan under `docs/plans/`; ask which plan if ambiguous.

## Gate

1. Read the plan, settled decision/task context when present, repository instructions, and current diff. Verify explicit human approval after presentation of the full written plan, and that the approved version still fits the current code. Decisions/tasks need no approval statuses. A request to run this skill alone is not approval of an unseen or materially changed plan.
2. If plan approval is absent, including when the user only agreed to a short conversational proposal, do not implement or apply that agreement retroactively. Create/update a task only if needed; follow `/skill:grill` to settle unresolved material choices before writing/updating the concrete plan as `State: PROPOSED`, reusing relevant records. Edit trivial corrections directly; recommend `/skill:check` for blocking untested assumptions. Present the full plan and stop for explicit approval of that version before setting `APPROVED`. This gate applies without a slash command too; once the presented concrete plan is explicitly approved, proceed without another planning round.
3. Identify baseline test/lint/typecheck/build commands from repository configuration. Run relevant baseline checks where practical and record existing failures separately. Set the approved plan to `IN PROGRESS`.

## Implement

4. Follow the user's preference for main-session implementation or delegation. Default to a single `worker` when available. Give it the exact approved plan, owned files, acceptance criteria, constraints, and no-commit/no-push rule. Require it to stop and ask if the plan cannot be followed.
5. Make the smallest sufficient changes and tests. Preserve existing patterns for dependency injection, comments grouped before functions, section outlines, and formatting; use local examples as the authority. Do not impose unrelated style cleanup.
6. Inspect the completed diff against every planned step. If a material deviation is necessary, stop and follow `/skill:grill` to discuss the delta before rewriting the plan as `PROPOSED`, then present it in full and obtain renewed explicit approval before continuing. Do not broaden scope to fix unrelated failures.

## Feedback loops

7. Run focused tests first, then the relevant repository-wide checks. Record commands, exit results, and skipped checks with reasons. Fix in-scope failures and rerun affected checks.
8. Once writes finish, request independent agent reviews (separate review tasks, preferably fresh agents):
   - **Feature correctness:** compare the actual diff and tests with the approved acceptance criteria; check edge cases, regression risks, and missing coverage.
   - **Style conformance:** compare changed code with repository conventions, especially injected libraries, comment placement, section layout, naming, and minimal scope.
   Review prompts must prohibit edits and require file/symbol references, severity, evidence, and a clear verdict. Use a capable available agent such as `worker`; do not assume a nonexistent reviewer profile.
9. Evaluate findings rather than applying them blindly. Fix justified in-scope issues; record why a finding is rejected or deferred. Rerun tests and affected reviews after changes. If repeated attempts make no progress, stop with a blocker and ask instead of looping indefinitely.
10. Perform a final scope audit and `git diff --check`. Mark the plan `COMPLETE` and any linked task checks done only when supported by evidence. Missing required validation or reviews must remain visible as blockers, not fabricated approvals. Keep completed plans focused on approved work, results, and real limitations; link separately recorded, agreed future work rather than retaining its queue. Do not defer unresolved failures of the current goal to claim completion.

Return a concise handoff: plan path, changed behavior/files, commands and outcomes, review verdicts, and remaining risks. Do not commit, push, or open a PR unless separately authorized; recommend `/skill:pr` when ready.
