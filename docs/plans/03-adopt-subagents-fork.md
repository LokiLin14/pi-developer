# Adopt the tested subagents fork

State: COMPLETE

## Goal

Use the `main` branch of `LokiLin14/pi-interactive-subagents` after the user opens a PR and merges the model-default fix. The user controls this local setup and accepts coupling to their fork's moving branch rather than an immutable commit. The fork checkout and its plan are currently at `workspace/pi-interactive-subagents/docs/plans/00-remove-bundled-model-pins.md`; this workspace path is local and ignored, not a distributable dependency.

## Approval and prerequisites

The user approved both presented plans: "looked over both plans, i approve please bring this to completion". Scope approval recorded. The user separately authorized installation, authenticated smoke testing, and fork commit/push with "yup please do". The fork fix is complete and published as `f0453acb672d5c0287f2c36855219cb34c067fc3` on `origin/fix/model-defaults`. The user subsequently requested changing adoption from an immutable commit to `main`, and will open the PR, merge it, and report back. The user subsequently approved the revised main-branch adoption and local commit on the current work branch: "we just need to pin to main instead and check everything still works then commit everything to this branch". Verified remote main resolves to `d3b9a6f947c08035f80adad3498b5f647b7e1d2f`, whose tree matches the tested fork fix exactly. Recorded APPROVED, then IN PROGRESS. No consumer push or merge is authorized; the user will review and merge locally.

## Ordered changes

1. `.pi/settings.json`, packages: replace the Amos upstream source with `git:github.com/LokiLin14/pi-interactive-subagents@main` after the user confirms their merge. Verify the branch contains the intended model-default changes, including if merged by squash rather than preserving the original commit.
2. `developer.sh`, subagents package path and install source: use the LokiLin14 package directory and the same `@main` source. Preserve launch/session arguments and all unrelated behavior; launcher session-flag concerns remain separate work.
3. `.pi/README.md`, dependency/setup guidance: describe the main-branch fork and its model-less bundled defaults, rather than the upstream dependency and provider-specific credentials. Explain that `@main` is a moving branch reference, not an immutable commit or a promise of automatic updates. Verify the installed Pi version's refresh behavior and document how to refresh explicitly; the launcher does not refresh an existing checkout merely because main advanced. Do not change APPEND_SYSTEM.md, add agent instructions, or create local profile overrides.
4. Record validation and review evidence here. Do not delete or revert existing installed package modifications; the new source uses its own package location.

## Validation

- Capture baseline; inspect the diff, parse `.pi/settings.json` as JSON, run `bash -n developer.sh`, and verify source/revision consistency between settings and launcher.
- After merge confirmation and approval to proceed, install the `@main` source using the already-authorized installation/network access. Record the actual resolved commit and verify its model-default changes. Do not run the working launcher merely to test installation because it also starts/resumes a session.
- Repeat the fresh-clone end-to-end test with `@main` and an empty project package cache. Verify the actual installed revision and all three default-model subagent completions. The earlier immutable-pin E2E pass is supporting evidence, not proof of this branch-based adoption.
- In a fresh/reloaded authorized Pi session, verify the loaded package source and that scout/researcher/worker have no model pins. Perform a minimal worker spawn without an override and record its reported model plus expected default/scope selection.
- Run independent read-only feature/style reviews and `git diff --check`; preserve existing unrelated changes and report baseline issues separately.

## Risks and exclusions

Wait for the user's PR/merge confirmation and approval to proceed; do not open or merge the PR on their behalf. Main may move between installations; record the tested resolved revision rather than claiming reproducibility from the branch name. Pi may treat explicit refs as pinned for update purposes, so verify refresh behavior instead of promising automatic tracking. Package installation can require network and trust approval. An already-running session may retain the old extension. Never use a successful spawn from the old installation as evidence for adoption.

No launcher behavior fix, availability notifications, retry policy, parent-current-model inheritance, credential edits, session-trace inspection, consumer pushes, or PR actions. A local commit on `fix/inital-worker-subagent-models-not-available` is now explicitly authorized; merging remains the user's separate action. The publishing-safety instruction plan stays deferred.

## Implementation results

Initial fork publication (before consumer implementation): fork commit `f0453acb672d5c0287f2c36855219cb34c067fc3` was committed and pushed to `LokiLin14/pi-interactive-subagents` branch `fix/model-defaults` with authorization. Both independent reviews and the real model-less worker smoke test passed. Fork validation limitations: one full-unit-suite failure also reproduced on unchanged HEAD, four narrow-pane tmux surface failures, stale lifecycle tests not run, and 13 install-reported dependency vulnerabilities. See the fork plan for full evidence. No PR was opened or merged. The user subsequently approved main-branch adoption and a local commit after merging the fork. The following first E2E check describes the earlier immutable-pin proposal and is retained as historical validation.

### Evidence cleanup

The user approved removing the one-off probe script while retaining validation commands, outcomes, resolved revisions, and limitations here. Deleted `docs/evidence/00-fresh-clone-e2e.mjs` after validation and removed its link below. Script paths in the historical command records describe past runs, not currently available commands. The completed adoption is unchanged; no paid tests were rerun for this documentation-only cleanup. `git diff --check` and relative-link checks passed; the standalone probe is confirmed absent.

### Main-branch adoption validation

