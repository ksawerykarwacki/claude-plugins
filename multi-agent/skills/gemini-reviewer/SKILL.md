---
description: Use Gemini to review designs, plans, and technical proposals before implementation. Catches architectural issues, validates API contracts, and ensures designs align with codebase patterns. Use proactively before starting implementation work.
---

# When to Use Gemini Reviewer

Use the gemini-reviewer agent when:
- About to implement a new feature or architectural change
- Reviewing API designs or data models
- Validating technical proposals or RFCs
- Checking if a plan accounts for edge cases
- Ensuring consistency with existing patterns

## Model Used

The gemini-reviewer agent uses **gemini-3-pro-preview** for deep analytical review.

## How to Use

1. Prepare the design/plan to be reviewed (document, code outline, or description)
2. Launch the gemini-reviewer agent with the Task tool
3. The agent will analyze using Gemini and provide structured feedback
4. Address issues before implementation

## Example Scenarios

- "Review this API design for the new authentication flow"
- "Check if this database schema handles all our use cases"
- "Validate this migration plan before we start"
- "Does this component design follow our existing patterns?"

## Benefits

- Catches issues before code is written (cheaper to fix)
- Leverages Gemini's large context for holistic analysis
- Provides structured, actionable feedback
- Ensures designs align with existing codebase

## When NOT to Use

- Simple, obvious implementations with no design choices
- After code is already written (use codex-critic instead)
- When you need code review, not design review
