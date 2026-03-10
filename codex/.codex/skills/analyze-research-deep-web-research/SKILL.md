---
name: "analyze-research-deep-web-research"
description: "Comprehensive parallel web research with multi-agent analysis and synthesis"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$analyze-research-deep-web-research`.
- Treat all user text after `$analyze-research-deep-web-research` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `analyze:research:deep-web-research`.
- Codex invocation: `$analyze-research-deep-web-research`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

## Context

- Research query: {{SC_ARGS}}

## Your spawn_agent

Conduct comprehensive web research using parallel sub-agents for thorough coverage and analysis.

Think deeply about the optimal research strategy for this specific query, considering:

- Technical complexity and scope
- Time-sensitive vs. foundational information needs
- Target audience (beginner, intermediate, expert)
- Project context and practical application requirements

STEP 1: Research Strategy Initialization

- Parse research query: {{SC_ARGS}}
- Initialize session state: /tmp/deep-web-research-$SESSION_ID.json
- Determine research complexity (simple/moderate/complex)
- Generate research angles and perspectives
- Create agent delegation strategy

STEP 2: Multi-Perspective Query Generation

- Generate 5-7 search query variations:
  - Current best practices and standards
  - Real-world implementation experiences
  - Recent trends and innovations
  - Comparative analysis and alternatives
  - Security and performance considerations
  - Common pitfalls and lessons learned
  - Enterprise vs. small-scale approaches

STEP 3: Parallel Research Execution

Deploy 5 research agents in parallel:

**Agent 1: Authoritative Sources Research**

- spawn_agent: "Research official documentation, standards, and authoritative best practices for: {{SC_ARGS}}"
- Focus: Official docs, RFC standards, vendor documentation
- Sources: 2-3 authoritative sources
- Output: /tmp/research-auth-$SESSION_ID.json

**Agent 2: Community Insights Research**

- spawn_agent: "Research community experiences, forums, and practical implementations for: {{SC_ARGS}}"
- Focus: Stack Overflow, Reddit, GitHub discussions, practitioner blogs
- Sources: 2-3 community sources
- Output: /tmp/research-community-$SESSION_ID.json

**Agent 3: Innovation and Trends Research**

- spawn_agent: "Research recent developments, emerging trends, and cutting-edge approaches for: {{SC_ARGS}}"
- Focus: Recent conference talks, innovation blogs, research papers
- Sources: 2-3 trend sources
- Output: /tmp/research-trends-$SESSION_ID.json

**Agent 4: Comparative Analysis Research**

- spawn_agent: "Research alternatives, comparisons, and decision criteria for: {{SC_ARGS}}"
- Focus: Technology comparisons, decision frameworks, trade-off analyses
- Sources: 2-3 comparative sources
- Output: /tmp/research-comparison-$SESSION_ID.json

**Agent 5: Risk and Implementation Research**

- spawn_agent: "Research risks, challenges, implementation considerations, and mitigation strategies for: {{SC_ARGS}}"
- Focus: Case studies, failure analyses, implementation guides
- Sources: 2-3 implementation sources
- Output: /tmp/research-risks-$SESSION_ID.json

STEP 4: Research Coordination and Validation

WAIT for all 5 agents to complete research phases.

FOR EACH agent result:

- Validate source quality and recency
- Extract key findings and insights
- Identify conflicting information
- Score source authority and relevance
- Update session state with findings

STEP 5: Cross-Reference Analysis

Think harder about potential biases in the sources and how to synthesize conflicting information:

- Identify consensus vs. debate areas
- Validate claims across multiple sources
- Resolve conflicting recommendations
- Assess information recency and relevance
- Weight findings by source authority

STEP 6: Comprehensive Report Generation

Create detailed research report: /tmp/deep-research-report-$SESSION_ID.md

Report structure:

```markdown
# Deep Research Report: [Query]

## Executive Summary

- Key findings (3-5 bullet points)
- Primary recommendations
- Critical considerations

## Detailed Findings

### Current Best Practices

[Synthesized from Agent 1]

### Community Insights

[Synthesized from Agent 2]

### Emerging Trends

[Synthesized from Agent 3]

### Comparative Analysis

[Synthesized from Agent 4]

### Implementation Considerations

[Synthesized from Agent 5]

## Recommendations

### For [Project Context]

- Specific actionable recommendations
- Implementation priorities
- Risk mitigation strategies

## Further Research

- Recommended deep-dive topics
- Additional resources
- Follow-up questions

## Sources

[Comprehensive source list with quality ratings]
```

STEP 7: Context-Aware Recommendations

IF project context detected:

- Tailor recommendations to detected technology stack
- Provide specific implementation guidance
- Include project-relevant examples
- Suggest integration approaches

ELSE:

- Provide general best practices
- Include multiple implementation options
- Focus on foundational concepts

STEP 8: Quality Validation and Output

TRY:

- Validate report completeness and accuracy
- Ensure all research angles covered
- Verify source citations and links
- Generate executive summary
- Save final report to session directory

CATCH (incomplete_research):

- Identify missing research areas
- Launch additional targeted research agents
- Supplement findings with focused searches
- Update report with additional insights

CATCH (conflicting_information):

- Document conflicting viewpoints
- Research additional sources for clarification
- Provide balanced analysis of different perspectives
- Include uncertainty acknowledgments

FINALLY:

- Update session state: research_complete
- Archive research artifacts
- Clean up temporary files: /tmp/_-$SESSION_ID-temp_
- Display final report location and key insights

## Research Quality Standards

**Source Validation Criteria:**

- Recency (prefer sources within 2 years for tech topics)
- Authority (official docs > expert blogs > forum posts)
- Practical relevance (implementation guides > theoretical discussions)
- Community validation (upvotes, citations, adoption)

**Analysis Depth Requirements:**

- Minimum 8-12 high-quality sources across all agents
- Cross-validation of claims across 3+ sources
- Coverage of all major perspectives and approaches
- Identification of consensus vs. debate areas

**Output Quality Assurance:**

- Executive summary under 200 words
- Detailed findings with source citations
- Actionable recommendations with implementation guidance
- Balanced analysis of trade-offs and considerations

Perfect for architectural decisions, technology evaluations, and comprehensive technical research requiring deep analysis and multiple perspectives.
