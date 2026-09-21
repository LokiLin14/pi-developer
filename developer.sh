#!/usr/bin/env bash
set -euo pipefail

# Resolve project-local dependencies and sessions relative to this script.
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"

# Keep the extension project-local, matching .pi/settings.json.
subagents_dir=".pi/git/github.com/amosblomqvist/pi-interactive-subagents"
if [[ ! -f "$subagents_dir/package.json" ]]; then
  echo "Installing interactive subagents..."
  pi install -l git:github.com/amosblomqvist/pi-interactive-subagents
fi

# Reuse a fixed session so calling ./developer.sh resumes the session.
session_dir="./.pi-session"
session_id="pi"

exec pi \
  --session-dir "$session_dir" \
  --session-id "$session_id" \
  "$@"
