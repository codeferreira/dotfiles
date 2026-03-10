---
name: "workflow-start-start"
description: "Intelligent workflow orchestration with state management, error recovery, and sub-agent coordination"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$workflow-start-start`.
- Treat all user text after `$workflow-start-start` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `workflow:start:start`.
- Codex invocation: `$workflow-start-start`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

## Context

- Target task: {{SC_ARGS}}

## Your spawn_agent

STEP 1: Initialize intelligent workflow session and analyze project state

- CREATE session state file: `/tmp/start-session-$SESSION_ID.json`
- ANALYZE current project state from Context section
- DETERMINE workflow complexity (simple task vs. complex feature implementation)
- VALIDATE environment and dependencies

```bash
# Initialize workflow session state
echo '{
  "sessionId": "'$SESSION_ID'",
  "targetspawn_agent": "'{{SC_ARGS}}'",
  "state": "initializing",
  "startTime": "'$(gdate -Iseconds 2>/dev/null || date -Iseconds)'",
  "checkpoints": [],
  "filesModified": [],
  "commitsCreated": 0,
  "testsStatus": "unknown",
  "priority": "auto-detect",
  "blockers": []
}' > /tmp/start-session-$SESSION_ID.json
```

STEP 2: Intelligent task selection and priority analysis

CASE task_specification:
WHEN "user_specified":

- PARSE {{SC_ARGS}} for specific task details
- VALIDATE task exists in update_plan system
- UPDATE session state with task details

WHEN "auto_select":

IF available_todos > 0:

LAUNCH parallel sub-agents for comprehensive task analysis:

- **Agent 1: Priority Analysis**: Analyze all pending todos for priority, dependencies, and effort estimation
  - Focus: spawn_agent dependencies, blocking relationships, effort vs. impact scoring
  - Tools: TodoRead for task analysis, project file analysis for context
  - Output: Prioritized task list with detailed scoring and reasoning

- **Agent 2: Environment Assessment**: Evaluate current project state and readiness for work
  - Focus: Git status, test state, dependency health, development environment
  - Tools: git commands, project-specific build tools, test runners
  - Output: Environment readiness report with any setup requirements

- **Agent 3: Code Analysis**: Analyze codebase for related work and potential conflicts
  - Focus: Recent changes, related files, potential merge conflicts, ongoing work
  - Tools: Grep, git log analysis, file dependency mapping
  - Output: Code context report with conflict warnings and related work identification

ELSE:

- EXECUTE intelligent project discovery to identify potential tasks
- CREATE new todo items based on code analysis findings
- SUGGEST task creation workflow

STEP 3: Pre-work setup with checkpoint creation

TRY:

**Environment Validation and Setup:**

```bash
# Validate clean working state
echo "🔍 Validating development environment..."

# Check for uncommitted changes
uncommitted_files=$(git diff --name-only HEAD 2>/dev/null | wc -l | tr -d ' ')
if [ "$uncommitted_files" -gt 0 ]; then
  echo "⚠️ Found $uncommitted_files uncommitted files"
  echo "📋 Uncommitted files:"
  git diff --name-only HEAD | head -5
  echo "💾 Creating pre-work checkpoint..."
  git stash push -m "Pre-work checkpoint for session $SESSION_ID"
fi

# Validate test state
echo "🧪 Checking current test status..."
if command -v deno >/dev/null && [ -f "deno.json" ]; then
  deno task test >/tmp/pre-work-tests-$SESSION_ID.log 2>&1
  test_exit_code=$?
elif command -v cargo >/dev/null && [ -f "Cargo.toml" ]; then
  cargo test >/tmp/pre-work-tests-$SESSION_ID.log 2>&1
  test_exit_code=$?
elif command -v go >/dev/null && [ -f "go.mod" ]; then
  go test ./... >/tmp/pre-work-tests-$SESSION_ID.log 2>&1
  test_exit_code=$?
else
  echo "No recognized test framework found"
  test_exit_code=0
fi

# Update session state with test results
jq --arg status "$([ $test_exit_code -eq 0 ] && echo 'passing' || echo 'failing')" \
   '.testsStatus = $status | .state = "setup_complete"' \
   /tmp/start-session-$SESSION_ID.json > /tmp/start-session-$SESSION_ID.tmp && \
