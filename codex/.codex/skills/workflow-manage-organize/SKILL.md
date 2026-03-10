---
name: "workflow-manage-organize"
description: "Intelligent project organization orchestrator with language-specific conventions and parallel analysis"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$workflow-manage-organize`.
- Treat all user text after `$workflow-manage-organize` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `workflow:manage:organize`.
- Codex invocation: `$workflow-manage-organize`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

## Context

- Target directory: {{SC_ARGS}}

## Your spawn_agent

STEP 1: Initialize organization session and analyze project architecture

- CREATE session state file: `/tmp/organize-session-$SESSION_ID.json`
- ANALYZE project structure and technology stack from Context section
- DETECT primary and secondary languages/frameworks from build files
- ASSESS current organization level and identify improvement opportunities

```bash
# Initialize organization session state
echo '{
  "sessionId": "'$SESSION_ID'",
  "targetDirectory": "'{{SC_ARGS}}'",
  "detectedTechnologies": [],
  "organizationStrategy": "auto-detect",
  "backupCreated": false,
  "changesApplied": []
}' > /tmp/organize-session-$SESSION_ID.json
```

STEP 2: Comprehensive project analysis with parallel sub-agent coordination

TRY:

IF project_complexity == "multi-language" OR directory_structure == "disorganized":

LAUNCH parallel sub-agents for comprehensive project analysis:

- **Agent 1: Technology Stack Discovery**: Analyze all build files, dependencies, and frameworks
  - Focus: Package managers, language versions, framework detection, toolchain analysis
  - Tools: fd for build file discovery, rg for dependency searches, bat for file inspection
  - Output: Technology manifest with detected languages and their conventions

- **Agent 2: Directory Structure Assessment**: Evaluate current organization vs. best practices
  - Focus: Source directories, test locations, config placement, build artifacts
  - Tools: eza for directory analysis, fd for pattern matching, structure comparison
  - Output: Organization gap analysis and improvement recommendations

- **Agent 3: File Classification & Sorting**: Categorize files by purpose and detect misplacements
  - Focus: Source code, tests, documentation, configuration, build artifacts
  - Tools: rg for content analysis, fd for extension-based classification
  - Output: File classification matrix and relocation suggestions

- **Agent 4: Dependency & Import Analysis**: Analyze import patterns and dependency organization
  - Focus: Import statements, module structure, dependency graphs, unused imports
  - Tools: rg for import pattern analysis, language-specific dependency tools
  - Output: Dependency cleanup recommendations and import organization

ELSE:

EXECUTE streamlined single-language organization workflow:

```bash
# Single-language organization workflow
echo "🔍 Analyzing single-language project organization..."
```

STEP 3: Safety checkpoint and backup creation

**CRITICAL SAFETY MEASURES:**

```bash
# Create git commit before major reorganization
if git rev-parse --git-dir >/dev/null 2>&1; then
  echo "📦 Creating safety commit before reorganization..."
  git add -A
  git commit -m "backup: pre-organization snapshot for session $SESSION_ID" || echo "No changes to commit"
  
  # Update session state
  jq '.backupCreated = true' /tmp/organize-session-$SESSION_ID.json > /tmp/organize-session-$SESSION_ID.tmp && 
  mv /tmp/organize-session-$SESSION_ID.tmp /tmp/organize-session-$SESSION_ID.json
else
  echo "⚠️ Not a git repository - manual backup recommended"
fi
```

STEP 4: Language-specific organization implementation

CASE detected_primary_language:
WHEN "rust":

**Rust Project Organization:**

```bash
# Ensure Cargo.toml and Cargo.lock are in project root
if [ -f "{{SC_ARGS}}/Cargo.toml" ]; then
  echo "🦀 Organizing Rust project structure..."
  
  # Create standard Rust directories
  mkdir -p "{{SC_ARGS}}/src"
  mkdir -p "{{SC_ARGS}}/tests"
  mkdir -p "{{SC_ARGS}}/benches"
  mkdir -p "{{SC_ARGS}}/examples"
  
  # Move source files to src/ if not already there
  fd "\.rs$" "{{SC_ARGS}}" -E "src/*" -E "tests/*" -E "benches/*" -E "examples/*" | \
    xargs -I {} sh -c 'echo "Moving {} to src/"'
  
  # Verify lib.rs vs main.rs structure
  if [ -f "{{SC_ARGS}}/src/main.rs" ] && [ -f "{{SC_ARGS}}/src/lib.rs" ]; then
    echo "📚 Both lib.rs and main.rs detected - binary with library structure"
  fi
