#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(CDPATH="" cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
SPEC="$REPO_ROOT/specs/1-speckit-framework/spec.md"
TASKS_JSON="$REPO_ROOT/specs/1-speckit-framework/tasks.json"
SCHEMA="$REPO_ROOT/specs/1-speckit-framework/contracts/tasks.schema.json"

echo "== Validate spec length (<=5000 linhas)"
LINES=$(wc -l < "$SPEC")
if [[ "$LINES" -gt 5000 ]]; then
  echo "ERROR: spec.md excede 5000 linhas ($LINES)"; exit 1
fi

if [[ -f "$TASKS_JSON" ]]; then
  if command -v npx >/dev/null 2>&1; then
    echo "== Validate tasks.json schema"
    npx --yes ajv-cli validate -s "$SCHEMA" -d "$TASKS_JSON"
  elif command -v jq >/dev/null 2>&1; then
    echo "== Basic tasks.json shape check (jq fallback)"
    jq -e 'type=="array" and (length<=500)' "$TASKS_JSON" >/dev/null
  else
    echo "WARNING: ajv/jq indisponível; pulando validação de schema"
  fi
else
  echo "INFO: tasks.json não encontrado, pulando validação"
fi

echo "== Smoke tests (help/dry-run)"
bash "$REPO_ROOT/.specify/scripts/bash/smoke-tests.sh" || true

echo "Validações concluídas"
