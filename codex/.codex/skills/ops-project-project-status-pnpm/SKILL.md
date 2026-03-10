---
name: "ops-project-project-status-pnpm"
description: "Ultra-fast pnpm TypeScript project health check using 8 parallel sub-agents for comprehensive analysis"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$ops-project-project-status-pnpm`.
- Treat all user text after `$ops-project-project-status-pnpm` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `ops:project:project-status-pnpm`.
- Codex invocation: `$ops-project-project-status-pnpm`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

## Context

- Check mode: {{SC_ARGS}} (optional - quick or detailed, default: quick)

## Your spawn_agent

**IMMEDIATELY DEPLOY 8 PARALLEL PNPM PROJECT HEALTH AGENTS** for ultra-fast comprehensive project analysis: **${ARGUMENTS:-quick} mode**

**CRITICAL**: Launch ALL agents simultaneously in first response - NO sequential processing.

## Parallel pnpm Project Health Framework

**NO SEQUENTIAL PROCESSING** - Deploy these specialized pnpm health analysis agents in parallel:

1. **Build & Compilation Agent**: Build script analysis, TypeScript compilation, build tool configuration, optimization assessment
2. **Test Suite & Coverage Agent**: Test execution, coverage analysis, test framework detection, test quality patterns
3. **Code Quality & Lint Agent**: ESLint analysis, code style violations, best practices validation, maintainability checks
4. **Dependencies & Security Agent**: pnpm audit, outdated packages, vulnerability scanning, dependency management
5. **TypeScript & Type Safety Agent**: Type checking, tsconfig analysis, type coverage, compiler options validation
6. **Scripts & Automation Agent**: package.json scripts, task automation, development workflow, build pipeline
7. **Project Structure Agent**: File organization, framework detection, workspace analysis, architectural patterns
8. **Performance & Optimization Agent**: Bundle analysis, dependency optimization, build performance, package efficiency

**Expected speedup**: 8x faster than sequential health checks.

**IMMEDIATELY LAUNCH ALL 8 AGENTS:**

**Agent 1: Build & Compilation Analysis**
Analyze build script configuration, TypeScript compilation health, build tool setup, and optimization opportunities. Check for build errors and performance issues.

**Agent 2: Test Suite & Coverage Analysis**
Evaluate test execution, coverage metrics, test framework detection (Jest/Vitest/Mocha), and test quality patterns. Identify missing tests and coverage gaps.

**Agent 3: Code Quality & Lint Analysis**
Perform ESLint analysis, identify code style violations, best practice compliance, and maintainability issues. Check for code smells and formatting problems.

**Agent 4: Dependencies & Security Analysis**
Analyze pnpm dependencies, security vulnerabilities, outdated packages, and dependency management. Check lock file status and package integrity.

**Agent 5: TypeScript & Type Safety Analysis**
Evaluate TypeScript configuration, type checking status, type coverage, and compiler options. Identify type errors and type safety issues.

**Agent 6: Scripts & Automation Analysis**
Assess package.json scripts, task automation, development workflow efficiency, and build pipeline configuration. Check for missing or misconfigured scripts.

**Agent 7: Project Structure Analysis**
Analyze file organization, framework detection (React/Vue/Angular), workspace configuration, and architectural patterns. Identify structural issues and best practices.

**Agent 8: Performance & Optimization Analysis**
Evaluate bundle size, dependency optimization, build performance, and package efficiency. Identify performance bottlenecks and optimization opportunities.

**CRITICAL**: All agents execute simultaneously for maximum efficiency. Synthesis happens after all agents complete.

Expected completion time: 8x faster than traditional sequential analysis.

## Quick Reference

### Usage Examples

```bash
# Quick health check (default)
/project-status-pnpm

# Detailed analysis with all checks
/project-status-pnpm detailed

# From a specific project directory
cd my-pnpm-project && /project-status-pnpm
```

### Health Checks Performed

1. **Build Health**: Build script and TypeScript compilation
2. **Test Suite**: Test execution and framework detection
3. **Code Quality**: ESLint and Prettier configuration
4. **Type Safety**: TypeScript configuration and errors
5. **Dependencies**: Security audit and outdated packages
6. **Scripts**: npm scripts analysis and configuration
7. **Project Structure**: Framework detection and best practices (detailed mode)
8. **Performance**: Bundle optimization and build efficiency

This command provides comprehensive pnpm project health monitoring with focus on modern TypeScript development practices through parallel sub-agent analysis.
