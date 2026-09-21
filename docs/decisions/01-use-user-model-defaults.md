# Use user model defaults for subagents

## Requirements

Bundled subagent profiles hardcode an OpenRouter model that is unavailable to users without that provider's credentials. Avoid machine-specific model names and modifications to installed package files.

## Final Decision

The user subsequently chose to maintain `LokiLin14/pi-interactive-subagents` instead of project-local profiles. The current decision and implementation proposal live in that fork's `docs/` directory. Retain the discussion below as rationale/history, not instructions to create local profiles. Saved-default behavior remains the goal; availability notifications are deferred.

### Earlier approach (replaced)

Provide project-local `scout`, `researcher`, and `worker` profiles under `.pi/agents/`, preserving the installed profiles' roles and permissions but omitting `model:`. Local profiles override bundled profiles, allowing fresh child Pi processes to use normal startup model selection.

This follows saved user/project defaults and model scopes, not necessarily the parent's current model. Explicit spawn overrides remain available. Missing defaults may fall back to another configured model; configured credentials do not guarantee a successful request. Existing child sessions may restore their earlier model.

The installed extension forwards profile thinking levels only alongside an explicit model, so model-less launches also use Pi's thinking defaults. Local copies must be reviewed when updating the dependency.

## Alternatives considered

- Hardcode a known-working model: simple but machine-specific, reproducing the portability problem.
- Pass the parent's current model on every spawn: useful as an override, but depends on callers remembering it.
- Change the extension to inherit the current parent model: automatic but requires upstream/fork maintenance; unnecessary for the chosen saved-default behavior.

## Related work

- [Implementation plan](../plans/02-use-user-model-defaults.md)
