---
agent: speckit.tasks
---

# /speckit.tasks - Gerar tarefas

## O que fazer
- Ler spec.md e plan.md, mapear user stories/P0/P1/P2.
- Usar tasks-template; quebrar por fases (Setup, Foundational, US por prioridade, Polish).
- Incluir caminhos de arquivos e marcador [P] para paralelizáveis.
- Gerar tasks.md e tasks.json; validar tasks.json com contracts/tasks.schema.json.

## Regras
- Uma tarefa por linha: `- [ ] T### [P?] [US?] descrição <path>`.
- Cada user story com teste independente e tarefas completas.
- Não ultrapassar 500 tasks.
- Referenciar requisitos/NFR ao possível.

## Saída
- tasks.md pronto para execução.
- tasks.json validado ou aviso se validação não pôde rodar.