mv /tmp/start-session-$SESSION_ID.tmp /tmp/start-session-$SESSION_ID.json
```

**update_plan Integration and spawn_agent Activation:**

```bash
# Load and activate selected task
selected_task="{{SC_ARGS}}"
if [ -z "$selected_task" ]; then
  # Auto-select highest priority task from TodoRead
  TodoRead
  # Parse TodoRead output to get highest priority pending task
  # This would be implemented based on TodoRead output format
fi

# Mark task as in-progress
update_plan --update-task "$selected_task" --status "in_progress" --session-id "$SESSION_ID"

# Create progress subtasks for complex work
if [[ "$selected_task" == *"implement"* ]] || [[ "$selected_task" == *"add"* ]]; then
  update_plan --create-subtask "$selected_task" "Planning and design" --priority "high"
  update_plan --create-subtask "$selected_task" "Implementation" --priority "high"
  update_plan --create-subtask "$selected_task" "Testing and validation" --priority "high"
  update_plan --create-subtask "$selected_task" "Documentation" --priority "medium"
fi
```

CATCH (environment_setup_failed):

- LOG error details to session state
- PROVIDE specific remediation steps
- AWAIT user intervention before proceeding

```bash
echo "❌ Environment setup failed. Check:"
echo "  1. Git repository status and conflicts"
echo "  2. Test suite failures requiring attention"
echo "  3. Missing dependencies or build tools"
echo "  4. Configuration issues"
echo "📊 Session state saved: /tmp/start-session-$SESSION_ID.json"
echo "🔄 Run /start again after resolving issues"
```

STEP 4: Intelligent execution with incremental progress and state management

CASE task_complexity:
WHEN "simple_change":

**Direct Implementation with Continuous Validation:**

```bash
# Execute focused implementation workflow
echo "⚡ Executing simple task with direct implementation..."

