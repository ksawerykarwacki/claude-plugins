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
- **gemini-reviewer**: Invoked for design/plan review before implementation
- **codex-reviewer**: Invoked for code review, security analysis

You don't need to explicitly call these - Claude uses them based on context.

## What's Included

```
multi-agent/
├── .claude-plugin/plugin.json    # Plugin identity
├── .mcp.json                     # MCP server configuration
├── agents/
│   ├── gemini-strategist.md     # Architecture planning agent
│   ├── gemini-reviewer.md       # Design/plan review agent
│   ├── codex-critic.md          # Complaining pair programmer
│   └── multi-explorer.md        # Alternative exploration agent
├── commands/
│   ├── fullauto.md              # Full orchestration workflow
│   ├── ask-gemini.md            # Quick Gemini consultation
│   └── ask-codex.md             # Codex code review
└── skills/
    ├── gemini-architect/        # Architecture decision skill
    ├── gemini-reviewer/         # Design/plan review skill
    └── codex-reviewer/          # Code review skill
```

## Agents

The plugin includes specialized agents that can be delegated complex tasks:

| Agent | Role | When to Use |
|-------|------|-------------|
| `gemini-strategist` | Architecture advisor | BEFORE implementing - "How should we build this?" |
| `gemini-reviewer` | Design/plan reviewer | BEFORE implementing - "Is this design solid?" |
| `codex-critic` | Complaining pair programmer | AFTER implementing - "What's wrong with this code?" |
| `multi-explorer` | Alternative explorer | BEFORE deciding - "What are the different approaches?" |

### The FULLAUTO Workflow

The `/multi-agent:fullauto` command executes a structured 6-phase workflow:

```
┌─────────────────────────────────────────────────────────────┐
│                    FULLAUTO MODE                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Phase 1: Discovery          → Understand the request       │
│      │    (AskUserQuestion)     Clarify ambiguities         │
│      ▼                                                      │
│  Phase 2: Exploration        → Find relevant files          │
│      │    (Explore agent)       Understand patterns         │
│      │    (Gemini)              Analyze architecture        │
│      ▼                                                      │
│  Phase 3: Planning           → Design solution              │
│      │    (Gemini)              Validate with gemini-reviewer│
│      │    (TodoWrite)           Break into tasks            │
│      ▼                                                      │
│  Phase 4: Implementation     → Build the solution           │
│      │    (TodoWrite)           Track progress              │
│      ▼                                                      │
│  Phase 5: Validation         → Run tests                    │
│      │    (Codex + Gemini)      Parallel review             │
│      │    (TodoWrite)           Track issues                │
│      ▼                                                      │
│  Phase 6: Summary            → Document changes             │
│           (TodoWrite)           Suggest next steps          │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Key Features**:
- Uses `TodoWrite` throughout for progress tracking
- Uses `AskUserQuestion` early for clarifications
- Parallel agent reviews in validation phase
- Filters by confidence (only addresses high-confidence issues)

### Example Usage

```bash
# Get architecture advice before coding
"Use gemini-strategist to plan how to add user authentication"

# Review a design/plan before implementing
"Have gemini-reviewer check this API design for issues"

# After Opus implements, get critical review
"Have codex-critic review the authentication code I just wrote"

# Explore alternatives before committing
"Use multi-explorer to compare different caching strategies"
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
