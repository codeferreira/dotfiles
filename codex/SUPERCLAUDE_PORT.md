# SuperClaude Port For Codex

This repo ports the Claude-side command and agent setup into Codex-native primitives.

## What maps to what

- Claude commands under `claude/.claude/commands/` become Codex skills under `codex/.codex/skills/`
- Claude agent/persona prompts under `claude/.claude/commands/agent/` become Codex agents under `codex/.codex/agents/`
- Claude MCP intent is registered in Codex via `codex/.codex/config.toml`

## Invocation style

Codex uses skill invocation, not Claude slash commands.

Examples:

- `/sc:analyze` -> `$sc-analyze`
- `/sc:research` -> `$sc-research`
- `git:pr:pr-review` -> `$git-pr-pr-review`

## MCP

The main gateway is configured as:

- `airis` -> `http://localhost:9400/sse`

Supporting MCP servers are also registered directly in Codex:

- `context7`
- `git`
- `playwright`
- `puppeteer`
- `sequential-thinking`

## Regeneration

When the Claude-side command or agent source changes, regenerate the Codex port with:

```bash
python3 codex/scripts/port_superclaude.py
```

The generator updates:

- generated skills
- generated `sc-*` agents
- the generated SuperClaude agent block in `codex/.codex/config.toml`

## Notes

- Existing GSD Codex skills are left in place.
- The generated port is Codex-style compatibility, not a literal 1:1 slash-command clone.
- Restart Codex after changes so newly added skills and agent registrations are picked up.
