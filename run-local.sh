#!/bin/bash
# Run pr-agent in local mode with Ollama (qwen3.5:27b on RTX 5090)
# Usage: ./run-local.sh [target-branch] [command] [extra-args...]
#   e.g.: ./run-local.sh main review
#         ./run-local.sh main describe
#         ./run-local.sh main improve
#         ./run-local.sh main ask "is this code safe?"

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
VENV="$SCRIPT_DIR/.venv"

TARGET_BRANCH="${1:-main}"
COMMAND="${2:-review}"
shift 2 2>/dev/null || true

source "$VENV/bin/activate"
exec python -m pr_agent.cli --pr_url="$TARGET_BRANCH" "$COMMAND" "$@"
