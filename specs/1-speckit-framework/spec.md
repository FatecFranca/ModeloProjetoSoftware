# SPEC KIT Framework - Modernização do Repositório ModeloProjetoSoftware

**Status**: Draft  
**Version**: 0.3.0  
**Created**: 2025-11-19  
**Last Updated**: 2025-11-19  
**Owner**: FATEC Franca - Equipe de Gerenciamento de Projetos  
**Stakeholders**: Professores, Alunos, Coordenação Acadêmica, Comunidade Open Source

---

## Executive Summary

Transformar o repositório ModeloProjetoSoftware em um framework moderno de gerenciamento de projetos de software baseado no SPEC KIT, implementando 10 comandos principais (init, specify, clarify, analyze, plan, tasks, taskstoissues, checklist, implement, constitution) que guiam equipes desde a configuração inicial até a implementação de features, substituindo a abordagem tradicional PMBOK/RUP por um fluxo ágil e orientado a especificações.

---

## Clarifications

### Session 2025-11-21

- Q: Qual abordagem de observabilidade vamos usar para acompanhar execuções dos comandos? → A: Logs estruturados por comando e tempos p95 registrados a cada execução.
- Q: Como padronizar tratamento de falhas externas (gh/non-network/permissões) nos comandos? → A: Abortar com mensagem curta + ação corretiva padrão, mantendo idempotência/dry-run.

## Problem Statement

### Current Situation
O repositório ModeloProjetoSoftware atual utiliza uma abordagem tradicional de documentação baseada em PMBOK e RUP, desenvolvida em 2016-2018. A estrutura é pesada, focada em documentação extensa upfront, e não acompanha as práticas modernas de desenvolvimento ágil e colaborativo.

### User Pain Points
- **Documentação desatualizada**: Referências a projetos de 2016, tecnologias obsoletas (Python 2, Django antigo)
- **Processo não iterativo**: Documentação criada toda no início, sem refinamento contínuo
- **Falta de automação**: Processo manual para criar tarefas, branches e documentação
- **Desconexão entre spec e código**: Não há ligação clara entre especificação e implementação
- **Curva de aprendizado alta**: Estudantes precisam ler dezenas de documentos antes de começar
- **Falta de templates modernos**: Não há estrutura para user stories, acceptance criteria, ou technical planning

### Business Impact
- Projetos acadêmicos demoram mais para iniciar devido à documentação pesada
- Alunos não aprendem práticas modernas usadas na indústria
- Baixa adoção do repositório por outras instituições
- Dificuldade em manter a documentação atualizada ao longo dos semestres

---

## Proposed Solution

### Overview
Implementar o SPEC KIT Framework - um sistema de gerenciamento de projetos baseado em comandos que guia as equipes através de um fluxo estruturado: especificação → clarificação → análise → planejamento → tarefas → implementação. Cada comando é um prompt do GitHub Copilot que automatiza parte do processo.

### Key Features
1. **Comandos Estruturados**: 10 comandos que cobrem desde setup até implementação completa
2. **Templates Modernos**: Especificações focadas em user value, não em implementação
3. **Automação**: Scripts para criar branches, issues, checklists automaticamente
4. **Rastreabilidade**: Conexão clara entre spec → plan → tasks → code
5. **Iterativo**: Permite refinamento contínuo através dos comandos clarify e analyze
6. **Educacional**: Cada comando ensina uma etapa do processo de desenvolvimento

### User Value
- Reduz tempo de setup de projetos de dias para horas
- Ensina práticas modernas de Product Management e Engineering
- Facilita colaboração entre equipes distribuídas
- Mantém documentação sempre sincronizada com o código
- Permite reuso do framework em múltiplos projetos

---

## User Scenarios & Testing

### Primary User Scenario
**As a** estudante de Engenharia de Software na FATEC  
**I want to** iniciar um novo projeto de software seguindo boas práticas modernas  
**So that** eu aprenda o processo completo desde especificação até implementação e tenha documentação que realmente ajuda no desenvolvimento

