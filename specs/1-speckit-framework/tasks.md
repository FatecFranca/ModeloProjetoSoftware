---

description: "Task list for SPEC KIT Framework implementation"
---

# Tasks: SPEC KIT Framework

**Input**: Design documents from `/specs/1-speckit-framework/`  
**Prerequisites**: plan.md (required), spec.md (user stories), research.md, data-model.md, contracts/  
**Tests**: Only include smoke/validation tasks mandated by research and governance; no additional automated tests requested for tasks unless noted.  
**Organization**: Tasks grouped by user story to enable independent implementation and testing.

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Repository initialization assets and baseline docs

- [X] T001 Create SPEC KIT config example with defaults in `.specify/config.example.json`
- [X] T002 Update onboarding section with branch naming + quickstart links in `README.md`
- [X] T003 Add SPECIFY_FEATURE override note and branch fallback steps in `specs/1-speckit-framework/quickstart.md`

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Core infrastructure required before any user story

- [X] T004 Add non-interactive `gh auth status` check helper in `.specify/scripts/bash/common.sh`
- [X] T005 [P] Create Bash smoke-test harness covering help/dry-run for all commands in `.specify/scripts/bash/smoke-tests.sh`
- [X] T006 [P] Create PowerShell smoke-test harness mirroring Bash flows in `.specify/scripts/powershell/smoke-tests.ps1`
- [X] T007 Wire `tasks.schema.json` validation (Node + jq fallback) into `.specify/scripts/bash/speckit.tasks.sh`
- [X] T008 [P] Add spec length/version warnings and traceability hints to `.specify/templates/spec-template.md`
- [X] T009 Document spec → plan → tasks → issues → wiki traceability using data-model entities in `docs/traceability.md`
- [X] T038 Implement Bash `/speckit.init` (idempotente, cria `.specify/`, `specs/`, `.github/prompts/` e instala templates) em `.specify/scripts/bash/speckit-init.sh`
- [X] T039 [P] Implement PowerShell parity para `/speckit.init` em `.specify/scripts/powershell/speckit-init.ps1`
- [X] T040 Atualizar prompt do init com modo dry-run/help e preservação de estrutura existente em `.github/prompts/speckit.init.prompt.md`
- [X] T041 [P] Adicionar smoke tests (help/dry-run/idempotência) para init em `.specify/scripts/bash/smoke-tests.sh` e `.specify/scripts/powershell/smoke-tests.ps1`
- [X] T042 Redesenhar `.specify/templates/spec-template.md` (seções obrigatórias, exemplos curtos, guidance WHAT/WHY, versão/traceability)
- [X] T043 [P] Adicionar checklist de completude do template e exemplos de preenchimento em `.specify/templates/spec-template.md`
- [X] T044 Criar workflow CI `.github/workflows/spec-kit-validate.yml` (analyze score ≥7/10, schema tasks.json, limite 5k linhas, smoke-tests help/dry-run)
- [X] T045 [P] Script local de validação alinhado ao CI em `.specify/scripts/bash/validate-spec-kit.sh` (degrada gracioso se `ajv`/`shellcheck` ausentes)
- [X] T046 Documentar tempos de execução dos comandos em `docs/perf.md` com metas do NFR
- [X] T047 Documentar idempotência/rollback esperado por comando em `docs/ops-notes.md`
- [X] T048 Criar `docs/CHANGELOG.md` com versionamento semântico para templates/scripts
- [X] T049 [P] Incluir lint opcional (shellcheck/pwsh) nos smoke-tests com skip seguro quando indisponível
- [X] T050 Criar dashboard de progresso em `docs/dashboard.md` (ou `README.md`) usando plan/tasks para status por fase/story
- [X] T051 Registrar backlog P2 (boards, templates específicos, diagramas, export, gamificação) em `docs/backlog-P2.md` como “Deferred” mantendo rastreabilidade

**Checkpoint**: Foundation ready—user story phases can begin

---

## Phase 3: User Story 1 - Criar espec em < 30min com /speckit.specify → /clarify → /analyze (Priority: P0) 🎯 MVP

**Goal**: Estudante gera spec completa com ambiguidades resolvidas e score de qualidade, incluindo criação de branch e estrutura de diretórios automatizada  
**Independent Test**: Executar `/speckit.init` (se necessário) e `/speckit.specify "Sistema de login"` seguido de `/speckit.clarify 1` e `/speckit.analyze 1`; validar que `specs/1-*/spec.md` não contém `[NEEDS CLARIFICATION]` e recebe score ≥ 8/10

