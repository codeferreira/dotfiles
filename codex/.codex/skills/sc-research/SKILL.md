---
name: "sc-research"
description: "Deep web research with adaptive planning and intelligent search"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$sc-research`.
- Treat all user text after `$sc-research` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `research`.
- Codex invocation: `$sc-research`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

# $sc-research - Deep Research Command

> **Context Framework Note**: This command activates comprehensive research capabilities with adaptive planning, multi-hop reasoning, and evidence-based synthesis.

## Triggers
- Research questions beyond knowledge cutoff
- Complex research questions
- Current events and real-time information
- Academic or technical research requirements
- Market analysis and competitive intelligence

## Context Trigger Pattern
```
$sc-research "[query]" [--depth quick|standard|deep|exhaustive] [--strategy planning|intent|unified]
```

## Behavioral Flow

### 1. Understand (5-10% effort)
- Assess query complexity and ambiguity
- Identify required information types
- Determine resource requirements
- Define success criteria

### 2. Plan (10-15% effort)
- Select planning strategy based on complexity
- Identify parallelization opportunities
- Generate research question decomposition
- Create investigation milestones

### 3. update_plan (5% effort)
- Create adaptive task hierarchy
- Scale tasks to query complexity (3-15 tasks)
- Establish task dependencies
- Set progress tracking

### 4. Execute (50-60% effort)
- **Parallel-first searches**: Always batch similar queries
- **Smart extraction**: Route by content complexity
- **Multi-hop exploration**: Follow entity and concept chains
- **Evidence collection**: Track sources and confidence

### 5. Track (Continuous)
- Monitor update_plan progress
- Update confidence scores
- Log successful patterns
- Identify information gaps

### 6. Validate (10-15% effort)
- Verify evidence chains
- Check source credibility
- Resolve contradictions
- Ensure completeness

## Key Patterns

### Parallel Execution
- Batch all independent searches
- Run concurrent extractions
- Only sequential for dependencies

### Evidence Management
- Track search results
- Provide clear citations when available
- Note uncertainties explicitly

### Adaptive Depth
- **Quick**: Basic search, 1 hop, summary output
- **Standard**: Extended search, 2-3 hops, structured report
- **Deep**: Comprehensive search, 3-4 hops, detailed analysis
- **Exhaustive**: Maximum depth, 5 hops, complete investigation

## MCP Integration
- **Web tool**: Primary search and extraction engine in Codex
- **Context7**: Official library and framework documentation
- **Sequential-thinking**: Complex reasoning and synthesis
- **Tavily**: Optional SuperClaude-compatible web retrieval MCP when configured
- **Serena**: Optional project-aware memory and semantic indexing when configured
- **Playwright / Puppeteer**: JavaScript-heavy content extraction

## Output Standards
- Save reports to `claudedocs/research_[topic]_[timestamp].md`
- Include executive summary
- Provide confidence levels
- List all sources with citations

## Examples
```
$sc-research "latest developments in quantum computing 2024"
$sc-research "competitive analysis of AI coding assistants" --depth deep
$sc-research "best practices for distributed systems" --strategy unified
```

## Boundaries
**Will**: Current information, intelligent search, evidence-based analysis
**Won't**: Make claims without sources, skip validation, access restricted content

## Codex Port Notes

- Use native `web` browsing first for current information.
- Use `context7` for library/framework docs.
- Use `tavily` and `serena` when they are configured directly in Codex.
- Do not rely on AIRIS for Codex research flows.

## CRITICAL BOUNDARIES

**STOP AFTER RESEARCH REPORT**

This command produces a RESEARCH REPORT ONLY - no implementation.

**Explicitly Will NOT**:
- Implement findings or recommendations
- Write code based on research
- Make architectural decisions
- Create system changes based on research

**Output**: Research report (`claudedocs/research_*.md`) containing:
- Findings with sources
- Evidence-based analysis
- Recommendations (for human decision)
- Cited references

**Next Step**: After research completes, user decides next action. Use `$sc-design` for architecture or `$sc-implement` for coding.
