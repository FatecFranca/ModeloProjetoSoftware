# Rastreabilidade SPEC KIT

## Fluxo
- spec.md → plan.md → tasks.md/tasks.json → issues (GitHub) → checklists → wiki/quickstart → implementação.

## Regras
- Cada comando gera/atualiza artefatos com referências cruzadas.
- tasks.json deve validar contra `specs/1-speckit-framework/contracts/tasks.schema.json`.
- CI deve bloquear se analyze < 7/10, spec > 5.000 linhas ou schema inválido.

## Pontos de verificação
- Spec contém links para plan/tasks.
- Plan referencia spec e artefatos de design (research, data-model, contracts, quickstart).
- tasks.md/tasks.json incluem IDs rastreáveis para stories/requisitos.
- Issues (quando criadas) devem referenciar tasks e spec.
