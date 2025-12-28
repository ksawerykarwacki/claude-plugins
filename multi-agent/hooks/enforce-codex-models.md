---
event: PreToolUse
match_tool_name: "^mcp__plugin_multi-agent_codex__"
---

# Model Parameter Enforcement - Codex

You are about to call a Codex MCP tool. **CRITICAL**: Ensure you are passing the correct `model` parameter.

## Required Model Selection

| Use Case | Model | Description |
|----------|-------|-------------|
| Deep analysis, complex debugging | `gpt-5.1-codex-max` | Long-running detailed work |
| Agentic tasks, quick reviews | `gpt-5.2-codex` | Latest frontier model |
| Quick checks, simple validation | `gpt-5.1-codex-mini` | Fast and cheap |

## Check Your Call

If you did NOT specify a `model` parameter, **STOP and add it now**.

For **thorough code review** (codex-critic style), use:
```
model: "gpt-5.1-codex-max"
```

For **quick agentic tasks**, use:
```
model: "gpt-5.2-codex"
```
