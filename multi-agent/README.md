# Multi-Agent Plugin for Claude Code

A Claude Code plugin that provides seamless access to multiple AI agents (Gemini, Codex) for orchestrated development workflows.

## Prerequisites

- [Claude Code](https://claude.ai/code) CLI installed
- [Gemini CLI](https://github.com/anthropics/gemini-cli) installed and authenticated (`gemini` command works)
- [Codex CLI](https://github.com/openai/codex) installed and authenticated (`codex` command works)

## Installation

### Option 1: Project-Local (Recommended)

Copy or symlink this plugin to your project:

```bash
# Symlink (updates automatically)
ln -s /path/to/claude-plugins/multi-agent ./multi-agent

# Or copy
cp -r /path/to/claude-plugins/multi-agent ./multi-agent
```

Claude Code auto-discovers plugins in the working directory.

### Option 2: Local Marketplace

```bash
# Create marketplace structure
mkdir -p ~/.claude-plugins/.claude-plugin

# Symlink this plugin
ln -s /path/to/claude-plugins/multi-agent ~/.claude-plugins/multi-agent

# Create marketplace manifest
cat > ~/.claude-plugins/.claude-plugin/marketplace.json << 'EOF'
{
  "name": "local-plugins",
  "plugins": [
    {"name": "multi-agent", "source": "./multi-agent"}
  ]
}
EOF

# In Claude Code:
# /plugin marketplace add ~/.claude-plugins
# /plugin install multi-agent@local-plugins
```

## Usage

### Commands

All commands are namespaced with `multi-agent:`:

```bash
# Full orchestration mode - uses both Gemini and Codex
/multi-agent:fullauto implement a caching layer for the API

# Quick Gemini consultation for architecture advice
/multi-agent:ask-gemini what's the best approach for handling auth?

# Codex code review
/multi-agent:ask-codex review the payment processing module
```

### Skills (Auto-Invoked)

The plugin includes skills that Claude automatically uses when relevant:

- **gemini-architect**: Invoked for architecture decisions, system design
- **codex-reviewer**: Invoked for code review, security analysis

You don't need to explicitly call these - Claude uses them based on context.

## What's Included

```
multi-agent/
├── .claude-plugin/plugin.json    # Plugin identity
├── .mcp.json                     # MCP server configuration
├── commands/
│   ├── fullauto.md              # Full orchestration workflow
│   ├── ask-gemini.md            # Quick Gemini consultation
│   └── ask-codex.md             # Codex code review
└── skills/
    ├── gemini-architect/        # Architecture decision skill
    └── codex-reviewer/          # Code review skill
```

## MCP Servers

This plugin registers two MCP servers:

| Server | Tool | Purpose |
|--------|------|---------|
| `gemini` | `gemini-mcp-tool` | Wraps Gemini CLI for architecture advice |
| `codex` | `codex mcp-server` | Native Codex MCP server for code tasks |

## Troubleshooting

### MCP servers not starting

Verify the CLIs work directly:
```bash
gemini "test"
codex exec "test"
```

### Commands not found

Check plugin is loaded:
```bash
# In Claude Code
/plugin list
```

## License

MIT
