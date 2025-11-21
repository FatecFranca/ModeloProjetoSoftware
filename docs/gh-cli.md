# Guia rápido - GitHub CLI (gh)

## Autenticação
- Verificar status: `gh auth status`
- Se falhar: `gh auth login` (não logar segredos em scripts)

## Boas práticas
- Sempre testar com `--dry-run` quando disponível em comandos que modificam recursos.
- Não armazenar tokens em logs; preferir `GH_TOKEN` por ambiente ou keychain.

## Uso com SPEC KIT
- `/speckit.taskstoissues` depende de `gh auth status` ok.
- Scripts abortam com mensagem curta + ação corretiva se gh não autenticado.
