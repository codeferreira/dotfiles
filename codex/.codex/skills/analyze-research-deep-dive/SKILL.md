---
name: "analyze-research-deep-dive"
description: "Systematic multi-perspective investigation with extended thinking and state management"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$analyze-research-deep-dive`.
- Treat all user text after `$analyze-research-deep-dive` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `analyze:research:deep-dive`.
- Codex invocation: `$analyze-research-deep-dive`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

# /deep-dive

## Context

- Investigation target: {{SC_ARGS}}

## Your spawn_agent

Execute systematic multi-perspective exploration of {{SC_ARGS}} to build comprehensive understanding through structured investigation using extended thinking and state management.

STEP 1: Initialize Investigation Session

- Create session state file: /tmp/deep-dive-$SESSION_ID.json
- Initialize investigation scope and boundaries
- Set exploration objectives based on {{SC_ARGS}}
- Create checkpoint: investigation_initialized

```json
// /tmp/deep-dive-$SESSION_ID.json
{
  "sessionId": "$SESSION_ID",
  "target": "{{SC_ARGS}}",
  "phase": "initialization",
  "scope": "defined_from_arguments",
  "objectives": [],
  "findings": {
    "technical": {},
    "business": {},
    "operational": {}
  },
  "checkpoints": {
    "last_checkpoint": "investigation_initialized",
    "next_milestone": "contextual_foundation",
    "rollback_point": "session_start"
  }
}
```

STEP 2: Contextual Foundation Analysis

Think deeply about the investigation scope and establish baseline understanding.

TRY:

- Analyze project structure and identify key stakeholders
- Map existing knowledge and document assumptions
- Perform initial reconnaissance of codebase/system
- Execute discovery commands:
  - Structure analysis: `fd . --type f | head -20`
  - Issue identification: `rg "TODO|FIXME|HACK|BUG" -n | head -10`
  - Dependency overview: `rg "import|require|use|from" -n | head -15`
- Update state with baseline findings
- Save checkpoint: contextual_foundation_complete

CATCH (insufficient_context):

- Expand search scope and parameters
- Look for additional documentation or configuration files
- Use extended thinking to analyze partial information
- Document context gaps for focused investigation

STEP 3: Multi-Dimensional Analysis Execution

FOR EACH dimension IN [technical, business, operational]:

Think harder about the specific dimension and launch focused analysis:

**Technical Dimension Investigation:**

- Architecture patterns: `rg "pattern|strategy|factory|observer|singleton" -i -A 2`
- Performance analysis: `rg "performance|optimization|bottleneck|slow" -i -A 1`
- Security review: `rg "security|auth|token|password|encrypt" -i -A 1`
- Testing coverage: `rg "test|spec|mock|stub" --files | head -10`

**Business Dimension Investigation:**

- User needs analysis: `rg "user|customer|client|requirement" -i -A 1`
- Business rules: `rg "rule|policy|constraint|validation" -i -A 1`
- Value propositions: `rg "value|benefit|feature|capability" -i -A 1`

**Operational Dimension Investigation:**

- Deployment patterns: `rg "deploy|docker|kubernetes|config" -i --files`
- Monitoring setup: `rg "monitor|metric|alert|log" -i -A 1`
- Scalability indicators: `rg "scale|performance|load|concurrent" -i -A 1`

Update state with dimension-specific findings after each analysis.

STEP 4: Deep Investigation Techniques

Think deeply about investigation approaches and execute systematic code archaeology:

**Code Evolution Analysis:**

```bash
# Understand historical context
git log --oneline --graph -20
git blame [key-files] | head -10  
git show --stat HEAD~5..HEAD
```

**Pattern Recognition:**

```bash
# Find architectural patterns
rg "func|function|def|class" -A 1 | head -20
rg "config|setting|option|parameter" -i -A 2
```

**Dependency Mapping:**

```bash
# External dependencies
fd "package.json|Cargo.toml|go.mod|requirements.txt" --type f
rg "import.*from|require\(|use " -n | head -15

# Internal coupling analysis
rg "\.\/|\.\.\/|@\/" -n | head -10
fd "index|mod|lib" --type f
```

**Data Flow Tracing:**

```bash
# Follow data transformations
rg "map|transform|convert|parse|serialize" -A 2 -B 1
rg "input|output|request|response|data" -A 1 -B 1
rg "store|save|persist|cache|fetch|load" -A 1
```

Update investigation state with technical findings.

STEP 5: Knowledge Synthesis and Pattern Recognition

Use extended thinking to synthesize findings and identify patterns:

Think harder about:

- Common design patterns and anti-patterns observed
- Recurring implementation strategies across the codebase
- Hidden dependencies and implicit constraints
- Non-obvious connections and system behaviors

Execute gap analysis:

- Missing functionality or incomplete features
- Technical debt and refactoring opportunities
- Documentation gaps and knowledge silos
- Testing blind spots and quality issues

Generate insights on:

- Optimization opportunities and quick wins
- Emergent properties and system behaviors
- Risk factors and mitigation strategies

Update state with synthesized knowledge and insights.

STEP 6: Structured Documentation Generation

Create comprehensive investigation report:

**Executive Summary Generation:**

```markdown
# Deep Dive Investigation: {{SC_ARGS}}

