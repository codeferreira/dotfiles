---
name: "sc"
description: "SuperClaude command dispatcher - Use /sc [command] to access all SuperClaude features"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$sc`.
- Treat all user text after `$sc` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.
- Prefer native Codex tools first for shell, git, editing, and web access.
- Prefer direct SuperClaude MCP servers in Codex over the AIRIS gateway when equivalent servers are available.

## C. Compatibility Notes
- Original command: `sc`.
- Codex invocation: `$sc`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
- This file is a Codex overlay for the SuperClaude command set. Keep the original Claude command files and Claude MCP registrations as the source of truth for Claude runtime behavior.
</codex_skill_adapter>

# SuperClaude Command Dispatcher

🚀 **SuperClaude Framework** - Main command dispatcher

## Usage

All SuperClaude commands use the `$sc-` prefix:

```
$sc-command [args...]
```

## Available Commands

### Core Workflow
```
$sc                         - Show this help and the available command set
$sc-help                    - List all available $sc commands and their functionality
$sc-pm [request]            - Project Manager Agent for session-wide orchestration
$sc-agent [type]            - Session controller that orchestrates investigation, implementation, and review
$sc-task [action] [target]  - Execute complex tasks with intelligent workflow management and delegation
$sc-workflow [input]        - Generate structured implementation workflows from PRDs and feature requirements
$sc-spawn [complex-task]    - Meta-system task orchestration with intelligent breakdown and delegation
```

### Analysis & Discovery
```
$sc-research [query]        - Deep web research with adaptive planning and intelligent search
$sc-analyze [target]        - Comprehensive code analysis across quality, security, performance, and architecture domains
$sc-brainstorm [topic]      - Interactive requirements discovery through Socratic dialogue and systematic exploration
$sc-explain [target]        - Provide clear explanations of code, concepts, and system behavior with educational clarity
$sc-estimate [target]       - Provide development estimates for tasks, features, or projects with intelligent analysis
$sc-recommend [context]     - Recommend the most suitable SuperClaude commands for the current request
$sc-business-panel [input]  - Multi-expert business analysis with adaptive interaction modes
$sc-spec-panel [input]      - Multi-expert specification review and improvement
```

### Delivery & Maintenance
```
$sc-implement [feature]     - Feature and code implementation with intelligent persona activation and MCP integration
$sc-build [target]          - Build, compile, and package projects with intelligent error handling and optimization
$sc-test [target]           - Execute tests with coverage analysis and automated quality reporting
$sc-troubleshoot [issue]    - Diagnose and resolve issues in code, builds, deployments, and system behavior
$sc-improve [target]        - Apply systematic improvements to code quality, performance, and maintainability
$sc-cleanup [target]        - Systematically clean up code, remove dead code, and optimize project structure
$sc-design [target]         - Design system architecture, APIs, and component interfaces with comprehensive specifications
$sc-document [target]       - Generate focused documentation for components, functions, APIs, and features
$sc-index [target]          - Generate comprehensive project documentation and knowledge base with intelligent organization
$sc-index-repo              - Repository indexing for context optimization and token-efficient project navigation
$sc-git [operation]         - Git operations with intelligent commit messages and workflow optimization
```

### Session & Tooling
```
$sc-load [target]           - Session lifecycle management with Serena MCP integration for project context loading
$sc-save                    - Session lifecycle management with Serena MCP integration for session context persistence
$sc-reflect                 - Task reflection and validation using Serena MCP analysis capabilities
$sc-select-tool [operation] - Intelligent MCP tool selection based on complexity scoring and operation analysis
```

## Command Namespace

All commands are namespaced under `sc:` to keep them organized:
- ✅ `$sc-research query`
- ✅ `$sc-index-repo`
- ✅ `$sc-agent type`
- ✅ `$sc-recommend`
- ✅ `$sc` (help)

## Examples

### Research
```
$sc-research React 18 new features
$sc-research LLM agent architectures 2024
$sc-research Python async best practices
```

### Index Repository
```
$sc-index-repo
```

### Agent
```
$sc-agent deep-research
$sc-agent self-review
$sc-agent repo-index
```

### Recommendations
```
$sc-recommend
```

## Quick Reference

| Command | Description | Example |
|---------|-------------|---------|
| `$sc` | Show this help and the available command set | `$sc` |
| `$sc-agent` | Session controller that orchestrates investigation, implementation, and review | `$sc-agent self-review` |
| `$sc-analyze` | Comprehensive code analysis across quality, security, performance, and architecture domains | `$sc-analyze src/ --focus performance` |
| `$sc-build` | Build, compile, and package projects with intelligent error handling and optimization | `$sc-build app --type prod` |
| `$sc-help` | List all available $sc commands and their functionality | `$sc-help` |
| `$sc-implement` | Feature and code implementation with intelligent persona activation and MCP integration | `$sc-implement "user dashboard"` |
| `$sc-index-repo` | Repository indexing for context optimization and token-efficient project navigation | `$sc-index-repo` |
| `$sc-pm` | Project Manager Agent for session-wide orchestration | `$sc-pm "plan auth rollout"` |
| `$sc-recommend` | Recommend the most suitable SuperClaude commands for the current request | `$sc-recommend "debug flaky tests"` |
| `$sc-research` | Deep web research with adaptive planning and intelligent search | `$sc-research React Server Components` |
| `$sc-task` | Execute complex tasks with intelligent workflow management and delegation | `$sc-task refactor auth --delegate` |
| `$sc-test` | Execute tests with coverage analysis and automated quality reporting | `$sc-test --type e2e --coverage` |
| `$sc-workflow` | Generate structured implementation workflows from PRDs and feature requirements | `$sc-workflow PRD.md --parallel` |

## Features

- **Parallel Execution**: Research runs multiple searches in parallel
- **Evidence-Based**: All findings backed by sources
- **Context-Aware**: Uses repository context when available
- **Token Efficient**: Optimized for minimal token usage
- **Direct MCP Port**: SuperClaude MCP behavior is mapped to direct Codex MCP servers instead of AIRIS

## Codex MCP Topology

- `context7`: Official library and framework documentation lookup
- `sequential-thinking`: Structured multi-step reasoning
- `serena`: Semantic code understanding and project-aware navigation
- `tavily`: Research-oriented web retrieval when configured
- `magic`: UI/component generation when configured
- `morphllm-fast-apply`: Pattern-heavy bulk code transforms when configured
- `chrome-devtools`: Browser debugging and devtools automation when configured
- `playwright` / `puppeteer`: Browser automation when real page execution is required
- Native Codex tools: default choice for file edits, shell execution, git, planning, and delegation

## Routing Rules

- Do not assume every optional SuperClaude MCP is installed and credentialed in Codex.
- Use direct Codex MCP servers when they are configured locally.
- If a requested SuperClaude MCP is unavailable or missing credentials, fall back to native Codex tools plus `context7`, `sequential-thinking`, and browser automation as needed.
- Do not edit or reinterpret the Claude-side install in `~/.claude` from this Codex overlay unless the user explicitly asks for a Claude-side change too.

## Help

For help on specific commands:
```
$sc-research --help
$sc-agent --help
```

Or use the main help command:
```
/sc
```

Check the documentation:
- PLANNING.md - Architecture and design
- TASK.md - Current tasks and priorities
- KNOWLEDGE.md - Tips and best practices

## Version

SuperClaude command set ported for Codex with direct MCP support

---

💡 **Tip**: All commands use the `$sc-` prefix - e.g., `$sc-research`, `$sc-agent`

🔧 **Installation**: Run `superclaude install` to install/update commands

📚 **Documentation**: https://github.com/SuperClaude-Org/SuperClaude_Framework

⚠️ **Important**: Restart Codex after installing commands to use them!
