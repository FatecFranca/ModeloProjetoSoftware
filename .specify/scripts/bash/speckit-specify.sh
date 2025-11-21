#!/usr/bin/env bash
set -euo pipefail

show_help() {
cat <<'EOF'
Usage: speckit-specify.sh "<descricao curta>" [--dry-run]
Gera estrutura inicial de spec usando template.
EOF
}

DRY=false
DESC=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) DRY=true; shift;;
    --help|-h) show_help; exit 0;;
    *) DESC="$1"; shift;;
  esac
done

if [[ -z "${DESC:-}" ]]; then
  echo "ERROR: descrição é obrigatória"; show_help; exit 1
fi

ROOT="$(CDPATH="" cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
FEATURE="${SPECIFY_FEATURE:-}"
if [[ -z "$FEATURE" ]]; then
  echo "ERROR: defina SPECIFY_FEATURE (ex.: export SPECIFY_FEATURE=\"1-nome\")" >&2
  exit 1
fi

TARGET_DIR="$ROOT/specs/$FEATURE"
SPEC_FILE="$TARGET_DIR/spec.md"
TEMPLATE="$ROOT/.specify/templates/spec-template.md"

mkdir_cmd() { $DRY && echo "DRY: mkdir -p $1" || mkdir -p "$1"; }
copy_cmd() { $DRY && echo "DRY: cp $1 $2" || cp "$1" "$2"; }

mkdir_cmd "$TARGET_DIR"

if [[ ! -f "$SPEC_FILE" ]]; then
  copy_cmd "$TEMPLATE" "$SPEC_FILE"
  $DRY || sed -i "s#\\[FEATURE NAME\\]#$FEATURE#g" "$SPEC_FILE"
else
  echo "KEEP: $SPEC_FILE já existe"
fi

echo "Spec pronta em $SPEC_FILE${DRY:+ (dry-run)}"
