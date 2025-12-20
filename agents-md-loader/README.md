# agents-md-loader

Automatically discovers and loads `AGENTS.md` files into Claude's context at session start.

## Background

This plugin implements the workaround described in [Claude Code Issue #6235](https://github.com/anthropics/claude-code/issues/6235) until native AGENTS.md support is added.

[AGENTS.md](https://agents.md/) is an open standard for guiding AI coding agents, used by 20,000+ open-source projects and supported by Codex, Amp, Cursor, and other tools.

## Features

- Recursively finds all `AGENTS.md` files in your project
- Loads content at session start (SessionStart hook)
- Works alongside `CLAUDE.md` (both are loaded, complementing each other)
- Silent no-op when no `AGENTS.md` files exist

## Usage

1. Enable the plugin in your Claude Code settings
2. Create `AGENTS.md` files in your projects
3. Start a Claude Code session - the content is automatically loaded

## Example AGENTS.md

```markdown
# Project Agent Guidelines

## Code Style
- Use TypeScript for all new code
- Follow ESLint rules defined in .eslintrc

## Testing
- Write unit tests for all new functions
- Maintain 80% code coverage

## Architecture
- Use dependency injection
- Follow the repository pattern for data access
```

## How It Works

The plugin registers a `SessionStart` hook that:
1. Searches the current directory recursively for `AGENTS.md` files
2. Outputs their contents to stdout
3. Claude Code injects this as context for the session
