---
name: "git-commit-commit"
description: "Create a git commit"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$git-commit-commit`.
- Treat all user text after `$git-commit-commit` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `git:commit:commit`.
- Codex invocation: `$git-commit-commit`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

## Context


## Your task

Generate a conventional commit message following https://www.conventionalcommits.org/en/v1.0.0/ specification and create the commit automatically.

STEP 1: Analyze current git state and changes

- EXAMINE output from Context section for current status
- DETERMINE if there are staged changes ready for commit
- IF no staged changes found:
  - IDENTIFY unstaged changes that should be committed
  - STAGE appropriate files using `git add`
- VALIDATE that commit is appropriate (not empty, not work-in-progress)

STEP 2: Determine conventional commit type and scope

- ANALYZE the nature of changes from git diff output
- CATEGORIZE changes using conventional commit types:
  - `feat`: New feature or functionality
  - `fix`: Bug fix or issue resolution
  - `docs`: Documentation changes only
  - `style`: Code style changes (formatting, missing semicolons, etc.)
  - `refactor`: Code changes that neither fix bugs nor add features
  - `test`: Adding or modifying tests
  - `chore`: Maintenance tasks (dependencies, build tools, etc.)
  - `ci`: Continuous integration changes
  - `perf`: Performance improvements
  - `revert`: Revert previous commits

- IDENTIFY scope if applicable:
  - Component, module, or functional area affected
  - Examples: `auth`, `api`, `ui`, `core`, `config`

STEP 3: Compose conventional commit message

- WRITE concise subject line (≤50 characters):
  - Format: `type(scope): description`
  - Use imperative mood ("add" not "added" or "adds")
  - Start with lowercase letter
  - No period at the end

- IF change is complex:
  - ADD detailed body (wrap at 72 characters)
  - EXPLAIN the "why" behind the change
  - SEPARATE body from subject with blank line

- IF breaking change:
  - ADD footer: `BREAKING CHANGE: description`
  - EXPLAIN the impact and migration path

STEP 4: Create the commit

TRY:

- EXECUTE `git commit` with generated message
- USE heredoc for multi-line messages to ensure proper formatting
- VERIFY commit creation success

CATCH (commit_failed):

- ANALYZE error message
- PROVIDE guidance on resolution
- SUGGEST alternative approaches

STEP 5: Validate commit result

- CONFIRM commit was created successfully
- DISPLAY commit hash and message
- PROVIDE summary of what was committed

Example formats:

- `feat(auth): add OAuth2 login support`
- `fix(api): resolve null pointer in user endpoint`
- `docs: update installation instructions`
- `chore(deps): bump lodash to 4.17.21`
- `refactor(core): extract user validation logic`
