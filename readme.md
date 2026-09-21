# Pi Developer

This repository documents my software development process and contains the .pi setup to onboard and help the agent complete tasks according to my workflow. 

## Starting a new development session  

User `./developer.sh` to open or resume the session. The first call creates a new session and future calls re-open the session. 

When Pi opens, make a request to it in this format: 
```
I want to implement **TASK**. 

Please grill me and propose an implementation plan. 
```

After the plan looks good, ask the agent to implement it according to the plan.
```
The plan looks good. Please build it out and refine it until all feedback loops pass.
```

## Developoment Philosophy 

Every PR should do one concrete thing: implement feature X, refactor interfaces Y, or fix bug Z. Even if I spot a refactor admist implementing a feature, I defer implementing the refactor until I finish the feature or give up and revert all my changes. 

This improves code quality by ensuring all code changes can be auditable towards a clear goal. Is this change needed for X? If yes it stays, if no revert it. Can I do X in a simpler way? If yes then do it, if no needs refactor, wait till later refactor Pr. 

## PR workflow 

I have a simple procedure to make PRs: 
1. Decide on what to build. 
    - Discuss the goal, constraints, and exclusions (i.e. /skill:grill skill), then record agreed decisions/tasks when needed.
    - Have agents write widgets to check libraries do what I want (i.e. /skill:check skill)
    - Write and present a concrete `docs/plans/xx-<plan>.md` with ordered edits and validation for one PR; wait for explicit approval before building.
2. Write the code; either: 
    - Manually implement the code. 
    - Spawn an agent to write the code according to the plan (i.e. /skill:build skill)
3. Run feedback loops until the code is of quality. 
    - Edit until tests pass. 
    - Edit until agents give a correctly implements feature. 
    - Edit until agents give style conformance (libraries are properly injected, comments are collected together before functions, sections are outlined etc.) 
4. PR and merge to main 
    - write a PR respecting the repo's conventions (i.e. /skill:pr skill)
5. Reflect on the process
    - reflect on how I could've done this better
    - check the pi agent trace and edit the pi skills 

## Documentation 

Discuss first, then preserve agreed context in concise records using `templates/`:

1. `docs/decisions/00-<decision>.md` - records an agreed choice, its requirements, rationale, and alternatives; useful for hard-to-reverse choices, not required for every task.
2. `docs/tasks/00-<task>.md` - records the agreed outcome, relevant links, verifiable completion checks, and exclusions when a separate task is useful.
3. `docs/plans/00-<plan>.md` - proposes concrete ordered changes, validation, and risks for one PR before implementation. Decisions/tasks have no approval statuses; plans alone track approval and execution.

Even without a slash command, agreement to a short conversational proposal approves direction only. Create/update a task only when needed, always write/update the concrete plan, present the full document, and wait for explicit approval of that version before building. Reuse relevant documents; approval of the presented plan permits implementation without another planning round.

Plans start `State: PROPOSED`, becoming `APPROVED` only after that presentation and explicit approval; never apply earlier agreement retroactively to an unseen plan. Material revisions return to `PROPOSED` for renewed presentation and approval. Use `IN PROGRESS`, `BLOCKED`, and `COMPLETE` to track execution, not to bypass approval.
