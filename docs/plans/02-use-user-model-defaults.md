# Use project-local model-less subagent profiles

State: BLOCKED

Superseded before implementation: the user chose to maintain a fork instead of project-local profiles. Do not execute this plan. The replacement package plan is in the local fork at `workspace/pi-interactive-subagents/docs/plans/00-remove-bundled-model-pins.md`; consumer adoption is covered by [plan 03](03-adopt-subagents-fork.md).

## Goal and linked decision

Make fresh subagents use normal Pi startup model selection instead of a bundled hardcoded provider. See the [agreed decision](../decisions/01-use-user-model-defaults.md). No separate task document is needed for this focused change.

## Approval

Awaiting approval of this written plan. Agreement to project-local profiles establishes direction, not implementation approval. Approval of this plan also authorizes one minimal authenticated worker smoke test, plus the normal implementation/review agents; no dependency installation or credential-file inspection is needed.

## Ordered changes

1. Add `.pi/agents/{scout,researcher,worker}.md`. Copy the corresponding installed bundled profiles, deleting the `model:` line only. Preserve role bodies, tool allowlists, spawn restrictions, thinking fields, system-prompt mode, and auto-exit behavior. Do not use an empty model field or merge partial profiles: project profiles replace bundled definitions in full.
2. Update `.pi/README.md`, setup and prerequisites, to describe local profile precedence and normal saved-default selection instead of requiring credentials for the bundled hardcoded models. Explain that current-session model selection is distinct from saved defaults, project settings/scopes may affect selection, and explicit spawn overrides remain available. Note that model-less launches currently use Pi's thinking defaults even though inherited profile thinking fields remain present. Document local-copy maintenance and the need for fresh spawns rather than resuming an old pinned run.
3. Update `.pi/APPEND_SYSTEM.md`, repository map and Delegation, to identify `.pi/agents/` and explain that these profiles omit model pins. Instruct callers to omit spawn model overrides by default, using an explicit override only when requested or agreed to address a model-selection blocker. Preserve all safety, approval, and review rules.
4. Record verification and review evidence here. Leave completed historical documents and installed package files unchanged. Existing temporary package model edits become shadowed by the local profiles; their cleanup is not required for this fix.

## Validation

- Capture pre-edit baselines; inspect `git status --short` and `git diff --check`. Record existing failures separately.
- Compare each local profile byte-for-byte with its bundled counterpart after removing exactly the `model:` line. Check that three discoverable profiles exist and none contains a model field; all role/permission fields are preserved.
- Call `subagents_list` to verify discovery shows all three local profiles without pinned model labels. Inspect the extension's actual discovery code if the result differs; do not assume a reload solved it.
- Perform one minimal new worker spawn with no `model` parameter, asking it to run `printenv PI_PROVIDER PI_MODEL PI_REASONING_LEVEL` and report the values without editing files or accessing credential/session files. It should complete using normal Pi defaults rather than a bundled hardcoded selection. Record the exact spawn request, reported model, and outcome. Comparing discovery and source selection prevents a coincidental match to the temporary package model from being mistaken for proof.
- Confirm effective startup default/scope selection using only model-related settings fields if needed; never print entire private configuration or authentication files. Scope-specific or custom-provider behavior beyond the tested environment remains a documented limitation.
- Run independent read-only feature and style reviews after edits finish. Inspect the final diff, run `git diff --check`, verify relative links, and check that no machine-specific model pin was introduced into first-party configuration.

## Risks and exclusions

Static inspection of Pi 0.86.1 and the installed extension supports this approach; the model-less spawn path has not yet been exercised. Model selection is not an authentication guarantee. Extension-only custom providers may be unavailable in restricted children using `--no-extensions`; do not weaken tool isolation to work around that.

No extension implementation changes, model pins, credential changes, package updates, launcher fixes, automatic fallback policy, or session-trace inspection. Preserve existing package edits, including its unrelated lockfile change. If discovery or the smoke test contradicts the design, stop and report the blocker before changing architecture. No commits, pushes, or PR actions are authorized.

## Implementation results

Not started. Source investigation found model precedence in the installed extension's `pi-extension/subagents/index.ts`: explicit spawn override, then profile model, otherwise no `--model`. Project profiles replace bundled definitions; Pi then selects from effective startup settings/scopes for fresh sessions. These findings are not yet executable evidence for the proposed local configuration.
