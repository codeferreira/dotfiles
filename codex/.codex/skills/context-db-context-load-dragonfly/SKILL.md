---
name: "context-db-context-load-dragonfly"
description: "Load comprehensive DragonflyDB documentation context for development"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$context-db-context-load-dragonfly`.
- Treat all user text after `$context-db-context-load-dragonfly` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `context:db:context-load-dragonfly`.
- Codex invocation: `$context-db-context-load-dragonfly`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

## Context


## Your spawn_agent

STEP 1: Initialize Context Loading Session

- Create context session file: /tmp/dragonfly-context-$SESSION_ID.json
- Initialize documentation tracking and priority loading queue
- Set focus areas based on project context

STEP 2: Load Core DragonflyDB Documentation

TRY:

- Resolve DragonflyDB library ID using Context7 MCP server
- Load comprehensive documentation with focus on:
  - Redis API compatibility and migration paths
  - Performance characteristics and benchmarks
  - Clustering configuration and deployment
  - Memory optimization strategies
    CATCH (context7_unavailable):
- Fallback to WebFetch for essential documentation URLs:
  - `https://dragonflydb.io/docs/getting-started`
  - `https://dragonflydb.io/docs/managing-dragonfly/`
  - `https://dragonflydb.io/docs/integrations/`

STEP 3: Focus Area Deep Dive

Load specialized context based on detected project needs:

IF Redis usage detected:

- Prioritize migration documentation and compatibility guides
- Load Redis command mapping and behavioral differences
- Focus on client library configuration changes

ELSE IF Docker configs found:

- Emphasize container deployment and orchestration
- Load cluster configuration and scaling patterns
- Focus on monitoring and health check setup

ELSE:

- Load general installation and configuration guidance
- Emphasize performance tuning and optimization
- Focus on client connection patterns

STEP 4: Synthesize Loaded Context

- Create actionable knowledge summary in context session file
- Organize by: installation, configuration, migration, performance, monitoring
- Highlight critical differences from Redis
- Document best practices and common pitfalls

STEP 5: Validate Context Completeness

- Verify coverage of essential DragonflyDB concepts
- Ensure migration path documentation is complete
- Confirm performance optimization guidance is loaded
- Save context validation results to session state

## Expected Capabilities After Loading

Upon completion, you will provide expert guidance on:

- **Migration Strategy**: Redis to DragonflyDB transition planning
- **Performance Optimization**: Memory efficiency and throughput tuning
- **Cluster Configuration**: High-availability deployment patterns
- **Monitoring Setup**: Metrics collection and alerting
- **Client Integration**: Connection patterns and library usage
- **Security Configuration**: Authentication and network security
- **Troubleshooting**: Common issues and diagnostic approaches

## Context Loading Priority

1. **High Priority**: Getting started, Redis compatibility, basic configuration
2. **Medium Priority**: Performance tuning, clustering, monitoring
3. **Low Priority**: Advanced features, integrations, troubleshooting

The goal is comprehensive DragonflyDB expertise enabling efficient Redis replacement and optimization.
