---
description: Code review or analysis using Codex
---

# Codex Consultation

Using the codex MCP tool for code review or analysis.

## Request

$ARGUMENTS

## Instructions

1. Identify the relevant code files to review
2. **CRITICAL**: Call the codex MCP tool with these EXACT parameters:
   ```
   prompt: "<your review request with code context>"
   model: "gpt-5.2-codex"
   ```
3. Present Codex's findings clearly
4. Offer to fix any issues found

## Model Enforcement

This command REQUIRES `model: "gpt-5.2-codex"`. Do NOT omit the model parameter.

## Other Model Options

- **gpt-5.1-codex-max**: For deep analysis, use the **codex-critic** agent instead
- **gpt-5.1-codex-mini**: For quick checks, pass `model: "gpt-5.1-codex-mini"` explicitly
