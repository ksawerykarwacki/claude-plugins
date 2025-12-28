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

3. **CRITICAL**: Call the gemini MCP **brainstorm** tool with these EXACT parameters:
   ```
   prompt: "<the brainstorming challenge>"
   model: "gemini-3-pro-preview"
   methodology: "auto"  # or specific: divergent, convergent, scamper, design-thinking, lateral
   domain: "software"  # or relevant domain
   ideaCount: 12
   includeAnalysis: true
   ```

   **Model Enforcement**: This command REQUIRES `model: "gemini-3-pro-preview"`. Do NOT omit the model parameter.

4. Present the ideas with:
   - Grouped by theme or approach
   - Feasibility analysis
   - Quick wins vs long-term plays
   - Recommended next steps

## Example Usage

- `/brainstorm How can we improve our onboarding flow?`
- `/brainstorm Ways to reduce API latency`
- `/brainstorm New features for the dashboard`