**Acceptance Criteria**:
- [ ] Consigo criar uma especificação completa em menos de 30 minutos usando `/speckit.specify`
- [ ] A especificação gerada contém todas as seções obrigatórias preenchidas
- [ ] Uma branch de feature é criada automaticamente com nome padronizado
- [ ] Posso refinar a spec através de perguntas e respostas com `/speckit.clarify`
- [ ] Consigo converter a spec em plano técnico com `/speckit.plan`
- [ ] As tarefas são geradas automaticamente e podem virar issues no GitHub

### Secondary Scenarios

#### Cenário 2: Professor Revisando Especificação
**As a** professor orientador  
**I want to** analisar a qualidade de uma especificação criada pelos alunos  
**So that** eu possa dar feedback estruturado e garantir que o projeto está bem definido

**Acceptance Criteria**:
- [ ] Comando `/speckit.analyze` gera relatório de qualidade automático
- [ ] Relatório identifica seções incompletas ou ambíguas
- [ ] Recebo score de qualidade (0-10) em múltiplas dimensões
- [ ] Recomendações de melhoria são específicas e acionáveis

#### Cenário 3: Equipe Planejando Sprint
**As a** Scrum Master da equipe  
**I want to** converter uma especificação aprovada em tarefas rastreáveis  
**So that** a equipe saiba exatamente o que implementar e possamos estimar o trabalho

**Acceptance Criteria**:
- [ ] Comando `/speckit.plan` gera plano técnico com arquitetura e tecnologias
- [ ] Comando `/speckit.tasks` quebra o plano em tarefas estimadas
- [ ] Comando `/speckit.taskstoissues` cria issues no GitHub automaticamente
- [ ] Cada issue é linkada à especificação original
- [ ] Issues contêm contexto suficiente para serem trabalhadas independentemente

#### Cenário 4: Desenvolvedor Implementando Feature
**As a** desenvolvedor da equipe  
**I want to** seguir um checklist de implementação enquanto codifico  
**So that** eu não esqueça requisitos importantes e mantenha qualidade

**Acceptance Criteria**:
- [ ] Comando `/speckit.checklist` gera checklist específico para a feature
- [ ] Checklist inclui requisitos funcionais, não-funcionais e testes
- [ ] Posso marcar itens como concluídos durante o desenvolvimento
- [ ] Comando `/speckit.implement` me guia na implementação seguindo o plano

#### Cenário 5: Aluno Aprendendo Gerenciamento de Projetos
**As a** aluno da FATEC cursando Engenharia de Software  
**I want to** acessar material didático estruturado sobre gerenciamento de projetos de software  
**So that** eu aprenda as etapas do processo, boas práticas e conceitos fundamentais de forma progressiva e prática

**Acceptance Criteria**:
- [ ] Wiki contém guias passo-a-passo para cada comando do SPEC KIT
- [ ] Cada página do wiki explica o "porquê" antes do "como"
- [ ] Exemplos práticos usando o próprio repositório como caso de uso
- [ ] Glossário de termos técnicos em português com exemplos
- [ ] Exercícios práticos ao final de cada seção principal
- [ ] Progressão clara: conceitos básicos → intermediários → avançados
- [ ] Links entre wiki e specs/plans demonstrando aplicação real

### Edge Cases
- Especificação muito vaga → clarify deve fazer perguntas até ter clareza
- Feature muito complexa → plan deve sugerir quebrar em múltiplas features
- Mudança de escopo → constitution documenta e versiona as decisões
- Conflito entre requisitos → analyze identifica inconsistências

---

## Functional Requirements

### Must Have (P0)

1. **Comando /speckit.specify**
   - Gera especificação completa a partir de descrição curta
   - Cria branch automaticamente (formato: `N-short-name`)
   - Cria diretório `specs/N-short-name/`
   - Usa template com todas as seções obrigatórias
   - Preenche seções automaticamente com base na descrição
   - Identifica ambiguidades com marcadores `[NEEDS CLARIFICATION]`

