# Streamline planning revisions and completion handoffs

State: COMPLETE

## Goal and linked task

Implement [the agreed task](../tasks/01-streamline-planning-and-handoffs.md) with concise instruction changes: settle material choices before rewriting plans, inspect relevant prerequisites early, keep future-work queues out of completed plans, and clarify local/remote Git outcomes.

Use existing workflow sections, not a new stage or mandatory checklist. Prerequisite checks are lightweight inspection, not mandatory installation/live API tests. Infer Git intent from clear context; ask only when materially ambiguous. Preserve implementation approval, publishing safeguards, and independent reviews.

## Approval

Version 1 explicitly approved after full presentation: "approved". Approval recorded; implementation and independent reviews are COMPLETE. The user agreed to lightweight prerequisite checks and contextual Git clarification, with a preference against instruction bloat. The user subsequently authorized committing and pushing to a work branch: "please make a remote commit to a branch from which ill pr and review". PR creation, review, and merging remain the user's actions; no main-branch push is authorized.

## Ordered changes

1. `.pi/APPEND_SYSTEM.md`, Development cycle and Documentation: qualify the existing plan-writing instruction so material choices are settled conversationally first, without reopening settled choices or requiring permission merely to draft. Straightforward corrections can be edited directly. Add concise shared guidance for targeted prerequisite inspection and keeping future-work queues in separate tasks while retaining actual validation limitations. In Scope and safety, add only a short local/remote clarification alongside existing Git safeguards. Validate against all five scenarios below and inspect for contradictory approval wording.
2. `.pi/skills/grill/SKILL.md`, inspection/discussion/documentation steps: explicitly check required files, dependencies, tools/services, and validation capabilities relevant to the proposed outcome. Surface missing prerequisites together with a fix-now/defer/blocker recommendation; use check for risky assumptions without requiring every probe before drafting. For material revisions, discuss the requested delta and remaining consequential choices before rewriting; then write and present the full plan for approval. Preserve the direct-edit exception for trivial corrections and all approval gates. Validate material-revision, trivial-correction, and missing-prerequisite scenarios.
3. `.pi/skills/check/SKILL.md`, evidence/replanning step, and `.pi/skills/build/SKILL.md`, absent-approval/material-deviation steps: use the same discussion-before-rewrite sequence when findings require replanning, preferably by referencing grill rather than duplicating its procedure. In build's completion step, keep finished plans focused on approved work/results/limitations and link separately recorded, agreed future work rather than retaining its queue. Validate consistency and the completed-plan scenario; do not turn unresolved failures of the current goal into deferred work to claim completion.
4. `.pi/skills/pr/SKILL.md`, target inspection, diff inspection, and handoff: distinguish local merge from remote publication when intent is unclear, check prerequisite commits against the intended remote base before promising a single-purpose diff, and state the actual local/remote result. Fold short clauses into existing steps; do not add a default merge destination, extra authorization round when intent is already clear, or any exception to the direct-main-push prohibition. Validate the Git scenario and existing authorization safeguards.
5. `templates/00-plan.md`, Implementation results guidance: state briefly that future-work queues belong in separate tasks, with links when useful; retain evidence and limitations relevant to the completed goal. Do not add sections/forms or alter decision/task templates. Validate the completed-plan scenario.
6. `readme.md`, Documentation, and `.pi/README.md`, workflow/documentation paragraphs: minimally qualify existing plan-timing wording to agree with the shared instructions and point readers to detailed guidance rather than repeating it. Preserve setup, commands, philosophy, and approval rules. Validate consistency with APPEND_SYSTEM and grill.
7. `docs/tasks/01-streamline-planning-and-handoffs.md` and this plan: retain their relative link, mark task checks only after verification, and record compact validation/review evidence here. No new decision is needed; historical completed decisions/plans remain untouched.

## Validation