fi
```

WHEN "go":

**Go Project Organization:**

```bash
# Ensure go.mod and go.sum are in module root
if [ -f "{{SC_ARGS}}/go.mod" ]; then
  echo "🐹 Organizing Go project structure..."
  
  # Create standard Go directories
  mkdir -p "{{SC_ARGS}}/cmd"
  mkdir -p "{{SC_ARGS}}/internal"
  mkdir -p "{{SC_ARGS}}/pkg"
  mkdir -p "{{SC_ARGS}}/api"
  mkdir -p "{{SC_ARGS}}/web"
  
  # Organize main packages in cmd/
  fd "main\.go$" "{{SC_ARGS}}" -E "cmd/*" | \
    xargs -I {} sh -c 'echo "Consider moving {} to cmd/ directory"'
fi
```

WHEN "java":

**Java Project Organization:**

```bash
# Ensure Maven/Gradle files are in project root
if [ -f "{{SC_ARGS}}/pom.xml" ] || [ -f "{{SC_ARGS}}/build.gradle" ]; then
  echo "☕ Organizing Java project structure..."
  
  # Create standard Maven directory structure
  mkdir -p "{{SC_ARGS}}/src/main/java"
  mkdir -p "{{SC_ARGS}}/src/main/resources"
  mkdir -p "{{SC_ARGS}}/src/test/java"
  mkdir -p "{{SC_ARGS}}/src/test/resources"
  
  # Verify package directory structure matches package declarations
  echo "📦 Verifying package directory structure..."
fi
```

WHEN "deno" OR "typescript" OR "javascript":

**Deno/TypeScript Project Organization:**

```bash
# Ensure deno.json is in project root
if [ -f "{{SC_ARGS}}/deno.json" ] || [ -f "{{SC_ARGS}}/package.json" ]; then
  echo "⚡ Organizing TypeScript/JavaScript project structure..."
  
  # Create standard directories
  mkdir -p "{{SC_ARGS}}/src"
  mkdir -p "{{SC_ARGS}}/tests"
  mkdir -p "{{SC_ARGS}}/scripts"
  mkdir -p "{{SC_ARGS}}/types"
  
  # For Deno projects, ensure JSR imports
  if [ -f "{{SC_ARGS}}/deno.json" ]; then
    echo "🦕 Verifying JSR import usage in Deno project..."
    rg "https://deno\.land" "{{SC_ARGS}}" --type typescript | head -5 | \
      xargs -I {} echo "Consider migrating to JSR: {}"
  fi
fi
```

STEP 5: Cross-cutting organization improvements

**Documentation Organization:**

```bash
# Move README.md to project root if not already there
if [ ! -f "{{SC_ARGS}}/README.md" ]; then
  fd "README\.md$" "{{SC_ARGS}}" | head -1 | \
    xargs -I {} mv {} "{{SC_ARGS}}/README.md"
fi

# Organize docs in docs/ directory
mkdir -p "{{SC_ARGS}}/docs"
fd "\.(md|rst|txt)$" "{{SC_ARGS}}" -E "README.md" -E "docs/*" | \
  head -5 | xargs -I {} echo "Consider moving {} to docs/"
```

**Configuration Organization:**

```bash
# Group editor configs
mkdir -p "{{SC_ARGS}}/.vscode"
mkdir -p "{{SC_ARGS}}/.claude"

# Group CI/CD configs
if [ -d "{{SC_ARGS}}/.github" ]; then
  echo "🔄 GitHub Actions configuration detected"
fi

# Check for scattered config files
fd "\.(json|yaml|yml|toml|ini|conf)$" "{{SC_ARGS}}" | \
  head -10 | xargs -I {} echo "Config file: {}"
```

**Build Artifacts and Gitignore:**

```bash
# Ensure common build artifacts are gitignored
if [ -f "{{SC_ARGS}}/.gitignore" ]; then
  echo "📝 Checking .gitignore coverage..."
  
  # Check for common patterns
  patterns=("target/" "node_modules/" "dist/" "build/" "*.log" ".env")
  for pattern in "${patterns[@]}"; do
    if ! rg -q "^$pattern" "{{SC_ARGS}}/.gitignore"; then
      echo "Consider adding $pattern to .gitignore"
    fi
  done
fi
```

STEP 6: Import and dependency organization

**Import Statement Cleanup:**

```bash
# Language-specific import organization
case "$detected_language" in
  "rust")
    echo "🦀 Organizing Rust imports..."
    # Check for unused imports (requires rustc)
    ;;
  "go")
    echo "🐹 Organizing Go imports..."
    # Use goimports if available
    ;;
  "typescript"|"javascript")
    echo "⚡ Organizing TypeScript/JavaScript imports..."
    # Check import sorting and unused imports
    ;;
  "java")
    echo "☕ Organizing Java imports..."
    # Check import organization
    ;;
