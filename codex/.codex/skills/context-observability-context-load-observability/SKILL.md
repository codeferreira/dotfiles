---
name: "context-observability-context-load-observability"
description: "Load comprehensive observability documentation with project-specific optimization and strategic context loading"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$context-observability-context-load-observability`.
- Treat all user text after `$context-observability-context-load-observability` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `context:observability:context-load-observability`.
- Codex invocation: `$context-observability-context-load-observability`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

## Context


## Your spawn_agent

STEP 1: Initialize observability context loading session

- CREATE session state file: `/tmp/observability-context-$SESSION_ID.json`
- INITIALIZE state tracking:
  ```json
  {
    "sessionId": "$SESSION_ID",
    "phase": "discovery",
    "detectedTools": [],
    "contextSources": [],
    "loadedTopics": [],
    "projectFocus": [],
    "documentationCache": {}
  }
  ```

STEP 2: Project-specific observability analysis

- ANALYZE project structure from Context section
- DETECT existing observability tooling and configuration
- PRIORITIZE documentation based on project needs and technology stack

IF comprehensive observability stack detected (Prometheus + Grafana + tracing):

- FOCUS on advanced configuration, optimization, and integration patterns
- PRIORITIZE performance tuning, custom metrics, and advanced alerting
- INCLUDE scaling, federation, and multi-cluster observability

ELSE IF partial observability implementation:

- FOCUS on missing components and integration strategies
- PRIORITIZE migration patterns and incremental adoption
- INCLUDE compatibility guides and best practices

ELSE IF new observability project:

- FOCUS on foundational setup, basic configuration, and getting started guides
- PRIORITIZE architecture decisions, tool selection, and initial implementation
- INCLUDE project setup workflows and basic instrumentation patterns

STEP 3: Strategic documentation loading with parallel sub-agents

Think deeply about optimal documentation loading strategy based on project complexity and observability maturity.

IF complex multi-tool observability environment:

- USE spawn_agent tool for parallel documentation loading:
  - **Prometheus Agent**: Load metrics, alerting, and federation documentation
  - **Grafana Agent**: Load dashboard design, data sources, and visualization guides
  - **Tracing Agent**: Load Jaeger/Tempo distributed tracing and OpenTelemetry instrumentation
  - **Best Practices Agent**: Load SLO/SLI frameworks, incident response, and optimization guides
- COORDINATE findings across agents for comprehensive understanding

ELSE:

- EXECUTE sequential context loading focused on detected tools and project needs
- PRIORITIZE most relevant documentation areas first

STEP 4: Execute documentation loading workflow

TRY:

- LOAD comprehensive observability documentation from prioritized sources
- USE WebFetch tool for each documentation URL with targeted prompts
- ORGANIZE information by functional area and complexity level
- SAVE loaded context to session state cache

**Core Documentation Sources (load based on project analysis):**

1. **Prometheus Ecosystem**
   - URL: `https://prometheus.io/docs/`
   - FOCUS: Configuration, PromQL querying, alerting rules, federation
   - EXTRACT: Metric collection patterns, performance tuning, storage optimization

2. **Grafana Platform**
   - URL: `https://grafana.com/docs/`
   - FOCUS: Dashboard design, data source integration, alerting, provisioning
   - EXTRACT: Visualization best practices, template variables, advanced features

3. **Distributed Tracing (Jaeger/Tempo)**
   - URL: `https://www.jaegertracing.io/docs/`
   - FOCUS: Deployment strategies, sampling, performance optimization
   - EXTRACT: Integration patterns, troubleshooting, scaling considerations

4. **OpenTelemetry Instrumentation**
   - URL: `https://opentelemetry.io/docs/`
   - FOCUS: Auto-instrumentation, manual instrumentation, collectors, exporters
   - EXTRACT: Language-specific SDKs, configuration patterns, best practices

5. **Observability Best Practices**
   - URL: `https://prometheus.io/docs/practices/`
   - FOCUS: Metric naming conventions, instrumentation strategies, performance
   - EXTRACT: SLO/SLI implementation, capacity planning, cost optimization

CATCH (documentation_loading_failed):

- LOG failed sources to session state
- CONTINUE with available documentation
- PROVIDE manual context loading instructions for failed sources
- SAVE fallback documentation references

STEP 5: Context organization and project integration

- SYNTHESIZE loaded documentation into project-relevant guidance
- ORGANIZE by implementation priority and complexity
- CREATE integration roadmap based on current project state
- GENERATE specific recommendations for detected technology stack

STEP 6: Session completion and state management

- UPDATE session state with loaded context summary
- SAVE documentation cache: `/tmp/observability-context-cache-$SESSION_ID.json`
- CREATE context loading report with coverage analysis
- MARK completion checkpoint

FINALLY:

- ARCHIVE context session data for future reference
- PROVIDE comprehensive context loading summary
- CLEAN UP temporary session files: `/tmp/observability-temp-$SESSION_ID-*`

## Expected Outcomes

After executing this command, you will have comprehensive context on:

**Core Observability Capabilities:**

- Prometheus metrics collection, storage, and querying (PromQL)
- Grafana dashboard design, data source integration, and alerting
- Distributed tracing with Jaeger/Tempo and OpenTelemetry instrumentation
- Alert rule configuration, notification routing, and incident response
- SLO/SLI framework implementation and capacity planning

**Advanced Implementation Techniques:**

- Multi-cluster and federated monitoring architectures
- Custom metric development and high-cardinality optimization
- Advanced dashboard templating and dynamic visualization
- Distributed tracing sampling strategies and performance tuning
- Observability automation and GitOps integration

**Project-Specific Integration:**

- Technology stack-specific instrumentation patterns
- Container and Kubernetes observability best practices
- CI/CD pipeline integration and deployment monitoring
- Cost optimization strategies for large-scale observability
- Security considerations and access control implementation

The context loading adapts to your specific project structure and emphasizes the most relevant observability documentation areas for your current monitoring and debugging needs.
