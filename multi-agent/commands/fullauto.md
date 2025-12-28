---
description: High-autonomy mode with multi-agent orchestration (Gemini + Codex)
---

# FULLAUTO MODE - Multi-Agent Orchestrated Development

You are entering **FULLAUTO MODE** - a high-autonomy workflow that orchestrates multiple AI agents to deliver complete solutions.

## User's Request

$ARGUMENTS

---

## Core Principles

1. **Track Everything** - Use TodoWrite extensively to track phases and tasks
2. **Understand Before Acting** - Never implement without understanding the codebase first
3. **Ask, Don't Assume** - Use AskUserQuestion for ambiguities
4. **Review Before Completion** - Always validate significant work

## Available Agents

### External Agents (via MCP Tools)

| Agent | MCP Tool | Model | Use For |
|-------|----------|-------|---------|
| **Gemini Pro** | `gemini` | `gemini-3-pro-preview` | Architecture, system design, planning |
| **Gemini Flash** | `gemini` | `gemini-3-flash-preview` | Quick checks, validation |
| **Codex Max** | `codex` | `gpt-5.1-codex-max` | Deep analysis, project-scale refactors |
| **Codex** | `codex` | `gpt-5.2-codex` | Agentic tasks, quick reviews |
| **Codex Mini** | `codex` | `gpt-5.1-codex-mini` | Quick code checks |

### Built-in Agents (via Task Tool)

| Agent | Subagent Type | Use For |
|-------|---------------|---------|
| **Explore** | `Explore` | Finding files, searching code, understanding codebase |
| **gemini-strategist** | `multi-agent:gemini-strategist` | Architecture planning with Gemini |
| **gemini-reviewer** | `multi-agent:gemini-reviewer` | Design/plan validation before implementation |
| **codex-critic** | `multi-agent:codex-critic` | Critical code review after implementation |
| **multi-explorer** | `multi-agent:multi-explorer` | Exploring alternatives with both Gemini and Codex |

## The 6-Phase Workflow

Execute these phases in order. Use TodoWrite to track progress through each phase.

### Phase 1: Discovery & Understanding

**Goal**: Fully understand what needs to be built.

