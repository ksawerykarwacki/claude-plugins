---
event: PreToolUse
match_tool_name: "^mcp__plugin_multi-agent_gemini__"
---

# Model Parameter Enforcement - Gemini

You are about to call a Gemini MCP tool. **CRITICAL**: Ensure you are passing the correct `model` parameter.

## Required Model Selection

| Tool | Default Model | When to Use |
|------|---------------|-------------|
| `ask-gemini` | `gemini-3-flash-preview` | Quick consultations, validation |
| `brainstorm` | `gemini-3-pro-preview` | Creative ideation, deep thinking |

For **architecture, planning, or deep analysis**, use `model: "gemini-3-pro-preview"`.

## Check Your Call

If you did NOT specify a `model` parameter, **STOP and add it now**. The default (gemini-2.5-pro) is outdated.

Example:
```
model: "gemini-3-pro-preview"  # For deep analysis
model: "gemini-3-flash-preview"  # For quick checks
```
