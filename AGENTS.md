# ModeloProjetoSoftware Development Guidelines

Auto-generated from all feature plans. Last updated: 2025-11-21

## Active Technologies
- Bash 5.x (*nix), PowerShell 7.x (Windows), Markdown/Mermaid para docs + Git, GitHub CLI (`gh`), GitHub Copilot (prompts), VS Code, JSON/JSON Schema (tasks.json), Node.js opcional (validação), `jq` (1-speckit-framework)
- Arquivos (Markdown/JSON/scripts); sem banco de dados (1-speckit-framework)
- Bash 5.x (*nix), PowerShell 7.x (Windows), Markdown/Mermaid para docs + Git, GitHub CLI (`gh`), GitHub Copilot (prompts), VS Code, JSON/JSON Schema (tasks.json), Node.js opcional (validação), `jq` (1-speckit-framework)

- Bash 5.x for *nix automation; PowerShell 7.x for Windows; Markdown/Mermaid for docs + Git, GitHub CLI (`gh`), GitHub Copilot prompt workflows, VS Code environment, JSON/JSON Schema handling for `tasks.json`, basic Node.js runtime optional (validation scripts) (1-speckit-framework)

## Project Structure

```text
src/
tests/
```

## Commands

# Add commands for Bash 5.x for *nix automation; PowerShell 7.x for Windows; Markdown/Mermaid for docs

## Code Style

Bash 5.x for *nix automation; PowerShell 7.x for Windows; Markdown/Mermaid for docs: Follow standard conventions

## Recent Changes
- 1-speckit-framework: Added Bash 5.x (*nix), PowerShell 7.x (Windows), Markdown/Mermaid para docs + Git, GitHub CLI (`gh`), GitHub Copilot (prompts), VS Code, JSON/JSON Schema (tasks.json), Node.js opcional (validação), `jq`
- 1-speckit-framework: Added Bash 5.x (*nix), PowerShell 7.x (Windows), Markdown/Mermaid para docs + Git, GitHub CLI (`gh`), GitHub Copilot (prompts), VS Code, JSON/JSON Schema (tasks.json), Node.js opcional (validação), `jq`

- 1-speckit-framework: Added Bash 5.x for *nix automation; PowerShell 7.x for Windows; Markdown/Mermaid for docs + Git, GitHub CLI (`gh`), GitHub Copilot prompt workflows, VS Code environment, JSON/JSON Schema handling for `tasks.json`, basic Node.js runtime optional (validation scripts)

<!-- MANUAL ADDITIONS START -->
- Use `gh auth status` antes de comandos que criam issues; consulte docs/gh-cli.md.
- Valide rapidamente com `.specify/scripts/bash/validate-spec-kit.sh` (limite 5k linhas spec, schema tasks).
- Keep specs abaixo de 5.000 linhas; limite tasks.json a 500 itens.
<!-- MANUAL ADDITIONS END -->
