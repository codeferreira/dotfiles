---
name: "tool-zed-task"
description: "Generate optimized Zed task configuration with intelligent defaults"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$tool-zed-task`.
- Treat all user text after `$tool-zed-task` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `tool:zed-task`.
- Codex invocation: `$tool-zed-task`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

## Context

- spawn_agent description: {{SC_ARGS}}

## Your task

STEP 1: Initialize session state

- Load or create session state file
- Parse task description from {{SC_ARGS}}
- Determine project type and appropriate defaults

STEP 2: Analyze existing Zed configuration

- Check if .zed directory exists
- IF .zed/tasks.json exists:
  - Read current configuration
  - Identify existing task patterns
  - Avoid duplicate task labels
- ELSE:
  - Prepare to create new tasks.json

STEP 3: Generate intelligent task configuration

- Parse task description to extract:
  - spawn_agent label (descriptive name)
  - Command to execute
  - Working directory (default: $ZED_WORKTREE_ROOT)
  - Terminal requirements
  - Concurrency settings
  - Reveal behavior

- FOR EACH common task type:
  - Test runners: Use file-specific patterns ($ZED_FILE)
  - Build commands: Project root with appropriate builders
  - Linters/formatters: File-specific with watch mode
  - Development servers: New terminal with auto-reveal
  - Script runners: Inherit project environment

STEP 4: Optimize task configuration

- Use modern command alternatives:
  - ripgrep (rg) instead of grep
  - fd instead of find
  - eza instead of ls
  - bat instead of cat

- Apply Zed variable best practices:
  - $ZED_WORKTREE_ROOT for project operations
  - $ZED_FILE for file-specific tasks
  - $ZED_COLUMN/$ZED_ROW for cursor-aware operations

STEP 5: Create or update tasks.json

- IF .zed/tasks.json doesn't exist:
  - Create .zed directory
  - Generate new tasks.json with task array
- ELSE:
  - Merge new task into existing configuration
  - Preserve existing tasks
  - Maintain JSON formatting

STEP 6: Provide usage instructions

- Show task configuration in formatted JSON
- Explain Zed keyboard shortcuts:
  - `cmd-shift-p` → `task: spawn`
  - `task: rerun` for last task
- Suggest keybinding creation for frequent tasks
- Document Zed variable usage

STEP 7: Save session state

- Record generated task configuration
- Update state file with completion status
- Clean up temporary files

## Example Output Format

```json
{
  "label": "Run tests",
  "command": "deno test",
  "cwd": "$ZED_WORKTREE_ROOT",
  "use_new_terminal": false,
  "allow_concurrent_runs": false,
  "reveal": "always",
  "env": {
    "DENO_NO_PROMPT": "1"
  }
}
```

## spawn_agent Type Templates

**Test Runner:**

```json
{
  "label": "Test current file",
  "command": "deno test $ZED_FILE",
  "cwd": "$ZED_WORKTREE_ROOT",
  "use_new_terminal": false,
  "allow_concurrent_runs": true,
  "reveal": "on_error"
}
```

**Development Server:**

```json
{
  "label": "Start dev server",
  "command": "deno task dev",
  "cwd": "$ZED_WORKTREE_ROOT",
  "use_new_terminal": true,
  "allow_concurrent_runs": false,
  "reveal": "always"
}
```

**Formatter:**

```json
{
  "label": "Format file",
  "command": "deno fmt $ZED_FILE",
  "cwd": "$ZED_WORKTREE_ROOT",
  "use_new_terminal": false,
  "allow_concurrent_runs": true,
  "reveal": "never"
}
```