- [X] T010 [US1] Refine branch+template creation flow in `.github/prompts/speckit.specify.prompt.md` to enforce `N-short-name` naming and autopopulate frontmatter fields
- [X] T011 [US1] Implement Bash command for /speckit.specify with branch creation, template copy, and metadata fill in `.specify/scripts/bash/speckit-specify.sh`
- [X] T012 [P] [US1] Implement PowerShell parity for /speckit.specify in `.specify/scripts/powershell/speckit-specify.ps1`
- [X] T013 [US1] Enhance clarification Q&A logging to update `clarifications.md` and clean markers in `.github/prompts/speckit.clarify.prompt.md`
- [X] T014 [US1] Strengthen analyze rubric (completude, testabilidade) referencing data-model in `.github/prompts/speckit.analyze.prompt.md`

**Checkpoint**: User story 1 fully functional and testable independently

---

## Phase 4: User Story 2 - Converter spec em plano técnico e tarefas rastreáveis (Priority: P0)

**Goal**: Equipe gera plan.md + research.md + data-model.md + quickstart.md e tasks.json/tasks.md validados  
**Independent Test**: Rodar `/speckit.plan 1` e `/speckit.tasks 1`; confirmar geração de artefatos em `specs/1-*/` e `tasks.json` válido contra `specs/1-speckit-framework/contracts/tasks.schema.json`

- [ ] T015 [US2] Update planning flow to include research/data-model/quickstart outputs in `.github/prompts/speckit.plan.prompt.md`
- [ ] T016 [US2] Implement Bash orchestrator for /speckit.plan writing plan.md, research.md, data-model.md, quickstart.md in `.specify/scripts/bash/speckit-plan.sh`
- [ ] T017 [P] [US2] Implement PowerShell orchestrator for /speckit.plan in `.specify/scripts/powershell/speckit-plan.ps1`
- [ ] T018 [P] [US2] Extend tasks generator to emit tasks.md + tasks.json with schema validation hooks in `.specify/scripts/bash/speckit.tasks.sh`
- [ ] T019 [US2] Align task prompt to map requirements → user-story tasks with file paths in `.github/prompts/speckit.tasks.prompt.md`
- [ ] T020 [US2] Enhance GitHub issue creation prompt for labels/milestones and gh CLI preflight in `.github/prompts/speckit.taskstoissues.prompt.md`
- [X] T015 [US2] Update planning flow to include research/data-model/quickstart outputs in `.github/prompts/speckit.plan.prompt.md`
- [X] T016 [US2] Implement Bash orchestrator for /speckit.plan writing plan.md, research.md, data-model.md, quickstart.md in `.specify/scripts/bash/speckit-plan.sh`
- [X] T017 [P] [US2] Implement PowerShell orchestrator for /speckit.plan in `.specify/scripts/powershell/speckit-plan.ps1`
- [X] T018 [P] [US2] Extend tasks generator to emit tasks.md + tasks.json with schema validation hooks in `.specify/scripts/bash/speckit.tasks.sh`
- [X] T019 [US2] Align task prompt to map requirements → user-story tasks with file paths in `.github/prompts/speckit.tasks.prompt.md`
- [X] T020 [US2] Enhance GitHub issue creation prompt for labels/milestones and gh CLI preflight in `.github/prompts/speckit.taskstoissues.prompt.md`

**Checkpoint**: User story 2 ready with validated plan and tasks

---

## Phase 5: User Story 3 - Checklist e guia de implementação (Priority: P0)

**Goal**: Desenvolvedor segue checklist gerado e navega implementação com dependências resolvidas  
**Independent Test**: Executar `/speckit.checklist 1` e `/speckit.implement 1`; verificar checklist em `specs/1-*/checklists/requirements.md` e fluxo de implementação que bloqueia tarefas com dependências não concluídas

- [X] T021 [US3] Update checklist prompt to derive items dos requisitos em `.github/prompts/speckit.checklist.prompt.md`
- [X] T022 [P] [US3] Implement checklist generator/enforcer for Bash in `.specify/scripts/bash/speckit-checklist.sh`
- [X] T023 [US3] Update implement prompt to consume tasks.md + checklist for guided flow in `.github/prompts/speckit.implement.prompt.md`
- [X] T024 [US3] Add Bash implement runner with dependency checks in `.specify/scripts/bash/speckit-implement.sh`

**Checkpoint**: User story 3 independently testable with checklist + guided implementation

---

## Phase 6: User Story 4 - Wiki instrucional modernizado (Priority: P0)

**Goal**: Aluno acessa wiki progressivo (Home, Guia Rápido, Glossário, Comandos, Exercícios, Apêndice) em PT-BR  
**Independent Test**: Abrir `wiki/_Sidebar.md` e navegar para Home, Guia-Rapido, Glossario, pelo menos 3 páginas em `wiki/Comandos/`, e exercícios iniciais; verificar consistência com `specs/1-speckit-framework/wiki-structure.md`

