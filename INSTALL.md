# How to install

<details>
<summary><strong>Antigravity (<code>agy</code>)</strong></summary>

### Install

```bash
agy plugin install https://github.com/ayghri/obsession-ai
```

### Verify

```bash
agy plugin list
```

### Update

```bash
agy plugin uninstall obsession-ai
agy plugin install https://github.com/ayghri/obsession-ai
```

### Uninstall

```bash
agy plugin uninstall obsession-ai
```

Or keep it installed and turn it off: `agy plugin disable obsession-ai`.

### Always-on (optional)

Add to `~/.gemini/GEMINI.md`:

```markdown
## Output style

The reader has ADHD. Shape every response so it can be acted on:

1. Lead with the answer or next action: command, path, or snippet first.
2. Number multi-step work; one bounded action per step.
3. End with one next action doable in under two minutes.
4. Finish the current issue before raising a new one.
5. Restate progress each turn ("step 3 of 5 done").
6. Give time estimates in concrete units, never "a bit".
7. After a change, show what now works.
8. Errors: state location, cause, and fix. No drama.
9. Cap lists at 5 items.
10. No preamble, no recaps, no closers.

Exceptions: explain fully when asked to explain. Confirm before destructive actions. After three failed fixes, stop and name the doubtful assumption. If the request is ambiguous, ask one short question.
```

</details>

<details>
<summary><strong>Claude Code</strong></summary>

### Install

```bash
claude plugin marketplace add ayghri/obsession-ai
claude plugin install obsession-ai@obsession-ai
```

Type `/obsession-ai`.

### Verify

```bash
claude plugin list
```

### Update

```bash
claude plugin marketplace update obsession-ai
```

### Uninstall

```bash
claude plugin uninstall obsession-ai
claude plugin marketplace remove obsession-ai
```

Or keep it installed and turn it off: `claude plugin disable obsession-ai`.

### Always-on (optional)

A `SessionStart` hook loads the full ruleset at the start of every session, no `/obsession-ai` needed:

```bash
touch ~/.claude/.obsession-ai-always
```

If you use a custom Claude configuration directory, create the flag there instead:

```bash
touch "$CLAUDE_CONFIG_DIR/.obsession-ai-always"
```

Back to on-demand:

```bash
rm ~/.claude/.obsession-ai-always
```

The hook only fires when the flag file exists, so installing the plugin changes nothing by itself. "stop obsession mode" still turns it off for the current session.

</details>


<details>
<summary><strong>Codex</strong></summary>

### Install

```bash
codex plugin marketplace add ayghri/obsession-ai --ref main
codex plugin add obsession-ai@obsession-ai
```

Invoke the skill explicitly by typing `$obsession-ai`. Codex will not activate
it automatically.

### Verify

```bash
codex plugin list
```

### Update

```bash
codex plugin marketplace upgrade obsession-ai
codex plugin remove obsession-ai
codex plugin add obsession-ai@obsession-ai
```

### Uninstall

```bash
codex plugin remove obsession-ai
codex plugin marketplace remove obsession-ai
```

### Always-on (optional)

Add to `~/.codex/AGENTS.md`:

```markdown
## Output style

The reader has ADHD. Shape every response so it can be acted on:

1. Lead with the answer or next action: command, path, or snippet first.
2. Number multi-step work; one bounded action per step.
3. End with one next action doable in under two minutes.
4. Finish the current issue before raising a new one.
5. Restate progress each turn ("step 3 of 5 done").
6. Give time estimates in concrete units, never "a bit".
7. After a change, show what now works.
8. Errors: state location, cause, and fix. No drama.
9. Cap lists at 5 items.
10. No preamble, no recaps, no closers.

Exceptions: explain fully when asked to explain. Confirm before destructive actions. After three failed fixes, stop and name the doubtful assumption. If the request is ambiguous, ask one short question.
```

</details>

<details>
<summary><strong>Gemini CLI</strong></summary>

Gemini CLI has no plugin marketplace, so there are two native routes: a **custom command** (opt-in, off until you invoke it) or an **extension** (always-on once installed). The command route matches this skill's default posture; pick it unless you want the rules on every session.

### Install (command, opt-in)

```bash
mkdir -p ~/.gemini/commands
curl -fsSL https://raw.githubusercontent.com/ayghri/obsession-ai/main/skills/obsession-ai/agents/gemini.toml \
  -o ~/.gemini/commands/obsession-ai.toml
```