2. **Comando /speckit.clarify**
   - Identifica todas as questões em aberto na spec
   - Faz perguntas interativas ao usuário
   - Atualiza a spec com as respostas
   - Remove marcadores `[NEEDS CLARIFICATION]`
   - Gera log de clarificações em `clarifications.md`

3. **Comando /speckit.analyze**
   - Analisa completude da especificação
   - Verifica testabilidade de requisitos
   - Identifica inconsistências
   - Gera score de qualidade (0-10)
   - Produz relatório com issues categorizados (Critical/Major/Minor)

4. **Comando /speckit.plan**
   - Converte spec em plano técnico
   - Define arquitetura e componentes
   - Escolhe tecnologias apropriadas
   - Quebra em fases de implementação
   - Cria `plan.md` com detalhes técnicos

5. **Comando /speckit.tasks**
   - Gera lista de tarefas implementáveis
   - Estima esforço de cada tarefa
   - Define dependências entre tarefas
   - Agrupa tarefas por fase
   - Cria `tasks.json` estruturado

6. **Comando /speckit.taskstoissues**
   - Cria issues no GitHub a partir de tasks.json
   - Adiciona labels apropriados
   - Linka issues à spec original
   - Define milestones por fase
   - Atribui issues conforme configuração

7. **Comando /speckit.checklist**
   - Gera checklist de implementação
   - Baseado em requisitos da spec
   - Inclui critérios de aceitação
   - Cria arquivo em `checklists/requirements.md`
   - Permite marcar progresso durante dev

8. **Template de Especificação**
   - Estrutura clara e completa
   - Foca em WHAT e WHY, não HOW
   - Seções obrigatórias bem definidas
   - Guidance para cada seção
   - Exemplos práticos

9. **Scripts de Automação**
   - Script Bash para criar feature (Linux/Mac)
   - Script PowerShell para criar feature (Windows)
   - Detecta próximo número disponível
   - Cria branch e estrutura de diretórios
   - Aceita parâmetros via CLI e JSON

10. **Comando /speckit.init**
    - Configura estrutura inicial do SPEC KIT no repositório
    - Cria diretórios `.specify/`, `specs/`, `.github/prompts/`
    - Instala templates de especificação
    - Configura scripts de automação
    - Detecta e preserva estrutura existente
    - Prompt interativo para preferências de configuração

11. **Wiki Instrucional Modernizado**
    - Transformar conteúdo PMBOK/RUP em guias práticos do SPEC KIT
    - Estrutura didática: Introdução → Conceitos → Prática → Exercícios
    - Páginas principais:
      - **Home**: Visão geral do SPEC KIT, diferenças PMBOK vs. Ágil
      - **Guia Rápido**: Setup em 5 minutos, primeiro spec em 30 minutos
      - **Comandos Detalhados**: Uma página por comando com exemplos
      - **Boas Práticas**: Padrões, anti-patterns, dicas
      - **Glossário**: Termos técnicos em PT-BR com contexto
      - **FAQ**: Dúvidas comuns de alunos
      - **Exercícios Práticos**: Desafios progressivos com gabaritos
    - Linguagem acessível para estudantes (evitar jargão excessivo)
    - Exemplos usando projeto real da FATEC como caso de uso
    - Diagramas e fluxogramas visuais (Mermaid)
    - Seção "Erros Comuns" em cada página

### Should Have (P1)

12. **Comando /speckit.constitution**
    - Documenta decisões importantes do projeto
    - Mantém histórico de mudanças de escopo
    - Registra trade-offs e rationale
    - Cria `constitution.md` versionado

13. **Migração de Conteúdo do Wiki Legado**
    - Mapear conteúdo PMBOK/RUP existente para nova estrutura
    - Preservar informações válidas (Gerenciamento de Riscos, Custos, etc.)
    - Criar página "Apêndice: PMBOK/RUP" com conteúdo histórico
    - Adicionar notas de comparação: "No PMBOK fazíamos X, no SPEC KIT fazemos Y"
    - Manter referências a projetos antigos como exemplos de evolução
    - Documentar lições aprendidas da transição

