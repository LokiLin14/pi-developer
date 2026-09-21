---
name: check
description: Verify risky library or API assumptions with small executable probes, preferably delegated to agents, and record reproducible evidence before committing to a design.
---

# Check

Arguments identify a library, behavior, or linked task/plan to investigate.

1. Read the relevant requirements, manifests, lockfiles, and runtime configuration. Identify the actual library version and environment. If no specific claim is given, ask what behavior needs proving.
2. Turn each assumption into a falsifiable claim: expected input/output or observable behavior, failure cases, and an explicit pass/fail criterion. Distinguish documentation research from executable evidence.
3. Propose the smallest standalone widget/probe that tests the real library, not a mock of the claim. Include relevant edge and negative cases. Avoid building the feature. Ask before installing dependencies, using credentials or paid services, or performing destructive/network side effects.
4. Discover available agents. Delegate independent probes to `worker` agents, giving each a unique scratch directory and a narrow hypothesis. Use `researcher` for sourced API/version context when useful. Probes may not alter production source, manifests, or lockfiles. Use temporary environments outside the repo unless a tracked probe location is agreed.
5. Require each result to include:
   - Hypothesis and pass/fail criterion.
   - Library/runtime versions and setup steps.
   - Probe path, source or a durable minimal reproduction, and exact execution command.
   - Expected versus actual output and exit status.
   - Conclusion: verified, falsified, or inconclusive, with limitations.
6. Wait for agent completion. Inspect probe code and rerun the decisive checks when possible. A mock, missing credential, unavailable service, or tool failure is not proof that the real library works or fails. Report contradictions explicitly.
7. Save compact evidence in the linked task/plan; for a standalone investigation, capture the investigation agreed with the user in a narrowly scoped task without inventing a technology decision. Preserve a reproducible snippet or agreed tracked probe before removing any scratch files you created. If evidence challenges an agreed choice, return to discussion before revising that decision; keep unresolved recommendations in findings/open questions. Material plan changes return to `PROPOSED` and require presentation of the full revised plan and renewed explicit approval before implementation.
8. Report the claim verdicts, evidence paths, and recommendation: proceed, change the approach, or investigate further. Do not implement the production feature.
