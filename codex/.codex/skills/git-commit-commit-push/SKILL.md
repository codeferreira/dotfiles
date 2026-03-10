---
name: "git-commit-commit-push"
description: "Create a git commit and push to remote"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$git-commit-commit-push`.
- Treat all user text after `$git-commit-commit-push` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `git:commit:commit-push`.
- Codex invocation: `$git-commit-commit-push`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

## Context


## Your task

PROCEDURE git_commit_and_push():

STEP 1: Initialize commit session state

- CREATE session state file: `/tmp/commit-push-state-$SESSION_ID.json`
- SET initial state:
  ```json
  {
    "sessionId": "$SESSION_ID",
    "phase": "analyzing",
    "branch": "auto-detect",
    "hasUpstream": false,
    "changesAnalyzed": false,
    "commitCreated": false,
    "pushCompleted": false,
    "errors": []
  }
  ```

STEP 2: Analyze repository state and changes

TRY:

- ANALYZE current git changes from Context section
- IDENTIFY change patterns and affected areas
- DETERMINE appropriate commit type based on changes:
  - **feat**: New feature addition
  - **fix**: Bug fixes and corrections
  - **docs**: Documentation updates
  - **style**: Code formatting, whitespace, missing semicolons
  - **refactor**: Code restructuring without functionality changes
  - **test**: Adding or updating tests
  - **chore**: Build process, dependencies, configuration changes
  - **perf**: Performance improvements
  - **ci**: CI/CD configuration changes

- UPDATE state: `phase: "message_generation"`

CATCH (analysis_failed):

- LOG error to state file
- PROVIDE manual analysis guidance
- EXIT with error status

STEP 3: Generate conventional commit message

- CONSTRUCT commit message following conventional commits specification:
  - FORMAT: `type(scope): description`
  - DESCRIPTION: Imperative mood, ≤50 characters
  - SCOPE: Component/module affected (optional but recommended)

- FOR complex changes:
  - ADD detailed body (wrap at 72 characters)
  - INCLUDE breaking change footer if applicable

- VALIDATE message format and content quality
- UPDATE state: `phase: "committing"`

**Conventional Commit Examples:**

- `feat(auth): add OAuth2 login support`
- `fix(api): resolve null pointer in user endpoint`
- `docs: update installation instructions`
- `chore(deps): bump lodash to 4.17.21`
- `refactor(components): extract shared utility functions`

STEP 4: Create commit with generated message

TRY:

- EXECUTE commit with generated conventional message
- VERIFY commit creation success
- UPDATE state: `commitCreated: true, phase: "pushing"`

CATCH (commit_failed):

- LOG commit error details to state
- PROVIDE troubleshooting guidance
- EXIT with commit failure status

STEP 5: Determine push strategy and execute

CASE upstream_status:

WHEN "No upstream branch":

- EXECUTE: `git push -u origin $CURRENT_BRANCH`
- SET upstream tracking for future pushes
- UPDATE state: `hasUpstream: true`

WHEN upstream exists:

- EXECUTE: `git push`
- HANDLE push conflicts if they occur

TRY:

- PERFORM push operation based on upstream status
- CAPTURE push result and any output

CATCH (push_failed):

CASE error_type:

WHEN "diverged_branches":

- INFORM: "Branch has diverged. Run `git pull` first, then retry commit-push"
- PROVIDE: Conflict resolution guidance
- SAVE state for manual resolution

WHEN "protected_branch":

- SUGGEST: "Branch is protected. Consider creating a PR instead"
- PROVIDE: `gh pr create` command example
- SAVE commit for PR workflow

WHEN "no_remote_access":

- INFORM: "No push access to remote repository"
- PROVIDE: Permission troubleshooting steps
- SAVE commit locally

OTHERWISE:

- LOG: Generic push error details
- PROVIDE: Manual push guidance
- SAVE troubleshooting state

STEP 6: Report completion status and provide context

IF push_completed:

- DISPLAY: "✅ Commit created and pushed successfully"
- SHOW: Commit hash and message
- PROVIDE: Remote repository links if available
- UPDATE state: `pushCompleted: true, phase: "completed"`

ELSE:

- DISPLAY: "⚠️ Commit created but push failed"
- SHOW: Commit details and error explanation
- PROVIDE: Next steps for manual resolution

FINALLY:

- SAVE final session state to `/tmp/commit-push-state-$SESSION_ID.json`
- PROVIDE session summary with all actions taken
- CLEAN UP temporary files if successful
