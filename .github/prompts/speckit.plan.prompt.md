---
agent: speckit.plan
---

# /speckit.plan - Plano técnico

## O que gerar
- preenche plan.md com contexto técnico, arquitetura, fases, testes/validação, limites.
- cria research.md, data-model.md, quickstart.md e contracts/ (OpenAPI/GraphQL conforme necessidade).
- reavalia Constitution Check.

## Entradas
- spec.md (requisitos, NFR, entidades).
- research.md (decisões) se existir.

## Saída
- plan.md completo; research/data-model/quickstart; contracts atualizados.
- Próximo comando: `/speckit.tasks`.

## Regras
- Respeitar limites (spec <5k linhas, tasks<=500).
- Incluir rastreabilidade e observabilidade (logs estruturados + tempos p95).
- Paridade bash/ps: documentar no plano.
