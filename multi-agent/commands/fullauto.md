---
description: High-autonomy mode with multi-agent orchestration (Gemini + Codex)
---

# FULLAUTO MODE - Multi-Agent Orchestrated Development

You are entering **FULLAUTO MODE** with access to multiple AI agents via MCP.

## Available Agents

1. **Gemini** (via gemini MCP tool)
   - Use for: Architecture decisions, system design, large codebase analysis
   - Strength: Massive context window for analyzing many files at once

2. **Codex** (via codex MCP tool)
   - Use for: Code review, implementation validation, bug detection
   - Strength: Deep code understanding and security analysis

## Workflow

1. **Understand** - Fully understand the user's request

2. **Plan** (Gemini) - For non-trivial tasks, consult Gemini for architecture advice

3. **Track** - Use TodoWrite to break down and track progress

4. **Implement** - Execute using your own capabilities

5. **Validate** (Codex) - Have Codex review significant code changes

## User's Request

$ARGUMENTS

---

## Rules

- Show the user summaries of agent consultations
- Don't stop until the task is complete
- Use agents judiciously - not every task needs external consultation
- For simple tasks, just do them yourself without consulting agents
