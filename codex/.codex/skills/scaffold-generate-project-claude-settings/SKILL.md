---
name: "scaffold-generate-project-claude-settings"
description: "Generate project-specific .claude/settings.json based on project context with appropriate hooks and configurations"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$scaffold-generate-project-claude-settings`.
- Treat all user text after `$scaffold-generate-project-claude-settings` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `scaffold:generate-project-claude-settings`.
- Codex invocation: `$scaffold-generate-project-claude-settings`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

## Context


## Your task

Generate a project-specific .codex/settings.json file based on the project context, including appropriate permissions, hooks, and configurations.

STEP 1: Analyze project context and determine configuration needs

```bash
# Create session state
session_id="$SESSION_ID"
state_file="/tmp/claude-settings-gen-$session_id.json"

# Initialize project analysis
echo '{
  "session_id": "'$session_id'",
  "project_root": "'$(pwd)'",
  "timestamp": "'$(gdate -Iseconds 2>/dev/null || date -Iseconds)'",
  "detected_languages": [],
  "detected_tools": [],
  "suggested_hooks": [],
  "existing_settings": null
}' > "$state_file"
```

**Project Type Detection:**

- IDENTIFY primary programming languages
- DETECT build tools and package managers
- FIND test frameworks and linters
- CHECK for existing CI/CD configurations
- LOCATE database configurations or API specs

**Tool Detection:**

```bash
# Check for common development tools
tools_found=""
[ -f "package.json" ] && tools_found="$tools_found npm"
[ -f "deno.json" ] && tools_found="$tools_found deno"
[ -f "Cargo.toml" ] && tools_found="$tools_found cargo"
[ -f "go.mod" ] && tools_found="$tools_found go"
[ -f "pom.xml" -o -f "build.gradle" ] && tools_found="$tools_found java"
[ -f "requirements.txt" -o -f "Pipfile" ] && tools_found="$tools_found python"
```

STEP 2: Fetch latest Codex settings documentation

- USE WebFetch to get current settings options from docs.anthropic.com
- EXTRACT all available configuration options
- UNDERSTAND hook types and MCP server configurations

STEP 3: Interactive configuration gathering

PROMPT user for configuration preferences:

1. **Permission Mode**:
   - Strict: Explicit allow/deny lists
   - Permissive: Allow most operations
   - Custom: User-defined rules

2. **Hook Preferences**:
   - Auto-formatting on file edit
   - Git integration (auto-stage, commit helpers)
   - Test execution on code changes
   - Linting and validation
   - Custom command execution

3. **MCP Server Setup**:
   - Database connections (if detected)
   - API integrations
   - File system servers
   - Custom servers

STEP 4: Generate base configuration structure

CREATE initial settings object based on project analysis:

```json
{
  "$schema": "https://json.schemastore.org/claude-code-settings.json",
  "permissions": {
    "allow": [],
    "deny": [],
    "defaultMode": "ask"
  },
  "hooks": {},
  "env": {},
  "includeCoAuthoredBy": true
}
```

STEP 5: Add language-specific configurations

FOR EACH detected language, add appropriate settings:

**JavaScript/TypeScript Projects:**

```json
{
  "permissions": {
    "allow": [
      "Bash(npm run:*)",
      "Bash(npx:*)",
      "Bash(deno task:*)",
      "Read(**/*.js)",
      "Read(**/*.ts)",
      "Write(**/*.js)",
      "Write(**/*.ts)"
    ]
  },
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Write|Edit|MultiEdit",
        "hooks": [
          {
            "type": "command",
            "command": "npx prettier --write $FILE_PATH 2>/dev/null || true"
          }
        ]
      }
    ]
  }
}
```

**Go Projects:**

```json
{
  "permissions": {
    "allow": [
      "Bash(go test:*)",
      "Bash(go run:*)",
      "Bash(go build:*)",
      "Bash(go fmt:*)"
    ]
  },
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Write|Edit|MultiEdit",
        "hooks": [
          {
            "type": "command",
            "command": "[ \"${FILE_PATH##*.}\" = \"go\" ] && go fmt $FILE_PATH || true"
          }
        ]
      }
    ]
  }
}
```

**Rust Projects:**

```json
{
  "permissions": {
    "allow": [
      "Bash(cargo build:*)",
      "Bash(cargo test:*)",
      "Bash(cargo run:*)",
      "Bash(cargo fmt:*)"
    ]
  },
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Write|Edit|MultiEdit",
        "hooks": [
          {
            "type": "command",
            "command": "[ \"${FILE_PATH##*.}\" = \"rs\" ] && rustfmt $FILE_PATH || true"
          }
        ]
      }
    ]
  }
}
```

STEP 6: Add common hooks based on user preferences

**Git Auto-Stage Hook:**

```json
{
  "PostToolUse": [
    {
      "matcher": "Write|Edit|MultiEdit",
      "hooks": [
        {
          "type": "command",
          "command": "[ -d .git ] && git add $FILE_PATH 2>/dev/null || true"
        }
      ]
    }
  ]
}
```

**Command Logging Hook:**

```json
{
  "PreToolUse": [
    {
      "matcher": "Bash",
      "hooks": [
        {
          "type": "command",
          "command": "echo \"$(date): $TOOL_INPUT\" >> ~/.codex/command-log.txt"
        }
      ]
    }
  ]
}
```

**Notification Hook:**

```json
{
  "Stop": [
    {
      "matcher": "",
      "hooks": [
        {
          "type": "command",
          "command": "osascript -e 'display notification \"Codex task completed\" with title \"Codex\"' 2>/dev/null || notify-send \"Codex\" \"spawn_agent completed\" 2>/dev/null || true"
        }
      ]
    }
  ]
}
```

STEP 7: Configure environment variables

ADD useful environment variables based on project:

```json
{
  "env": {
    "CLAUDE_BASH_MAINTAIN_PROJECT_WORKING_DIR": "true",
    "NODE_ENV": "development",
    "RUST_BACKTRACE": "1",
    "GO111MODULE": "on"
  }
}
```

STEP 8: Add MCP server configurations if needed

IF databases or APIs detected:

```bash
# Suggest MCP server setup
echo "📡 MCP Server Suggestions:"
echo ""