Start a new session, type `/obsession-ai`. It stays on for that session.

### Install (extension, always-on)

```bash
gemini extensions install https://github.com/ayghri/obsession-ai
```

The extension loads `GEMINI.md`, which imports the full skill, so the rules apply from message one. `git` must be installed.

### Verify

```bash
gemini extensions list          # extension route
ls ~/.gemini/commands           # command route: obsession-ai.toml present
```

Or type `/` in a session and confirm `obsession-ai` is listed.

### Update

```bash
gemini extensions update obsession-ai    # extension route
# command route: re-run the curl above
```

### Uninstall

```bash
gemini extensions uninstall obsession-ai    # extension route
rm ~/.gemini/commands/obsession-ai.toml     # command route
```

</details>

<details>
<summary><strong>GitHub Copilot (VS Code and Copilot CLI)</strong></summary>

Copilot reads Agent Skills natively: the same `SKILL.md`, no conversion. It scans `.github/skills/`, `.claude/skills/`, and `.agents/skills/` in the project, and `~/.copilot/skills/`, `~/.claude/skills/`, and `~/.agents/skills/` globally.

### Install

```bash
npx skills add ayghri/obsession-ai -a github-copilot        # this project
npx skills add ayghri/obsession-ai -a github-copilot -g     # all projects
```

Without the CLI, copy the skill folder into any directory Copilot scans:

```bash
git clone https://github.com/ayghri/obsession-ai
mkdir -p ~/.copilot/skills
cp -R obsession-ai/skills/obsession-ai ~/.copilot/skills/
```

### Verify

Type `/` in the chat input and confirm `obsession-ai` appears. Or:

```bash
npx skills list
npx skills ls -g    # if installed globally
```

### Update

```bash
npx skills update obsession-ai
```

Or re-copy the folder after `git pull`.

### Uninstall

```bash
npx skills remove obsession-ai
```

Or delete the `obsession-ai` folder from the skills directory it landed in.

### Activation note

