---
name: "workflow-view-summary"
description: "Generate structured conversation summary with key decisions, action items, and essential code snippets"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$workflow-view-summary`.
- Treat all user text after `$workflow-view-summary` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `workflow:view:summary`.
- Codex invocation: `$workflow-view-summary`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

## Context

- Target format: Structured business summary with actionable insights

## Your spawn_agent

STEP 1: Analyze conversation scope and content depth

- REVIEW the entire conversation context systematically
- IDENTIFY key themes, decisions, and technical discussions
- CATEGORIZE content by importance and actionability
- EXTRACT essential code/configuration examples

STEP 2: Generate structured summary following exact deliverable format

**Deliverable Structure (MANDATORY):**

### TLDR

• 2-3 sentence high-level recap (≤50 words)

### Bullet Points

• Key decisions
• Action items with responsible parties
• Open questions / blockers
• Next steps
(Limit to 8 bullets total)

### Code Snippets

IF conversation included code, config, or CLI commands essential for reproducing solutions:

- INCLUDE in fenced blocks
- OMIT boilerplate and unnecessary details
- FOCUS on reproduction-critical elements

STEP 3: Apply content quality controls

**Mandatory Rules:**

- USE only information present in conversation context; NEVER invent content
- PRESERVE original terminology, variable names, and paths exactly
- WRITE in crisp business English; AVOID filler words
- ENSURE entire summary (excluding code blocks) ≤300 words
- FOCUS on actionable insights and concrete next steps

STEP 4: Validate summary completeness

- VERIFY all critical decisions captured
- CONFIRM action items have clear ownership
- ENSURE blockers and next steps are specific
- CHECK code snippets are reproduction-ready
