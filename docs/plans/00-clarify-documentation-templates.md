# Align repository guidance with discussion-first documentation

State: COMPLETE

## Goal and context

Align all first-party onboarding and workflow guidance with discussion-first documentation: decisions/tasks preserve agreed context, while a detailed plan is presented before implementation for approval. Make templates support that model without turning discussion into form filling.

- [Task](../tasks/00-clarify-documentation-templates.md)
- [Decision](../decisions/00-discussion-first-documentation.md)

The user approved the documentation direction, then requested expanding this plan from template updates to repository-wide alignment so new agents receive consistent instructions. The user also requested an explicit distinction between agreement to a short conversational proposal and approval of the written implementation plan. The user further selected PROPOSED (replacing PENDING) as the initial plan state, with APPROVED reserved for explicit approval after presentation of the full written plan. Those requests did not approve implementation. After presentation of this amended plan, the user explicitly approved implementation: "looks good, please bring this to completion". Approval recorded; the plan transitioned from PROPOSED to APPROVED, then IN PROGRESS.

## Scope

Change the three `templates/00-*.md` files, `readme.md`, `.pi/README.md`, `.pi/APPEND_SYSTEM.md`, and all four `.pi/skills/*/SKILL.md` files as detailed below, plus evidence/state updates to this plan and its linked task. Audit all four `.pi/prompts/*.md` shortcuts and remaining first-party files for consistency; compatible files need no edit. Preserve pre-existing working-tree content, including within files now in scope.

Repository-wide means first-party instructions and artifacts, not installed packages, generated files, or private session traces. No launcher behavior, dependency, configuration, publishing-policy, or unrelated cleanup changes are included. Keep existing document filenames to preserve links.

Each template will use short italic fill-in guidance. Replace examples that imply a particular language or application structure with artifact-neutral prompts. Do not add mandatory tables, extensive procedural checklists, or duplicated logs.

## Ordered edits

### 1. Clarify `templates/00-decision.md`

Retain the lightweight structure: title, Requirements, Final Decision, and Alternatives considered.

- Explain briefly that this document records a choice reached through discussion, not a proposal form to complete during exploration.
- Prompt Requirements for the problem/context and constraints that motivated the choice.
- Prompt Final Decision for the agreed choice and its rationale.
- Prompt Alternatives considered for meaningful alternatives and why their tradeoffs led to the choice.
- Do not add proposed/accepted status, approval tracking, implementation checklists, or review logs.

Validation: a reader can identify what was chosen, why, and what alternatives mattered, without completing workflow bookkeeping.

### 2. Clarify `templates/00-task.md`

Retain the title, Short Description, Queue, and Out of scope sections.

- Prompt Short Description for the agreed observable outcome and relative links to relevant decisions/plans when they exist. Do not require a decision document for every task.
- Replace generic feature/test/manual-check examples with a short illustrative checkbox entry that couples work with an observable completion check.
- Prompt Out of scope for agreed exclusions and deferred adjacent work.
- Explain briefly that the task captures the outcome of discussion; detailed implementation belongs in the linked plan.
- Do not add lifecycle statuses, approval fields, or procedural logs.

Validation: a reader can determine the intended result, when it is done, and what is excluded without duplicating the plan.

### 3. Replace the illustrative body of `templates/00-plan.md`

Replace `State: PENDING` with `State: PROPOSED` and use these lightweight sections:

- **Goal and linked task:** one concrete PR outcome and a relative task link when a relevant task exists. If no separate task is needed, capture the agreed outcome and scope directly here rather than creating a task merely to fill the link.
- **Approval:** initially awaiting explicit user approval of this concrete plan document; agreement to an earlier short conversational proposal is not sufficient. Present the full written plan before asking for approval; only subsequent explicit approval of that version permits transitioning from PROPOSED to APPROVED. Never apply earlier agreement retroactively to a document the user has not seen. Material revisions return to PROPOSED and require renewed presentation and approval. Retain IN PROGRESS, BLOCKED, and COMPLETE as execution states, not substitutes for approval.
- **Ordered changes:** a repeatable numbered entry naming the file and symbol/interface or document section, intended change/behavior, and associated validation. Remove the fictional TypeScript-like interface/class and fuzzer examples. Allow illustrative code where it makes the proposal clearer; do not require literal line numbers.
- **Validation:** observable acceptance criteria and exact repository-appropriate commands or manual checks. Distinguish checks planned in advance from results recorded later.
- **Risks and open questions:** relevant assumptions, compatibility/rollback concerns where applicable, and blockers. Keep irrelevant details out rather than manufacturing risks.
- **Implementation results:** a compact place to record actual commands/outcomes, feature/style review verdicts, and remaining limitations after work begins. No lengthy review-log form.

Validation: before implementation, a user can review the complete proposed scope and how success will be checked; afterward, results can be recorded without creating another reporting document.

### 4. Align onboarding and shared instructions

