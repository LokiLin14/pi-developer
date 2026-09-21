---
name: pr
description: Prepare or open a single-purpose pull request using repository conventions and verified validation evidence. Use after implementation and review; merging requires explicit authorization.
---

# PR

Arguments may identify a plan, branch, existing PR, or request to publish; clarify ambiguity before remote actions.

1. Inspect repository contribution rules, PR templates (including `.github/` when present), branch/commit conventions, remotes, current branch, working tree, and relevant existing decision/task/plan records. Determine the intended base branch; do not assume it is `main`. Do not switch branches or disturb unrelated work without permission.
2. Inspect the entire proposed PR diff and commit history against the base (normally using the merge base / three-dot diff), not just uncommitted changes. Confirm that it serves one concrete goal, contains no secrets or scratch artifacts, and includes only authorized changes. If it mixes unrelated goals, stop and propose a split.
3. Check acceptance criteria, test evidence, feature-review verdicts, and style-review verdicts. Validation must cover the current diff, not a previous version. Run required checks or clearly report blockers; never describe unrun tests as passing. Resolve in-scope blockers with `/skill:build`, not by silently expanding the PR.
4. Draft a title and body matching the repository template and conventions. Include the problem, concise change summary, links to relevant decisions/tasks/plans that exist, tests with actual results, and relevant compatibility/rollout risks. Do not require a decision for every task or manufacture documents merely for publication. Keep the description focused and auditable.
5. If the user only requested preparation, return the draft and proposed commands. Before committing, pushing, or opening a PR, confirm authorization for those actions and the target remote/base. Push changes to a work branch, never directly to main (or the repository's equivalent default branch); merging is a separate step requiring explicit approval. When authorized, stage explicit task-owned paths after inspecting their contents; do not use blanket staging that could capture user work. Never force-push or bypass hooks/checks.
6. Use the repository's hosting tooling (for example `gh` for GitHub) only if installed and authenticated. Check for an existing PR on the branch before creating another. If tooling or permissions are unavailable, provide the draft and exact next steps rather than claiming publication succeeded.
7. After publication, report the actual PR URL and CI status, distinguishing pending from passed. Do not merge unless explicitly requested, required checks pass, and approvals/branch policies permit it. Do not delete branches without permission.
8. Offer a short reflection: what caused rework, what evidence should have been gathered earlier, and one improvement for the next task. With permission, inspect only the relevant pi session trace, avoid copying credentials/private content, and propose a focused skill change as separate work. Do not bundle process refactors into this PR.

Done means a truthful, ready-to-review draft or an actual published PR, with any remaining blockers explicit. Opening a PR does not imply it was merged.
