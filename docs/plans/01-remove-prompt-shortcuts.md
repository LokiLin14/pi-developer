# Remove redundant prompt shortcuts

State: COMPLETE

## Goal

Use native skills instead of maintaining four prompt wrappers. Keep all four skills and their procedures. No separate task or decision is needed for this small, agreed simplification.

## Approval

The user approved this presented plan with "looks good". Approval recorded; transitioned from PROPOSED through APPROVED to IN PROGRESS.

## Ordered changes

1. Delete `.pi/prompts/{grill,check,build,pr}.md`, which only dispatch to the corresponding skills. Remove the directory if empty.
2. In `.pi/README.md`, simplify the commands table to native `/skill:grill`, `/skill:check`, `/skill:build`, and `/skill:pr` commands. Remove wrapper/conflict guidance and update the typical flow. Note that ordinary requests can also cause the agent to load the relevant skill.
3. In `readme.md` and `.pi/APPEND_SYSTEM.md`, replace shortcut command references with native skill commands. Remove the prompt-directory repository-map entry and the description of prompt templates as a repository artifact. Preserve all other workflow rules and existing user edits.
4. In `.pi/skills/{grill,build,pr}/SKILL.md`, update cross-skill command references to `/skill:<name>` without changing procedures. Audit the check skill; no edit is expected.
5. Leave completed historical decision/task/plan records unchanged. Record validation and review results here.

## Validation

- Confirm the four wrapper files are absent and all four skill files remain.
- Search current first-party onboarding and skill instructions for stale short commands and prompt-wrapper references; inspect matches rather than replacing path fragments blindly.
- Inspect the final diff and compare pre-existing untracked files against a captured baseline. Run `git diff --check`, distinguishing existing README whitespace findings from new errors.
- Obtain independent feature and style reviews. No application tests or provider/network probes are needed for this deletion and documentation-only change.

## Risks and exclusions

Existing users must use native skill commands rather than the removed shortcuts. Do not change skill behavior, templates, launcher/configuration, installed packages, or session traces. No commits or publishing actions are authorized.

## Implementation results

Removed all four wrappers and the empty `.pi/prompts/` directory. Updated the three onboarding files and command references in grill/build/pr; check remains unchanged. No commits or publishing actions performed.

Validation against `/tmp/pi-shortcuts-baseline.HWWzb6`:

- `test ! -e .pi/prompts` passed; `find .pi/skills -name SKILL.md -print` lists all four skills.
- Baseline-relative `diff -u` / `diff -ru` inspected in the main session: changes limited to planned deletion and guidance updates.
- Scoped `rg` search for short commands and prompt-wrapper wording in `readme.md`, `.pi/README.md`, `.pi/APPEND_SYSTEM.md`, and `.pi/skills`: no matches (exit 1).
- Main-session Python assertions passed: no new whitespace diagnostics from per-file `git diff --no-index --check`; all skill changes equal only the expected native-command substitutions; README startup content byte-identical; wrappers absent.
- `cmp /tmp/pi-shortcuts-baseline.HWWzb6/.pi/skills/check/SKILL.md .pi/skills/check/SKILL.md`: exit 0.
- `git diff --check`: exit 2, only the five pre-existing README startup whitespace findings at lines 5, 7, 9, 11, and 13. These user changes were preserved.
- Independent `shortcuts-feature-review`: PASS, no actionable findings; commands, retained skills, ordinary-request guidance, and safety gates verified.
- Independent `shortcuts-style-review`: PASS, no actionable findings; minimal scope, Markdown consistency, preserved procedures/startup, and no new whitespace issues verified.

Limitations: historical records were not included in the baseline, so byte-for-byte historical immutability is unverified. Neither implementation worker nor main reported editing them during this task. Baseline snapshots are temporary local evidence. No application tests or network probes were needed for this documentation/deletion-only change.
