---
name: "jprompt_ultra_diff_review"
description: "Codex port of jprompt_ultra_diff_review"
metadata:
  short-description: "Claude command port"
---

<codex_skill_adapter>
## A. Skill Invocation
- This skill is invoked by mentioning `$jprompt_ultra_diff_review`.
- Treat all user text after `$jprompt_ultra_diff_review` as `{{SC_ARGS}}`.
- If no arguments are present, treat `{{SC_ARGS}}` as empty.

## B. Claude Command Translation
- This skill is a Codex-native port of the Claude command tree and SuperClaude framework.
- Translate Claude `spawn_agent(...)` patterns to Codex `spawn_agent(...)`.
- Translate Claude planning/checklist language to Codex `update_plan`.
- Prefer existing Codex MCP servers from `config.toml` when the original command mentions MCP.

## C. Compatibility Notes
- Original command: `jprompt_ultra_diff_review`.
- Codex invocation: `$jprompt_ultra_diff_review`.
- Preserve the behavioral intent of the source command, but use Codex-native tools and collaboration primitives.
</codex_skill_adapter>

# Ultra Diff Review
> Execute each task in the order given to conduct a thorough code review.

## spawn_agent 1: Create diff.txt

Create a new file called diff.md.

At the top of the file, add the following markdown:

```md
# Code Review
- Review the diff, report on issues, bugs, and improvements. 
- End with a concise markdown table of any issues found, their solutions, and a risk assessment for each issue if applicable.
- Use emojis to convey the severity of each issue.

## Diff

```

## spawn_agent 2: git diff and append

Then run git diff and append the output to the file.

## spawn_agent 3: just-prompt multi-llm tool call

Then use that file as the input to this just-prompt tool call.

prompts_from_file_to_file(
    from_file = diff.md,
    models = "openai:o3-mini, anthropic:claude-3-7-sonnet-20250219:4k, gemini:gemini-2.0-flash-thinking-exp"
    output_dir = ultra_diff_review/
)

## spawn_agent 4: Read the output files and synthesize

Then read the output files and think hard to synthesize the results into a new single file called `ultra_diff_review/fusion_ultra_diff_review.md` following the original instructions plus any additional instructions or callouts you think are needed to create the best possible review.

## spawn_agent 5: Present the results

Then let me know which issues you think are worth resolving and we'll proceed from there.