14. **Comando /speckit.implement**
    - Guia passo-a-passo na implementação
    - Sugere ordem de desenvolvimento
    - Valida contra checklist
    - Alerta sobre dependências não resolvidas

15. **Dashboard de Progresso**
    - Visualização do status de todas as features
    - Métricas de qualidade agregadas
    - Timeline de implementação
    - Gerado automaticamente em `README.md`

16. **Validação Automática**
    - GitHub Action que valida specs em PRs
    - Verifica completude obrigatória
    - Roda analyze automaticamente
    - Bloqueia merge se score < 7/10

### Nice to Have (P2)

17. **Integração com Project Boards**
    - Sincroniza tasks com GitHub Projects
    - Atualiza status automaticamente
    - Move cards conforme progresso

18. **Templates Específicos por Tipo**
    - Template para APIs
    - Template para UIs
    - Template para integrações
    - Template para refatorações

19. **Geração de Diagramas**
    - Diagrama de arquitetura automático
    - Fluxos de usuário visuais
    - Modelo de dados em Mermaid

20. **Exportação para Formatos**
    - PDF para apresentações
    - Confluence para wikis
    - Notion para documentação

21. **Wiki Interativo com Exercícios Gamificados**
    - Sistema de badges/conquistas para progresso
    - Desafios práticos com validação automática
    - Leaderboard de aprendizado (opcional, opt-in)
    - Quiz interativo ao final de cada módulo

---

## Non-Functional Requirements

### Performance
- Comandos devem responder em < 30 segundos (95th percentile)
- Geração de spec completa em < 2 minutos
- Criação de issues em batch < 10 segundos para 20 tasks

### Security
- Scripts não devem expor tokens do GitHub
- Usar GitHub CLI para autenticação segura
- Validar inputs para prevenir injection

### Scalability
- Suportar até 100 features simultâneas em um repositório
- Specs têm hard limit de 5,000 linhas (rejeita e orienta split)
- Tasks.json pode ter até 500 tarefas
- Tasks.json validado com JSON Schema para garantir estrutura

### Reliability
- Comandos devem ser idempotentes quando possível
- Backup automático antes de modificações destrutivas
- Rollback capability para alterações em specs

### Observability
- Logs estruturados por comando
- Registro de tempos p95 por execução para validar metas de performance

### Usability
- Comandos seguem padrão consistente: `/speckit.<comando> [args]`
- Documentação inline em cada prompt
- Mensagens de erro claras e acionáveis
- Exemplos práticos em todos os comandos
- Compatível com VS Code + GitHub Copilot

### Maintainability
- Código dos scripts bem documentado
- Templates versionados semanticamente
- Changelog para mudanças no framework
- Testes automatizados para scripts

---

## Success Criteria

### Key Performance Indicators (KPIs)

1. **Adoção**: 80% dos projetos novos na FATEC usam SPEC KIT no primeiro semestre
2. **Qualidade de Specs**: Score médio > 8/10 no comando analyze
3. **Velocidade**: Tempo médio para criar spec completa < 1 hora (vs. 2 dias atual)
4. **Satisfação**: NPS > 8 de estudantes e professores
5. **Completude**: 90% das specs têm todos os campos obrigatórios preenchidos
6. **Rastreabilidade**: 100% das issues linkadas a specs
7. **Aprendizado**: 70% dos alunos completam Guia Rápido do Wiki antes da primeira spec

### Definition of Done
- [ ] Todos os 10 comandos principais implementados e testados
- [ ] Templates criados e validados em projeto piloto
- [ ] Scripts bash e powershell funcionando em todos os SOs
- [ ] Documentação completa (README, guias, exemplos)
- [ ] Wiki modernizado com todas as páginas principais em PT-BR
- [ ] Guia Rápido do Wiki validado com 10 alunos (tempo < 1h para completar)
- [ ] 3 projetos piloto completados usando o framework
- [ ] Feedback positivo (> 4/5) de pelo menos 20 usuários
- [ ] GitHub Actions configurado para validação automática
- [ ] Vídeo tutorial de 10min demonstrando uso completo

