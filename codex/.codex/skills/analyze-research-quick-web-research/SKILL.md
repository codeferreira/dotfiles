---
name: "analyze-research-quick-web-research"
description: "Ultra-fast parallel web research using sub-agents for 5-10x speedup"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$analyze-research-quick-web-research`.
- Treat all user text after `$analyze-research-quick-web-research` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `analyze:research:quick-web-research`.
- Codex invocation: `$analyze-research-quick-web-research`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

## Context

- Research query: {{SC_ARGS}}
- Results directory: /tmp/research-results-$SESSION_ID/

## Your spawn_agent

**IMMEDIATELY DEPLOY 8 PARALLEL SUB-AGENTS** for lightning-fast research on: "{{SC_ARGS}}"

STEP 1: Initialize Research Session

- Create session state file: /tmp/research-state-$SESSION_ID.json
- Initialize results directory: /tmp/research-results-$SESSION_ID/
- Log research parameters and timestamp

STEP 2: Parallel Research Execution

**LAUNCH ALL 8 AGENTS SIMULTANEOUSLY:**

1. **Primary Search Agent**: Execute main WebSearch for "{{SC_ARGS}}"
2. **Alternative Search Agent**: Search with refined/alternative query terms
3. **Technical Docs Agent**: Focus on official documentation and APIs
4. **Best Practices Agent**: Find current industry best practices
5. **Tutorial Agent**: Locate practical tutorials and examples
6. **Community Agent**: Search Stack Overflow, forums, discussions
7. **Security Agent**: Research security considerations and vulnerabilities
8. **Performance Agent**: Find performance benchmarks and optimizations

Each agent should:

- Perform independent searches with domain-specific focus
- Extract and analyze 2-3 top sources
- Rate content quality and relevance
- Save findings to /tmp/research-results-$SESSION_ID/agent-N.md

STEP 3: Parallel Content Analysis

**NO SEQUENTIAL PROCESSING** - All agents work concurrently:

- Each agent uses WebFetch on their discovered sources
- Focus on their specific domain expertise
- Extract actionable insights and patterns
- Identify current vs outdated information

STEP 4: Synthesis and Analysis

After all agents complete:

- Aggregate findings from all 8 parallel research streams
- Cross-reference information for validation
- Identify consensus recommendations
- Flag conflicting or outdated information
- Create unified knowledge base

STEP 5: Structured Output

Generate comprehensive report with:

- Executive summary from multi-agent findings
- Key insights by category (technical, security, performance, etc.)
- Confidence scores based on source agreement
- Recommended next steps with priority ranking
- Source quality matrix

STEP 6: Session Cleanup

- Save final synthesized report
- Archive individual agent findings
- Update session state with completion metrics
- Report performance gain (expected 5-10x faster)

## Error Handling

TRY:

- Execute primary research workflow
  CATCH (WebSearch failures):
- Log error and attempt alternative search terms
- Provide partial results if any sources were successfully fetched
  CATCH (WebFetch failures):
- Skip failed sources and continue with available content
- Note limitations in final report
  FINALLY:
- Ensure session state is updated
- Clean up temporary files if requested

## Quality Assurance

- Verify all sources are accessible and current
- Cross-reference information across multiple sources
- Flag potentially outdated or unreliable information
- Provide confidence indicators for each finding

## Research Examples

**Technology Research:**

- "Next.js 15 new features" → Focus on official docs, release notes, migration guides
- "Python asyncio best practices 2024" → Prioritize recent articles, official Python docs
- "Docker security vulnerabilities" → Emphasize security advisories, CVE databases

**Development Focus:**

- Prioritize official documentation over blog posts
- Favor recent content (last 12 months) for rapidly evolving technologies
- Include practical examples and implementation guidance
- Verify information against multiple authoritative sources
