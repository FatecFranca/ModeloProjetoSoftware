#!/usr/bin/env bash
set -euo pipefail

ROOT="$(CDPATH="" cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
QS="$ROOT/specs/1-speckit-framework/quickstart.md"

echo "== Validando quickstart (links básicos)"
if [[ ! -f "$QS" ]]; then
  echo "WARNING: quickstart.md ausente em $QS"; exit 0
fi

grep -q "/speckit.init" "$QS" || { echo "ERROR: quickstart sem /speckit.init"; exit 1; }
grep -q "tasks.schema.json" "$QS" || { echo "ERROR: quickstart sem referência ao schema de tasks"; exit 1; }

echo "Quickstart verificado (checks básicos)."
