---
name: "workflow-view-next-steps"
description: "Intelligent project state analyzer with priority-based task recommendations and sub-agent coordination"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$workflow-view-next-steps`.
- Treat all user text after `$workflow-view-next-steps` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `workflow:view:next-steps`.
- Codex invocation: `$workflow-view-next-steps`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

## Context

- Analysis target: {{SC_ARGS}}

## Your spawn_agent

STEP 1: Initialize next-steps analysis session with comprehensive state assessment

- CREATE session state file: `/tmp/next-steps-session-$SESSION_ID.json`
- ANALYZE current project context from Context section
- DETERMINE analysis scope based on {{SC_ARGS}} (general analysis vs. specific focus area)
- ASSESS project complexity and coordination requirements

```bash
# Initialize next-steps analysis session
echo '{
  "sessionId": "'$SESSION_ID'",
  "analysisTarget": "'{{SC_ARGS}}'",
  "projectType": "auto-detect",
  "analysisScope": "comprehensive",
  "priorityFramework": "impact-effort-matrix",
  "recommendations": []
}' > /tmp/next-steps-session-$SESSION_ID.json
```

STEP 2: Multi-dimensional project state analysis with parallel sub-agent coordination

TRY:

IF project_complexity == "large" OR analysis_scope == "comprehensive":

LAUNCH parallel sub-agents for thorough project state analysis:

- **Agent 1: Git & Version Control Analysis**: Analyze repository state and development flow
  - Focus: Branch status, recent commits, merge conflicts, pending PRs, release cycles
  - Tools: git commands, gh CLI for GitHub integration, branch analysis
  - Output: Development flow assessment and version control recommendations

- **Agent 2: spawn_agent & TODO Analysis**: Examine existing work tracking and outstanding items
  - Focus: TodoRead analysis, task system status, blocked items, dependency chains
  - Tools: TodoRead, task system analysis, priority assessment
  - Output: Work queue analysis and priority recommendations

- **Agent 3: Code Quality & Technical Debt**: Assess codebase health and improvement opportunities
  - Focus: TODO/FIXME comments, test coverage gaps, refactoring needs, security issues
  - Tools: rg for pattern searches, static analysis, coverage reports
  - Output: Technical debt assessment and quality improvement roadmap

- **Agent 4: Dependencies & Infrastructure**: Analyze external dependencies and system health
  - Focus: Dependency updates, security vulnerabilities, build system health, CI/CD status
  - Tools: Package manager analysis, security scanning, build system checks
  - Output: Infrastructure and dependency management recommendations

- **Agent 5: Documentation & Knowledge Gaps**: Identify documentation needs and knowledge management
  - Focus: Missing documentation, outdated guides, API documentation, onboarding materials
  - Tools: fd for doc discovery, rg for documentation patterns, gap analysis
  - Output: Documentation strategy and knowledge management improvements

ELSE:

EXECUTE focused single-agent analysis for targeted recommendations:

```bash
echo "🎯 Executing focused analysis for: {{SC_ARGS}}"
```

## Analysis Process

STEP 3: Intelligent priority analysis using impact-effort matrix methodology

TRY:

**Multi-Dimensional Priority Assessment:**

```bash
# Priority analysis framework
echo "📊 Applying impact-effort matrix to identified tasks..."
```

CASE priority_category:
WHEN "immediate_blockers":

- IDENTIFY issues preventing other work from proceeding
- ASSESS impact on team productivity and project timeline
- PRIORITIZE by severity and dependency cascade effects
- RECOMMEND immediate action items with clear resolution paths

WHEN "high_impact_opportunities":

- EVALUATE core functionality improvements and critical bug fixes
- ANALYZE user experience impact and business value
- CONSIDER technical feasibility and resource requirements
- RECOMMEND strategic initiatives with measurable outcomes

WHEN "quick_wins":

- DISCOVER small tasks with immediate visible value
- FOCUS on low-effort, high-visibility improvements
- IDENTIFY automation opportunities and developer experience enhancements
- RECOMMEND tactical improvements for momentum building

WHEN "technical_debt":

- ASSESS code quality degradation and maintenance burden
- EVALUATE refactoring opportunities and architecture improvements
- CONSIDER long-term maintainability and team velocity impact
- RECOMMEND strategic technical investments

WHEN "knowledge_gaps":

- IDENTIFY missing documentation and knowledge transfer needs
- ASSESS onboarding efficiency and team knowledge distribution
- EVALUATE API documentation and usage guidance completeness
- RECOMMEND knowledge management and documentation strategies

STEP 4: Intelligent recommendation synthesis with actionable task breakdown

**Structured Recommendation Generation:**

```bash
# Generate prioritized recommendations
jq --arg timestamp "$(gdate -Iseconds 2>/dev/null || date -Iseconds)" '
  .recommendations = [] |
  .analysisTimestamp = $timestamp |
  .priorityFramework = "impact-effort-matrix"
