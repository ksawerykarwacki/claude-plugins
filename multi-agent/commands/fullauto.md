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

1. **Context Gathering**
   - Read FULLAUTO_CONTEXT.md if it exists for project state
   - Understand the user's request fully

2. **Strategic Planning** (Gemini)
   - For non-trivial tasks, consult Gemini for architecture advice
   - Share relevant code files with Gemini for context

3. **Implementation**
   - Execute the plan using your own capabilities
   - Use TodoWrite to track progress

4. **Validation** (Codex)
   - Have Codex review significant code changes
   - Address any issues found

5. **Update Context**
   - Update FULLAUTO_CONTEXT.md with progress
   - Mark completed items

## User's Request

$ARGUMENTS

---

## Rules

- Show the user summaries of agent consultations
- Don't stop until the task is complete
- Use agents judiciously - not every task needs external consultation
- For simple tasks, just do them yourself without consulting agents
