# Claude Hooks

This directory contains global hook scripts for Claude Code that can be enabled in individual projects.

## Available Hooks

### use-npm.js
- **Purpose**: Enforces npm usage by blocking yarn, pnpm, and pnpx commands
- **Action**: Suggests npm/npx equivalents when other package managers are detected
- **Logging**: Records blocked attempts to `npm_enforcement.json`

## How to Enable Hooks in Projects

To enable a hook in a specific project, add it to your local `.claude/settings.json`:

```json
{
  "hooks": {
    "user-prompt-submit": "~/.claude/hooks/use-npm.js"
  }
}
```

## Hook Types

- `user-prompt-submit`: Runs before executing user commands
- `tool-call`: Runs before tool execution
- `response-generate`: Runs after response generation

## Creating New Hooks

Hook scripts should:
1. Be executable (`chmod +x`)
2. Read JSON input from stdin
3. Exit with code 0 (allow) or 2 (block with correction)
4. Print error messages to stderr for Claude to see