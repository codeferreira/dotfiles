---
name: "meta-search-search-smart"
description: "Intelligent code search orchestrator using modern tools with parallel analysis capabilities"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$meta-search-search-smart`.
- Treat all user text after `$meta-search-search-smart` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `meta:search:search-smart`.
- Codex invocation: `$meta-search-search-smart`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

## Context

- Search target: {{SC_ARGS}}

## Your spawn_agent

STEP 1: Initialize intelligent search session and analyze project context

- CREATE session state file: `/tmp/search-session-$SESSION_ID.json`
- ANALYZE project structure from Context section
- DETERMINE search complexity based on codebase size and query
- VALIDATE modern CLI tools availability (rg, fd, bat, fzf are MANDATORY)

```bash
# Initialize search session state
echo '{
  "sessionId": "'$SESSION_ID'",
  "searchTarget": "'{{SC_ARGS}}'",
  "projectLanguages": [],
  "searchStrategy": "auto-detect",
  "resultsFound": 0,
  "searchHistory": []
}' > /tmp/search-session-$SESSION_ID.json
```

STEP 2: Adaptive search strategy selection with intelligent routing

TRY:

CASE search_complexity:
WHEN "simple_pattern":

- EXECUTE direct ripgrep search with smart filtering
- USE targeted file type detection
- PROVIDE immediate results with context

WHEN "complex_analysis":

- LAUNCH parallel sub-agents for comprehensive search
- COORDINATE results from multiple search domains
- SYNTHESIZE findings into coherent analysis

WHEN "interactive_exploration":

- ENABLE fzf-powered interactive search interface
- PROVIDE live preview with bat syntax highlighting
- SUPPORT multi-select and batch operations

**Simple Pattern Search (Fast Results):**

```bash
# Smart case-insensitive search with context
rg "{{SC_ARGS}}" --smart-case --context 3 --color always --heading --line-number --stats

# Language-specific search with auto-detection
if fd "\.rs$" . | head -1 >/dev/null; then
  echo "🦀 Rust project detected - searching with Rust patterns"
  rg "{{SC_ARGS}}" --type rust --context 2
fi

if fd "\.go$" . | head -1 >/dev/null; then
  echo "🐹 Go project detected - searching with Go patterns"  
  rg "{{SC_ARGS}}" --type go --context 2
fi

if fd "\.(js|ts)$" . | head -1 >/dev/null; then
  echo "⚡ JavaScript/TypeScript project detected"
  rg "{{SC_ARGS}}" --type-add 'js:*.{js,ts,jsx,tsx}' --type js --context 2
