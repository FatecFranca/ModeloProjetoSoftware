# Research - SPEC KIT Framework

## Testing approach for automation scripts (resolved NEEDS CLARIFICATION)
Decision: Use zero-dependency smoke tests for Bash and PowerShell commands executed with `bash -euo pipefail` and `pwsh -NoLogo -NoProfile`, covering `--help`/dry-run flows and JSON outputs; prefer `shellcheck` when available but keep it optional to fit the academic environment.  
Rationale: Cross-platform support (Linux/macOS/Windows) with R$0 budget, quick execution (<30s target from spec), and repeatable checks without extra installs for students.  
Alternatives considered: Bats/Pester frameworks (extra install/setup), manual verification only (non-repeatable and error-prone), GitHub Actions-only validation (leaves local users without feedback).

## Constitution baseline for SPEC KIT governance
Decision: Author a lightweight constitution in `/home/johnny/Documentos/FATEC/GITHUB/ModeloProjetoSoftware/.specify/memory/constitution.md` with principles for docs-first templates, GitHub-only integration, cross-platform parity, smoke-tested scripts, and traceability between specs, plans, tasks, issues, and wiki updates.  
Rationale: Required to unblock Constitution gate, provide clear rules for automation changes, and align wiki modernization with the same standards used by the commands.  
Alternatives considered: Keep placeholder (blocks gates and leaves rules undefined), import a heavy engineering handbook (overkill for academic workflows and slows adoption).

## GitHub CLI + Git integration best practices
Decision: Check `gh auth status` non-interactively before API calls; avoid logging tokens; wrap `gh` calls with idempotent checks and dry-run previews; respect branch naming `N-short-name`; surface fallback guidance for offline environments; prefer GitHub CLI over raw API calls to reduce boilerplate.  
Rationale: Protects credentials, keeps automation deterministic for students, honors <30s response targets, and matches the GitHub-only constraint in the spec.  
Alternatives considered: Raw `curl` to GitHub API (more brittle auth handling), manual issue creation (no automation/rastreabilidade), PAT-only flows (breaks SSO setups).

## tasks.json schema and validation approach
Decision: Publish a JSON Schema (draft-07) at `/home/johnny/Documentos/FATEC/GITHUB/ModeloProjetoSoftware/specs/1-speckit-framework/contracts/tasks.schema.json`; enforce required fields (id, title, description, phase, estimate_hours, status), enums for status/priority, max 500 tasks, and dependency ids that reference existing tasks; validate via `node` + `ajv` when available, with lightweight `jq` sanity checks documented for zero-install use.  
Rationale: Schema-driven validation keeps tasks consistent with P0 requirements, works in CI and locally, and stays tool-agnostic while meeting the 500-task cap and JSON requirement.  
Alternatives considered: Ad-hoc validation scripts (harder to reuse), unstructured JSON (error-prone), switching to YAML (adds parser fragmentation and not requested).