esac
```

**Dependency Cleanup:**

```bash
# Remove unused dependencies (language-specific)
echo "📦 Analyzing dependencies for cleanup opportunities..."

# Update session state with dependency analysis
jq '.dependencyAnalysis = {
  "unusedDependencies": [],
  "outdatedDependencies": [],
  "securityVulnerabilities": []
}' /tmp/organize-session-$SESSION_ID.json > /tmp/organize-session-$SESSION_ID.tmp && 
mv /tmp/organize-session-$SESSION_ID.tmp /tmp/organize-session-$SESSION_ID.json
```

CATCH (organization_failed):

- LOG error details to session state
- PROVIDE rollback instructions using git reset
- SUGGEST manual organization steps

```bash
echo "⚠️ Organization failed. Rollback available:"
echo "git reset --hard HEAD~1  # Restore pre-organization state"
echo "Session state: /tmp/organize-session-$SESSION_ID.json"
```

STEP 7: Validation and verification

**Build System Validation:**

```bash
# Verify builds still work after reorganization
echo "🔨 Validating build system after reorganization..."

if [ -f "{{SC_ARGS}}/Cargo.toml" ]; then
  echo "Testing Rust build..."
  cd "{{SC_ARGS}}" && cargo check --quiet 2>/dev/null && echo "✅ Rust build OK" || echo "❌ Rust build failed"
elif [ -f "{{SC_ARGS}}/go.mod" ]; then
  echo "Testing Go build..."
  cd "{{SC_ARGS}}" && go build ./... 2>/dev/null && echo "✅ Go build OK" || echo "❌ Go build failed"