---

## Key Entities & Data Model

### Entities

1. **Specification**
   - id: Number (sequencial)
   - short_name: String (kebab-case, único)
   - title: String
   - status: Enum (Draft, In Review, Approved, In Development, Complete)
   - created_at: Date
   - updated_at: Date
   - owner: String
   - stakeholders: Array<String>
   - problem_statement: Text
   - proposed_solution: Text
   - requirements: Array<Requirement>
   - success_criteria: Array<Criterion>
   - risks: Array<Risk>

2. **Requirement**
   - id: String (REQ-XXX)
   - type: Enum (Functional, Non-Functional)
   - priority: Enum (P0, P1, P2)
   - description: Text
   - acceptance_criteria: Array<String>
   - status: Enum (Pending, Approved, Implemented, Tested)

3. **Plan**
   - spec_id: Number
   - architecture: Text
   - technologies: Array<Technology>
   - phases: Array<Phase>
   - technical_decisions: Array<Decision>

4. **Task**
   - id: String (TASK-XXX)
   - title: String
   - description: Text
   - phase: Number
   - estimate_hours: Number
   - dependencies: Array<String> (task ids)
   - assignee: String (opcional)
   - status: Enum (Not Started, In Progress, In Review, Done)

5. **Checklist**
   - spec_id: Number
   - items: Array<ChecklistItem>
   - completion_percentage: Number

6. **ChecklistItem**
   - id: String
   - description: Text
   - category: Enum (Functional, Non-Functional, Testing, Documentation)
   - completed: Boolean

### Relationships
- Specification 1:1 Plan
- Specification 1:N Requirements
- Plan 1:N Tasks
- Specification 1:1 Checklist
- Checklist 1:N ChecklistItems
- Task N:N Task (dependencies)

---

## User Interface & Experience

### User Flow

0. **Aprender o Processo (Novo Aluno)**
   ```
   User: Acessa Wiki → Home do SPEC KIT
   → System apresenta Guia Rápido com 3 seções:
      1. Por que SPEC KIT? (5 min de leitura)
      2. Setup inicial (5 min hands-on)
      3. Primeira spec (30 min hands-on)
   → User completa exercício guiado
   → System sugere próxima página: "Comandos Detalhados"
   ```

1. **Iniciar Nova Feature**
   ```
   User: /speckit.specify Adicionar autenticação de usuários com OAuth2
   → System cria branch 1-user-authentication
   → System cria specs/1-user-authentication/spec.md
   → System popula spec com conteúdo inicial
   → System identifica 3 clarificações necessárias
   → System sugere: "📚 Dúvidas? Veja Wiki: Comandos/Specify"
   ```

2. **Clarificar Ambiguidades**
   ```
   User: /speckit.clarify 1
   → System lista perguntas pendentes
   → System apresenta opções para cada pergunta
   → User responde perguntas interativamente
   → System atualiza spec.md
   → System remove marcadores [NEEDS CLARIFICATION]
   ```

3. **Analisar Qualidade**
   ```
   User: /speckit.analyze 1
   → System verifica completude
   → System valida testabilidade
   → System gera relatório com score
   → System sugere melhorias
   ```

4. **Criar Plano Técnico**
   ```
   User: /speckit.plan 1
   → System analisa requisitos
   → System sugere arquitetura
   → System propõe tecnologias
   → System quebra em fases
   → System cria plan.md
   ```

5. **Gerar Tarefas**
   ```
   User: /speckit.tasks 1
   → System lê plan.md
   → System cria lista de tasks
   → System estima esforço
   → System define dependências
   → System salva tasks.json
   ```

