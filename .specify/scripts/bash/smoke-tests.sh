#!/usr/bin/env bash
set -euo pipefail

# Smoke tests for SPEC KIT commands (help/dry-run). Safe no-op if scripts missing.

SCRIPT_DIR="$(CDPATH="" cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"

run_help() {
    local cmd="$1"
    shift || true
    if [[ -x "$cmd" ]]; then
        echo "==> $cmd $*"
        "$cmd" "$@" >/dev/null
    else
        echo "SKIP: $cmd not found or not executable"
    fi
}

# Bash scripts (expected)
run_help "$SCRIPT_DIR/speckit-init.sh" --help || true
run_help "$SCRIPT_DIR/speckit-specify.sh" --help || true
run_help "$SCRIPT_DIR/speckit-plan.sh" --help || true
run_help "$SCRIPT_DIR/speckit.tasks.sh" --help || true
run_help "$SCRIPT_DIR/speckit-checklist.sh" --help || true
run_help "$SCRIPT_DIR/speckit-implement.sh" --help || true

# Optional validator
run_help "$SCRIPT_DIR/validate-spec-kit.sh" --help || true

# Optional lint (skip if unavailable)
if command -v shellcheck >/dev/null 2>&1; then
    echo "==> shellcheck (selected scripts)"
    shellcheck "$SCRIPT_DIR"/speckit-*.sh "$SCRIPT_DIR"/smoke-tests.sh || true
else
    echo "SKIP: shellcheck not found (ok to skip)"
fi