- User-approved merge verified: `git fetch origin main` in the fork resolved `d3b9a6f947c08035f80adad3498b5f647b7e1d2f`. `git diff f0453acb672d5c0287f2c36855219cb34c067fc3 origin/main --stat` was empty: main's tree matches the reviewed/tested fix.
- Updated only `.pi/settings.json`, the package path/source in `developer.sh`, and dependency guidance in `.pi/README.md`. Preserved the user's existing `.gitignore` workspace exclusion. No APPEND_SYSTEM.md edits or local profile overrides. Deferred publishing-safety instructions remain unimplemented.
- `pi install --approve -l git:github.com/LokiLin14/pi-interactive-subagents@main`: successful fresh installation in the working repository, resolving main to `d3b9a6f...`. Repeating the same command successfully fetched main for the existing checkout, validating the explicit refresh instructions. Old installed package modifications remain untouched.
- Created `workspace/pi-developer-main-e2e` with `git clone --no-local .`, then copied only the three consumer files under review. Confirmed no project package cache/session directory existed before the run.
- `node docs/evidence/00-fresh-clone-e2e.mjs /home/lucas/Sessions/pi-developer/workspace/pi-developer-main-e2e`: PASS. The real launcher fetched `@main`, RPC discovery identified that clone's installed package source, and all three package profiles had no model pin. Actual worker/scout/researcher spawn arguments omitted `model`; all three exited 0 and completion metadata reported `gpt-6-astra`. Worker reported `openai-codex`, `gpt-6-astra`, `medium`; scout read the README; researcher returned the marker without web access. Parent exited 0 after deliberate test teardown. Installed clone HEAD independently verified as `d3b9a6f...`.
- `bash -n developer.sh`, JSON parsing, `node --check docs/evidence/00-fresh-clone-e2e.mjs`, source-consistency assertions, relative-link checks, and `git diff --check`: all passed.
- Independent `adoption-feature-review`: PASS, no blocking findings. Independent `adoption-style-review`: PASS, no blocking findings. Both requested replacing stale pre-implementation status text; this record now distinguishes completed main adoption from historical pinned-revision evidence. The optional suggestion to assert every completion's model in the probe is deferred: all three model fields were observed and recorded, while the probe asserts all exits/markers and the worker's reported model. No implementation edits followed review.
- Baseline copies of the three changed consumer files are at `/tmp/pi-adoption-baseline.NrhnhT`. Final diff and syntax/link checks passed. Implementation and validation are complete; the user authorized a local commit on `fix/inital-worker-subagent-models-not-available`. No consumer push or merge is authorized or performed; final review and local merge belong to the user.

The discarded RPC probe was specific to this machine's expected model and deliberately asserted the observed configured default. It was an opt-in authenticated test, not a generic offline test suite. The earlier caveats about trust, existing user credentials, researcher web-tool coverage, and other providers apply to this main-branch rerun as well.

### Fresh-clone end-to-end check (earlier immutable-pin proposal)

Verdict: PASS for clean project initialization, package loading, and all three default-model subagent starts/completions on this configured machine.

1. `git clone --no-local . workspace/pi-developer-e2e` created a fresh clone of Pi Developer commit `a57cf62afc23f7a9d4dda6e6ff8fbc83eced4c2f`. Confirmed no installed project package checkout or `.pi-session/` was copied.
2. Applied only the proposed `.pi/settings.json` fork pin and `developer.sh` package path/install-source replacements inside that clone. No profile overrides, copied package cache, modified role definitions, or session-argument changes.
3. Ran `node /tmp/pi-fresh-clone-e2e.mjs /home/lucas/Sessions/pi-developer/workspace/pi-developer-e2e`. The one-off RPC probe was discarded after validation with user approval. It started the actual `./developer.sh --mode rpc --approve`, consumed live RPC events rather than polling session files, and asked the real parent model to discover and spawn worker/scout/researcher without model overrides.
4. The launcher installed the fork from GitHub at exact commit `f0453acb672d5c0287f2c36855219cb34c067fc3`. RPC command discovery identified the extension source under this clone's `.pi/git/github.com/LokiLin14/pi-interactive-subagents/`, not the old installed package or workspace source. The package install reported zero vulnerabilities for its production install; this does not negate the earlier development-dependency audit report.
5. `subagents_list` returned all three package profiles without model fields. All three actual spawn requests omitted `model`. Worker exited 0 and returned `openai-codex`, `gpt-6-astra`, `medium`; scout exited 0 after reading the README heading; researcher exited 0 with its requested marker and no web calls. Completion statistics reported `gpt-6-astra` for all three, matching the saved user default. The probe exited successfully after all results; it intentionally terminated its idle RPC parent with SIGTERM (launcher exit 143 is expected teardown, not a failed spawn).
6. Verified installed package HEAD equals the pin and `git diff -- agents` is empty. Clone diff contains only the two intended consumer files. The working Pi Developer configuration and launcher remain unchanged.

Limitations: this is a clean project clone using the user's existing authenticated Pi installation/defaults and tmux, not a clean machine or new account. `--approve` explicitly grants project trust for the RPC run; interactive trust prompts were not tested. Researcher provider startup was tested, not optional web-tool dependencies or web services. Session resume and other providers were not tested. The existing `--session-id pi` launcher argument worked on this installed runtime, creating a new named session; the earlier documentation-based concern did not block this run. Scratch clone and runtime artifacts remain in ignored `workspace/`; no private session traces were read.
