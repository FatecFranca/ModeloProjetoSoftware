#!/usr/bin/env bash
set -euo pipefail

show_help() {
cat <<'EOF'
Usage: speckit.tasks.sh [--validate tasks.json] [--help]
Generates or validates tasks for SPEC KIT. This stub focuses on schema validation.
Options:
  --validate <file>   Validate tasks.json against contracts/tasks.schema.json
  --help              Show this help
EOF
}

VALIDATE=
while [[ $# -gt 0 ]]; do
  case "$1" in
    --validate) VALIDATE="$2"; shift 2;;
    --help|-h) show_help; exit 0;;
    *) echo "Unknown argument: $1"; show_help; exit 1;;
  esac
done

REPO_ROOT="$(CDPATH="" cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
SCHEMA="$REPO_ROOT/specs/1-speckit-framework/contracts/tasks.schema.json"

if [[ -n "$VALIDATE" ]]; then
  FILE="$VALIDATE"
  if [[ ! -f "$FILE" ]]; then
    echo "ERROR: tasks file not found: $FILE" >&2
    exit 1
  fi
  if command -v npx >/dev/null 2>&1; then
    npx --yes ajv-cli validate -s "$SCHEMA" -d "$FILE" || exit 1
  elif command -v jq >/dev/null 2>&1; then
    # Basic structural check with jq if ajv not available
    jq -e 'type=="array" and (length<=500)' "$FILE" >/dev/null
  else
    echo "WARNING: neither ajv nor jq available; skipping validation" >&2
  fi
  echo "Validation completed for $FILE"
  exit 0
fi

show_help
