# Claude Plugins

Personal Claude Code plugin marketplace.

## Installation

```bash
# Add this marketplace to Claude Code
claude plugin marketplace add https://github.com/ksawerykarwacki/claude-plugins

# Install a plugin
claude plugin install multi-agent@ksawery-plugins
```

**Alternative: Project-local symlink**
```bash
ln -s ~/git/ksawerykarwacki/claude-plugins/multi-agent ./multi-agent
```

## Available Plugins

| Plugin | Description |
|--------|-------------|
| [multi-agent](multi-agent/) | Multi-agent orchestration with Gemini and Codex |

## Adding New Plugins

1. Create a new directory at repo root: `my-plugin/`
2. Add `.claude-plugin/plugin.json` inside it
3. Update `.claude-plugin/marketplace.json` to include it
