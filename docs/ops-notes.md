# Operação e rollback dos comandos SPEC KIT

- Idempotência: comandos não devem recriar arquivos já existentes sem confirmação; usar `--dry-run` sempre que disponível.
- Falhas externas (gh/auth/rede): abortar com mensagem curta + ação corretiva; não prosseguir em modo best-effort.
- Rollback: manter backups antes de mudanças destrutivas quando aplicável; preferir edição idempotente.
- Logs estruturados por comando; registrar tempos p95 por execução para validar metas de performance.
- Segurança: não logar segredos; preferir `gh auth status` para checar autenticação.

## Mapeamento de tarefas polish
- T035–T037: documentação gh-cli, validador do quickstart, atualização de AGENTS.md — todas ligadas a Segurança/Usabilidade/Rastreabilidade.
