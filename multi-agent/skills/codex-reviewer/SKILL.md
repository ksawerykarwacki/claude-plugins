---
description: Use Codex for code review, implementation validation, and bug detection. Codex excels at understanding code semantics and catching issues. Use when reviewing code quality, security, or validating implementations.
---

# When to Use Codex

Use the codex MCP tool when:
- Reviewing code for bugs, security issues, or best practices
- Validating an implementation against requirements
- Need detailed code analysis
- Want a second opinion on code quality

## Model Selection

- **gpt-5.1-codex-max**: Deep, detailed analysis - project-scale refactors, complex debugging (recommended for codex-critic)
- **gpt-5.2-codex**: Agentic coding tasks, reliable tool calling, quick reviews
- **gpt-5.1-codex-mini**: Cheaper, faster for simple validation

## How to Use

1. Identify the code to review
2. Call the codex MCP tool with `model: "gpt-5.2-codex"` for deep analysis
3. Address findings and iterate

## Example Scenarios

- "Review this authentication implementation for security issues"
- "Check if this code handles all edge cases"
- "Validate this implementation against the spec"

## When NOT to Use

- High-level architecture decisions (use Gemini instead)
- Simple refactoring you can do yourself
- When the user wants quick changes without review