6. **Criar Issues no GitHub**
   ```
   User: /speckit.taskstoissues 1
   → System lê tasks.json
   → System cria issues via GitHub API
   → System adiciona labels e milestones
   → System linka à spec
   → System reporta issues criados
   ```

7. **Implementar com Checklist**
   ```
   User: /speckit.checklist 1
   → System gera checklist de requisitos
   User: /speckit.implement 1
   → System guia através das tarefas
   → System valida contra checklist
   → User marca itens como concluídos
   ```

### Wireframes/Mockups

```
# Exemplo de Spec Gerada

specs/1-user-authentication/
├── spec.md               # Especificação principal
├── plan.md               # Plano técnico
├── tasks.json            # Lista de tarefas
├── clarifications.md     # Log de clarificações
├── constitution.md       # Decisões importantes
└── checklists/
    └── requirements.md   # Checklist de implementação
```

### Interaction Patterns
- Comandos seguem padrão: `/speckit.<ação> [número-da-spec]`
- Output sempre em Markdown formatado
- Prompts interativos quando necessário
- Confirmações antes de ações destrutivas
- Progresso visual em operações longas

---

## Dependencies

### Internal Dependencies
- Estrutura de diretórios `.specify/` deve existir
- Templates em `.specify/templates/` devem estar presentes
- Scripts em `.specify/scripts/` devem ser executáveis
- GitHub Copilot deve estar instalado e ativo

### External Dependencies
- **GitHub CLI (gh)**: Para criação de issues e interação com API
- **Git**: Para gerenciamento de branches
- **GitHub Copilot**: Para execução dos comandos
- **VS Code**: Editor recomendado com extensão do Copilot
- **Node.js** (opcional): Para scripts de validação
- **Bash/PowerShell**: Para execução de scripts

### Technical Dependencies
- GitHub repository com issues habilitadas
- Permissões de escrita no repositório
- Branch protection rules configuradas

---

## Constraints & Limitations

### Technical Constraints
- Limitado a repositórios Git hospedados no GitHub (arquitetura modular permite extensões futuras)
- Requer GitHub Copilot (pago) para funcionalidade completa
- Scripts shell podem ter problemas em Windows sem WSL/Git Bash
- Specs limitadas a 5,000 linhas (hard limit com orientação para split)
- Tasks.json deve seguir JSON Schema definido

### Business Constraints
- Budget: R$ 0 (projeto open source)
- Timeline: 1 semestre (fevereiro-junho 2026)
- Resources: 1-2 desenvolvedores principais + contribuidores

### Known Limitations
- Não substitui ferramentas de project management completas (Jira, Linear)
- Geração automática pode precisar de refinamento manual
- Qualidade depende da clareza da descrição inicial
- Não suporta branches além de Git (Mercurial, SVN, etc.)

---

## Risks & Mitigation

| Risk | Probability | Impact | Mitigation Strategy |
|------|-------------|--------|---------------------|
| Baixa adoção por resistência a mudança | High | High | Criar projetos piloto com early adopters, coletar feedback, demonstrar valor rapidamente |
| Qualidade das specs geradas é insuficiente | Medium | High | Iterar templates baseado em feedback, adicionar mais validações, criar biblioteca de exemplos |
| GitHub Copilot muda API ou pricing | Low | High | Documentar alternativas (usar como CLI tool), manter versão dos prompts |
| Scripts incompatíveis entre SOs | Medium | Medium | Testar em Linux, Mac e Windows, fornecer versões Bash e PowerShell |
| Specs ficam desatualizadas | High | Medium | Adicionar validação em CI, criar comando de sync, educar sobre manutenção |
| Sobrecarga de documentação | Medium | Medium | Manter templates concisos, tornar seções opcionais quando possível |
| Dependência de ferramentas pagas | Low | Medium | Documentar uso sem Copilot (templates manuais), considerar alternativas OSS |

---

## Alternatives Considered