Copilot respects `disable-model-invocation`: nothing applies until you invoke the skill, same as Claude Code (tested in [#60](https://github.com/ayghri/obsession-ai/pull/60)).

### Always-on (optional)

Add the block below to `.github/copilot-instructions.md` in the project (Copilot reads it into every chat):

```markdown
## Output style

The reader has ADHD. Shape every response so it can be acted on:

1. Lead with the answer or next action: command, path, or snippet first.
2. Number multi-step work; one bounded action per step.
3. End with one next action doable in under two minutes.
4. Finish the current issue before raising a new one.
5. Restate progress each turn ("step 3 of 5 done").
6. Give time estimates in concrete units, never "a bit".
7. After a change, show what now works.
8. Errors: state location, cause, and fix. No drama.
9. Cap lists at 5 items.
10. No preamble, no recaps, no closers.

Exceptions: explain fully when asked to explain. Confirm before destructive actions. After three failed fixes, stop and name the doubtful assumption. If the request is ambiguous, ask one short question.
```

</details>


<details>
<summary><strong>Hermes</strong></summary>

### Install

```bash
hermes skills install ayghri/obsession-ai/skills/obsession-ai
```

Type `/obsession-ai`. The skill installs into `~/.hermes/skills/` and is exposed as a slash command at the next session start.

Prefer to browse first? Add this repo as a skill source (a "tap"), then search and install:

```bash
hermes skills tap add ayghri/obsession-ai
hermes skills search obsession
hermes skills install ayghri/obsession-ai/skills/obsession-ai
```

### Verify

```bash
hermes skills list
```

### Update

```bash
hermes skills update obsession-ai
```

### Uninstall

```bash
hermes skills uninstall obsession-ai
```

Or remove the tap too: `hermes skills tap remove ayghri/obsession-ai`.

### Always-on (optional)

Add to the `AGENTS.md` in your working directory (Hermes loads it per workdir), or to your persona `SOUL.md` for every session:

```markdown
## Output style

The reader has ADHD. Shape every response so it can be acted on:

1. Lead with the answer or next action: command, path, or snippet first.
2. Number multi-step work; one bounded action per step.
3. End with one next action doable in under two minutes.
4. Finish the current issue before raising a new one.
5. Restate progress each turn ("step 3 of 5 done").
6. Give time estimates in concrete units, never "a bit".
7. After a change, show what now works.
8. Errors: state location, cause, and fix. No drama.
9. Cap lists at 5 items.
10. No preamble, no recaps, no closers.

Exceptions: explain fully when asked to explain. Confirm before destructive actions. After three failed fixes, stop and name the doubtful assumption. If the request is ambiguous, ask one short question.
```

</details>

<details>
<summary><strong>Kimi Code CLI</strong></summary>

### Install

Start a Kimi Code session, then:

1. Run `/plugins`.
2. Choose **Custom**.
3. Paste `https://github.com/ayghri/obsession-ai` and press `Enter`.
4. Choose **Trust and install**.

Use slash command `/skill:obsession-ai` to invoke the skill explicitly.

### Update

`/plugins` in Kimi Code session, cursor to **I Have ADHD**, press `R`.

### Uninstall

`/plugins` in Kimi Code session, cursor to **I Have ADHD**, press `D`.


</details>

<details>
<summary><strong>OpenCode</strong></summary>

OpenCode loads this repository as a server plugin: `.opencode/plugins/obsession-ai.mjs` registers the `skills/` entry point and the `/obsession-ai` command, and injects the ruleset when always-on is enabled. OpenCode also reads `skills/` natively, so the skill still works even without the plugin — the plugin adds the `/obsession-ai` command and the always-on flag.

### Install

Clone the repo and point OpenCode at the plugin. An absolute path shares one checkout across every project:

```bash
git clone https://github.com/ayghri/obsession-ai ~/.config/opencode/vendor/obsession-ai
```

Add to your `opencode.json` (global: `~/.config/opencode/opencode.json`):

```json
{ "plugin": ["/absolute/path/to/obsession-ai/.opencode/plugins/obsession-ai.mjs"] }
```

Or run OpenCode from the checkout — it ships a root `opencode.json` with the plugin already wired up.

Start a new session and turn on ADHD-friendly output for the session:

```text
/obsession-ai
```

Rules stay on until `stop obsession mode` or `flow mode`.

### Verify

Start OpenCode, type `/`, and confirm `obsession-ai` appears in the command list.

### Update

```bash
git -C ~/.config/opencode/vendor/obsession-ai pull
```

### Uninstall

Remove the `plugin` entry from `opencode.json`.

### Always-on (optional)

```bash
touch ~/.config/opencode/.obsession-ai-always
```

While the flag exists, the plugin appends the full ruleset to the system prompt every turn — the OpenCode equivalent of the Claude Code `SessionStart` hook. `stop obsession mode` or `flow mode` disables it for the current session; delete the flag to turn always-on off for good:

```bash
rm ~/.config/opencode/.obsession-ai-always
```

</details>


<details>
<summary><strong>Pi</strong></summary>

Pi discovers this repository as a native package: `extensions/` provides the session-persistent mode and `skills/` keeps the Agent Skills entry point available.

### Install

```bash
pi install https://github.com/ayghri/obsession-ai
```

Start a new Pi session. Toggle ADHD-friendly output for the current session:

```text
/obsession-ai
```

The footer shows `● ADHD ON` while the mode is active. Run the command again to turn it off, or be explicit:

```text
/obsession-ai on
/obsession-ai off
stop obsession mode
```

Like the Claude Code hook, the extension adds the ruleset to the conversation once instead of rewriting the system prompt on every request, and adds it again after compaction drops it.

The existing Agent Skills command remains available as an alias:

```text
/skill:obsession-ai
```

Start a new Pi session with the mode enabled by default:

```bash
pi --obsession
```

### Verify

```bash
pi list
```

Confirm the GitHub package is listed, then type `/obsession-ai` and check that `● ADHD ON` appears in the footer.

### Update

```bash
pi update https://github.com/ayghri/obsession-ai
```

Or update every unpinned Pi package with `pi update --extensions`.

### Uninstall

```bash
pi remove https://github.com/ayghri/obsession-ai
```

### Always-on (optional)

Create a flag in Pi's agent configuration directory:

```bash
touch ~/.pi/agent/.obsession-ai-always
```

The extension checks the flag at every new, resumed, forked, or reloaded session. A saved choice for the current session wins over this default, so `stop obsession mode` keeps that session disabled.

Back to on-demand:

```bash
rm ~/.pi/agent/.obsession-ai-always
```

### Config file (optional)

Create `~/.pi/agent/obsession-ai.json` in Pi's agent configuration directory:

```json
{
  "alwaysOn": true,
  "hideStatus": true
}
```

- `alwaysOn`: start every session with the rules active — same as the `.obsession-ai-always` flag file, which still works
- `hideStatus`: keep the `● ADHD ON` status-bar entry hidden; the rules and the `/obsession-ai` command still work

Read once at extension startup, so restart Pi after changing it. A saved choice for the current session wins over `alwaysOn`, so `stop obsession mode` keeps that session disabled.

If `PI_CODING_AGENT_DIR` is set, put `.obsession-ai-always` in that directory instead. Run `/reload` or start a new session after changing the flag.

</details>


<details>
<summary><strong>Oh My Pi (OMP)</strong></summary>

### Install

```bash
omp plugin marketplace add ayghri/obsession-ai
omp plugin install --scope user obsession-ai@obsession-ai
```

Start a new OMP session and run `/obsession-ai` to toggle the mode.

### Update

```bash
omp plugin marketplace update obsession-ai
omp plugin upgrade --scope user obsession-ai@obsession-ai
```

### Uninstall

```bash
omp plugin uninstall --scope user obsession-ai@obsession-ai
omp plugin marketplace remove obsession-ai
```

</details>


<details>
<summary><strong>Qwen Code</strong></summary>

### Install

```bash
qwen extensions install ayghri/obsession-ai
```

Qwen Code supports the GitHub shorthand and installs the repository as a
native extension. The extension discovers the skill under `skills/`.

Type `/obsession-ai` to invoke the skill explicitly. Installing the extension
does not change output until the skill is invoked.

### Verify

```bash
qwen extensions list
```

Then start a new Qwen Code session and run:

```text
/skills
```

Confirm that `obsession-ai` appears in the list.

### Update

```bash
qwen extensions update obsession-ai
```

### Uninstall

```bash
qwen extensions uninstall obsession-ai
```

</details>

<details>
<summary><strong>Zed</strong></summary>

Zed's Agent reads Agent Skills natively: the same `SKILL.md`, no conversion. (Zed's older "Rules" were replaced by Skills plus `AGENTS.md` instructions.)

### Install

In the Agent Panel, open the Skills manager and choose **Create skill from URL** (also in the command palette as `agent: create skill from url`), then paste:

```
https://github.com/ayghri/obsession-ai/blob/main/skills/obsession-ai/SKILL.md
```

Save it in **User** scope for every project, or **Project** scope for one. Then type `/obsession-ai` in the Agent Panel.

Prefer the filesystem? Clone the repo and drop the skill folder into your user skills directory:

```bash
git clone https://github.com/ayghri/obsession-ai
cp -R obsession-ai/skills/obsession-ai ~/.config/zed/skills/
```

### Verify

Open the Skills manager in the Agent Panel and confirm `obsession-ai` is listed. Or type `/` and confirm it appears.

### Update

Re-import from the same URL (overwrites), or re-copy the folder after `git pull`.

### Uninstall

Remove `obsession-ai` from the Skills manager, or delete `~/.config/zed/skills/obsession-ai`.

### Always-on (optional)

Add to your personal `~/.config/zed/AGENTS.md`:

```markdown
## Output style

The reader has ADHD. Shape every response so it can be acted on:

1. Lead with the answer or next action: command, path, or snippet first.
2. Number multi-step work; one bounded action per step.
3. End with one next action doable in under two minutes.
4. Finish the current issue before raising a new one.
5. Restate progress each turn ("step 3 of 5 done").
6. Give time estimates in concrete units, never "a bit".
7. After a change, show what now works.
8. Errors: state location, cause, and fix. No drama.
9. Cap lists at 5 items.
10. No preamble, no recaps, no closers.

Exceptions: explain fully when asked to explain. Confirm before destructive actions. After three failed fixes, stop and name the doubtful assumption. If the request is ambiguous, ask one short question.
```

</details>

<details>
<summary><strong>Cursor, Amp, and any other agent-skills harness</strong></summary>

Works with any harness that reads agent skills. Swap `-a <agent>` for yours.

### Install

```bash
npx skills add ayghri/obsession-ai                  # this workspace
npx skills add ayghri/obsession-ai -g               # all projects
npx skills add ayghri/obsession-ai -a cursor -y     # one agent only
npx skills add ayghri/obsession-ai -a opencode -y
```

New agent chat, type `/obsession-ai`.

Without the CLI, copy the skill folder into whatever path your agent scans:

```bash
git clone https://github.com/ayghri/obsession-ai
mkdir -p ~/.cursor/skills     # Cursor. Use .agents/skills for OpenCode, or your agent's own path
cp -R obsession-ai/skills/obsession-ai ~/.cursor/skills/
```

### Verify

```bash
npx skills list
npx skills ls -g    # if installed globally
```

### Update

```bash
npx skills update obsession-ai
npx skills update -g    # if installed globally
```

### Uninstall

```bash
npx skills remove obsession-ai
npx skills remove obsession-ai -g    # if installed globally
```

### Always-on (optional)

Paste this into your agent's persistent rules file. Cursor: **Settings → Rules → User Rules**, or a project rule under `.cursor/rules/` with `alwaysApply: true`. OpenCode: `~/.config/opencode/AGENTS.md`.

```markdown
## Output style

The reader has ADHD. Shape every response so it can be acted on:

1. Lead with the answer or next action: command, path, or snippet first.
2. Number multi-step work; one bounded action per step.
3. End with one next action doable in under two minutes.
4. Finish the current issue before raising a new one.
5. Restate progress each turn ("step 3 of 5 done").
6. Give time estimates in concrete units, never "a bit".
7. After a change, show what now works.
8. Errors: state location, cause, and fix. No drama.
9. Cap lists at 5 items.
10. No preamble, no recaps, no closers.

Exceptions: explain fully when asked to explain. Confirm before destructive actions. After three failed fixes, stop and name the doubtful assumption. If the request is ambiguous, ask one short question.
```
</details>


## How activation works

1. **Installed, not invoked.** In Claude Code, Qwen Code, and Codex, nothing happens until you invoke the skill explicitly. Claude Code and Qwen Code honor `disable-model-invocation: true` in `SKILL.md`; Codex honors `policy.allow_implicit_invocation: false` in `agents/openai.yaml`. Other harnesses may load every skill's description at startup and activate the skill themselves.
2. **You invoke it explicitly.** Type `/obsession-ai` in Claude Code or Qwen Code, or `$obsession-ai` in Codex. Rules stay on for that session. "stop obsession mode" or "flow mode" turns them off.
3. **You touch `~/.claude/.obsession-ai-always`** (Claude Code). A `SessionStart` hook loads the full ruleset from message one, every session.
4. **You add the always-on snippet above** (other harnesses). Keeps the core rules in your agent's persistent context.

In Claude Code, Qwen Code, and Codex, no middle ground: if you did not turn it on, it is off.

## Troubleshooting

**`/obsession-ai` not in autocomplete.** Restart the agent. The plugin index is read at startup.

**Always-on flag has no effect.** Update the plugin (`claude plugin marketplace update obsession-ai`) and restart. Hooks are read at startup, and the flag needs the plugin version that ships `hooks/hooks.json`.

**`claude plugin marketplace add` fails.** Use the `owner/repo` form. A local path must point at the repo root, not `.claude-plugin/`.

**Installed but replies still preamble.** Open a new session. If it still drifts, tighten the wording in `skills/obsession-ai/SKILL.md`.

**Want different rules.** Fork, edit `skills/obsession-ai/SKILL.md`, then swap your copy in:

```bash
claude plugin uninstall obsession-ai            # drop the upstream copy first:
claude plugin marketplace remove obsession-ai   # fork and upstream share both names
claude plugin marketplace add <your-username>/obsession-ai
claude plugin install obsession-ai@obsession-ai
```

Restart, then re-invoke `/obsession-ai`.

**Skill missing after `npx skills add`.** Start a new agent chat. Skills are indexed at session start. Confirm the folder landed where your agent scans (`~/.cursor/skills/` for Cursor, `.agents/skills/` for OpenCode) and that the frontmatter `name` matches the folder name.

<details>
<summary><strong>VS Code Extension</strong></summary>

### Install

1. Clone the repository:
```bash
git clone https://github.com/ayghri/obsession-ai
cd obsession-ai/.vscode
npm install
npm run compile
```

2. Package and install:
```bash
npm install -g vsce
vsce package
code --install-extension obsession-ai-1.0.0.vsix
```

3. Or manually: Extensions → `...` → Install from VSIX

### Usage

- **Command Palette**: `Ctrl+Shift+P` → "I Have ADHD: Toggle"
- **Status Bar**: Click the status indicator to toggle
- **Always-On**: Enable in settings `"obsession-ai.alwaysOn": true`

### Features

- Toggle ADHD-friendly mode on/off
- Status bar indicator
- Copy rules to clipboard
- Persistent settings across sessions

</details>

<details>
<summary><strong>JetBrains IDEs (IntelliJ, WebStorm, etc.)</strong></summary>

### Install

1. Clone the repository:
```bash
git clone https://github.com/ayghri/obsession-ai
cd obsession-ai/.idea
```

2. Build the plugin:
```bash
# Use IntelliJ IDEA or Gradle to build
# Or copy .idea folder contents to your project's .idea/
```

3. Manual install: Settings → Plugins → ⚙️ → Install Plugin from Disk

### Usage

- **Tools Menu**: Tools → Enable/Disable ADHD Mode
- **Keyboard Shortcut**: `Ctrl+Alt+A` (configurable)
- **Status Bar**: Shows when ADHD mode is active

</details>

<details>
<summary><strong>Vim/Neovim Plugin</strong></summary>

### Install

Using vim-plug:
```vim
Plug 'ayghri/obsession-ai', { 'rtp': '.vim' }
```

Using lazy.nvim:
```lua
{
  "ayghri/obsession-ai",
  rtp = ".vim",
  config = function()
    vim.g.obsession_mode_enabled = true
  end
}
```

Manual install:
```bash
git clone https://github.com/ayghri/obsession-ai
cp obsession-ai/.vim/obsession.vim ~/.vim/plugin/
```

### Usage

- **Commands**: `:ObsessionToggle`, `:ObsessionEnable`, `:ObsessionDisable`, `:AdhdRules`, `:AdhdCopy`
- **Keybinding**: `<Leader>aa` to toggle (configurable)
- **Status Line**: Shows `[ADHD ON]` when active

</details>

<details>
<summary><strong>Emacs Package</strong></summary>

### Install

Using use-package:
```elisp
(use-package obsession-ai
  :load-path "~/.emacs.d/obsession-ai/.emacs"
  :bind (("C-c a" . obsession-map))
  :config
  (obsession-global-mode 1))
```

Manual install:
```bash
git clone https://github.com/ayghri/obsession-ai
cp obsession-ai/.emacs/obsession-ai.el ~/.emacs.d/
```

Then add to `~/.emacs` or `init.el`:
```elisp
(add-to-list 'load-path "~/.emacs.d/")
(require 'obsession-ai)
(obsession-global-mode 1)
```

### Usage

- **Commands**: `M-x obsession-toggle`, `M-x obsession-enable`, `M-x obsession-disable`, `M-x obsession-show-rules`, `M-x obsession-copy-rules`
- **Keybindings**: `C-c a t` (toggle), `C-c a e` (enable), `C-c a d` (disable), `C-c a r` (rules), `C-c a c` (copy)
- **Mode Line**: Shows ` ADHD` when active

</details>

<details>
<summary><strong>Zed Editor</strong></summary>

### Install

1. Clone the repository:
```bash
git clone https://github.com/ayghri/obsession-ai ~/.config/zed/obsession-ai
```

2. Add to Zed settings (`settings.json`):
```json
{
  "assistant": {
    "default_model": "claude-sonnet-4"
  }
}
```

3. Create or update `.zed/assistant.md` with the ADHD rules (already included in repo)

### Usage

The rules in `assistant.md` are automatically loaded by Zed's AI assistant.

</details>

<details>
<summary><strong>Claude Desktop App</strong></summary>

### Install

Add to Claude Desktop configuration (`claude_desktop_config.json`):
```json
{
  "prompts": {
    "obsession": "The reader has ADHD. Shape every response so it can be acted on:\n\n1. Lead with the answer or next action: command, path, or snippet first.\n2. Number multi-step work; one bounded action per step.\n3. End with one next action doable in under two minutes.\n4. Finish the current issue before raising a new one.\n5. Restate progress each turn (\"step 3 of 5 done\").\n6. Give time estimates in concrete units, never \"a bit\".\n7. After a change, show what now works.\n8. Errors: state location, cause, and fix. No drama.\n9. Cap lists at 5 items.\n10. No preamble, no recaps, no closers."
  }
}
```

### Usage

Start conversations with `/obsession` prompt or set as default system prompt.

</details>

<details>
<summary><strong>Cursor IDE</strong></summary>

### Install (Global)

```bash
mkdir -p ~/.cursor/rules
curl -fsSL https://raw.githubusercontent.com/ayghri/obsession-ai/main/skills/obsession-ai/SKILL.md \
  -o ~/.cursor/rules/obsession.mdc
```

### Install (Project)

Add `.cursor/rules/obsession.mdc` to your project with the SKILL.md content.

### Always-On

Add to `.cursor/rules/default.mdc`:
```markdown
---
description: Always apply ADHD-friendly formatting
globs: **
---

## Output style

The reader has ADHD. Shape every response so it can be acted on:

1. Lead with the answer or next action: command, path, or snippet first.
2. Number multi-step work; one bounded action per step.
3. End with one next action doable in under two minutes.
4. Finish the current issue before raising a new one.
5. Restate progress each turn ("step 3 of 5 done").
6. Give time estimates in concrete units, never "a bit".
7. After a change, show what now works.
8. Errors: state location, cause, and fix. No drama.
9. Cap lists at 5 items.
10. No preamble, no recaps, no closers.
```

</details>

<details>
<summary><strong>Windsurf / Codeium</strong></summary>

### Install

Add to project root `.codeium/instructions.md`:
```markdown
## Output style

The reader has ADHD. Shape every response so it can be acted on:

1. Lead with the answer or next action: command, path, or snippet first.
2. Number multi-step work; one bounded action per step.
3. End with one next action doable in under two minutes.
4. Finish the current issue before raising a new one.
5. Restate progress each turn ("step 3 of 5 done").
6. Give time estimates in concrete units, never "a bit".
7. After a change, show what now works.
8. Errors: state location, cause, and fix. No drama.
9. Cap lists at 5 items.
10. No preamble, no recaps, no closers.
```

### Global Install

Add to `~/.codeium/instructions.md` for all projects.

</details>

<details>
<summary><strong>Sourcegraph Cody</strong></summary>

### Install

Add to `.cody/instructions.md` in your project:
```markdown
## Output style

The reader has ADHD. Shape every response so it can be acted on:

1. Lead with the answer or next action: command, path, or snippet first.
2. Number multi-step work; one bounded action per step.
3. End with one next action doable in under two minutes.
4. Finish the current issue before raising a new one.
5. Restate progress each turn ("step 3 of 5 done").
6. Give time estimates in concrete units, never "a bit".
7. After a change, show what now works.
8. Errors: state location, cause, and fix. No drama.
9. Cap lists at 5 items.
10. No preamble, no recaps, no closers.
```

</details>

<details>
<summary><strong>Tabnine</strong></summary>

### Install

Add to project root `.tabnine/config.json`:
```json
{
  "instructions": "The reader has ADHD. Shape every response so it can be acted on:\n\n1. Lead with the answer or next action: command, path, or snippet first.\n2. Number multi-step work; one bounded action per step.\n3. End with one next action doable in under two minutes.\n4. Finish the current issue before raising a new one.\n5. Restate progress each turn (\"step 3 of 5 done\").\n6. Give time estimates in concrete units, never \"a bit\".\n7. After a change, show what now works.\n8. Errors: state location, cause, and fix. No drama.\n9. Cap lists at 5 items.\n10. No preamble, no recaps, no closers."
}
```

</details>

<details>
<summary><strong>Continue.dev</strong></summary>

### Install

Add to `~/.continue/config.json`:
```json
{
  "systemMessage": "The reader has ADHD. Shape every response so it can be acted on:\n\n1. Lead with the answer or next action: command, path, or snippet first.\n2. Number multi-step work; one bounded action per step.\n3. End with one next action doable in under two minutes.\n4. Finish the current issue before raising a new one.\n5. Restate progress each turn (\"step 3 of 5 done\").\n6. Give time estimates in concrete units, never \"a bit\".\n7. After a change, show what now works.\n8. Errors: state location, cause, and fix. No drama.\n9. Cap lists at 5 items.\n10. No preamble, no recaps, no closers."
}
```

### Project-level

Add `.continue/config.json` to your project with the same content.

</details>