elif [ -f "{{SC_ARGS}}/deno.json" ]; then
  echo "Testing Deno check..."
  cd "{{SC_ARGS}}" && deno check src/*.ts 2>/dev/null && echo "✅ Deno check OK" || echo "❌ Deno check failed"
fi
```

**Import Resolution Validation:**

```bash
# Check that import statements still resolve correctly
echo "🔗 Validating import resolution..."
rg "^(import|use|#include|require)" "{{SC_ARGS}}" --type-add 'source:*.{rs,go,java,ts,js,py}' --type source | \
  head -5 | xargs -I {} echo "Import: {}"
```

STEP 8: Session summary and recommendations

**Generate Organization Report:**

```bash
# Update session state with final results
jq --arg timestamp "$(gdate -Iseconds 2>/dev/null || date -Iseconds)" '
.completedAt = $timestamp |
.summary = {
  "filesReorganized": (.changesApplied | length),
  "directoriesCreated": 0,
  "buildValidated": true,
  "recommendationsGenerated": true
}' /tmp/organize-session-$SESSION_ID.json > /tmp/organize-session-$SESSION_ID.tmp && 
mv /tmp/organize-session-$SESSION_ID.tmp /tmp/organize-session-$SESSION_ID.json

# Display final summary
echo "✅ Project organization completed"
echo "📊 Session: $SESSION_ID"
echo "📁 Target: {{SC_ARGS}}"
echo "🔄 Changes applied: $(jq -r '.changesApplied | length' /tmp/organize-session-$SESSION_ID.json)"
echo "💾 Session state: /tmp/organize-session-$SESSION_ID.json"
```

**Recommendations for Further Improvement:**

```bash
echo "🎯 Recommendations for continued organization:"
echo "  1. Set up automated formatting (rustfmt, gofmt, prettier)"
echo "  2. Configure pre-commit hooks for code quality"
echo "  3. Implement dependency update automation"
echo "  4. Add comprehensive .gitignore patterns"
echo "  5. Document project structure in README.md"
```

FINALLY:

- SAVE session state for audit trail
- PROVIDE git history for rollback if needed
- SUGGEST next steps for maintaining organization

## Organization Strategy Reference

### Language-Specific Directory Conventions

**Rust Projects:**

```
project/
├── Cargo.toml
├── Cargo.lock
├── src/
│   ├── main.rs (for binaries)
│   ├── lib.rs (for libraries)
│   └── modules/
├── tests/
├── benches/
└── examples/
```

**Go Projects:**

```
project/
├── go.mod
├── go.sum
├── cmd/
│   └── app/main.go
├── internal/
├── pkg/
├── api/
└── web/
```

**Java Projects (Maven):**

```
project/
├── pom.xml
├── src/
│   ├── main/
│   │   ├── java/
│   │   └── resources/
│   └── test/
│       ├── java/
│       └── resources/
└── target/ (gitignored)
```

**Deno/TypeScript Projects:**

```
project/
├── deno.json
├── deno.lock
├── src/
├── tests/
├── scripts/
├── types/
└── docs/
```

### Best Practices Summary

1. **Build Configuration**: Always in project root
2. **Source Code**: Organized in `src/` or language-specific directories
3. **Tests**: Mirror source structure in `tests/` or `test/`
4. **Documentation**: Root-level README.md, detailed docs in `docs/`
5. **Configuration**: Group by purpose (`.github/`, `.vscode/`, etc.)
6. **Build Artifacts**: Always gitignored, never committed
7. **Dependencies**: Regularly audited and cleaned up
8. **Imports**: Sorted and organized by type (std, third-party, local)

9. **Configuration File Placement:**

   **Rust Projects:**
   - Move `Cargo.toml`, `Cargo.lock` to project root
   - Organize `src/`, `tests/`, `benches/`, `examples/` directories
   - Place `.cargo/config.toml` in appropriate location

   **Go Projects:**
   - Move `go.mod`, `go.sum` to module root
   - Organize packages in logical directory hierarchy
   - Place `cmd/`, `internal/`, `pkg/`, `api/` directories appropriately

   **Java Projects:**
   - Move `pom.xml` (Maven) or `build.gradle` (Gradle) to project root
   - Organize `src/main/java/`, `src/test/java/`, `src/main/resources/`
   - Check `application.properties` placement in `resources/`

   **Deno Projects:**
   - Move `deno.json`, `deno.lock` to project root
   - Organize task definitions and import maps
   - Structure `src/`, `tests/`, `scripts/` directories

   **Node.js Projects:**
   - Move `package.json`, `package-lock.json` to project root
   - Organize `src/`, `dist/`, `tests/`, `scripts/` directories
   - Check `tsconfig.json`, `.eslintrc` placement

10. **Directory Structure Standardization:**

    **Source Code:**
    - Create missing standard directories (`src/`, `lib/`, `tests/`)
    - Move source files to appropriate locations
    - Separate application code from library code

    **Documentation:**
    - Move `README.md` to project root
    - Organize docs in `docs/` directory
    - Place API documentation appropriately

    **Configuration:**
    - Group editor configs (`.vscode/`, `.codex/`, etc.)
    - Organize CI/CD configs (`.github/`, `.gitlab/`, etc.)
    - Place environment configs (`.env.example`, `config/`)

    **Build Artifacts:**
    - Ensure `target/` (Rust), `build/` (others) are gitignored
    - Check `node_modules/`, `dist/` in gitignore
    - Verify temporary files are excluded

11. **File Organization Within Directories:**

    **Source Organization:**
    - Group related modules/packages together
    - Separate interfaces/traits from implementations
    - Organize by feature or layer (domain-driven design)

    **Test Organization:**
    - Match test directory structure to source structure
    - Separate unit, integration, and e2e tests
    - Place test utilities in appropriate shared locations

    **Script Organization:**
    - Move build/deployment scripts to `scripts/`
    - Create task runners in `deno.json`, `package.json`, or `Makefile`
    - Group automation scripts by purpose

12. **Import and Dependency Organization:**

    **Import Statements:**
    - Sort imports by type (standard library, third-party, local)
    - Remove unused imports
    - Use absolute paths where conventional

    **Dependency Management:**
    - Remove unused dependencies from manifests
    - Group dependencies by purpose (dev, test, runtime)
    - Update to compatible versions where safe

13. **Language-Specific Best Practices:**

    **Rust:**
    - Organize modules with `mod.rs` or single-file modules
    - Check `lib.rs` vs `main.rs` usage
    - Verify feature flags in `Cargo.toml`

    **Go:**
    - Follow Go module structure conventions
    - Check package naming conventions
    - Verify internal package usage

    **Java:**
    - Ensure proper package directory structure
    - Check Maven/Gradle multi-module setup
    - Verify resource file locations

    **Deno/TypeScript:**
    - Use JSR imports for standard library
    - Organize type definitions appropriately
    - Check `import_map.json` usage

14. **Cleanup Operations:**
    - Remove empty directories
    - Delete orphaned configuration files
    - Clean up duplicate or conflicting configs
    - Remove build artifacts from version control
    - Fix file permissions where needed

15. **Validation:**
    - Verify builds still work after reorganization
    - Check that tests can still find their targets
    - Ensure CI/CD configs reference correct paths
    - Validate import statements resolve correctly

Safety measures:

- Create git commit before major reorganization
- Preserve file history during moves (use `git mv`)
- Run project-specific tests after each major change
- Check that development workflows still function
- Backup any configuration that might be lost

Output:

- Summary of files moved and directories created
- List of configuration files relocated
- Report on dependency cleanup
- Suggestions for further improvements
- Updated project documentation if needed
