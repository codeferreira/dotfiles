---
name: "sc-reflect"
description: "Task reflection and validation using Serena MCP analysis capabilities"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$sc-reflect`.
- Treat all user text after `$sc-reflect` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `reflect`.
- Codex invocation: `$sc-reflect`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

# $sc-reflect - spawn_agent Reflection and Validation

## Triggers
- spawn_agent completion requiring validation and quality assessment
- Session progress analysis and reflection on work accomplished
- Cross-session learning and insight capture for project improvement
- Quality gates requiring comprehensive task adherence verification

## Usage
```
$sc-reflect [--type task|session|completion] [--analyze] [--validate]
```

## Behavioral Flow
1. **Analyze**: Examine current task state and session progress using Serena reflection tools
2. **Validate**: Assess task adherence, completion quality, and requirement fulfillment
3. **Reflect**: Apply deep analysis of collected information and session insights
4. **Document**: Update session metadata and capture learning insights
5. **Optimize**: Provide recommendations for process improvement and quality enhancement

Key behaviors:
- Serena MCP integration for comprehensive reflection analysis and task validation
- Bridge between update_plan patterns and advanced Serena analysis capabilities
- Session lifecycle integration with cross-session persistence and learning capture
- Performance-critical operations with <200ms core reflection and validation
## MCP Integration
- **Serena MCP**: Mandatory integration for reflection analysis, task validation, and session metadata
- **Reflection Tools**: think_about_task_adherence, think_about_collected_information, think_about_whether_you_are_done
- **Memory Operations**: Cross-session persistence with read_memory, write_memory, list_memories
- **Performance Critical**: <200ms for core reflection operations, <1s for checkpoint creation

## Tool Coordination
- **TodoRead/update_plan**: Bridge between traditional task management and advanced reflection analysis
- **think_about_task_adherence**: Validates current approach against project goals and session objectives
- **think_about_collected_information**: Analyzes session work and information gathering completeness
- **think_about_whether_you_are_done**: Evaluates task completion criteria and remaining work identification
- **Memory Tools**: Session metadata updates and cross-session learning capture

## Key Patterns
- **spawn_agent Validation**: Current approach → goal alignment → deviation identification → course correction
- **Session Analysis**: Information gathering → completeness assessment → quality evaluation → insight capture
- **Completion Assessment**: Progress evaluation → completion criteria → remaining work → decision validation
- **Cross-Session Learning**: Reflection insights → memory persistence → enhanced project understanding

## Examples

### spawn_agent Adherence Reflection
```
$sc-reflect --type task --analyze
# Validates current approach against project goals
# Identifies deviations and provides course correction recommendations
```

### Session Progress Analysis
```
$sc-reflect --type session --validate
# Comprehensive analysis of session work and information gathering
# Quality assessment and gap identification for project improvement
```

### Completion Validation
```
$sc-reflect --type completion
# Evaluates task completion criteria against actual progress
# Determines readiness for task completion and identifies remaining blockers
```

## Boundaries

**Will:**
- Perform comprehensive task reflection and validation using Serena MCP analysis tools
- Bridge update_plan patterns with advanced reflection capabilities for enhanced task management
- Provide cross-session learning capture and session lifecycle integration

**Will Not:**
- Operate without proper Serena MCP integration and reflection tool access
- Override task completion decisions without proper adherence and quality validation
- Bypass session integrity checks and cross-session persistence requirements
