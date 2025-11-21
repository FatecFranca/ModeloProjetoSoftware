---
agent: speckit.taskstoissues
---

# /speckit.taskstoissues - Criar issues a partir de tasks

## Fluxo
- Ler tasks.json (validado) e criar issues no GitHub com labels/milestones.
- Pré-check: `gh auth status` (abort with guidance if not ok).
- Respeitar links para spec/plan/tasks para rastreabilidade.

## Regras
- Não logar segredos; usar gh CLI.
- Usar títulos claros com IDs T### e US.
- Adicionar milestone por fase e labels de prioridade (P0/P1/P2) se informadas.

## Saída
- Lista de issues criadas (id/url).
- Relatório de erros se algo falhar (sem best-effort silencioso).