### Alternative 1: Adaptar Estrutura Atual PMBOK/RUP
**Description**: Manter a estrutura atual e apenas atualizar conteúdo  
**Pros**: 
- Menos trabalho inicial
- Familiar para professores atuais
- Não requer treinamento extenso

**Cons**: 
- Não resolve problemas fundamentais (processo pesado, não iterativo)
- Não ensina práticas modernas
- Mantém desconexão entre doc e código

**Why not chosen**: Não atende objetivo de modernização real, apenas mascara problemas

### Alternative 2: Usar Ferramenta Comercial (Jira, Linear, Notion)
**Description**: Migrar para plataforma comercial de gerenciamento  
**Pros**: 
- Solução completa e madura
- Suporte profissional
- Integrações prontas

**Cons**: 
- Custo recorrente para instituição
- Vendor lock-in
- Menos controle e customização
- Não é código aberto (vai contra filosofia do projeto)

**Why not chosen**: Custo proibitivo para escala acadêmica, não permite customização educacional

### Alternative 3: Framework Baseado em CLI Standalone
**Description**: Criar CLI tool independente (ex: `speckit init`, `speckit plan`)  
**Pros**: 
- Independente de editor
- Mais portável
- Pode ser instalado via npm/pip

**Cons**: 
- Requer instalação adicional
- Não aproveita poder do Copilot para geração
- Menos integração com workflow do desenvolvedor

**Why not chosen**: Menor integração com fluxo de trabalho, perde benefício de AI-assisted generation

---

## Timeline & Milestones

| Milestone | Target Date | Status |
|-----------|-------------|--------|
| Definição de Requisitos Completa | 2025-11-22 | In Progress |
| Templates Finalizados | 2025-11-30 | Pending |
| Scripts de Automação Prontos | 2025-12-10 | Pending |
| Comandos Specify/Clarify/Analyze | 2025-12-20 | Pending |
| Comandos Plan/Tasks/TasksToIssues | 2026-01-15 | Pending |
| Comandos Checklist/Implement/Constitution | 2026-01-31 | Pending |
| Documentação Completa | 2026-02-15 | Pending |
| Projeto Piloto 1 | 2026-03-01 | Pending |
| Ajustes Baseados em Feedback | 2026-03-31 | Pending |
| Projetos Piloto 2 e 3 | 2026-04-30 | Pending |
| Release v1.0 | 2026-05-15 | Pending |
| Apresentação Final | 2026-06-01 | Pending |

---

## Clarification Decisions

### Session 2025-11-19

1. **Q: Qual nível de integração desejamos com GitHub Projects?**
   - **A**: Começar sem integração, adicionar como P2 (Nice to Have) posteriormente
   - **Rationale**: Foco inicial em features essenciais, GitHub Projects pode ser adicionado depois com base em feedback
   - **Impact**: Req #14 permanece como P2, não bloqueia MVP

2. **Q: Devemos suportar outros repositórios além do GitHub?**
   - **A**: GitHub-only com arquitetura modular para facilitar extensões futuras
   - **Rationale**: GitHub é amplamente adotado na FATEC, arquitetura modular permite adicionar GitLab/Bitbucket futuramente
   - **Impact**: Reduz escopo inicial, mantém qualidade, permite extensibilidade

3. **Q: Como lidar com specs grandes que não cabem no contexto do Copilot?**
   - **A**: Hard limit de 5,000 linhas com rejeição e orientação para split
   - **Rationale**: Specs maiores indicam necessidade de quebrar feature em partes menores, promove modularidade
   - **Impact**: Adicionado a Non-Functional Requirements / Scalability

4. **Q: Qual formato de tasks.json usar?**
   - **A**: JSON com JSON Schema validation
   - **Rationale**: Melhor balance entre compatibilidade universal, validação estrita, e suporte IDE
   - **Impact**: Tasks.json terá schema definido para validação automática

5. **Q: Precisamos de controle de versão de specs?**
   - **A**: Semantic versioning (1.0.0, 1.1.0, etc.) no frontmatter + Revision History
   - **Rationale**: Versionamento explícito facilita comunicação de mudanças e rastreamento
   - **Impact**: Template de spec incluirá campo de versão, comandos atualizarão versão automaticamente

