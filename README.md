# Claude Plugins

Personal Claude Code plugins and configuration.

## Plugins

### multi-agent

Multi-agent orchestration with Gemini and Codex. See [multi-agent/README.md](multi-agent/README.md).

**Commands:**
- `/multi-agent:fullauto` - High-autonomy mode with multi-agent orchestration
- `/multi-agent:ask-gemini` - Quick Gemini consultation
- `/multi-agent:ask-codex` - Codex code review

## Installation

Symlink plugins to your project or set up a local marketplace:

```bash
# Project-local
ln -s ~/git/ksawerykarwacki/claude-plugins/multi-agent ./multi-agent

# Or global marketplace
mkdir -p ~/.claude-plugins/.claude-plugin
ln -s ~/git/ksawerykarwacki/claude-plugins/multi-agent ~/.claude-plugins/multi-agent
```