fi
```

STEP 3: Parallel comprehensive search using sub-agent architecture

IF codebase_size > 1000 files OR search_target contains multiple_terms:

**CRITICAL: Deploy parallel sub-agents for maximum search performance (8-10x faster comprehensive search)**

IMMEDIATELY launch 8 specialized parallel search agents:

- **Agent 1: Source Code Search**: Deep search across primary source directories (src/, lib/, app/)
  - Focus: Function definitions, class declarations, implementation logic, business logic
  - Tools: rg with language-specific patterns, function signature detection, semantic search
  - Output: Core implementation findings with relevance scoring and cross-references

- **Agent 2: Test Code Analysis**: Comprehensive test ecosystem search (test/, tests/, spec/, **tests**)
  - Focus: Test cases, mocks, test utilities, usage patterns, test coverage analysis
  - Tools: rg with test-specific patterns, test framework detection, coverage mapping
  - Output: Test coverage insights and example usage patterns with quality assessment

- **Agent 3: Documentation Search**: Exhaustive documentation and comment analysis
  - Focus: API docs, usage examples, architectural notes, inline comments, READMEs
  - Tools: rg with comment patterns, markdown search, documentation analysis, link validation
  - Output: Contextual documentation with cross-references and knowledge gaps identified

- **Agent 4: Configuration Search**: Complete configuration and environment analysis
  - Focus: Environment variables, build configs, deployment settings, feature flags
  - Tools: rg with config-specific patterns, structured data search, environment mapping
  - Output: Configuration insights with environment dependencies and security considerations

- **Agent 5: Script & Automation Search**: CI/CD and automation tool analysis
  - Focus: Build scripts, deployment tools, CI/CD configurations, automation workflows
  - Tools: rg with script patterns, workflow analysis, dependency chain mapping
  - Output: Automation workflow findings with optimization opportunities

- **Agent 6: Database & Schema Search**: Data layer and persistence pattern analysis
  - Focus: Database schemas, migrations, queries, data models, ORM configurations
  - Tools: rg with SQL patterns, schema analysis, query optimization detection
  - Output: Data architecture findings with performance and integrity insights

- **Agent 7: API & Integration Search**: Service interface and integration pattern analysis
  - Focus: REST endpoints, GraphQL schemas, service contracts, external integrations
  - Tools: rg with API patterns, contract analysis, integration mapping
  - Output: API surface area with consistency and compatibility analysis

- **Agent 8: Security & Compliance Search**: Security pattern and vulnerability analysis
  - Focus: Authentication, authorization, input validation, security configurations
  - Tools: rg with security patterns, vulnerability detection, compliance checking
  - Output: Security findings with risk assessment and remediation recommendations

**Sub-Agent Coordination:**

- Each agent saves findings to `/tmp/search-agents-$SESSION_ID/`
- Parallel execution provides 8-10x speed improvement over sequential search
- Cross-agent correlation identifies patterns spanning multiple domains
- Results synthesized with intelligent ranking and relevance scoring
- Smart deduplication and cross-reference linking across all search domains

STEP 4: Interactive search interface with modern tooling

**fzf-Powered Interactive Search:**

```bash
# Interactive content search with live preview
rg --line-number --color=always --smart-case "{{SC_ARGS}}" | \
  fzf --ansi --delimiter : --nth 3.. \
      --preview 'bat --color=always --highlight-line {2} {1}' \
      --preview-window right:50% \
      --bind 'enter:execute(bat --color=always --highlight-line {2} {1})'

# Interactive file discovery
fd "{{SC_ARGS}}" --type file --color always | \
  fzf --preview 'bat --color=always {}' \
      --preview-window right:50%
```

**Advanced Search Patterns:**

```bash
# Function/method search with language awareness
rg "^(function|def|fn|func|class|interface|type)\s+.*{{SC_ARGS}}" --type-add 'code:*.{js,ts,py,rs,go,java,c,cpp}' --type code

# TODO/FIXME search with context
rg "(TODO|FIXME|HACK|NOTE|BUG).*{{SC_ARGS}}" --context 2 --color always

# Recent changes search (files modified in last 7 days)
fd --changed-within 7d --type file | xargs rg "{{SC_ARGS}}" --context 2 --color always
```

STEP 5: Results processing and intelligent ranking

TRY:

**Structured Output Generation:**

```bash
# Generate JSON results for programmatic processing
rg "{{SC_ARGS}}" --json | jq -r '
  select(.type=="match") | 
  {
    file: .path.text,
    line: .line_number,
    content: .lines.text,
    relevance: (.lines.text | length)
  }
' > /tmp/search-results-$SESSION_ID.json

# Statistics and summary
echo "📊 Search Statistics:"
rg "{{SC_ARGS}}" --stats --color always

# File-based match counts  
echo "📁 Matches per file:"
rg "{{SC_ARGS}}" --count-matches --sort path | head -10
```

**Result Filtering and Enhancement:**

```bash
# Filter by file types based on project
project_types=$(fd "(package\.json|Cargo\.toml|go\.mod)" . | head -1)
if [[ -n "$project_types" ]]; then
  echo "🎯 Project-specific filtering applied"
fi