6. **Q: Devemos criar um command `/speckit.init` para setup inicial do repositório?**
   - **A**: Sim, criar `/speckit.init` para setup automatizado
   - **Rationale**: Reduz fricção de adoção, garante configuração consistente, excelente primeira impressão
   - **Impact**: Adicionar comando #10 (será P0 - Must Have)

7. **Q: Como medir efetivamente o sucesso do framework?**
   - **A**: Manter os 6 KPIs atuais (suficiente)
   - **Rationale**: KPIs existentes cobrem dimensões críticas sem criar overhead de medição
   - **Impact**: Nenhuma alteração na seção Success Criteria

---

## Assumptions

1. Usuários têm conhecimento básico de Git e GitHub
2. Ambiente de desenvolvimento inclui VS Code ou editor compatível com Copilot
3. Internet disponível para acesso à API do GitHub e Copilot
4. Projetos seguirão metodologia ágil com sprints/iterações
5. Equipes terão entre 3-10 pessoas (tamanho típico de projeto acadêmico)
6. Specs serão escritas em português ou inglês
7. GitHub Free tier é suficiente (não requer GitHub Enterprise)
8. Comandos serão executados por pessoas técnicas (desenvolvedores, tech leads)

---

## Out of Scope

Explicitamente NÃO incluído nesta especificação:

- Sistema de autenticação ou permissões além do GitHub
- Interface gráfica web para gerenciar specs
- Sincronização bidirecional com ferramentas externas (Jira, Trello)
- Geração automática de código a partir de specs
- Testes automatizados de implementação
- Deployment ou CI/CD configuration
- Gestão de recursos humanos ou alocação de pessoas
- Timetracking ou controle de horas
- Relatórios financeiros ou de custos
- Integração com sistemas acadêmicos (SIGA, Moodle)
- Suporte para múltiplos repositórios simultâneos
- Mobile apps ou interfaces mobile-optimized
- Tradução automática entre idiomas
- AI para code review ou sugestões de implementação
- Gerenciamento de releases ou versões do produto final
- Plataforma de e-learning completa (Moodle, Canvas, etc.)
- Sistema de avaliação/notas automático
- Fórum de discussão ou chat integrado no wiki
- Certificações ou credenciais formais

---

## References & Resources

- [GitHub SPEC KIT Original](https://github.com/github/spec-kit)
- [GitHub Copilot Custom Instructions](https://docs.github.com/en/copilot/customizing-copilot/adding-custom-instructions-for-github-copilot)
- [GitHub CLI Documentation](https://cli.github.com/)
- [Specification by Example - Gojko Adzic](https://gojko.net/books/specification-by-example/)
- [Shape Up - Basecamp](https://basecamp.com/shapeup)
- [RFC Process - IETF](https://www.ietf.org/standards/rfcs/)
- [ADR (Architecture Decision Records)](https://adr.github.io/)
- [User Story Mapping - Jeff Patton](https://www.jpattonassociates.com/user-story-mapping/)

---

## Revision History

| Date | Version | Author | Changes |
|------|---------|--------|---------|
| 2025-11-19 | 0.1.0 | GitHub Copilot | Initial draft - complete specification |
| 2025-11-19 | 0.2.0 | GitHub Copilot | Clarification session completed - resolved 7 open questions, added /speckit.init command (P0), updated constraints and scalability requirements |
| 2025-11-19 | 0.3.0 | GitHub Copilot | Added wiki modernization requirements - P0 requirement for instructional wiki, P1 for legacy content migration, P2 for gamification, new user scenario for student learning, updated KPIs and DoD |

---

## Approvals

| Role | Name | Signature | Date |
|------|------|-----------|------|
| Product Owner | Prof. FATEC | Pending | |
| Tech Lead | Johnny Vaz | Pending | |
| Academic Coordinator | | Pending | |
