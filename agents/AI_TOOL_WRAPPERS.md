# 🤖 AI Tool Wrappers - Complete Reference

**Universal Model-Agnostic Memory System**  
Every AI tool gets DNA context automatically.

---

## The Complete Wrapper Family

| Command | Tool | Status | Method |
|---------|------|--------|--------|
| `kimic` | Kimi CLI | ✅ Ready | Pipes DNA as first message |
| `claudec` | Claude CLI | ✅ Ready | System prompt injection |
| `aidere` | Aider | ✅ Ready | `--read` flag |
| `geminic` | Gemini CLI | ✅ Ready | `GEMINI_SYSTEM_MD` env var |
| `kiloc` | Kilo Code CLI | ✅ Ready | Context file injection |
| `dna-context` | Any tool | ✅ Ready | Clipboard/pipe output |
| VS Code | Copilot/Continue | ✅ Auto | `.github/copilot-instructions.md` |

---

## Usage

### CLI Tools

```bash
# Kimi
kimic                    # Start with DNA context
kimil                    # Continue last session

# Claude
claudec                  # Start with DNA context

# Aider
aidere                   # Start with DNA context

# Gemini
geminic                  # Start with DNA context

# Kilo
kiloc                    # Start with DNA context

# Any other tool
dna-context | xclip -selection clipboard
# Paste into any web UI or CLI
```

### VS Code (Automatic)

Just open VS Code in `/evo` directory. Copilot/Continue/Cline automatically load DNA from:
- `.github/copilot-instructions.md`
- `.vscode/settings.json`

---

## Installation

### New Machine Setup

```bash
# 1. Install dotfiles (tools)
git clone https://github.com/Badders80/evo-dotfiles.git
cd evo-dotfiles && ./install.sh

# 2. Install brain (DNA data)
git clone https://github.com/Badders80/evo-brain.git ~/00_DNA

# 3. Verify
evo doctor
```

### Individual Tools

If a tool is missing:

```bash
# Install specific wrapper
cp /home/evo/_scripts/TOOLNAME.sh ~/.local/bin/TOOLNAME
chmod +x ~/.local/bin/TOOLNAME
```

---

## How It Works

Each wrapper does the same thing:

1. **Load DNA files** (`🧠 AI_CONTEXT.md`, `OPERATING_BACKLOG.md`, `DECISION_LOG.md`)
2. **Inject into tool** (method varies by tool)
3. **Launch tool** with context pre-loaded

The DNA files are the **shared memory**. The wrappers are **tool-specific keys** that unlock it.

---

## Important Rules

1. **Each tool is isolated.** Running `kimic` doesn't help Claude. Each needs its own wrapper.

2. **Each terminal session is fresh.** Run the wrapper every time you start a new terminal.

3. **The DNA is constant.** Same files, different delivery method per tool.

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| `kimic: command not found` | Run `evo doctor`, check installation |
| Tool not loading context | Check wrapper is installed to `~/.local/bin/` |
| VS Code not working | Verify `.github/copilot-instructions.md` exists |
| Clipboard not working | Install `xclip`: `sudo apt install xclip` |

---

## Adding New Tools

Pattern for any new AI tool:

```bash
#!/bin/bash
# 1. Load DNA context
dna-context > /tmp/tool-context.md

# 2. Launch tool with context
exec new-tool --context /tmp/tool-context.md "$@"
```

Then:
1. Save to `_scripts/NEWTOOL.sh`
2. Install to `~/.local/bin/`
3. Add check to `evo-doctor.sh`
4. Update this doc

---

**Every AI tool. One command. Full context.**