# Check for database configurations
if fd "database.yml|db.json|.env" . -d 2 | grep -q .; then
  echo "Database configuration detected. Consider adding:"
  echo "  claude mcp add postgres-db postgresql://localhost/mydb"
fi

# Check for API specifications
if fd "openapi.yml|swagger.json|api.json" . -d 2 | grep -q .; then
  echo "API specification detected. Consider adding:"
  echo "  claude mcp add api-server http://localhost:3000"
fi
```

STEP 9: Write the configuration file

CREATE .claude directory and prepare to write settings:

```bash
# Set target path for project-specific settings
target_dir=".claude"
target_file=".codex/settings.json"
mkdir -p .claude

# Check for existing file
if [ -f "$target_file" ]; then
  echo "⚠️  Existing settings found at $target_file"
  echo "Options:"
  echo "  1) Backup and replace"
  echo "  2) Merge configurations"
  echo "  3) Cancel"
  # Handle user choice
  backup_file=".codex/settings.json.backup-$(date +%Y%m%d-%H%M%S)"
  cp "$target_file" "$backup_file"
  echo "📋 Backup created: $backup_file"
fi
```

WRITE the generated configuration with helpful comments:

```json
{
  "$schema": "https://json.schemastore.org/claude-code-settings.json",

  // Tool permissions - control what Codex can execute
  "permissions": {
    "allow": [
      // Language-specific tools
      "Bash(npm run:*)",
      "Bash(go test:*)",

      // File operations
      "Read(**/*.ts)",
      "Write(**/*.ts)",

      // Utility commands
      "Bash(jq:*)",
      "Bash(fd:*)"
    ],
    "deny": [
      // Dangerous operations
      "Bash(rm -rf:*)",
      "Bash(curl:*)",
      "Bash(wget:*)"
    ],
    "defaultMode": "ask"
  },

  // Hooks for automation
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Write|Edit|MultiEdit",
        "hooks": [
          {
            "type": "command",
            "command": "# Auto-format hook\n[ \"${FILE_PATH##*.}\" = \"ts\" ] && npx prettier --write $FILE_PATH || true"
          }
        ]
      }
    ]
  },

  // Environment variables
  "env": {
    "CLAUDE_BASH_MAINTAIN_PROJECT_WORKING_DIR": "true"
  },

  // Git co-authoring
  "includeCoAuthoredBy": true,

  // Cleanup period for transcripts
  "cleanupPeriodDays": 30
}
```

STEP 10: Provide usage guidance and next steps

```bash
echo "✅ Project-specific Codex settings generated successfully!"
echo ""
echo "📁 Configuration saved to: .codex/settings.json"
echo ""
echo "🚀 Next steps:"
echo "  1. Review and customize the settings file"
echo "  2. Test with: claude code (from project root)"
echo "  3. Add custom hooks as needed"
echo ""
echo "📚 Useful commands:"
echo "  - View settings: bat .codex/settings.json"
echo "  - Edit settings: $EDITOR .codex/settings.json"
echo "  - Validate JSON: jq . .codex/settings.json"
echo ""
echo "🔧 Hook customization:"
echo "  - Add formatting for other languages"
echo "  - Create project-specific automation"
echo "  - Set up notification preferences"
echo ""
echo "🌐 MCP server setup (project scope):"
echo "  - Add database servers: claude mcp add -s project <name> <command>"
echo "  - Configure API servers: claude mcp add -s project --transport http <name> <url>"
echo "  - List project servers: claude mcp list -s project"
```

FINALLY:

- SAVE session state for debugging
- SUGGEST testing the configuration
- PROVIDE troubleshooting tips if needed
- CLEAN UP temporary files

**Example Usage:**

```bash
# Generate settings for current project
/generate-project-claude-settings

# Generate with all hooks enabled
/generate-project-claude-settings --hooks all

# Generate with minimal permissions
/generate-project-claude-settings --minimal
```

**Configuration Examples:**

1. **Minimal Configuration** - Basic permissions only
2. **Developer Configuration** - Formatting and git hooks
3. **Team Configuration** - Standardized settings for sharing
4. **Advanced Configuration** - Custom hooks and MCP servers

The generated .codex/settings.json will be tailored to your project's specific needs, providing project-specific configurations while following Codex best practices.
