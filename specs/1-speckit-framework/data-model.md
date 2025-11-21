# Data Model - SPEC KIT Framework

## Entities

### Specification
- `id` (integer, >=1, sequential) — unique identifier for the spec.
- `short_name` (string, pattern `^[0-9]+-[a-z0-9-]+$`, unique) — derived from feature branch naming.
- `title` (string, 1-150 chars) — human-friendly name.
- `version` (string, semver) — spec semantic version.
- `status` (enum: Draft, In Review, Approved, In Development, Complete).
- `created_at` / `updated_at` (ISO 8601 datetime).
- `owner` (string) — primary responsible person.
- `stakeholders` (array<string>) — reviewers/consumers.
- `problem_statement` (text) — pain points.
- `proposed_solution` (text) — solution outline.
- `requirements` (array<Requirement>) — functional/non-functional.
- `success_criteria` (array<Criterion>) — measurable goals.
- `risks` (array<Risk>) — mitigations attached.
- `plan` (Plan) — technical plan reference.
- `checklist` (Checklist) — implementation checklist.
- `clarifications` (array<Clarification>) — Q&A log.
- Constraints: file length <=5,000 lines; all arrays trimmed of null/empty strings.

### Requirement
- `id` (string, pattern `REQ-[0-9]{3,}` unique within spec).
- `type` (enum: Functional, Non-Functional).
- `priority` (enum: P0, P1, P2).
- `description` (text, 1-500 chars).
- `acceptance_criteria` (array<string>, minItems 1).
- `status` (enum: Pending, Approved, Implemented, Tested).

### Plan
- `spec_id` (FK -> Specification.id).
- `architecture` (text) — architecture narrative.
- `technologies` (array<string>) — selected stack choices.
- `phases` (array<Phase>) — ordered delivery phases.
- `technical_decisions` (array<Decision>) — key trade-offs with rationale.

### Phase
- `number` (integer >=1).
- `name` (string).
- `scope` (text) — deliverables.
- `exit_criteria` (array<string>) — measurable phase completion rules.

### Task
- `id` (string, pattern `TASK-[0-9]{3,}` unique within spec).
- `title` (string, 1-120 chars).
- `description` (text) — actionable unit of work.
- `phase` (integer >=1) — maps to Plan.phases number.
- `estimate_hours` (number >=0, step 0.5).
- `dependencies` (array<string>, values must reference existing Task.id).
- `assignee` (string, optional).
- `status` (enum: Not Started, In Progress, In Review, Done).
- Constraints: max 500 tasks per spec.

### Checklist
- `spec_id` (FK -> Specification.id).
- `items` (array<ChecklistItem>).
- `completion_percentage` (number 0-100, derived).

### ChecklistItem
- `id` (string, unique within checklist).
- `description` (text, 1-200 chars).
- `category` (enum: Functional, Non-Functional, Testing, Documentation).
- `completed` (boolean).

### Clarification
- `question` (text).
- `answer` (text).
- `created_at` (ISO 8601 datetime).
- `status` (enum: Open, Answered, Resolved).

### Constitution
- `version` (semver).
- `ratified_at` (ISO 8601 date).
- `principles` (array<string>).
- `gates` (array<string>) — planning, testing, traceability rules.

## Relationships
- Specification 1:1 Plan
- Specification 1:N Requirements
- Specification 1:N Clarifications
- Specification 1:1 Checklist
- Plan 1:N Phases
- Plan 1:N Tasks (via Phase number)
- Checklist 1:N ChecklistItems
- Task N:N Task (dependencies)

## State Transitions
- Specification.status: Draft → In Review → Approved → In Development → Complete (rollback allowed to In Review if scope changes).
- Requirement.status: Pending → Approved → Implemented → Tested.
- Task.status: Not Started → In Progress → In Review → Done (blocked if dependencies incomplete).
- Clarification.status: Open → Answered → Resolved (resolutions should update spec.md).

## Validation Rules
- `short_name` must match branch naming and be unique.
- Requirements must include at least one acceptance criterion and a priority.
- Tasks must reference an existing phase number and valid dependency ids; hard cap of 500 tasks.
- Specs exceeding 5,000 lines are rejected with instruction to split scope.
- All dates/times use ISO 8601; numerical IDs increment without reuse inside a spec.
