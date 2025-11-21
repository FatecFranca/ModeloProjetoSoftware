#!/usr/bin/env bash
set -euo pipefail

show_help() {
cat <<'EOF'
Usage: speckit-init.sh [--dry-run] [--help]
Prepara estrutura SPEC KIT: .specify/, specs/, .github/prompts/.
EOF
}

DRYRUN=false
while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) DRYRUN=true; shift;;
    --help|-h) show_help; exit 0;;
    *) echo "Unknown arg: $1"; show_help; exit 1;;
  esac
done

ROOT="$(CDPATH="" cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
mkdir_cmd() {
  local dir="$1"
  if $DRYRUN; then echo "DRY: mkdir -p $dir"; else mkdir -p "$dir"; fi
}

copy_if_missing() {
  local src="$1" dst="$2"
  if [[ -f "$dst" ]]; then
    echo "KEEP: $dst já existe"
  else
    if $DRYRUN; then echo "DRY: cp $src $dst"; else cp "$src" "$dst"; fi
  fi
}

mkdir_cmd "$ROOT/.specify/templates"
mkdir_cmd "$ROOT/.specify/scripts/bash"
mkdir_cmd "$ROOT/.specify/scripts/powershell"
mkdir_cmd "$ROOT/specs"
mkdir_cmd "$ROOT/.github/prompts"

# Copiar exemplos se existirem
copy_if_missing "$ROOT/.specify/config.example.json" "$ROOT/.specify/config.json"

echo "Init completo${DRYRUN:+ (dry-run)}"
