# Quickstart - SPEC KIT Framework

## Pré-requisitos
- Git + GitHub CLI autenticado (`gh auth status`)
- Bash (Linux/macOS) e PowerShell 7 (Windows)
- VS Code com GitHub Copilot instalado
- Defina a feature ativa se estiver fora de um branch git: `export SPECIFY_FEATURE="1-speckit-framework"`

## Passo a passo
1. **Inicialize o repositório**  
   ```bash
   /speckit.init
   ```  
   Verifique se `.specify/` e `specs/` foram criados.

2. **Gere a primeira spec**  
   ```bash
   /speckit.specify "Sistema de login com email e senha"
   ```  
   A spec será salva em `/home/johnny/Documentos/FATEC/GITHUB/ModeloProjetoSoftware/specs/1-speckit-framework/spec.md` (ajuste o número conforme o projeto).

3. **Resolva ambiguidades**  
   ```bash
   /speckit.clarify 1
   ```  
   Responda às perguntas e confirme as atualizações.

4. **Analise qualidade**  
   ```bash
   /speckit.analyze 1
   ```  
   Revise o score e corrija seções destacadas.

5. **Crie o plano técnico**  
   ```bash
   /speckit.plan 1
   ```  
   O plano fica em `/home/johnny/Documentos/FATEC/GITHUB/ModeloProjetoSoftware/specs/1-speckit-framework/plan.md`.

6. **Quebre em tarefas**  
   ```bash
   /speckit.tasks 1
   ```  
   Valide `tasks.json` com o schema em `/home/johnny/Documentos/FATEC/GITHUB/ModeloProjetoSoftware/specs/1-speckit-framework/contracts/tasks.schema.json`.

7. **Crie issues no GitHub**  
   ```bash
   /speckit.taskstoissues 1
   ```  
   Confirme labels e milestones sugeridos.

8. **Checklist e implementação**  
   ```bash
   /speckit.checklist 1
   /speckit.implement 1
   ```  
   Marque o progresso conforme o checklist.

9. **Constitution e wiki**  
   Atualize decisões em `/home/johnny/Documentos/FATEC/GITHUB/ModeloProjetoSoftware/.specify/memory/constitution.md` e modernize o wiki seguindo `specs/1-speckit-framework/wiki-structure.md`.

## Validação rápida
- Scripts novos devem passar smoke tests: `bash -euo pipefail script.sh --help` e `pwsh -NoLogo -NoProfile script.ps1 -WhatIf`.
- Assegure rastreabilidade: spec → plan → tasks → issues → checklist → wiki.
