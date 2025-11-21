#!/usr/bin/env bash
set -euo pipefail

show_help() {
cat <<'EOF'
Usage: speckit-constitution.sh [--message "decisão"] [--version X.Y.Z] [--help]
Atualiza constituição da feature e global.
EOF
}

MSG=""
VER=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --message) MSG="$2"; shift 2;;
    --version) VER="$2"; shift 2;;
    --help|-h) show_help; exit 0;;
    *) echo "Unknown arg: $1"; show_help; exit 1;;
  esac
done

ROOT="$(CDPATH="" cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
GLOBAL="$ROOT/.specify/memory/constitution.md"
FEATURE="${SPECIFY_FEATURE:-1-speckit-framework}"
FEATURE_FILE="$ROOT/specs/$FEATURE/constitution.md"

if [[ ! -f "$GLOBAL" ]]; then
  echo "ERROR: constituição global não encontrada em $GLOBAL" >&2
  exit 1
fi

if [[ -n "$VER" ]]; then
  sed -i "s/^\\*\\*Version\\*\\*: .*/**Version**: $VER/" "$GLOBAL" || true
fi

if [[ -n "$MSG" ]]; then
  {
    echo "## Decision ($(date +%Y-%m-%d))"
    echo "- $MSG"
  } >> "$GLOBAL"
fi

mkdir -p "$(dirname "$FEATURE_FILE")"
if [[ ! -f "$FEATURE_FILE" ]]; then
  cp "$GLOBAL" "$FEATURE_FILE"
else
  [[ -n "$MSG" ]] && printf "\\n- %s\\n" "$MSG" >> "$FEATURE_FILE"
fi

echo "Constitution updated${VER:+ version=$VER}${MSG:+ message added}"
