---
name: "ops-project-project-status-rust"
description: "Ultra-fast Rust project health check using 8 parallel sub-agents for comprehensive analysis"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$ops-project-project-status-rust`.
- Treat all user text after `$ops-project-project-status-rust` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `ops:project:project-status-rust`.
- Codex invocation: `$ops-project-project-status-rust`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

## Context

- Check mode: {{SC_ARGS}} (optional - quick or detailed, default: quick)

## Your spawn_agent

**IMMEDIATELY DEPLOY 8 PARALLEL RUST PROJECT HEALTH AGENTS** for ultra-fast comprehensive project analysis: **${ARGUMENTS:-quick} mode**

**CRITICAL**: Launch ALL agents simultaneously in first response - NO sequential processing.

## Parallel Rust Project Health Framework

**NO SEQUENTIAL PROCESSING** - Deploy these specialized Rust health analysis agents in parallel:

1. **Build & Compilation Agent**: Cargo check, compilation errors, dependency resolution, build optimization analysis
2. **Test Suite & Coverage Agent**: Test execution, coverage analysis, test count, test quality assessment
3. **Code Quality & Clippy Agent**: Clippy warnings, lint analysis, code quality metrics, style violations
4. **Security & Audit Agent**: Cargo audit, vulnerabilities, yanked crates, security best practices
5. **Dependencies & Updates Agent**: Outdated dependencies, version conflicts, update recommendations
6. **Project Structure Agent**: File organization, README, LICENSE, best practices, workspace analysis
7. **Performance & Benchmarks Agent**: Binary size, benchmarks, performance metrics, optimization opportunities
8. **Formatting & Standards Agent**: Rustfmt, code formatting, naming conventions, documentation standards

**Expected speedup**: 8x faster than sequential health checks.

**IMMEDIATELY LAUNCH ALL 8 AGENTS:**

**Agent 1: Build & Compilation Analysis**
Analyze Rust build health, compilation status, dependency resolution, and build configuration. Check for build errors, missing dependencies, and compilation issues.

**Agent 2: Test Suite & Coverage Analysis**
Evaluate test execution, coverage metrics with tarpaulin, test count, and test quality patterns. Identify missing tests, coverage gaps, and test performance.

**Agent 3: Code Quality & Clippy Analysis**
Perform clippy analysis, identify code quality issues, lint violations, and best practice compliance. Check for potential bugs, performance issues, and style problems.

**Agent 4: Security & Audit Analysis**
Analyze security vulnerabilities with cargo-audit, yanked crate detection, and security best practices. Check for known vulnerabilities and security risks.

**Agent 5: Dependencies & Updates Analysis**
Evaluate dependency status, outdated packages, version conflicts, and update recommendations. Check for dependency management issues and optimization opportunities.

**Agent 6: Project Structure Analysis**
Assess project organization, workspace structure, documentation presence (README/LICENSE), and Rust project best practices. Identify structural issues.

**Agent 7: Performance & Benchmarks Analysis**
Analyze binary size, benchmark availability, performance optimization opportunities, and profiling readiness. Identify performance bottlenecks.

**Agent 8: Formatting & Standards Analysis**
Verify code formatting with rustfmt, naming conventions, documentation standards, and style guide compliance. Check formatting consistency.

**CRITICAL**: All agents execute simultaneously for maximum efficiency. Synthesis happens after all agents complete.

Expected completion time: 8x faster than traditional sequential analysis.

## Quick Reference

### Usage Examples

```bash
# Quick health check (default)
/project-status-rust

# Detailed analysis with all checks
/project-status-rust detailed

# From a specific project directory
cd my-rust-project && /project-status-rust
```

### Health Checks Performed

1. **Build Health**: Compilation and dependency status
2. **Test Suite**: Test compilation/execution and coverage
3. **Code Quality**: Clippy lints and formatting
4. **Security**: Vulnerability audit and yanked crates
5. **Project Structure**: Best practices and organization
6. **Performance**: Benchmarks and binary metrics (detailed mode)
7. **Dependencies**: Outdated packages and security issues
8. **Standards**: Rustfmt and documentation compliance

This command provides comprehensive Rust project health monitoring with actionable recommendations for maintaining code quality and security through parallel sub-agent analysis.