# 1. Analyze files to modify
# 2. Make incremental changes with validation
# 3. Run tests after each significant change
# 4. Update progress in update_plan and session state
```

WHEN "complex_feature":

**Multi-Phase Implementation with Sub-Agent Coordination:**

LAUNCH parallel sub-agents for comprehensive feature implementation:

- **Agent 1: Planning & Architecture**: Design implementation approach and identify required changes
  - Focus: Code architecture, file organization, integration points, testing strategy
  - Tools: Read, Grep, Glob for codebase analysis, architectural pattern identification
  - Output: Implementation plan with file modifications, testing requirements, integration steps

- **Agent 2: Core Implementation**: Execute primary code changes based on planning agent output
  - Focus: Main functionality implementation, following established patterns
  - Tools: Edit, MultiEdit for code changes, maintaining existing code style
  - Output: Core feature implementation with proper error handling

- **Agent 3: Testing Implementation**: Create comprehensive tests for new functionality
  - Focus: Unit tests, integration tests, edge case coverage
  - Tools: Write, Edit for test file creation, following project testing patterns
  - Output: Complete test suite for new functionality

- **Agent 4: Documentation & Integration**: Update documentation and ensure proper integration
  - Focus: API documentation, README updates, configuration changes
  - Tools: Edit for documentation files, ensuring consistency
  - Output: Updated documentation and integration verification

**Sub-Agent Coordination and Progress Tracking:**

```bash
# Each phase reports to session state
echo "🚀 Launching multi-agent feature implementation..."
echo "📊 Progress tracking: /tmp/start-session-$SESSION_ID.json"
echo "🔄 Coordination through session state and update_plan"
```

STEP 5: Continuous validation and checkpoint management

**Incremental Testing and Validation:**

```bash
# After each significant change, validate progress
validate_progress() {
  echo "🔍 Validating progress for session $SESSION_ID..."
  
  # Run relevant tests
  if command -v deno >/dev/null && [ -f "deno.json" ]; then
    deno task test --filter="$(echo $selected_task | head -c 20)" 2>/tmp/validation-$SESSION_ID.log
  elif command -v cargo >/dev/null && [ -f "Cargo.toml" ]; then
    cargo test 2>/tmp/validation-$SESSION_ID.log
  elif command -v npm >/dev/null && [ -f "package.json" ]; then
    npm test 2>/tmp/validation-$SESSION_ID.log
  fi
  
  validation_status=$?
  
  # Update session state with validation results
  jq --arg status "$([ $validation_status -eq 0 ] && echo 'passing' || echo 'failing')" \
     --arg timestamp "$(gdate -Iseconds 2>/dev/null || date -Iseconds)" \
     '.lastValidation = {"timestamp": $timestamp, "status": $status} | .checkpoints += [$timestamp]' \
     /tmp/start-session-$SESSION_ID.json > /tmp/start-session-$SESSION_ID.tmp && \
  mv /tmp/start-session-$SESSION_ID.tmp /tmp/start-session-$SESSION_ID.json
  
  return $validation_status
}
```

**Progress Checkpointing:**

```bash
# Create checkpoint after major milestones
create_checkpoint() {
  local checkpoint_name="$1"
  echo "💾 Creating checkpoint: $checkpoint_name"
  
  # Git checkpoint
  git add -A
  git commit -m "checkpoint($SESSION_ID): $checkpoint_name" || true
  
  # Update session state
  jq --arg checkpoint "$checkpoint_name" \
     --arg timestamp "$(gdate -Iseconds 2>/dev/null || date -Iseconds)" \
     '.checkpoints += [{"name": $checkpoint, "timestamp": $timestamp}]' \
     /tmp/start-session-$SESSION_ID.json > /tmp/start-session-$SESSION_ID.tmp && \
  mv /tmp/start-session-$SESSION_ID.tmp /tmp/start-session-$SESSION_ID.json
  
  # Update update_plan with progress
  update_plan --update-task "$selected_task" --progress "checkpoint: $checkpoint_name"
}
```

STEP 6: Error handling and recovery mechanisms

TRY:

**Execution Monitoring:**

```bash
# Monitor execution and handle errors gracefully
while [ "$(jq -r '.state' /tmp/start-session-$SESSION_ID.json)" != "completed" ]; do
  current_state=$(jq -r '.state' /tmp/start-session-$SESSION_ID.json)
  
  case "$current_state" in
    "executing")
      # Continue with current implementation
      validate_progress
      if [ $? -ne 0 ]; then
        echo "⚠️ Validation failed, entering error recovery mode"
        jq '.state = "error_recovery"' /tmp/start-session-$SESSION_ID.json > /tmp/start-session-$SESSION_ID.tmp && \
        mv /tmp/start-session-$SESSION_ID.tmp /tmp/start-session-$SESSION_ID.json
      fi
      ;;
    "error_recovery")
      echo "🔧 Entering error recovery mode..."
      # Attempt automated recovery or await user intervention
      break
      ;;
  esac
done
```

CATCH (test_failure):

- SAVE current progress to checkpoint
- ANALYZE test failures for root cause
- PROVIDE specific remediation guidance
- AWAIT user decision on how to proceed

```bash
echo "❌ Test failures detected during task execution"
echo "📊 Session: $SESSION_ID"
echo "💾 Progress saved to checkpoint"
echo "📋 Test results: /tmp/validation-$SESSION_ID.log"
echo "🔄 Options:"
echo "  1. Fix failing tests and resume: /start --resume $SESSION_ID"
echo "  2. Rollback to last checkpoint: /start --rollback $SESSION_ID"
echo "  3. Debug test failures manually"
```

CATCH (git_conflict):

- CREATE conflict resolution checkpoint
- ATTEMPT automated merge resolution
- IF failed: PROVIDE conflict resolution guidance

```bash
echo "⚠️ Git conflicts detected"
echo "📊 Session: $SESSION_ID"
echo "🔧 Attempting automated resolution..."
git status --porcelain | grep "^UU" | while read -r conflict_file; do
  echo "  Conflict in: $conflict_file"
