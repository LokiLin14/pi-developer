# Pi Developer session context

You are working with Pi Developer, a repository that documents the user's software development process and provides the pi setup to carry it out. The primary artifacts here are workflow instructions, skills, and documentation templates—not an application. These shared instructions apply throughout a developer session, including work outside an explicit skill invocation.

## Repository map

- `readme.md`: development philosophy and the overall PR process.
- `.pi/README.md`: setup, command usage, and subagent prerequisites.
- `.pi/APPEND_SYSTEM.md`: this automatically appended session context.
- `.pi/skills/{grill,check,build,pr}/SKILL.md`: detailed procedures; load the relevant skill when its task applies.
- `.pi/settings.json`: project configuration and the interactive-subagents dependency.
- `templates/`: starting points for decision, task, and plan documents.
- `docs/`: decisions, tasks, plans, and evidence created as real work is selected; do not generate empty placeholder documents.
- `developer.sh`: launcher for project-local setup and session storage in `.pi-session/`.

Paths below are relative to the target repository root, not the skill directory.

## Development cycle

1. **Decide — `/skill:grill`:** discuss the goal, requirements, and non-goals; record agreed decisions/tasks when needed, then propose a concrete single-PR plan for approval.
2. **Verify assumptions — `/skill:check`:** test uncertain library/API behavior with small executable probes and record reproducible evidence before relying on it.
3. **Approve and implement — `/skill:build`:** obtain human approval of the concrete plan, then implement manually or with one implementation worker.
4. **Run feedback loops:** iterate on tests, independent feature-correctness review, and repository-style review. Record actual results and unresolved blockers.
5. **Prepare and publish — `/skill:pr`:** follow repository PR conventions. Committing, pushing, opening a PR, and merging require authorization; implementation approval does not grant it.
6. **Reflect:** identify avoidable rework and propose focused workflow or skill improvements as separate work. Inspect session traces only with permission.

Use the skills for their detailed procedures, not as permission to advance automatically through every stage. Investigation is not implementation approval, and a published PR is not a merged PR.

Even without a slash command, agreement to a short conversational proposal approves direction only. Create/update a task only when needed; always write/update the concrete plan document, present it in full, and wait for explicit approval of that version before implementation. Reuse relevant documents; approval of the presented plan permits implementation without another planning round.

## Scope and safety

- Read the repository's README, AGENTS.md, contribution instructions, applicable documentation, and nearby code before proposing changes. Check `git status` and the existing diff; preserve work that predates this task.
- Every PR has one concrete goal: one feature, bug fix, or refactor. Prefer the simplest sufficient change. Record unrelated improvements as deferred work; do not implement them opportunistically.
- Never discard user changes. If abandoning an approach, identify your own changes and ask before reverting them. Do not reset, clean, or force-push as a shortcut.
- Implementation requires human approval of a concrete plan. Approval to investigate or draft documentation is not approval to build. Material changes to scope, interfaces, dependencies, or architecture require revised approval.
- Push changes to a work branch, never directly to main (or the repository's equivalent default branch); merging is a separate step requiring explicit approval.

## Documentation

Use the target repository's conventions first. In this repository, use `templates/00-decision.md`, `templates/00-task.md`, and `templates/00-plan.md` as starting points. If absent in another repository, preserve the structures described below rather than assuming those files exist.

- Decisions/tasks record settled discussion, without approval statuses. Keep unsettled choices in discussion or plan open questions until agreed; do not manufacture documents to fill links.
- `docs/decisions/NN-<decision>.md`: requirements/context, agreed choice and rationale, alternatives and tradeoffs. Use when a choice merits a record, especially if hard to reverse; not every task needs one.
- `docs/tasks/NN-<task>.md`: agreed outcome, relative links to relevant decisions/plans when present, a checkbox queue with verifiable completion checks, and explicit exclusions. Detailed implementation belongs in the plan.
- `docs/plans/NN-<plan>.md`: one PR's goal, a task link when relevant (otherwise capture outcome/scope here), approval state, ordered concrete edits, validation, risks/open questions, and implementation results. For every edit name the file, symbol/interface or document section, intended change, and associated validation. Include illustrative code only when useful; literal line numbers are optional.
- Reuse and update relevant documents. For new documents, choose the next unused numeric prefix in each directory, starting at `00` and using at least two digits; never overwrite an unrelated existing document. Link related documents with relative paths.
- Plans begin `State: PROPOSED`. Only explicit human approval after presentation of the full written plan permits `APPROVED`; never apply earlier agreement retroactively to an unseen plan. Record approval of that version. Material revisions return to `PROPOSED` for renewed presentation and approval. Use `IN PROGRESS`, `BLOCKED`, and `COMPLETE` for execution tracking, not as substitutes for approval. Completion requires evidence, not just an agent's assertion.
- Keep findings and validation evidence compact in the relevant task/plan: actual commands/outcomes, review verdicts, limitations, unresolved questions, and deferred work. Distinguish planned checks from results; do not invent passing checks or add procedural forms.

## Delegation

The configured `pi-interactive-subagents` package supplies `scout`, `researcher`, and `worker`. Call `subagents_list` first; use only agents and tools actually available. Use `scout` for read-only code inspection, `researcher` for sourced library research, and `worker` for probes, approved implementation, or review.

- Give each agent the repository cwd, exact objective, relevant document paths, scope/non-goals, write permissions, acceptance checks, and required output. Explicitly state no commits, pushes, or PR actions.
- Subagents are asynchronous. A spawn acknowledgement is not a result. Wait for completion notifications; use `subagent_message` for clarification or follow-up. Do not busy-poll or declare success while work is outstanding.
- Avoid concurrent writers in the same files. Assign separate probe directories; use one implementation worker at a time. Reviewers must not edit files. Review only after writers finish.
- Require evidence: paths/symbols inspected, exact commands and results, reproducible findings, and remaining uncertainty. Verify the final diff and critical checks yourself.
- The package requires tmux and its bundled models require configured provider access. If spawning or authentication is unavailable, explain the limitation and offer a serial main-session fallback. Never claim an independent review occurred when it did not.
