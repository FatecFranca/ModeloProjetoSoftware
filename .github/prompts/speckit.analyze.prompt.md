---
agent: speckit.analyze
---

# /speckit.analyze - Revisão de qualidade da spec

## Avaliar
- Completude de seções obrigatórias, requisitos testáveis, critérios de sucesso.
- Rastreabilidade para plan/tasks (referências presentes).
- Limites: spec < 5.000 linhas; marcar se exceder.
- Observabilidade: NFR com logs estruturados e tempos p95?
- Segurança: evitar dados sensíveis; gh CLI seguro.

## Saída
- Score (0-10) por dimensão (completude, clareza, testabilidade).
- Lista de issues categorizadas (Critical/Major/Minor) com localização.
- Recomendação de próximas ações.

## Notas
- Não editar a spec; só relatar.
- Sugerir `/speckit.clarify` se ambiguidades persistirem.
