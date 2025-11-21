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

- [ ] T001 Create SPEC KIT config example with defaults in `.specify/config.example.json`
- [ ] T002 Update onboarding section with branch naming + quickstart links in `README.md`
- [ ] T003 Add SPECIFY_FEATURE override note and branch fallback steps in `specs/1-speckit-framework/quickstart.md`

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Core infrastructure required before any user story

- [ ] T004 Add non-interactive `gh auth status` check helper in `.specify/scripts/bash/common.sh`
- [ ] T005 [P] Create Bash smoke-test harness covering help/dry-run for all commands in `.specify/scripts/bash/smoke-tests.sh`
- [ ] T006 [P] Create PowerShell smoke-test harness mirroring Bash flows in `.specify/scripts/powershell/smoke-tests.ps1`
- [ ] T007 Wire `tasks.schema.json` validation (Node + jq fallback) into `.specify/scripts/bash/speckit.tasks.sh`
- [ ] T008 [P] Add spec length/version warnings and traceability hints to `.specify/templates/spec-template.md`
- [ ] T009 Document spec → plan → tasks → issues → wiki traceability using data-model entities in `docs/traceability.md`

**Checkpoint**: Foundation ready—user story phases can begin

---

## Phase 3: User Story 1 - Criar espec em < 30min com /speckit.specify → /clarify → /analyze (Priority: P0) 🎯 MVP

**Goal**: Estudante gera spec completa com ambiguidades resolvidas e score de qualidade, incluindo criação de branch e estrutura de diretórios automatizada  
**Independent Test**: Executar `/speckit.init` (se necessário) e `/speckit.specify "Sistema de login"` seguido de `/speckit.clarify 1` e `/speckit.analyze 1`; validar que `specs/1-*/spec.md` não contém `[NEEDS CLARIFICATION]` e recebe score ≥ 8/10

- [ ] T010 [US1] Refine branch+template creation flow in `.github/prompts/speckit.specify.prompt.md` to enforce `N-short-name` naming and autopopulate frontmatter fields
- [ ] T011 [US1] Implement Bash command for /speckit.specify with branch creation, template copy, and metadata fill in `.specify/scripts/bash/speckit-specify.sh`
- [ ] T012 [P] [US1] Implement PowerShell parity for /speckit.specify in `.specify/scripts/powershell/speckit-specify.ps1`
- [ ] T013 [US1] Enhance clarification Q&A logging to update `clarifications.md` and clean markers in `.github/prompts/speckit.clarify.prompt.md`
- [ ] T014 [US1] Strengthen analyze rubric (completude, testabilidade) referencing data-model in `.github/prompts/speckit.analyze.prompt.md`

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

**Checkpoint**: User story 2 ready with validated plan and tasks

---

## Phase 5: User Story 3 - Checklist e guia de implementação (Priority: P0)

**Goal**: Desenvolvedor segue checklist gerado e navega implementação com dependências resolvidas  
**Independent Test**: Executar `/speckit.checklist 1` e `/speckit.implement 1`; verificar checklist em `specs/1-*/checklists/requirements.md` e fluxo de implementação que bloqueia tarefas com dependências não concluídas

- [ ] T021 [US3] Update checklist prompt to derive items dos requisitos em `.github/prompts/speckit.checklist.prompt.md`
- [ ] T022 [P] [US3] Implement checklist generator/enforcer for Bash in `.specify/scripts/bash/speckit-checklist.sh`
- [ ] T023 [US3] Update implement prompt to consume tasks.md + checklist for guided flow in `.github/prompts/speckit.implement.prompt.md`
- [ ] T024 [US3] Add Bash implement runner with dependency checks in `.specify/scripts/bash/speckit-implement.sh`

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

- [ ] T032 [US5] Atualizar prompt de constituição para ler/gravar decisões versionadas em `.github/prompts/speckit.constitution.prompt.md`
- [ ] T033 [P] [US5] Implementar comando Bash para registrar decisões e bumps de versão em `.specify/scripts/bash/speckit-constitution.sh`
- [ ] T034 [US5] Criar registro de constituição da feature em `specs/1-speckit-framework/constitution.md`

**Checkpoint**: User story 5 independently testable com versionamento de decisões

---

## Phase 8: Polish & Cross-Cutting Concerns

- [ ] T035 [P] Documentar fallback offline/gh-auth e troubleshooting em `docs/gh-cli.md`
- [ ] T036 Automatizar verificação do quickstart end-to-end em `.specify/scripts/bash/validate-quickstart.sh`
- [ ] T037 [P] Atualizar sessão manual de tecnologias/fluxos em `AGENTS.md`

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
