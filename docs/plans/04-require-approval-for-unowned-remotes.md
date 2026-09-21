# Protect publishing destinations and keep merging separate

State: PROPOSED

## Goal

Prevent publishing to an upstream or other unowned repository without explicit permission for that destination, even after implementation-plan approval. Publish work to a non-main branch; merging into main is a separate step requiring explicit authorization.

## Approval

Deferred at the user's request until the current subagent-fork adoption is finished. Awaiting approval of this full written change before implementation. No instruction files changed yet.

## Ordered changes

1. `.pi/APPEND_SYSTEM.md`, Scope and safety: add: "Before pushing, verify the exact destination repository and whether the user owns it. Never push to a repository the user does not own without explicit approval naming that destination, even after plan approval or general publishing authorization. If ownership or destination is unclear, ask first."
2. `.pi/APPEND_SYSTEM.md`, Scope and safety: also require publishing to a non-main work branch, never pushing implementation changes directly to main (or the repository's equivalent integration/default branch). Confirm the target branch before publishing. Treat merging as a separate step requiring explicit authorization; plan approval and push authorization do not authorize merging.
3. `.pi/skills/pr/SKILL.md`, publishing and merge steps: require the same ownership/destination check, a non-main work branch, and separate merge authorization. Inspect repository branch conventions rather than assuming the integration branch is named main. Preserve existing commit/push/PR authorization and merge checks even for user-owned repositories.

## Validation

Check both instructions agree, retain existing approval gates, and cover owned, unowned, and unknown-ownership destinations. Verify that authorization to push targets a work branch, not main; a differently named default branch gets the same protection; and neither implementation nor publishing approval authorizes a merge. Run `git diff --check` and independent feature/style reviews before recording completion.

## Implementation results

Not started. Verified the previous fork push already targeted `git@github.com:LokiLin14/pi-interactive-subagents.git`, branch `fix/model-defaults`, commit `f0453acb672d5c0287f2c36855219cb34c067fc3`. `git ls-remote origin refs/heads/fix/model-defaults` confirms that commit exists on the user's fork. No upstream push occurred.
