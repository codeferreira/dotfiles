---
name: "tool-cpr"
description: "Create commit, push, and open pull request"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$tool-cpr`.
- Treat all user text after `$tool-cpr` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `tool:cpr`.
- Codex invocation: `$tool-cpr`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

## Context


## Your task

PROCEDURE create_commit_push_pr():

STEP 1: Analyze current state

- IF no staged changes:
  - Stage appropriate files: git add <files>
- ELSE:

STEP 2: Create commit

- IF {{SC_ARGS}} provided:
  - Use as commit message
- ELSE:
  - Generate conventional commit message
- Execute: git commit -m "$(cat <<'EOF'
  [Generated or provided message]
  EOF
  )"

STEP 3: Push to remote

- IF no upstream branch:
  - Push with upstream: git push -u origin [branch-name]
- ELSE:
  - Push normally: git push

STEP 4: Create pull request

- Base branch: Determine from git config or default to main
- Generate PR title from commit message
- Create PR: gh pr create --title "[title]" --body "$(cat <<'EOF'

## Summary

[Brief description of changes]

## Changes

- [Key change 1]
- [Key change 2]

## Test Plan

- [ ] Tests pass
- [ ] Manual testing completed
      EOF
      )"

STEP 5: Return result

- Display PR URL
- Provide next steps if needed
