# 🚀 Quick Start - Evolution Stables

**The DNA memory system is ALWAYS available.** No sourcing required!

---

## ✅ Verify Installation (One-Time Check)

In any terminal:

```bash
evo doctor
```

**Expected output:**
```
🔧 Checking Universal AI Tool DNA Integration
  ✅ kimic installed
  ✅ claudec installed
  ✅ aidere installed
  ✅ dna-context installed
  ✅ GitHub Copilot instructions configured
```

---

## 🎯 Universal AI Tool Cheat Sheet

| Tool | Command | When to Use |
|------|---------|-------------|
| **Kimi** | `kimic` | Starting Kimi CLI |
| **Claude** | `claudec` | Starting Claude CLI |
| **Aider** | `aidere` | Starting Aider coding assistant |
| **VS Code Copilot** | Auto | Just open VS Code (uses `.github/copilot-instructions.md`) |
| **VS Code Continue/Cline** | Auto | Uses `.vscode/settings.json` |
| **Any Web UI** | `dna-context \| xclip` | Copy to clipboard, paste into ChatGPT/Gemini/etc |
| **Any Tool** | `dna-context` | Pipe to any CLI: `dna-context \| my-tool` |

---

## 🔥 Quick Commands by Situation

### Starting a CLI Session
```bash
kimic                    # Kimi with DNA
claudec                  # Claude with DNA
aidere                   # Aider with DNA
```

### VS Code (Automatic)
Just open VS Code in `/evo` directory. Copilot/Continue/Cline automatically load DNA context.

### Web UI (ChatGPT, Gemini, etc.)
```bash
# Copy DNA to clipboard
dna-context | xclip -selection clipboard

# Then paste into any web UI
```

### Unknown/New Tool
```bash
# Get DNA context as plain text
dna-context > /tmp/context.txt

# Or pipe directly
dna-context | any-ai-tool
```

---

## 🧠 The Simple Rule

> **Every AI tool gets DNA context automatically or via one command.**

You never have to remember file paths. Each tool has its own entry point:
- CLI tools → `kimic`, `claudec`, `aidere`
- VS Code → Auto-loaded
- Web UIs → `dna-context | xclip`

---

## 🆘 Troubleshooting

| Problem | Fix |
|---------|-----|
| `kimic: command not found` | Run `evo doctor`, follow install instructions |
| `claudec: command not found` | `cp _scripts/claudec.sh ~/.local/bin/claudec && chmod +x ~/.local/bin/claudec` |
| VS Code not loading context | Check `.vscode/settings.json` exists |
| Clipboard not working | Install xclip: `sudo apt install xclip` |

---

## 📚 DNA Files Location

All context lives in `/evo/00_DNA/`:
- `🧠 AI_CONTEXT.md` - Project overview and rules
- `OPERATING_BACKLOG.md` - Current work
- `DECISION_LOG.md` - Why we made choices

**The tools read these automatically.** You don't need to open them manually.

---

**Remember:** `evo doctor` checks everything. Run it anytime something feels off.