## Key Findings

- [3-5 critical discoveries from analysis]
- [Strategic insights for decision making]
- [Urgent issues requiring immediate attention]

## Strategic Implications

- [Impact on project roadmap and priorities]
- [Resource allocation recommendations]
- [Risk mitigation priorities and timelines]
```

**Technical Deep Dive Documentation:**

```markdown
## Architecture Analysis

### Current State Assessment

- [Detailed system architecture description]
- [Component responsibilities and interaction patterns]
- [Technology stack evaluation and assessment]

### Design Pattern Analysis

- [Effective patterns in use across codebase]
- [Anti-patterns and technical debt identification]
- [Architecture evolution opportunities and recommendations]

### Performance Profile

- [Identified bottlenecks and optimization targets]
- [Scalability characteristics and limitations]
- [Resource utilization patterns and efficiency]
```

STEP 7: Actionable Insights and Recommendations

Generate prioritized action items based on investigation findings:

**Immediate Actions (Next 1-2 weeks):**

- [ ] Critical security fixes or vulnerabilities
- [ ] Performance bottlenecks with high impact
- [ ] Documentation of key architectural decisions

**Short-term Improvements (Next 1-3 months):**

- [ ] Refactoring high-complexity areas identified
- [ ] Adding test coverage for critical paths
- [ ] Infrastructure optimizations and improvements

**Long-term Evolution (3-12 months):**

- [ ] Major architectural improvements and modernization
- [ ] Technology upgrades or migration planning
- [ ] Process automation and tooling enhancements

STEP 8: State Management and Session Completion

TRY:

- Generate final investigation summary and insights
- Create knowledge map with discovered relationships
- Document all findings in structured format
- Save comprehensive state with all discoveries
- Create investigation artifact archive
- Save checkpoint: investigation_complete

CATCH (incomplete_analysis):

- Document partial findings and gaps
- Create continuation plan for next session
- Save investigation progress to state file
- Generate interim report with current insights

CATCH (session_timeout OR resource_exhaustion):

- Save current investigation state to /tmp/deep-dive-$SESSION_ID.json
- Create resumption instructions for follow-up session
- Document completed phases and next steps
- Archive partial findings for reference

FINALLY:

- Update investigation session state and progress tracking
- Clean up temporary analysis files: /tmp/deep-dive-temp-$SESSION_ID-*
- Generate comprehensive investigation summary
- Create maintenance recommendations and follow-up actions
- Archive session artifacts for future reference

## Investigation Methodologies

### Code-First Investigation Pattern

- Start with entry points and trace execution flows systematically
- Map data structures and their transformation pipelines
- Analyze error handling patterns and edge case coverage
- Document performance-critical execution paths

### Problem-First Investigation Pattern

- Begin with user pain points or business need analysis
- Trace backwards through system to identify root causes
- Map all contributing factors and system dependencies
- Evaluate and compare solution alternatives

### Architecture-First Investigation Pattern

- Start with high-level system design and component analysis
- Drill down systematically into implementation details
- Analyze cross-cutting concerns and shared dependencies
- Evaluate design pattern effectiveness and consistency

### Data-First Investigation Pattern

- Begin with data models, schemas, and structure analysis
- Trace complete data lifecycle and transformation processes
- Analyze data quality, consistency, and integrity patterns
- Evaluate storage strategies and access pattern efficiency

## Extended Thinking Integration

This command leverages extended thinking capabilities for:

- **Complex Analysis**: Use "think harder" for multi-layered system understanding
- **Pattern Recognition**: Deep thinking about architectural patterns and anti-patterns
- **Strategic Planning**: Extended analysis of long-term implications and trade-offs
- **Risk Assessment**: Comprehensive evaluation of system vulnerabilities and mitigation strategies

## Sub-Agent Integration Opportunities

For large-scale investigations, consider delegating to parallel sub-agents:

1. **Technical Analysis Agent**: Focus on code quality, architecture, and performance
2. **Security Assessment Agent**: Dedicated security vulnerability and compliance analysis
3. **Documentation Agent**: Generate comprehensive technical documentation
4. **Testing Analysis Agent**: Evaluate test coverage and quality assurance processes
5. **Dependency Mapping Agent**: Create detailed dependency graphs and relationship analysis

## Integration with Other Commands

- Use after `/investigate` for deeper exploration of specific findings
- Combine with `/options` to explore alternative approaches discovered during analysis
- Follow with `/plan` to organize implementation of identified improvements
- Use `/dependencies` to map discovered relationships and system connections
- Apply `/monitor` to track key metrics and patterns identified during investigation

The goal is developing expert-level understanding that enables confident decision-making and effective strategic action planning.