- [ ] T025 [US4] Inventariar wiki legado (PMBOK/RUP) e mapear páginas existentes para a nova estrutura em `wiki/Legacy-Map.md` sem remover arquivos atuais
- [ ] T026 [US4] Implementar sidebar/nav com novas seções e bloco “Legado PMBOK/RUP” apontando para arquivos atuais em `wiki/_Sidebar.md`
- [ ] T027 [US4] Redigir páginas base Home, Guia-Rapido e Glossario reutilizando conteúdo relevante existente em `wiki/Home.md`, `wiki/Guia-Rapido.md`, `wiki/Glossario.md`, adicionando visão geral de práticas ágeis (Scrum/Kanban/XP) quando SPEC KIT não se aplica
- [ ] T028 [P] [US4] Criar páginas detalhadas dos comandos em `wiki/Comandos/` usando prompts como fonte (`speckit.*.prompt.md`) e preservando links para referências legadas
- [ ] T029 [US4] Montar exercícios iniciais e projeto final em `wiki/Exercicios/Modulo-1-Setup.md`, `wiki/Exercicios/Modulo-2-Planejamento.md` e `wiki/Exercicios/Projeto-Final.md`
- [ ] T030 [US4] Escrever seção de boas práticas modernas mapeando áreas legadas (Escopo, Tempo, Custos, Riscos, Comunicação, RH, Aquisições, Qualidade) para SPEC KIT ou, na ausência dele, para práticas ágeis consolidadas (Scrum/Kanban/Lean/XP) em `wiki/Boas-Praticas.md`, com links cruzados para páginas novas e legadas
- [ ] T031 [US4] Consolidar conteúdo histórico em `wiki/Apendice-PMBOK.md` referenciando páginas legadas e adicionando banner de direcionamento sem deletar os arquivos originais; incluir quadro comparativo PMBOK → SPEC KIT → Agile genérico

**Checkpoint**: User story 4 independently navigable e validado

---

## Phase 7: User Story 5 - Constituição e governança (Priority: P1)

**Goal**: Registrar princípios, gates e decisões versionadas via /speckit.constitution  
**Independent Test**: Executar `/speckit.constitution 1` para registrar decisão e ver atualização em `.specify/memory/constitution.md` e `specs/1-*/constitution.md`

- [X] T032 [US5] Atualizar prompt de constituição para ler/gravar decisões versionadas em `.github/prompts/speckit.constitution.prompt.md`
- [X] T033 [P] [US5] Implementar comando Bash para registrar decisões e bumps de versão em `.specify/scripts/bash/speckit-constitution.sh`
- [X] T034 [US5] Criar registro de constituição da feature em `specs/1-speckit-framework/constitution.md`

**Checkpoint**: User story 5 independently testable com versionamento de decisões

---

## Phase 8: Polish & Cross-Cutting Concerns

- [X] T035 [P] Documentar fallback offline/gh-auth e troubleshooting em `docs/gh-cli.md`
- [X] T036 Automatizar verificação do quickstart end-to-end em `.specify/scripts/bash/validate-quickstart.sh`
- [X] T037 [P] Atualizar sessão manual de tecnologias/fluxos em `AGENTS.md`
- [X] T052 [P] Mapear T035–T037 para requisitos de Segurança/Usabilidade/Traceability dentro de `tasks.md` ou notas em `docs/ops-notes.md` garantindo rastreabilidade explícita

---

## Dependencies & Execution Order

- Phase 1 → Phase 2 → all User Stories (Phases 3-7) → Phase 8.
- User Story ordering by priority and flow: US1 (spec creation) → US2 (plan/tasks/issues) → US3 (checklist/implement) → US4 (wiki) → US5 (constitution).
- Within each story: prompts update before scripts; generation scripts before issue creation/checklist runners.

## Parallel Opportunities

- Marked `[P]` tasks can run in parallel: smoke-test harnesses (T005, T006), PowerShell parity tasks (T012, T017), schema validation wiring (T018), checklist runner (T022), wiki command pages (T027), constitution script (T031), docs updates (T033, T035).
- Different user stories can proceed in parallel after Phase 2 if teams are split, but respect the story order for integration.

## Implementation Strategy

- MVP is User Story 1 (specify → clarify → analyze) once Setup and Foundational phases are complete.  
- Deliver incrementally: finish US1, then US2 (plan/tasks/issues), then US3 (checklist/implement), US4 (wiki), and finally US5 (constitution).  
- Keep smoke tests and schema validation running after each command change to preserve traceability and quality gates.
