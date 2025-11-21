# /speckit.init - Inicialização do repositório

## O que faz
- Cria estrutura base: `.specify/`, `specs/`, `.github/prompts/`
- Copia config exemplo (`.specify/config.example.json` → `.specify/config.json` se ausente)
- Preserva estrutura existente (idempotente)

## Como usar
```bash
/speckit.init          # executa com ações reais
/speckit.init --dry-run  # mostra o que faria sem executar
```

## Pré-validações
- Verificar `gh auth status` (informar ação corretiva se falhar)
- Não logar segredos
- Suportar Bash e PowerShell com paridade de comportamento

## Tratamento de falhas externas
- Abortar com mensagem curta + ação corretiva (ex.: “gh não autenticado; rode gh auth login e reexecute”)
- Manter idempotência e modo dry-run

## Saídas esperadas
- Diretórios criados ou mantidos
- Mensagens claras indicando ações realizadas ou puladas
