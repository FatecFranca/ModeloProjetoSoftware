# SPEC KIT Framework Constitution

## Core Principles

### I. Docs-First Templates
Every feature starts with the SPEC KIT templates (spec, plan, research, contracts, quickstart); content must focus on WHAT/WHY, with implementation kept in later phases. Updates to automation must preserve template compatibility.

### II. GitHub-Only Integration
Automation targets GitHub repositories using Git and GitHub CLI. No other SCM/hosting is supported. Never log tokens or secrets; prefer `gh auth status` to verify authentication before operations.

### III. Tested Automation (NON-NEGOTIABLE)
Shell and PowerShell scripts must be smoke-tested (`bash -euo pipefail` and `pwsh -NoLogo -NoProfile`) before release. Failure handling must be explicit; scripts should support dry-run/help modes.

### IV. Cross-Platform Parity
Features must support Linux/macOS (Bash) and Windows (PowerShell) with equivalent capabilities. Degradations must be documented, and portable defaults are preferred over OS-specific logic.

### V. Traceability and Versioning
Maintain linkage spec → plan → tasks → issues → wiki. Templates and schemas use semantic versioning; changes must document rationale and migration guidance.

## Operational Constraints
- Performance: commands <30s (p95); spec generation <2min; batch issue creation <10s for 20 tasks.
- Limits: spec files <=5,000 lines; tasks.json <=500 tasks; GitHub-only scope.
- Budget: R$0; avoid external paid dependencies. Optional tools (shellcheck, ajv) must degrade gracefully.
- Security: no secret exposure in logs; prefer local auth flows (gh CLI) and dry-run options.

## Workflow and Gates
- Planning Gate: Technical context must be defined; Constitution Check recorded in plan.md before research starts.
- Testing Gate: Automation changes require smoke-test coverage for Bash and PowerShell paths.
- Traceability Gate: New commands or wiki changes must update relevant spec/plan/research/contracts/quickstart files and link to schema versions.
- Exception Handling: Any violation must be justified in plan.md under Complexity Tracking with a simpler alternative rejected.

## Governance
- This constitution supersedes other process documents for SPEC KIT work. Amendments require version bump, rationale, and date update. Reviews must verify adherence to principles and gates.

**Version**: 1.0.0 | **Ratified**: 2025-11-21 | **Last Amended**: 2025-11-21