' /tmp/next-steps-session-$SESSION_ID.json > /tmp/next-steps-session-$SESSION_ID.tmp && \
mv /tmp/next-steps-session-$SESSION_ID.tmp /tmp/next-steps-session-$SESSION_ID.json
```

**Recommendation Structure Template:**

FOR EACH identified_priority_task:

**[TASK_NAME]** - Priority: [HIGH/MEDIUM/LOW] | Impact: [HIGH/MEDIUM/LOW] | Effort: [QUICK/MODERATE/SIGNIFICANT]

- **Why**: [Impact analysis and business/technical justification]
- **What**: [Specific, actionable implementation steps]
- **Dependencies**: [Prerequisite tasks and external requirements]
- **Acceptance Criteria**:
  - [ ] Criterion 1
  - [ ] Criterion 2
  - [ ] Criterion 3
- **Estimated Effort**: [Time estimate with confidence level]
- **Risk Factors**: [Potential blockers and mitigation strategies]
- **Follow-up spawn_agents**:
  - [Related task 1 with dependency type]
  - [Related task 2 with impact assessment]

**Parallel Execution Opportunities:**

- IDENTIFY tasks suitable for concurrent execution
- DESIGN sub-agent delegation strategies for complex tasks
- RECOMMEND Git worktree usage for parallel development streams
- SUGGEST multi-agent coordination patterns

**Strategic Considerations:**

- EVALUATE longer-term architectural improvements
- ASSESS process optimization opportunities
- IDENTIFY team capability development needs
- RECOMMEND tooling and automation investments

STEP 5: spawn_agent system integration with automated task creation

TRY:

**Automated spawn_agent Management Integration:**

```bash
IF [task_system_available]:
  FOR EACH high_priority_recommendation:
    # Offer task creation in management system
    echo "📝 Creating task: $TASK_NAME"
    echo "   Priority: $PRIORITY_LEVEL"
    echo "   Effort: $EFFORT_ESTIMATE"
    echo "   Dependencies: $TASK_DEPENDENCIES"
ELSE:
  # Use update_plan for immediate task tracking
  echo "📋 Adding to todo system for immediate action"
FI
```

**spawn_agent Linkage and Dependency Mapping:**

```bash
# Create task dependency graph
echo "🔗 Mapping task dependencies and relationships..."
echo "📊 Generating priority matrix visualization..."
```

CATCH (analysis_failed):

- LOG error details to session state
- PROVIDE fallback analysis using available context
- SUGGEST manual analysis steps

```bash
echo "⚠️ Analysis execution failed. Providing fallback recommendations:"
echo "🔍 Manual analysis steps:"
echo "  1. Review git log and recent changes"
echo "  2. Check TodoRead for pending items"
echo "  3. Examine project build files for updates needed"
echo "  4. Look for TODO/FIXME comments in codebase"
```

STEP 6: Session state management and recommendation persistence

**Update Session State with Analysis Results:**

```bash
# Save analysis results and recommendations
jq --arg timestamp "$(gdate -Iseconds 2>/dev/null || date -Iseconds)" --arg status "completed" '
  .analysisStatus = $status |
  .completionTimestamp = $timestamp |
  .recommendationCount = (.recommendations | length)
' /tmp/next-steps-session-$SESSION_ID.json > /tmp/next-steps-session-$SESSION_ID.tmp && \
mv /tmp/next-steps-session-$SESSION_ID.tmp /tmp/next-steps-session-$SESSION_ID.json
```

**Analysis Summary Report:**

```bash
echo "✅ Next Steps Analysis Completed"
echo "🎯 Target: ${ARGUMENTS:-"General project analysis"}"
echo "📊 Recommendations: $(jq -r '.recommendationCount // 0' /tmp/next-steps-session-$SESSION_ID.json)"
echo "⏱️ Session: $SESSION_ID"
echo "💾 Results cached in: /tmp/next-steps-session-$SESSION_ID.json"
```

FINALLY:

- SAVE session state for follow-up analysis
- PROVIDE guidance for implementing recommendations
- SUGGEST coordination strategies for team environments
- OFFER to create tasks in management systems

## Usage Examples

```bash
# Comprehensive project analysis
/next-steps

# Focus on specific domain
/next-steps "performance optimization opportunities"

# Post-feature completion analysis
/next-steps "just finished user authentication, what should we tackle next?"

# Blocked workflow resolution
/next-steps "blocked on database migration, need alternative approaches"

# Technical debt assessment
/next-steps "focus on code quality and refactoring opportunities"

# Documentation gap analysis
/next-steps "identify documentation needs and knowledge gaps"
```

## Strategic Analysis Framework

### Impact-Effort Matrix Categories

**High Impact, Low Effort (Quick Wins)**:

- Bug fixes with clear solutions
- Documentation updates
- Small UX improvements
- Developer experience enhancements

**High Impact, High Effort (Strategic Projects)**:

- Major feature implementations
- Architecture refactoring
- Performance optimization initiatives
- Security hardening projects

**Low Impact, Low Effort (Fill-in spawn_agents)**:

- Code cleanup and formatting
- Comment improvements
- Minor dependency updates
- Tool configuration tweaks

**Low Impact, High Effort (Avoid/Defer)**:

- Over-engineering solutions
- Premature optimizations
- Non-critical feature bloat
- Complex abstractions without clear value

### Priority Assessment Criteria

1. **Business Impact**: User experience, revenue, market position
2. **Technical Impact**: System stability, maintainability, scalability
3. **Team Impact**: Developer productivity, knowledge sharing, morale
4. **Risk Impact**: Security, compliance, technical debt accumulation
5. **Effort Required**: Time, complexity, coordination needs
6. **Dependencies**: Blocking relationships, external constraints

### Recommendation Implementation Guidelines

- **Immediate Actions** (0-1 days): Critical blockers and quick wins
- **Short-term Goals** (1-7 days): High-impact features and important fixes
- **Medium-term Objectives** (1-4 weeks): Strategic projects and major improvements
- **Long-term Vision** (1-3 months): Architecture evolution and process optimization

This intelligent next-steps analyzer provides comprehensive project state assessment with actionable, prioritized recommendations for optimal development workflow progression.
