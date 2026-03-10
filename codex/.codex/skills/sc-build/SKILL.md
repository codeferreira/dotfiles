---
name: "sc-build"
description: "Build, compile, and package projects with intelligent error handling and optimization"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$sc-build`.
- Treat all user text after `$sc-build` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `build`.
- Codex invocation: `$sc-build`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

# $sc-build - Project Building and Packaging

## Triggers
- Project compilation and packaging requests for different environments
- Build optimization and artifact generation needs
- Error debugging during build processes
- Deployment preparation and artifact packaging requirements

## Usage
```
$sc-build [target] [--type dev|prod|test] [--clean] [--optimize] [--verbose]
```

## Behavioral Flow
1. **Analyze**: Project structure, build configurations, and dependency manifests
2. **Validate**: Build environment, dependencies, and required toolchain components
3. **Execute**: Build process with real-time monitoring and error detection
4. **Optimize**: Build artifacts, apply optimizations, and minimize bundle sizes
5. **Package**: Generate deployment artifacts and comprehensive build reports

Key behaviors:
- Configuration-driven build orchestration with dependency validation
- Intelligent error analysis with actionable resolution guidance
- Environment-specific optimization (dev/prod/test configurations)
- Comprehensive build reporting with timing metrics and artifact analysis

## MCP Integration
- **Playwright MCP**: Auto-activated for build validation and UI testing during builds
- **DevOps Engineer Persona**: Activated for build optimization and deployment preparation
- **Enhanced Capabilities**: Build pipeline integration, performance monitoring, artifact validation

## Tool Coordination
- **Bash**: Build system execution and process management
- **Read**: Configuration analysis and manifest inspection
- **Grep**: Error parsing and build log analysis
- **Glob**: Artifact discovery and validation
- **Write**: Build reports and deployment documentation

## Key Patterns
- **Environment Builds**: dev/prod/test → appropriate configuration and optimization
- **Error Analysis**: Build failures → diagnostic analysis and resolution guidance
- **Optimization**: Artifact analysis → size reduction and performance improvements
- **Validation**: Build verification → quality gates and deployment readiness

## Examples

### Standard Project Build
```
$sc-build
# Builds entire project using default configuration
# Generates artifacts and comprehensive build report
```

### Production Optimization Build
```
$sc-build --type prod --clean --optimize
# Clean production build with advanced optimizations
# Minification, tree-shaking, and deployment preparation
```

### Targeted Component Build
```
$sc-build frontend --verbose
# Builds specific project component with detailed output
# Real-time progress monitoring and diagnostic information
```

### Development Build with Validation
```
$sc-build --type dev --validate
# Development build with Playwright validation
# UI testing and build verification integration
```

## Boundaries

**Will:**
- Execute project build systems using existing configurations
- Provide comprehensive error analysis and optimization recommendations
- Generate deployment-ready artifacts with detailed reporting

**Will Not:**
- Modify build system configuration or create new build scripts
- Install missing build dependencies or development tools
- Execute deployment operations beyond artifact preparation
