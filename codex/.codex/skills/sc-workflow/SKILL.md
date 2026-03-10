---
name: "sc-workflow"
description: "Generate structured implementation workflows from PRDs and feature requirements"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$sc-workflow`.
- Treat all user text after `$sc-workflow` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `workflow`.
- Codex invocation: `$sc-workflow`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

# $sc-workflow - Implementation Workflow Generator

## Triggers
- PRD and feature specification analysis for implementation planning
- Structured workflow generation for development projects
- Multi-persona coordination for complex implementation strategies
- Cross-session workflow management and dependency mapping

## Usage
```
$sc-workflow [prd-file|feature-description] [--strategy systematic|agile|enterprise] [--depth shallow|normal|deep] [--parallel]
```

## Behavioral Flow
1. **Analyze**: Parse PRD and feature specifications to understand implementation requirements
2. **Plan**: Generate comprehensive workflow structure with dependency mapping and task orchestration
3. **Coordinate**: Activate multiple personas for domain expertise and implementation strategy
4. **Execute**: Create structured step-by-step workflows with automated task coordination
5. **Validate**: Apply quality gates and ensure workflow completeness across domains

Key behaviors:
- Multi-persona orchestration across architecture, frontend, backend, security, and devops domains
- Advanced MCP coordination with intelligent routing for specialized workflow analysis
- Systematic execution with progressive workflow enhancement and parallel processing
- Cross-session workflow management with comprehensive dependency tracking

## MCP Integration
- **Sequential MCP**: Complex multi-step workflow analysis and systematic implementation planning
- **Context7 MCP**: Framework-specific workflow patterns and implementation best practices
- **Magic MCP**: UI/UX workflow generation and design system integration strategies
- **Playwright MCP**: Testing workflow integration and quality assurance automation
- **Morphllm MCP**: Large-scale workflow transformation and pattern-based optimization
- **Serena MCP**: Cross-session workflow persistence, memory management, and project context

## Tool Coordination
- **Read/Write/Edit**: PRD analysis and workflow documentation generation
- **update_plan**: Progress tracking for complex multi-phase workflow execution
- **spawn_agent**: Advanced delegation for parallel workflow generation and multi-agent coordination
- **WebSearch**: Technology research, framework validation, and implementation strategy analysis
- **sequentialthinking**: Structured reasoning for complex workflow dependency analysis

## Key Patterns
- **PRD Analysis**: Document parsing → requirement extraction → implementation strategy development
- **Workflow Generation**: spawn_agent decomposition → dependency mapping → structured implementation planning
- **Multi-Domain Coordination**: Cross-functional expertise → comprehensive implementation strategies
- **Quality Integration**: Workflow validation → testing strategies → deployment planning

## Examples

### Systematic PRD Workflow
```
$sc-workflow Claudedocs/PRD/feature-spec.md --strategy systematic --depth deep
# Comprehensive PRD analysis with systematic workflow generation
# Multi-persona coordination for complete implementation strategy
```

### Agile Feature Workflow
```
$sc-workflow "user authentication system" --strategy agile --parallel
# Agile workflow generation with parallel task coordination
# Context7 and Magic MCP for framework and UI workflow patterns
```

### Enterprise Implementation Planning
```
$sc-workflow enterprise-prd.md --strategy enterprise --validate
# Enterprise-scale workflow with comprehensive validation
# Security, devops, and architect personas for compliance and scalability
```

### Cross-Session Workflow Management
```
$sc-workflow project-brief.md --depth normal
# Serena MCP manages cross-session workflow context and persistence
# Progressive workflow enhancement with memory-driven insights
```

## Boundaries

**Will:**
- Generate comprehensive implementation workflows from PRD and feature specifications
- Coordinate multiple personas and MCP servers for complete implementation strategies
- Provide cross-session workflow management and progressive enhancement capabilities

**Will Not:**
- Execute actual implementation tasks beyond workflow planning and strategy
- Override established development processes without proper analysis and validation
- Generate workflows without comprehensive requirement analysis and dependency mapping

## CRITICAL BOUNDARIES

**STOP AFTER PLAN CREATION**

This command produces an IMPLEMENTATION PLAN ONLY - no code execution.

**Explicitly Will NOT**:
- Execute any implementation tasks
- Write or modify code
- Create files (except the workflow plan document)
- Make architectural changes
- Run builds or tests

**Output**: Workflow plan document (`claudedocs/workflow_*.md`) containing:
- Implementation phases
- spawn_agent dependencies
- Execution order
- Checkpoints and validation steps

**Next Step**: After workflow completes, use `$sc-implement` to execute the plan step by step.
