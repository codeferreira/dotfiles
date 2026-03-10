---
name: "docs-manage-docs-init"
description: "Initialize Docusaurus documentation site with Deno lifecycle integration"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$docs-manage-docs-init`.
- Treat all user text after `$docs-manage-docs-init` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `docs:manage:docs-init`.
- Codex invocation: `$docs-manage-docs-init`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

## Context

- Target: {{SC_ARGS}}

## Your task

Initialize a Docusaurus documentation site in the `/docs` folder with automatic integration into the project's Deno task lifecycle.

STEP 1: Initialize session state and validate prerequisites

- CREATE session state file: `/tmp/docs-init-state-$SESSION_ID.json`
- SET initial state:
  ```json
  {
    "sessionId": "$SESSION_ID",
    "timestamp": "ISO_8601_TIMESTAMP",
    "phase": "validation",
    "project_name": "auto-detect",
    "docs_status": "unknown",
    "prerequisites": {
      "node_available": false,
      "npm_available": false,
      "git_repo": false,
      "deno_json": false
    },
    "initialization_plan": {},
    "created_files": [],
    "errors": []
  }
  ```

TRY:

- VALIDATE Node.js availability (required for Docusaurus)
- VALIDATE npm package manager availability
- DETECT project name from {{SC_ARGS}}, deno.json, or directory name
- CHECK existing docs folder and prompt if overwrite needed

CATCH (prerequisites_failed):

- LOG missing prerequisites to state file
- PROVIDE installation instructions for missing tools
- EXIT with clear error message and recovery steps

STEP 2: Determine project configuration and docs strategy

CASE docs_folder_status:
WHEN "not found":

- SET strategy = "create_new"
- PLAN full Docusaurus initialization

WHEN "exists" AND empty:

- SET strategy = "initialize_existing"
- PLAN Docusaurus setup in existing folder

WHEN "exists" AND contains_files:

IF {{SC_ARGS}} contains "force":

- SET strategy = "overwrite"
- BACKUP existing docs to `/docs-backup-$SESSION_ID/`

ELSE:

- PROMPT user for confirmation
- AWAIT user decision (overwrite/cancel/merge)

STEP 3: Execute Docusaurus initialization

TRY:

CASE strategy:
WHEN "create_new" OR "initialize_existing":

- CREATE docs directory if needed
- EXECUTE: `cd docs && npx create-docusaurus@latest . classic --typescript`
- CONFIGURE docusaurus.config.ts with detected project information
- CLEAN UP default tutorial content
- CREATE project-specific documentation structure

WHEN "overwrite":

- BACKUP existing docs folder
- EXECUTE clean initialization
- RESTORE any custom content from backup if requested

STEP 4: Configure Deno lifecycle integration

TRY:

IF deno.json exists:

- READ current deno.json configuration
- ADD docs tasks to existing task list:
  ```json
  {
    "docs": "cd docs && npm run start",
    "docs:build": "cd docs && npm run build",
    "docs:serve": "cd docs && npm run serve"
  }
  ```
- PRESERVE existing tasks and configuration

ELSE:

- CREATE new deno.json with docs tasks
- INCLUDE basic project structure for Deno integration

STEP 5: Customize Docusaurus configuration

- EDIT docusaurus.config.ts with project-specific settings:
  - Project name from detection or {{SC_ARGS}}
  - GitHub repository URLs if git remote detected
  - Tagline from README.md if available
  - Mermaid diagram support (enabled by default)
- CONFIGURE sidebar.js for project structure
- CREATE initial docs/intro.md with project overview
- SET UP API documentation placeholder structure

STEP 6: Generate project-specific content

CASE project_type_detected:
WHEN "deno":

- CREATE Deno-specific documentation sections
- INCLUDE JSR publishing guides
- ADD TypeScript configuration examples

WHEN "go":

- CREATE Go module documentation structure
- INCLUDE package documentation integration
- ADD API reference structure for REST/gRPC

WHEN "rust":

- CREATE Rust crate documentation structure
- INCLUDE cargo doc integration
- ADD performance and safety documentation

WHEN "java":

- CREATE Java project documentation structure
- INCLUDE Spring Boot/Quarkus patterns
- ADD OpenAPI integration examples

WHEN "generic":

- CREATE standard documentation structure
- INCLUDE basic getting started guide
- ADD general project documentation templates

STEP 7: Finalize setup and validation

TRY:

- INSTALL npm dependencies: `cd docs && npm install`
- VALIDATE Docusaurus builds successfully: `cd docs && npm run build`
- CREATE .gitignore for docs build artifacts
- UPDATE session state with completion status

CATCH (build_failed):

- LOG build errors to state file
- ATTEMPT dependency resolution
- PROVIDE manual fix instructions
- SAVE partial configuration for recovery

FINALLY:

- UPDATE session state with final status
- CREATE setup summary: `/tmp/docs-init-summary-$SESSION_ID.md`
- PROVIDE next steps and usage instructions
- CLEAN UP temporary session files

## Post-Installation Instructions

After successful initialization:

1. **Start documentation server**: `deno task docs`
2. **Build for production**: `deno task docs:build`
3. **Add new content**: Use `/docs-add` command
4. **Update existing docs**: Use `/docs-update` command

## State Management

- Session state tracked in `/tmp/docs-init-state-$SESSION_ID.json`
- Checkpoint after each major step
- Recovery capability from any checkpoint
- Error logging with specific failure points and recovery instructions