- `readme.md`, PR workflow and Documentation: describe discussion first, then recording agreed decisions/tasks; describe the plan as the detailed, single-PR proposal reviewed before building. Clarify that a task need not invent a hard-to-reverse decision. Preserve the user's existing startup instructions and unrelated wording.
- `.pi/README.md`, command table and documentation/flow summary: distinguish recording discussion outcomes from drafting a plan for approval. Keep command names, installation instructions, and publishing boundaries intact.
- `.pi/APPEND_SYSTEM.md`, Development cycle and Documentation: replace the instruction to label unapproved decisions as proposed with instructions to keep unsettled choices in discussion or plan open questions until agreed. State that decisions/tasks record settled context without their own approval statuses; plans alone use lifecycle states. Replace the initial PENDING state with PROPOSED, and allow APPROVED only after explicit approval of the full written plan presented to the user. Make material revisions return to PROPOSED for renewed approval. Keep evidence compact in the relevant task/plan rather than adding procedural forms. Preserve all safety and delegation rules; do not add the previously rejected Efficient iteration section.

In all three entry points, state the conversational handoff explicitly: agreement to a short proposal approves direction only. Create/update a task only when needed, always write/update the concrete plan document, present it to the user, and wait for approval before implementation. This applies even without a slash command. Reuse relevant documents; explicit approval of the presented concrete plan is sufficient to proceed without another planning round.

Validation: an agent reading any onboarding entry point receives the same document timing and approval model.

### 5. Align skill behavior with the documentation model

- `.pi/skills/grill/SKILL.md`, description and steps 5–7: discuss and settle the goal before recording appropriate decisions/tasks; draft the concrete plan separately for approval. Do not imply that decisions/tasks themselves await a formal approval lifecycle. Keep focused questions and the stop-before-build gate.
- `.pi/skills/check/SKILL.md`, step 7: remove the instruction to update proposed decisions. Record probe evidence in the linked task/plan; for a standalone investigation, capture the investigation agreed with the user without inventing a technology decision. If evidence challenges an agreed choice, return to discussion before revising that decision. Keep unresolved recommendations in findings/open questions, and require renewed plan approval for material changes.
- `.pi/skills/build/SKILL.md`, Gate and handoff: distinguish reading settled decision/task context when present from verifying explicit approval of the implementation plan. If the user has only approved a short conversational proposal, do not implement: create/update a task only if needed, always write/update a concrete plan document, present it, and stop for approval. Apply the same handoff in `/grill`; agreement to direction is not approval of an unseen plan. Preserve tests, independent reviews, evidence-based completion, and reapproval for material plan changes.
- `.pi/skills/pr/SKILL.md`, linked-document and PR-body guidance: link relevant documents that exist without requiring a decision for every task or manufacturing documents for publication. Preserve all authorization and validation requirements.

Validation: test the guidance against (a) an exploratory discussion with no agreement, (b) an agreed task needing no architecture decision, (c) a probe disproving an assumption, (d) an approved plan requiring material revision, (e) an "okay" to a short proposal with no plan document, and (f) explicit approval of a presented concrete plan document. In scenario (e), require a written plan and a separate approval pause, but not an unnecessary task document; in scenario (f), permit implementation without another documentation-only approval cycle. Each scenario must identify where facts are recorded and what, if anything, needs user approval.

### 6. Audit remaining first-party entry points

- Read `.pi/prompts/{grill,check,build,pr}.md` against the revised skills. Their current thin invocation text is compatible; retain it unless an actual contradiction is found. Any needed change must be limited to the discussion/plan distinction, not duplicated procedures.
- Inspect `developer.sh`, `.pi/settings.json`, and first-party ignore files for documentation-standard references. No behavior/configuration edits are expected or authorized by this plan.
- Recheck the linked decision/task/plan records for consistency. The decision already expresses the agreed standard and requires no substantive change.
- Exclude `.pi/git/` installed package content and `.pi-session/` private traces from the audit. Do not inspect traces as part of this work.

Validation: enumerate reviewed first-party paths, record compatible files left unchanged, and report any additional conflicting instruction before expanding the planned edits.

## Acceptance criteria

- Decision/task templates clearly record agreed discussion rather than imposing a discussion sequence.
- The decision template contains no proposed/accepted status field.
- Task queue guidance requests verifiable completion checks, not vague activities.
- The plan makes the pre-implementation approval gate explicit and asks for concrete ordered edits, acceptance criteria, validation, and relevant risks.
- Guidance is concise, artifact-neutral, and free of the current fictional code example.
- Existing section names are preserved where useful; no extra decision/task procedural machinery is introduced.
- READMEs, shared context, all four skills, and prompt shortcuts agree on when decisions/tasks are written and what the plan approval gate covers.
- No instruction requires a proposed/accepted decision status, creates a decision merely to fill a template, or treats an unsettled recommendation as an agreed choice.
- Agreement to a short proposal never triggers implementation directly: a concrete plan document is always written or updated and presented for separate approval; a task document is created/updated only when needed.
- Initial plan state is consistently PROPOSED, not PENDING. APPROVED requires explicit approval after the full written plan has been presented; earlier agreement never authorizes an unseen plan. Material revisions return to PROPOSED for renewed approval.
- Existing relevant documents can be reused, and approval of the presented concrete plan does not trigger an endless planning/approval loop.
- Existing implementation, review, publishing, and safety gates remain intact.
- No unrelated setup behavior or instructions are modified.

