# Developer setup

## Start

Open pi in the repository root and trust the project when prompted. Project packages are installed automatically after trust; restart pi after adding this setup. For subagents, start pi inside tmux:

```sh
tmux new -A -s pi-developer 'pi'
```

`settings.json` declares the same `git:github.com/amosblomqvist/pi-interactive-subagents` dependency used by `~/Git/Personal/pi-theory-tutor/.pi/settings.json` (the tutor's actual location on this machine). It supplies the `scout`, `researcher`, and `worker` agents; this setup does not need the tutor's diagram agents or teaching extensions. No tutor model/provider defaults are copied.

The dependency is unpinned, matching the tutor. Its bundled agent models need their own provider credentials, independently of the main session's model. Inspect available profiles with `subagents_list`; choose an available model override when spawning if needed. Without tmux or working subagents, the skills offer an explicit main-session fallback rather than pretending agents ran. Third-party extensions execute code with your permissions: review the package before trusting/installing it.

## Commands

| Native skill command | Purpose |
| --- | --- |
| `/skill:grill <idea>` | Discuss the goal, record agreed context, and propose a plan for approval |
| `/skill:check <claim>` | Run small library probes and record evidence |
| `/skill:build <plan-path>` | Implement an approved plan and iterate on checks/reviews |
| `/skill:pr <plan-path or request>` | Prepare a conventional PR; publish only when authorized |

The skills live in `skills/`. Ordinary requests can also cause the agent to load the relevant skill. Pi automatically appends [APPEND_SYSTEM.md](APPEND_SYSTEM.md) to the system prompt for sessions started in this repository root, providing repository orientation and shared scope, documentation, approval, and delegation rules even when no skill is invoked. The skills supply the detailed procedures without requiring a separate workflow read.

Typical flow: `/skill:grill` → `/skill:check` for uncertain assumptions → present the written plan → explicitly approve that plan → `/skill:build` → `/skill:pr` → reflect. Investigation does not approve implementation, and implementation does not authorize publishing or merging.

Documentation follows the root README and `templates/`: discuss first, then record agreed choices and tradeoffs in decisions when needed, and outcomes, completion checks, and exclusions in tasks when useful. Neither needs approval statuses, and a task need not invent a decision. Plans propose concrete ordered edits, validation, and risks for one PR before building.

Even without a slash command, agreement to a short conversational proposal approves direction only. Create/update a task only when needed; always write/update the concrete plan document, present it in full, and wait for explicit approval of that version. Reuse relevant documents; approval of the presented plan permits implementation without another planning round.

Plans start `State: PROPOSED`. Only explicit approval after presentation permits `APPROVED`; earlier agreement never retroactively approves an unseen plan. Material revisions return to `PROPOSED` for renewed presentation and approval. `IN PROGRESS`, `BLOCKED`, and `COMPLETE` track execution, not approval.
