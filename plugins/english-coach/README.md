# English Coach

Turn Claude Code into your English coach while you code.

Every time you send a message — English, Traditional Chinese, or mixed — Claude briefly coaches you before proceeding with your task.

## What it looks like

```
★ English Coach ─────────────────────────────────
- "幫我看一下這個 bug" → "Can you take a look at this bug for me?"
- More concise: "Check this bug"
- 幫我看 = "take a look" / "check out"
─────────────────────────────────────────────────
```

## Install

```bash
/plugin marketplace add junyiacademy/claude-plugins
/plugin install english-coach@junyiacademy-claude-plugins
```

## Architecture

Two-layer hook design (same pattern as Anthropic's `explanatory-output-style` plugin):

- **SessionStart** — injects full coaching instructions via `additionalContext` (sub-agents never see it)
- **UserPromptSubmit** — lightweight reminder each turn (prevents forgetting in long sessions)

## Customization

- **Change source language** — edit `instructions.md`, replace "Traditional Chinese" with your native language
- **Adjust coaching focus** — modify the priority list in the same file

## License

MIT
