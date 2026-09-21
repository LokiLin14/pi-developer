# Document the workspace convention

State: COMPLETE

## Change

Add one entry to `.pi/APPEND_SYSTEM.md`, Repository map:

> `workspace/`: clone repositories being worked on into `workspace/<repo-name>/`; reuse existing checkouts when appropriate. Treat each checkout as a separate repository: run Git commands there and keep its decisions, tasks, and plans in its own `docs/` directory.

No skill changes or repository cloning. Work on `docs/workspace-convention`; no commits, pushes, or merges authorized.

## Approval and validation

The user approved the written plan: "just looked at it, approved". Recorded APPROVED, then IN PROGRESS. Implemented the single repository-map entry. Main diff inspection confirmed exactly one instruction insertion, with all other wording unchanged. `git diff --check` passed. Independent feature and style reviews both passed with no findings. No cloning, commits, pushes, or merges performed; changes remain uncommitted on `docs/workspace-convention`.
