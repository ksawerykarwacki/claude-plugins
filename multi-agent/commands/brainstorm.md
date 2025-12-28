---
description: Creative brainstorming using Gemini's ideation capabilities
---

# Brainstorm with Gemini

Using Gemini's powerful brainstorm tool for creative ideation and problem-solving.

## Challenge

$ARGUMENTS

## Instructions

1. Analyze the brainstorming challenge
2. Determine the best methodology based on the problem:
   - **divergent**: Generate many wild ideas (quantity over quality)
   - **convergent**: Refine existing concepts critically
   - **scamper**: Systematic triggers (substitute, combine, adapt, modify, repurpose, eliminate, reverse)
   - **design-thinking**: Human-centered, empathy-focused
   - **lateral**: Unexpected connections from unrelated fields
   - **auto**: Let Gemini choose the best approach

3. Call the gemini MCP **brainstorm** tool with:
   - `model: "gemini-3-pro-preview"` (deep thinking for ideation)
   - `methodology`: based on the challenge type
   - `domain`: if relevant (software, business, creative, etc.)
   - `ideaCount`: 10-15 for broad exploration, fewer for focused refinement

4. Present the ideas with:
   - Grouped by theme or approach
   - Feasibility analysis
   - Quick wins vs long-term plays
   - Recommended next steps

## Example Usage

- `/brainstorm How can we improve our onboarding flow?`
- `/brainstorm Ways to reduce API latency`
- `/brainstorm New features for the dashboard`