**Actions**:
1. Parse the user's request to extract:
   - Core objective (what they want)
   - Constraints (limitations, requirements)
   - Success criteria (how to know it's done)
2. If the request is ambiguous, use **AskUserQuestion** to clarify
3. Create initial TodoWrite entries for the phases

**Output**: Clear understanding of the task with defined scope.

---

### Phase 2: Codebase Exploration

**Goal**: Understand existing patterns before making changes.

**Actions**:
1. Use **Task tool with Explore agent** to find relevant files and patterns
2. Read key files to understand:
   - Existing conventions and patterns
   - Related functionality
   - Integration points
3. For complex tasks, consult **Gemini Pro** for holistic analysis:
   ```
   Use gemini MCP tool with model="gemini-3-pro-preview": "Analyze these files and explain the architecture patterns..."
   ```

**Output**: Understanding of codebase context and conventions to follow.

---

### Phase 3: Architecture & Planning

**Goal**: Design the solution before implementing.

**Actions**:
1. **For non-trivial tasks** (>3 files or architectural decisions), consult **Gemini Pro**:
   ```
   Use gemini MCP tool with model="gemini-3-pro-preview": "Design an architecture for [feature] that follows the patterns in [files]..."
   ```

2. **Validate the design** before implementing:
   - Use **gemini-reviewer agent** (via Task tool) for design review
   - Or quick Gemini check: "What are the potential issues with this approach?"

3. **Break down into tasks** using **TodoWrite**:
   - Each task should be atomic and completable
   - Order tasks by dependencies
   - Include: files to modify, what changes, acceptance criteria

4. **Present the plan** to the user before implementing:
   - Summary of approach
   - Key files to modify
   - Any trade-offs or decisions made

**Skip if**: Task is simple (single file, obvious implementation)

**Output**: Approved plan with TodoWrite tasks ready for implementation.

---

### Phase 4: Implementation

**Goal**: Build the solution following the plan.

**Actions**:
1. Work through TodoWrite tasks sequentially
2. Mark each task as `in_progress` before starting, `completed` when done
3. Follow codebase conventions discovered in Phase 2
4. For each significant piece of code:
   - Keep changes minimal and focused
   - Don't over-engineer or add unnecessary abstractions
   - Maintain existing patterns

**Rules**:
- Only ONE task should be `in_progress` at a time
- Complete tasks immediately when done (don't batch)
- If blocked, create new todos for blockers

---

### Phase 5: Validation & Review

**Goal**: Ensure quality before declaring completion.

**Actions**:
1. **Run tests** if they exist:
   - Execute relevant test suites
   - Fix any failures before proceeding

2. **For significant changes**, launch parallel reviews:
   - **Codex** for code quality and bugs:
     ```
     Use codex MCP tool with model="gpt-5.2-codex": "Review for bugs, edge cases, and security issues..."
     ```
   - **Gemini Flash** for quick validation (or Pro for deep analysis):
     ```
     Use gemini MCP tool with model="gemini-3-flash-preview": "Does this implementation align with the existing patterns?"
     ```

3. **Filter by confidence**: Only address issues with high confidence (clear problems, not nitpicks)

4. **Structure findings** in TodoWrite:
   - Critical issues (must fix)
   - Concerns (should consider)
   - Suggestions (nice to have)

5. Address critical issues, document deferred items

**Skip if**: Changes are trivial (< 20 lines, single file, obvious fix)

**Output**: Validated implementation with issues addressed and documented.

---

### Phase 6: Summary & Completion

**Goal**: Document what was accomplished.

**Actions**:
1. Summarize for the user:
   - What was implemented
   - Key decisions made
   - Files modified/created
   - Any remaining considerations
2. Clear TodoWrite by marking all tasks complete
3. Suggest next steps if applicable

---

## Decision Tree: When to Use Agents

```
Is this a simple task (< 3 files, obvious approach)?
├── YES → Skip Gemini planning, implement directly
└── NO → Continue...

Does it require architectural decisions?
├── YES → Use Gemini Pro (gemini-3-pro-preview) for architecture
└── NO → Continue...

Are there multiple valid approaches?
├── YES → Use Gemini Pro for trade-off analysis
└── NO → Continue...

Need quick validation?
├── YES → Use Gemini Flash (gemini-3-flash-preview)
└── NO → Continue...

Is the implementation significant (> 20 lines)?
├── YES → Have Codex review
└── NO → Skip review
```

**Model Selection Guide:**
- **gemini-3-pro-preview**: Architecture, planning, deep analysis, brainstorming
- **gemini-3-flash-preview**: Quick checks, validation, simple questions
- **gpt-5.1-codex-max**: Deep analysis, project-scale refactors, complex debugging (used by codex-critic)
- **gpt-5.2-codex**: Agentic tasks, reliable tool calling, quick reviews
- **gpt-5.1-codex-mini**: Quick code checks, simple validation

## Rules of Engagement

1. **Show Progress**: Keep TodoWrite updated in real-time
2. **Show Summaries**: After agent consultations, summarize key insights for the user
3. **Don't Stop**: Continue until all tasks are complete
4. **Be Judicious**: Not every task needs external consultation
5. **Ask Early**: Use AskUserQuestion at the start, not mid-implementation
6. **Stay Focused**: Implement what was asked, don't scope-creep

## Anti-Patterns to Avoid

- ❌ Implementing without reading existing code first
- ❌ Consulting agents for trivial tasks
- ❌ Skipping the review phase for significant changes
- ❌ Leaving TodoWrite items stale or untracked
- ❌ Making assumptions instead of asking clarifying questions
- ❌ Over-engineering or adding unnecessary complexity

---

**BEGIN FULLAUTO MODE**: Start with Phase 1 - analyze the user's request above.
