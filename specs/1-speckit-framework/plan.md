# Implementation Plan: SPEC KIT Framework

**Branch**: `1-speckit-framework` | **Date**: 2025-11-21 | **Spec**: /home/johnny/Documentos/FATEC/GITHUB/ModeloProjetoSoftware/specs/1-speckit-framework/spec.md  
**Input**: Feature specification from `/specs/1-speckit-framework/spec.md`

**Note**: This plan follows the `/speckit.plan` workflow.

## Summary

Modernizar o repositório ModeloProjetoSoftware em um framework SPEC KIT completo (10 comandos: init, specify, clarify, analyze, plan, tasks, taskstoissues, checklist, implement, constitution) com templates atualizados, automação Bash/PowerShell, rastreabilidade spec→plan→tasks→issues e wiki instrucional modernizado para alunos da FATEC.

## Technical Context

**Language/Version**: Bash 5.x (*nix), PowerShell 7.x (Windows), Markdown/Mermaid para docs  
**Primary Dependencies**: Git, GitHub CLI (`gh`), GitHub Copilot (prompts), VS Code, JSON/JSON Schema (tasks.json), Node.js opcional (validação), `jq`  
**Storage**: Arquivos (Markdown/JSON/scripts); sem banco de dados  
**Testing**: Smoke tests obrigatórios (bash: `bash -euo pipefail <cmd> --help/--dry-run`; ps: `pwsh -NoLogo -NoProfile <cmd> -Help/-WhatIf`); lint opcional (shellcheck/pwsh) com skip seguro  
**Target Platform**: Cross-platform (Linux/macOS/Windows via Bash/PowerShell)  
**Project Type**: Toolkit de documentação + automação (sem backend/app dedicado)  
**Performance Goals**: Comandos p95 <30s; geração de spec <2min; criação de issues (20 tasks) <10s  
**Constraints**: Spec ≤5.000 linhas; tasks.json ≤500 tasks com JSON Schema; GitHub-only; orçamento R$0; paridade bash/ps; não logar segredos  
**Scale/Scope**: Até 100 features simultâneas; wiki completo PT-BR com exemplos/exercícios

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

- Constituição em `/home/johnny/Documentos/FATEC/GITHUB/ModeloProjetoSoftware/.specify/memory/constitution.md` (v1.0.0, 2025-11-21).  
- Gates: contexto de planejamento preenchido; smoke-tests para automação Bash/PowerShell; rastreabilidade spec→plan→tasks→issues→wiki; exceções justificadas em Complexity Tracking.  
- Status: **PASS** (nenhuma violação declarada).

## Project Structure

### Documentation (this feature)

```text
specs/1-speckit-framework/
├── plan.md              # Este arquivo
├── research.md          # Fase 0
├── data-model.md        # Fase 1
├── quickstart.md        # Fase 1
├── contracts/           # Fase 1
└── tasks.md             # Fase 2 (/speckit.tasks)
```

### Source Code (repository root)

```text
.specify/
├── scripts/
│   ├── bash/
│   └── powershell/
├── templates/
└── memory/

specs/
└── 1-speckit-framework/  # workspace da feature

wiki/                     # legado a modernizar + novo conteúdo
docs/                     # documentação adicional
src/                      # artefatos estáticos de exemplo
```

**Structure Decision**: Documentação + automação em `.specify/` e `specs/` são foco; sem backend/app. Wiki reestruturado em `wiki/` coerente com templates.

## Complexity Tracking

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
| None | N/A | N/A |

## Architecture

- Prompts: `.github/prompts/speckit.*.prompt.md` geram instruções por comando.  
- Orquestração Bash/PowerShell: `.specify/scripts/bash/*.sh` e `.specify/scripts/powershell/*.ps1` com paridade.  
- Validação: `validate-spec-kit.sh` + GH Action para score analyze ≥7/10, schema tasks.json, limite 5k linhas, smoke-tests help/dry-run; skips seguros para ferramentas opcionais (ajv/shellcheck).  
- Artefatos: spec/plan/research/data-model/quickstart/contracts em `specs/1-speckit-framework/`; tasks.json + tasks.md; wiki modernizado em `wiki/`.  
- Observabilidade mínima: logs estruturados por comando e tempos p95 registrados por execução (conforme Clarifications/NFR).  
- Storage: somente arquivos; GH CLI para issues.

## Delivery Phases (plan alignment)

- Fase 1: Setup (config example, README onboarding, quickstart note).  
- Fase 2: Fundacional (auth check helper, smoke harnesses bash/ps, schema validation, avisos spec-template, traceability doc, init bash/ps, prompt init, CI workflow, validação local, perf/ops docs, changelog, lint opcional, dashboard, backlog P2).  
- Fase 3: US1 (specify/clarify/analyze prompts + scripts).  
- Fase 4: US2 (plan + tasks orchestrators, schema validation, prompt alignment, taskstoissues prompt).  
- Fase 5: US3 (checklist/implement prompts + runners).  
- Fase 6: US4 (wiki modernizado + legado, boas práticas ágeis).  
- Fase 7: US5 (constituição, registro de decisões).  
- Fase 8: Polish (docs gh-cli, quickstart validator, agents, rastreabilidade polish).

## Testing and Validation Approach

- Smoke-tests obrigatórios (bash: `bash -euo pipefail <cmd> --help/--dry-run`; ps: `pwsh -NoLogo -NoProfile <cmd> -Help/-WhatIf`).  
- CI (`.github/workflows/spec-kit-validate.yml`): analyze score ≥7/10; validação JSON Schema de tasks.json; limite 5k linhas spec; smoke-tests help/dry-run; skips seguros para ferramentas opcionais.  
- Perf checks em `docs/perf.md`; rollback/idempotência em `docs/ops-notes.md`; lint opcional com skip seguro.

## Technical Decisions and Constraints

- GitHub-only; GH CLI para operações externas; não logar segredos; dry-run antes de ações.  
- Paridade Bash/PowerShell mandatória; degradação documentada.  
- Limites: spec ≤5k linhas; tasks.json ≤500 tasks; comandos p95 <30s; spec generation <2min; issues batch (20) <10s.  
- Versionamento semântico de templates/scripts em `docs/CHANGELOG.md`; backlog P2 em `docs/backlog-P2.md`.