done
echo "🔄 Manual resolution required if automation fails"
```

STEP 7: Completion workflow with comprehensive cleanup

**Final Validation and Commit:**

```bash
# Execute final validation before completion
final_validation() {
  echo "🏁 Executing final validation for task completion..."
  
  # Run full test suite
  echo "🧪 Running full test suite..."
  if command -v deno >/dev/null && [ -f "deno.json" ]; then
    deno task test
  elif command -v cargo >/dev/null && [ -f "Cargo.toml" ]; then
    cargo test
  elif command -v go >/dev/null && [ -f "go.mod" ]; then
    go test ./...
  elif command -v npm >/dev/null && [ -f "package.json" ]; then
    npm test
  fi
  
  if [ $? -eq 0 ]; then
    echo "✅ All tests passing"
  else
    echo "❌ Test failures prevent task completion"
    return 1
  fi
  
  # Run linting if available
  if command -v deno >/dev/null && [ -f "deno.json" ]; then
    deno task lint && deno task fmt
  elif command -v cargo >/dev/null && [ -f "Cargo.toml" ]; then
    cargo clippy && cargo fmt
  fi
  
  echo "✅ Final validation complete"
  return 0
}
```

**spawn_agent Completion and State Cleanup:**

```bash
# Complete task and update all tracking systems
complete_task() {
  echo "🎉 Completing task: $selected_task"
  
  # Create final commit
  git add -A
  git commit -m "feat($SESSION_ID): complete $selected_task
  
- Implemented core functionality
- Added comprehensive tests
- Updated documentation
- All validation checks passing
  
Session: $SESSION_ID"
  
  # Update update_plan
  update_plan --complete-task "$selected_task" --session-id "$SESSION_ID"
  
  # Update session state
  jq --arg timestamp "$(gdate -Iseconds 2>/dev/null || date -Iseconds)" \
     '.state = "completed" | .completedAt = $timestamp | .commitsCreated += 1' \
     /tmp/start-session-$SESSION_ID.json > /tmp/start-session-$SESSION_ID.tmp && \
  mv /tmp/start-session-$SESSION_ID.tmp /tmp/start-session-$SESSION_ID.json
  
  echo "✅ spawn_agent completed successfully"
}
```

STEP 8: Next task suggestion and workflow continuation

**Intelligent Next spawn_agent Analysis:**

```bash
# Analyze project state and suggest next high-priority task
suggest_next_task() {
  echo "🎯 Analyzing next high-priority tasks..."
  
  # Load current todos and analyze dependencies
  TodoRead
  
  # Suggest logical next task based on:
  # 1. spawn_agents unblocked by current completion
  # 2. Related functionality expansion
  # 3. Critical path dependencies
  
  echo "💡 Suggested next tasks:"
  # This would integrate with TodoRead output to suggest specific tasks
  echo "  - Run '/start' for auto-selected next task"
  echo "  - Use TodoRead to review all available tasks"
}
```

FINALLY:

- SAVE session state for potential resume operations
- PROVIDE comprehensive completion summary
- SUGGEST workflow continuation options

**Workflow Session Summary:**

```bash
echo "✅ Workflow session completed successfully"
echo "📊 Session: $SESSION_ID"
echo "🎯 spawn_agent: $selected_task"
echo "⏱️ Duration: $(jq -r '.completedAt' /tmp/start-session-$SESSION_ID.json | xargs -I {} bash -c 'echo $(( $(gdate -d {} +%s) - $(gdate -d "$(jq -r .startTime /tmp/start-session-$SESSION_ID.json)" +%s) ))') seconds"
echo "📁 Files modified: $(jq -r '.filesModified | length' /tmp/start-session-$SESSION_ID.json)"
echo "🏆 Commits created: $(jq -r '.commitsCreated' /tmp/start-session-$SESSION_ID.json)"
echo "🧪 Final test status: $(jq -r '.testsStatus' /tmp/start-session-$SESSION_ID.json)"
echo "💾 Session data: /tmp/start-session-$SESSION_ID.json"
echo ""
echo "🚀 Ready for next task - run '/start' to continue development workflow"
```

## Session Management Commands

**Resume Interrupted Session:**

```bash
/start --resume SESSION_ID
```

**Rollback to Checkpoint:**

```bash
/start --rollback SESSION_ID CHECKPOINT_NAME
```

**Session Status Check:**

```bash
/start --status SESSION_ID
```

This intelligent workflow orchestration command provides deterministic execution, comprehensive state management, error recovery capabilities, and seamless integration with update_plan for robust development workflow automation.