- Capture `git status --short` and `git diff` before editing. Preserve untracked `thought.md` without inspecting or changing it. Changes must stay within the files above.
- Run `git diff --check` and `git diff --stat`; inspect the entire diff for unintended edits, unnecessary repetition, or weaker authorization rules.
- Run `rg -n 'plan|revis|prerequis|defer|main|merg|push|COMPLETE' readme.md .pi/README.md .pi/APPEND_SYSTEM.md .pi/skills/*/SKILL.md templates/*.md` and review matching guidance for contradictions. Check relative Markdown links in changed files with a small read-only Python check; record its exact command/result.
- Perform a one-time instruction walkthrough of five examples, recording expected behavior and whether the final wording supports it:
  1. Material revision: discuss unresolved scope choices before rewriting; once settled, present the written revision and await approval before implementation.
  2. Trivial correction: edit directly without unnecessary discussion or reopening scope.
  3. Missing prerequisite: expose its effect on outcome/validation, recommend fix/defer/blocker handling, and obtain required authorization before side-effectful probes or implementation.
  4. Completed plan with future work: preserve real results/limitations, place future queues in separate agreed tasks, and keep COMPLETE only when the original goal's checks passed.
  5. Local merge with remote main unchanged: state both facts, identify prerequisites absent from the remote PR base, and ask only if the next requested Git destination/action is ambiguous. Do not automatically push or merge.
- Obtain independent read-only feature-correctness and repository-style reviews. Reviewers should assess all five examples, instruction consistency, scope, and brevity; prohibit edits and publishing actions. Use commands capped at 60 seconds, with no installations or paid runtime probes. These are document reviews, not proof of future model behavior.
- Rerun affected checks after corrections and inspect the final diff personally. Mark COMPLETE only after evidence and both review verdicts support it.

## Risks and exclusions

The main risk is replacing repeated Markdown with repeated questions. Limit discussion to unresolved material choices and clarify that drafting needs no extra approval. Avoid imposing an exhaustive prerequisite audit or stripping legitimate blockers from completed-plan evidence.

No executable code, configuration, dependency, launcher, timeout/retry policy, tmux behavior, or independent-review requirement changes. No direct-main-push policy change, automatic publishing permission, historical document rewrite, or edits to workspace repositories. Keep Git clarification short rather than adding a separate process.

## Implementation results

Implemented the eight planned workflow/template/README edits, amending existing paragraphs and steps without adding workflow stages or checklists. Both independent feature-correctness and repository-style reviews passed after the implementation worker finished. Task checks are complete based on those verdicts and final main-session verification. No scope ambiguity or implementation blocker was found.

Baseline `git status --short` showed only this plan, the linked task, and `thought.md` untracked; `git diff` was empty. The user-owned file was neither read nor changed. Read both READMEs, shared instructions, all four skills, all three templates, and this plan/task before editing. A targeted `find` for AGENTS.md, contribution files, package.json, and Makefile at depth two (excluding workspace/session paths) returned no files. This is instruction-only work: no installation, runtime/API probe, pane operation, child spawn, or Git publication action was performed.

Validation (all shell calls capped at 60 seconds):

- `git diff --check` exited 0, no output. `git diff --stat` reported exactly eight tracked files, 18 insertions and 18 deletions; the untracked plan/task are additional owned records, not included in that stat.
- Inspected the entire `git diff` personally: only planned sections changed; setup, commands, philosophy, templates for tasks/decisions, and historical records were untouched. Implementation/version approval, separate Git authorization, direct-main-push prohibition, and independent-review gates remain intact.
- `rg -n 'plan|revis|prerequis|defer|main|merg|push|COMPLETE' readme.md .pi/README.md .pi/APPEND_SYSTEM.md .pi/skills/*/SKILL.md templates/*.md` exited 0. Reviewed the matches: shared guidance and both READMEs agree with grill; check/build reference its discussion-before-rewrite sequence. Remaining short lifecycle summaries do not bypass that sequence or approval. No contradictory guidance found.
- Read-only relative-link check below exited 0 initially with eight links and, after task evidence was added, with `10 files; 9 relative links; 0 missing`. It checks inline relative file targets, not anchors or external URLs, and ignores fenced examples.

