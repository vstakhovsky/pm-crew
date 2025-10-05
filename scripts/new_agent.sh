#!/usr/bin/env bash
set -euo pipefail
if [ $# -lt 1 ]; then echo "Usage: $0 <WorkerName>"; exit 1; fi
NAME="$1"
SCHEMA="agents/contracts/${NAME}.json"
PROMPT="prompts/${NAME}.md"
[ -e "$SCHEMA" -o -e "$PROMPT" ] && { echo "Files already exist"; exit 1; }
cat > "$SCHEMA" <<'JSON'
{"$schema":"https://json-schema.org/draft/2020-12/schema","title":"<WorkerName> Input","type":"object","properties":{"goal":{"type":"string"}},"required":["goal"]}
JSON
cat > "$PROMPT" <<'MD'
# <WorkerName>
## System
Verification > speed; ground in PRD/ADR/Spec.
MD
echo "[*] Created $SCHEMA and $PROMPT"
