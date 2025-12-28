---
description: Code review or analysis using Codex
---

# Codex Consultation

Using the codex MCP tool for code review or analysis.

## Request

$ARGUMENTS

## Instructions

1. Identify the relevant code files to review
2. Call the codex MCP tool with `model: "gpt-5.2-codex"` for deep code analysis
3. Present Codex's findings clearly
4. Offer to fix any issues found

## Model Options

- **gpt-5.2-codex**: Agentic tasks, reliable tool calling (default for ask-codex)
- **gpt-5.1-codex-max**: Deep analysis, project-scale refactors (used by codex-critic)
- **gpt-5.1-codex-mini**: Cheaper, faster for quick checks
