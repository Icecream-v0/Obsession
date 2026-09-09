# I Have ADHD - VS Code Extension

Transforms AI coding assistant (Copilot, Cursor, etc.) responses to be ADHD-friendly directly in VS Code.

## Features

- **Action-First Responses**: Gets straight to the point with commands and code snippets first
- **Numbered Steps**: Breaks down multi-step tasks into clear, bounded actions
- **Concrete Next Actions**: Always ends with a specific action doable in under 2 minutes
- **No Fluff**: Eliminates preamble, recaps, and closing pleasantries
- **Status Indicator**: Shows when ADHD mode is active in the status bar
- **Toggle On/Off**: Easy keyboard shortcut or command palette access

## Installation

1. Download this folder or clone the repository
2. In VS Code: `Extensions` → `...` → `Install from VSIX...`
3. Or run: `code --install-extension i-have-adhd`

## Usage

- **Command Palette**: `Ctrl+Shift+P` → "I Have ADHD: Toggle"
- **Keyboard Shortcut**: Configure in `keybindings.json`
- **Always-On Mode**: Enable in settings `"i-have-adhd.alwaysOn": true`

## Rules

1. Lead with the next action
2. Number multi-step tasks
3. End with one concrete next step
4. Suppress tangents
5. Restate state every turn
6. Specific time estimates
7. Make wins visible
8. Matter-of-fact errors
9. Cap lists at 5 items
10. No preamble, no recap, no closers

## Settings

- `i-have-adhd.alwaysOn`: Apply rules to all AI responses (default: false)
- `i-have-adhd.showStatus`: Show status bar indicator (default: true)

## License

MIT
