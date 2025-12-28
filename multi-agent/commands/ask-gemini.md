---
description: Quick Gemini consultation for architecture advice
---

# Gemini Consultation

Using the gemini MCP tool for quick consultations.

## Request

$ARGUMENTS

## Instructions

1. Gather relevant context from the codebase (files, patterns, constraints)
2. **CRITICAL**: Call the gemini MCP `ask-gemini` tool with these EXACT parameters:
   ```
   prompt: "<your question with context>"
   model: "gemini-3-flash-preview"
   ```
3. Present Gemini's response with your own analysis
4. Suggest next steps based on the advice

## Model Enforcement

This command REQUIRES `model: "gemini-3-flash-preview"`. Do NOT omit the model parameter.

For deep architectural analysis, use the **gemini-strategist** agent instead (uses gemini-3-pro-preview).
