---
agent: speckit.clarify
---

# /speckit.clarify - Resolver ambiguidades

## O que fazer
- Ler spec.md e identificar `[NEEDS CLARIFICATION]` ou áreas vagas.
- Formular perguntas objetivas (até 5 palavras na resposta) com opções quando possível.
- Atualizar spec.md removendo marcadores e registrando em `clarifications.md`.
- Manter rastreabilidade e não alterar requisitos já claros.

## Registro
- Adicionar seção `## Clarifications` com `### Session YYYY-MM-DD` se não existir.
- Registrar cada Q/A: `- Q: ... → A: ...`

## Saída
- Spec atualizada sem marcadores pendentes.
- Próximo comando sugerido: `/speckit.analyze`.
