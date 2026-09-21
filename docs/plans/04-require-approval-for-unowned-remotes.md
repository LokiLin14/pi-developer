# Publish to work branches

State: COMPLETE

## Goal

Keep publishing guidance simple: push changes to a work branch, not main, and treat merging as a separate step.

## Approval

The user approved this revised plan with "approve" after presentation. Recorded APPROVED, then IN PROGRESS on `fix/publishing-safety`. No commit, push, or merge authorized.

## Ordered changes

1. `.pi/APPEND_SYSTEM.md`, Scope and safety: replace this branch's three added publishing bullets with one sentence: "Push changes to a work branch, never directly to main (or the repository's equivalent default branch); merging is a separate step requiring explicit approval."
2. `.pi/skills/pr/SKILL.md`: remove this branch's expanded ownership and merge wording, preserving the original authorization and merge gates. Add only the same concise work-branch rule to the publishing step.

## Validation

Review the diff against main: only the concise branch rule should be added to each instruction file, with existing authorization safeguards unchanged. Run `git diff --check` and independent feature/style reviews. Record results here; no application tests or paid probes are needed.

## Implementation results

Implemented the identical concise rule in both instruction files, replacing the broader uncommitted additions.

- `git diff --check`: passed.
- Python comparison with `git show main:<path>`: removing the one added sentence from each file reproduces main exactly; all existing safeguards remain unchanged.
- Independent feature re-review: PASS, no correctness findings.
- Independent style re-review: PASS, no actionable findings.

No application tests or paid probes needed. Changes remain uncommitted on `fix/publishing-safety`; no pushes or merges performed.