```sh
python3 - <<'PY'
from pathlib import Path
import re
files = [Path(p) for p in ('readme.md', '.pi/README.md', '.pi/APPEND_SYSTEM.md', '.pi/skills/grill/SKILL.md', '.pi/skills/check/SKILL.md', '.pi/skills/build/SKILL.md', '.pi/skills/pr/SKILL.md', 'templates/00-plan.md', 'docs/plans/06-streamline-planning-and-handoffs.md', 'docs/tasks/01-streamline-planning-and-handoffs.md')]
checked = 0
missing = []
for path in files:
    text = re.sub(r'```.*?```', '', path.read_text(), flags=re.S)
    for target in re.findall(r'\[[^\]]*\]\(([^)]+)\)', text):
        if re.match(r'[a-zA-Z][a-zA-Z0-9+.-]*:', target) or target.startswith('#'):
            continue
        checked += 1
        if not (path.parent / target.split('#', 1)[0]).exists():
            missing.append(f'{path}: {target}')
print(f'{len(files)} files; {checked} relative links; {len(missing)} missing')
for item in missing:
    print(item)
raise SystemExit(bool(missing))
PY
```

One-time manual instruction walkthrough (wording assessment, not proof of future model behavior):

1. **Material revision — supported.** For a requested migration scope expansion, grill step 2 requires restating the delta, recommending a direction, and settling only unresolved consequential choices before rewriting. Steps 6–7 then require the full written revision and explicit approval before implementation; check step 7 and build steps 2/6 use the same sequence. No drafting-permission round is required.
2. **Trivial correction — supported.** For a plan typo or straightforward path correction, shared Development cycle guidance, grill step 2, build step 2, and both READMEs permit direct editing without reopening scope. This exception does not authorize material implementation changes.
3. **Missing prerequisite — supported.** For a missing service/dependency needed to validate the outcome, shared Scope guidance and grill step 1 require targeted inspection and an explicit fix-now/defer/blocker recommendation with effects exposed, not silent installation or scope expansion. Grill steps 4/6 allow drafting with disclosed assumptions but not pretending a blocked plan is ready; check step 3 retains permission requirements for installation, credentials/paid services, and side effects. Implementation still needs plan approval.
4. **Completed plan with future work — supported.** For an otherwise validated migration with a future web-research queue, shared Documentation guidance, build step 10, and the plan template put agreed future work in separate tasks with useful links while preserving actual migration results and limitations. Build step 10 forbids deferring current-goal failures to claim completion and retains missing validation/reviews as blockers.
5. **Local merge, remote main unchanged — supported.** PR steps 1/7 require distinguishing and reporting both states; step 2 checks prerequisite commits absent from the intended remote base before promising a migration-only diff. If the next request merely says “merge” with an unclear destination, clarify; if it explicitly names an authorized local merge or remote action, do not ask redundantly. PR steps 5/7 retain separate authorization and checks, with no automatic push/merge or exception for directly pushing main.

Final main-session verification: `git diff --check` passed; exact tracked-file scope assertion matched the eight planned files; the link check passed for 10 documents and 9 relative links. The full diff and five scenario assessments were personally reviewed. No workflow edits followed review; only plan/task completion records were updated. `thought.md` remains untouched, and no commits or publishing actions occurred.

Independent `workflow-feature-review`: **PASS**, no findings. Independent `workflow-style-review`: **PASS**, no findings. Both reviewed the actual diff, relevant instructions, and all five scenarios; their scope, consistency, and whitespace checks passed. Feature review independently reran the exact link checker (10 files, 9 links, 0 missing). All commands used 60-second caps with no timeouts. Reviews were read-only and confirm textual consistency, not future model behavior.
