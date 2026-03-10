---
name: "sc-brainstorm"
description: "Interactive requirements discovery through Socratic dialogue and systematic exploration"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$sc-brainstorm`.
- Treat all user text after `$sc-brainstorm` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `brainstorm`.
- Codex invocation: `$sc-brainstorm`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

# $sc-brainstorm - Interactive Requirements Discovery

> **Context Framework Note**: This file provides behavioral instructions for Codex when users type `$sc-brainstorm` patterns. This is NOT an executable command - it's a context trigger that activates the behavioral patterns defined below.

## Triggers
- Ambiguous project ideas requiring structured exploration
- Requirements discovery and specification development needs
- Concept validation and feasibility assessment requests
- Cross-session brainstorming and iterative refinement scenarios

## Context Trigger Pattern
```
$sc-brainstorm [topic/idea] [--strategy systematic|agile|enterprise] [--depth shallow|normal|deep] [--parallel]
```
**Usage**: Type this pattern in your Codex conversation to activate brainstorming behavioral mode with systematic exploration and multi-persona coordination.

## Behavioral Flow
1. **Explore**: Transform ambiguous ideas through Socratic dialogue and systematic questioning
2. **Analyze**: Coordinate multiple personas for domain expertise and comprehensive analysis
3. **Validate**: Apply feasibility assessment and requirement validation across domains
4. **Specify**: Generate concrete specifications with cross-session persistence capabilities
5. **Handoff**: Create actionable briefs ready for implementation or further development

Key behaviors:
- Multi-persona orchestration across architecture, analysis, frontend, backend, security domains
- Advanced MCP coordination with intelligent routing for specialized analysis
- Systematic execution with progressive dialogue enhancement and parallel exploration
- Cross-session persistence with comprehensive requirements discovery documentation

## MCP Integration
- **Sequential MCP**: Complex multi-step reasoning for systematic exploration and validation
- **Context7 MCP**: Framework-specific feasibility assessment and pattern analysis
- **Magic MCP**: UI/UX feasibility and design system integration analysis
- **Playwright MCP**: User experience validation and interaction pattern testing
- **Morphllm MCP**: Large-scale content analysis and pattern-based transformation
- **Serena MCP**: Cross-session persistence, memory management, and project context enhancement

## Tool Coordination
- **Read/Write/Edit**: Requirements documentation and specification generation
- **update_plan**: Progress tracking for complex multi-phase exploration
- **spawn_agent**: Advanced delegation for parallel exploration paths and multi-agent coordination
- **WebSearch**: Market research, competitive analysis, and technology validation
- **sequentialthinking**: Structured reasoning for complex requirements analysis

## Key Patterns
- **Socratic Dialogue**: Question-driven exploration → systematic requirements discovery
- **Multi-Domain Analysis**: Cross-functional expertise → comprehensive feasibility assessment
- **Progressive Coordination**: Systematic exploration → iterative refinement and validation
- **Specification Generation**: Concrete requirements → actionable implementation briefs

## Examples

### Systematic Product Discovery
```
$sc-brainstorm "AI-powered project management tool" --strategy systematic --depth deep
# Multi-persona analysis: architect (system design), analyzer (feasibility), project-manager (requirements)
# Sequential MCP provides structured exploration framework
```

### Agile Feature Exploration
```
$sc-brainstorm "real-time collaboration features" --strategy agile --parallel
# Parallel exploration paths with frontend, backend, and security personas
# Context7 and Magic MCP for framework and UI pattern analysis
```

### Enterprise Solution Validation
```
$sc-brainstorm "enterprise data analytics platform" --strategy enterprise --validate
# Comprehensive validation with security, devops, and architect personas
# Serena MCP for cross-session persistence and enterprise requirements tracking
```

### Cross-Session Refinement
```
$sc-brainstorm "mobile app monetization strategy" --depth normal
# Serena MCP manages cross-session context and iterative refinement
# Progressive dialogue enhancement with memory-driven insights
```

## Boundaries

**Will:**
- Transform ambiguous ideas into concrete specifications through systematic exploration
- Coordinate multiple personas and MCP servers for comprehensive analysis
- Provide cross-session persistence and progressive dialogue enhancement

**Will Not:**
- Make implementation decisions without proper requirements discovery
- Override user vision with prescriptive solutions during exploration phase
- Bypass systematic exploration for complex multi-domain projects

## CRITICAL BOUNDARIES

**STOP AFTER REQUIREMENTS DISCOVERY**

This command produces a REQUIREMENTS SPECIFICATION ONLY.

**Explicitly Will NOT**:
- Create architecture diagrams or system designs (use `$sc-design`)
- Generate implementation code (use `$sc-implement`)
- Make architectural decisions
- Design database schemas or API contracts
- Create technical specifications beyond requirements

**Output**: Requirements document with:
- Clarified user goals
- Functional requirements
- Non-functional requirements
- User stories / acceptance criteria
- Open questions for user

**Next Step**: After brainstorm completes, use `$sc-design` for architecture or `$sc-workflow` for implementation planning.
