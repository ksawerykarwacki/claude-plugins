---
description: Use Gemini for strategic architecture decisions, system design, and high-level planning. Gemini has a massive context window ideal for analyzing large codebases. Use when planning architecture, evaluating trade-offs, or need a second opinion on complex design.
---

# When to Use Gemini

Use the gemini MCP tool when:
- Planning system architecture or major refactors
- Analyzing large codebases or multiple files
- Making strategic technical decisions
- Evaluating trade-offs between approaches
- Need a "second opinion" on complex design choices

## How to Use

1. Gather relevant context (files, requirements, constraints)
2. Call the gemini MCP tool with a clear question
3. Review Gemini's response and integrate insights

## Example Scenarios

- "What's the best architecture for adding a caching layer?"
- "Review these files and identify potential race conditions"
- "Evaluate trade-offs between REST and GraphQL for this use case"

## When NOT to Use

- Simple code generation (use your own capabilities)
- Quick syntax questions (just answer them)
- When the user explicitly doesn't want external consultation
