#!/usr/bin/env bash
set -euo pipefail
if [ $# -lt 1 ]; then echo "Usage: $0 /absolute/path/to/eigent"; exit 1; fi
SRC_DIR=$(cd "$(dirname "$0")/.." && pwd)
EIGENT_DIR="$1"
TARGET="$EIGENT_DIR/custom/pm-crew"
mkdir -p "$TARGET/prompts" "$TARGET/contracts" "$TARGET/docs"
rsync -a --delete "$SRC_DIR/prompts/" "$TARGET/prompts/"
rsync -a --delete "$SRC_DIR/agents/contracts/" "$TARGET/contracts/"
rsync -a --delete "$SRC_DIR/docs/" "$TARGET/docs/"
echo "[*] Copied PM Crew assets into $TARGET"
