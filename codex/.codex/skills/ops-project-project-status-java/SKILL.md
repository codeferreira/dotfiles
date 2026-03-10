---
name: "ops-project-project-status-java"
description: "Ultra-fast Java project health check using 8 parallel sub-agents for comprehensive Gradle/Maven analysis"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$ops-project-project-status-java`.
- Treat all user text after `$ops-project-project-status-java` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `ops:project:project-status-java`.
- Codex invocation: `$ops-project-project-status-java`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

## Context

- Check mode: {{SC_ARGS}} (optional - quick or detailed, default: quick)

## Your spawn_agent

**IMMEDIATELY DEPLOY 8 PARALLEL JAVA PROJECT HEALTH AGENTS** for ultra-fast comprehensive project analysis: **${ARGUMENTS:-quick} mode**

**CRITICAL**: Launch ALL agents simultaneously in first response - NO sequential processing.

## Parallel Java Project Health Framework

**NO SEQUENTIAL PROCESSING** - Deploy these specialized Java health analysis agents in parallel:

1. **Build & Compilation Agent**: Gradle/Maven build status, compilation errors, wrapper detection, build optimization analysis
2. **Test Suite & Coverage Agent**: Test execution, JaCoCo coverage analysis, test framework detection, test quality assessment
3. **Code Quality & Static Analysis Agent**: Checkstyle analysis, SpotBugs detection, code quality metrics, best practices validation
4. **Dependencies & Security Agent**: Dependency analysis, vulnerability scanning, OWASP checks, update recommendations
5. **Framework & Architecture Agent**: Spring Boot/Quarkus detection, database technology analysis, architectural patterns
6. **Project Structure Agent**: File organization, package structure, build configuration, best practices compliance
7. **Performance & Metrics Agent**: Build performance, JAR size analysis, optimization opportunities, profiling readiness
8. **Configuration & Standards Agent**: Build wrapper status, plugin configuration, code formatting, development standards

**Expected speedup**: 8x faster than sequential health checks.

**IMMEDIATELY LAUNCH ALL 8 AGENTS:**

**Agent 1: Build & Compilation Analysis**
Analyze Java build health, Gradle/Maven compilation status, wrapper presence, and build configuration. Check for compilation errors, missing dependencies, and build issues.

**Agent 2: Test Suite & Coverage Analysis**
Evaluate test execution, JaCoCo coverage metrics, test framework detection, and test quality patterns. Identify missing tests, coverage gaps, and test performance.

**Agent 3: Code Quality & Static Analysis**
Perform Checkstyle analysis, SpotBugs detection, identify code quality issues, and best practice violations. Check for potential bugs and maintainability problems.

**Agent 4: Dependencies & Security Analysis**
Analyze project dependencies, security vulnerabilities, OWASP dependency checks, and update recommendations. Check for outdated and vulnerable dependencies.

**Agent 5: Framework & Architecture Analysis**
Detect Spring Boot/Quarkus usage, database technologies (jOOQ vs JPA), migration tools (Flyway/Liquibase), and architectural patterns. Assess framework configuration.

**Agent 6: Project Structure Analysis**
Assess package organization, directory structure, build configuration quality, and Java project best practices. Identify structural and organizational issues.

**Agent 7: Performance & Metrics Analysis**
Analyze build performance, JAR/WAR size, memory usage patterns, and optimization opportunities. Check for performance bottlenecks and inefficiencies.

**Agent 8: Configuration & Standards Analysis**
Verify build wrapper presence, plugin configuration, code formatting standards, and development environment setup. Check tool configuration quality.

**CRITICAL**: All agents execute simultaneously for maximum efficiency. Synthesis happens after all agents complete.

Expected completion time: 8x faster than traditional sequential analysis.

## Quick Reference

### Usage Examples

```bash
# Quick health check (default)
/project-status-java

# Detailed analysis with all checks
/project-status-java detailed

# From a specific project directory
cd my-java-project && /project-status-java
```

### Health Checks Performed

1. **Build Health**: Compilation for Gradle/Maven projects
2. **Test Suite**: Test execution and reporting
3. **Code Quality**: Checkstyle and SpotBugs analysis
4. **Dependencies**: Update checks and vulnerability scanning
5. **Test Coverage**: JaCoCo coverage analysis (detailed mode)
6. **Project Structure**: Best practices and framework detection
7. **Framework Analysis**: Spring Boot, Quarkus, database tools
8. **Performance**: Build optimization and resource analysis

This command provides comprehensive Java project health monitoring supporting both Gradle and Maven build systems through parallel sub-agent analysis.
