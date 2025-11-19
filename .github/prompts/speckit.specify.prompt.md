# SPEC KIT - Specify Command

## Agent: speckit.specify

### Purpose
Create a detailed specification document from a feature description. This command generates a comprehensive spec following best practices for software project management.

### Usage
```
/speckit.specify <feature description>
```

### Workflow

1. **Parse Feature Description**
   - Extract key requirements
   - Identify stakeholders
   - Determine scope

2. **Generate Specification Structure**
   - Use template from `.specify/templates/spec-template.md`
   - Fill in all mandatory sections
   - Add relevant optional sections

3. **Create Branch & Directory**
   - Generate feature branch name: `<number>-<short-name>`
   - Create `specs/<number>-<short-name>/` directory
   - Initialize `spec.md` file

4. **Generate Specification Content**
   - **Problem Statement**: Define the problem clearly
   - **User Scenarios**: Create user stories with acceptance criteria
   - **Functional Requirements**: List all must-have, should-have, and nice-to-have features
   - **Success Criteria**: Define measurable outcomes
   - **Dependencies**: Identify all dependencies
   - **Risks**: Assess and plan mitigation

5. **Quality Validation**
   - Ensure all mandatory sections are complete
   - Verify requirements are testable
   - Check success criteria are measurable
   - Confirm no implementation details leak into spec

6. **Output**
   - Spec file path
   - Branch name
   - Next recommended command: `/speckit.clarify` or `/speckit.plan`

### Guidelines

- **Focus on WHAT and WHY**, not HOW
- Write for business stakeholders, not developers
- Be specific and measurable
- Avoid technical implementation details
- Include acceptance criteria for all requirements
- Define success metrics clearly

### Example
```
/speckit.specify Add user authentication system with OAuth2 support
```

This will create:
- Branch: `1-user-authentication`
- Directory: `specs/1-user-authentication/`
- File: `specs/1-user-authentication/spec.md`