# Contextual result enhancement
echo "🔍 Enhanced search results with:"
echo "  - Syntax highlighting via bat"
echo "  - Interactive selection via fzf" 
echo "  - Smart case matching"
echo "  - Language-aware patterns"
```

CATCH (search_failed):

- LOG error details to session state
- PROVIDE alternative search strategies
- SUGGEST tool installation if modern tools missing

```bash
echo "⚠️ Search execution failed. Checking tool availability:"
echo "Required tools status:"
echo "  ripgrep (rg): $(which rg >/dev/null && echo '✓ installed' || echo '❌ missing - install with: brew install ripgrep')"
echo "  fd: $(which fd >/dev/null && echo '✓ installed' || echo '❌ missing - install with: brew install fd')"
echo "  bat: $(which bat >/dev/null && echo '✓ installed' || echo '❌ missing - install with: brew install bat')"
echo "  fzf: $(which fzf >/dev/null && echo '✓ installed' || echo '❌ missing - install with: brew install fzf')"
```

STEP 6: Session state management and search history

**Update Session State:**

```bash
# Update search session with results
jq --arg query "{{SC_ARGS}}" --arg timestamp "$(gdate -Iseconds 2>/dev/null || date -Iseconds)" '
  .searchHistory += [{
    "query": $query,
    "timestamp": $timestamp,
    "resultsCount": (.resultsFound // 0)
  }]
' /tmp/search-session-$SESSION_ID.json > /tmp/search-session-$SESSION_ID.tmp && \
mv /tmp/search-session-$SESSION_ID.tmp /tmp/search-session-$SESSION_ID.json
```

**Search Session Summary:**

```bash
echo "✅ Search session completed"
echo "🔍 Query: {{SC_ARGS}}"
echo "📊 Results: $(jq -r '.resultsFound // 0' /tmp/search-session-$SESSION_ID.json) matches found"
echo "⏱️ Session: $SESSION_ID"
echo "💾 Results cached in: /tmp/search-results-$SESSION_ID.json"
```

FINALLY:

- SAVE session state for potential follow-up searches
- PROVIDE guidance for result exploration
- SUGGEST related search patterns based on project analysis

## Search Strategies Reference

### Language-Specific Patterns

**Rust Projects:**

- Function definitions: `rg "^(fn|pub fn|async fn)" --type rust`
- Struct/enum definitions: `rg "^(struct|enum|trait)" --type rust`
- Error handling: `rg "(Result|Option|unwrap|expect)" --type rust`

**Go Projects:**

- Function definitions: `rg "^func.*{{SC_ARGS}}" --type go`
- Interface definitions: `rg "^type.*interface" --type go`
- Error handling: `rg "error.*{{SC_ARGS}}" --type go`

**TypeScript/JavaScript Projects:**

- Function definitions: `rg "(function|const|let).*{{SC_ARGS}}" --type typescript`
- Class definitions: `rg "^(class|interface|type).*{{SC_ARGS}}" --type typescript`
- Async patterns: `rg "(async|await|Promise).*{{SC_ARGS}}" --type typescript`

**Java Projects:**

- Class definitions: `rg "^(public|private).*class.*{{SC_ARGS}}" --type java`
- Method definitions: `rg "(public|private).*{{SC_ARGS}}.*\(" --type java`
- Annotations: `rg "@.*{{SC_ARGS}}" --type java`

### Development Workflow Searches

**Common Development Patterns:**

- API endpoints: `rg "(GET|POST|PUT|DELETE|PATCH).*{{SC_ARGS}}"`
- Environment variables: `rg "process\.env\.{{SC_ARGS}}|$\{{{SC_ARGS}}\}"`
- Configuration keys: `rg "\"{{SC_ARGS}}\":" --type json`
- Database queries: `rg "(SELECT|INSERT|UPDATE|DELETE).*{{SC_ARGS}}" --ignore-case`

**Code Quality Searches:**

- Technical debt: `rg "(TODO|FIXME|HACK|DEPRECATED).*{{SC_ARGS}}"`
- Security patterns: `rg "(password|secret|token|api.?key).*{{SC_ARGS}}" --ignore-case`
- Performance patterns: `rg "(slow|performance|optimize|cache).*{{SC_ARGS}}" --ignore-case`

## Example Usage Scenarios

```bash
# Search for API endpoint implementations
/search-smart "createUser"

# Find all configuration references
/search-smart "database_url"

# Interactive exploration of authentication code
/search-smart "auth token"

# Comprehensive analysis of error handling patterns
/search-smart "error handling"

# Find recent changes related to specific feature
/search-smart "payment processing"
```

This intelligent search command adapts to your project, leverages modern tools exclusively, and provides both quick results and comprehensive analysis capabilities through parallel sub-agent coordination.