## Validation approach

This change affects Markdown templates and workflow guidance; no application build or library probe is required.

1. Read all changed files and audit the first-party entry points listed above against the linked decision/task. Run `rg -n 'propos|approv|decision|task|template' readme.md .pi/README.md .pi/APPEND_SYSTEM.md .pi/skills .pi/prompts templates docs` and assess matches in context; legitimate proposed plans and goals must not be removed by a blanket replacement. Check that the guidance supports the agreed model without copying full skills into templates.
2. Walk through the six scenarios in step 5 and apply the templates to this alignment task. Record conclusions and any ambiguity in this plan; do not create extra sample documents.
3. Request independent read-only feature-correctness and repository-style reviews after edits finish, using the acceptance criteria and nearby Markdown conventions. Record any unavailable review as a limitation/blocker rather than claiming it ran.
4. Run `git diff --check` and `git diff -- readme.md templates .pi docs`; inspect `git status --short` for scope. Read untracked first-party files directly as well, since ordinary diff does not include them. Compare edits in pre-existing modified/untracked files against their pre-implementation contents, not merely against HEAD.
5. Check the relative links in these three new records and any concrete links introduced into the templates. Placeholder links in templates must be clearly identified as fill-in guidance.

## Risks and open questions

- Overloading templates with workflow detail would undermine the goal. Prefer short prompts and a compact results section only in the plan.
- Shared instructions currently mention labeling unapproved decisions as proposed, and `/check` refers to updating proposed decisions. Resolving both conflicts is now explicitly in scope; unsettled choices must remain distinguishable from agreed decisions.
- The existing working tree includes modifications to `readme.md` and untracked setup files. Preserve their pre-existing content while making only the planned alignment edits. Capture a baseline before implementation so those edits remain auditable.

## Implementation results

Implemented the ten planned template/guidance files. Pre-implementation snapshots are at `/tmp/pi-docs-baseline.okrdZY` (exact Pi files under `project-pi/`). Main-session verification:

- `git diff -- readme.md templates` and `diff -ru /tmp/pi-docs-baseline.okrdZY/project-pi .pi --exclude=git`: reviewed actual changes, including untracked Pi files, against the plan. Only intended guidance changes found.
- `git diff --check`: exit 2, solely pre-existing README trailing whitespace at lines 5, 7, 9, 11, and 13. No new whitespace findings. User startup text preserved byte-for-byte.
- `python3 /tmp/pi-docs-validation-20260921.py`: exit 0. Checks ten changed files with baseline-relative `git diff --no-index --check`, byte-compares startup content and eight unchanged paths, resolves seven concrete Markdown links, and rejects `State: PENDING` in current guidance. Script and baseline are temporary local evidence, not repository dependencies.
- `rg -n 'PENDING|proposed decisions|unapproved choices' readme.md .pi/README.md .pi/APPEND_SYSTEM.md .pi/skills .pi/prompts templates docs`: remaining matches only document historical wording and the planned migration in these records; no stale operational instructions.
- `git status --short`: scope inspected; existing setup files remain untracked, with no commits or publishing actions.

Scenario walkthrough against final guidance:

1. Exploration without agreement: keep unsettled choices in discussion/open questions, not a decision record.
2. Agreed work without an architecture choice: no manufactured decision; a separate task is optional.
3. Probe disproves an assumption: record evidence and revisit an agreed choice through discussion before changing its decision record.
4. Material plan revision: return to PROPOSED, present the full revision, and obtain renewed approval.
5. Agreement to a short summary: write/update and present the concrete plan; pause for approval, without requiring an unnecessary task.
6. Approval of the presented concrete plan: proceed to implementation without another planning round.

The templates fit this documentation-alignment task without fictional application code or additional reporting forms. Audited and left unchanged: `.pi/prompts/{grill,check,build,pr}.md`, `.pi/settings.json`, `.pi/.gitignore`, `.gitignore`, and `developer.sh`.

Independent read-only reviews completed against the final ten-file implementation:

- `feature-review` (`openai-codex/gpt-6-astra`): PASS, no actionable findings. Verified all six scenarios, consistent onboarding gates, optional discussion records, and preserved implementation/review/publishing safeguards.
- `style-review` (`openai-codex/gpt-6-astra`): PASS, no actionable findings. Verified lightweight templates, terminology, scope, unchanged compatible files, preserved startup content, and no new whitespace errors.

No implementation changes were needed after review. Task checks are complete. The five baseline README whitespace findings remain disclosed rather than silently repaired; there are no unresolved in-scope blockers. No commits, pushes, or PR actions were performed.

Separate user-authorized environment workaround: after the original worker exited without output due unavailable provider access, changed only the model fields of the installed bundled scout/researcher/worker profiles to `openai-codex/gpt-6-astra`; replacement worker completed with that explicit override. This local package workaround is not part of the first-party documentation change and may be overwritten by package updates. Durable model configuration and the previously noted launcher session flag concern remain deferred. No private session traces were inspected.
