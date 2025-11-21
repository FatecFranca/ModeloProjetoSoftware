#!/usr/bin/env bash
set -euo pipefail

show_help() { cat <<'EOF'
Usage: speckit-implement.sh [--help]
Stub placeholder; to be implemented.
EOF
}

case "${1:-}" in --help|-h) show_help; exit 0;; esac
show_help
