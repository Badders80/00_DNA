# 🛠️ Enhancements Guide - Evolution Stables

**Lightweight tools that add value without bloat.**

---

## 🚀 Quick Start

Install everything:
```bash
bash /home/evo/_scripts/install-git-hooks.sh      # Prevent accidents
bash /home/evo/_scripts/install-enhancements.sh   # FZF, Zoxide, Just, Starship
source /home/evo/.bashrc                          # Reload shell
```

---

## 📦 What's Included

### 1. Git Hooks (Zero Overhead)
**Purpose:** Prevent committing secrets (.env files, keys)  
**Install:** `bash /home/evo/_scripts/install-git-hooks.sh`

**What it does:**
- Blocks commits of `.env`, `.pem`, `.key` files
- Warns about files >10MB (suggests Git LFS)
- Auto-installs to all projects with `.git`

**Emergency bypass:** `git commit --no-verify -m "message"`

---

### 2. FZF (Low Overhead)
**Purpose:** Fuzzy find anything  
**Install:** Included in `install-enhancements.sh`

**Key bindings:**
- `Ctrl+R` - Search command history
- `Ctrl+T` - Find files
- `Alt+C` - Fuzzy cd to directory
- Type `**` then Tab - Fuzzy autocomplete

**Example:**
```bash
Ctrl+R
type "docker"
# Shows all commands with "docker", select with arrows
```

---

### 3. Zoxide (Near Zero Overhead)
**Purpose:** Smarter `cd` command  
**Install:** Included in `install-enhancements.sh`

**Usage:**
```bash
# Instead of
cd /home/evo/projects/Evolution_Studio

# Just type
cd studio        # or even 'cd stu'
# Zoxide learns and fuzzy matches

# Interactive selection
cd --            # Shows recent dirs, pick with arrows
```

**Replaces:** `cd` (transparently)

---

### 4. Just (Low Overhead)
**Purpose:** Task runner (better than Make)  
**Install:** Included in `install-enhancements.sh`

**Usage:**
```bash
just               # Show all tasks
just check         # Run all checks
just status        # Show project status
just vault         # Edit API vault
just n8n           # Start N8N
just stop-all      # Stop all Docker
```

**Where tasks are defined:** `/home/evo/Justfile`

**Add your own tasks:** Edit `Justfile` in any project

---

### 5. Starship (Low Overhead)
**Purpose:** Pretty, informative prompt  
**Install:** Included in `install-enhancements.sh`

**Shows:**
- Current directory (shortened)
- Git branch 🌿
- Git status (✓ clean, 📝 modified, etc.)
- ➜ (green) or ✗ (red) based on last command

**Example prompt:**
```
projects/Evolution_Studio 🌿 main 📝 ➜
```

**Config:** `~/.config/starship.toml`

---

### 6. Bash Aliases (Zero Overhead)
**Purpose:** Save keystrokes  
**Auto-loaded:** Via `/home/evo/_config/bash-evo.sh`

**Navigation:**
```bash
cd.       # Go to /evo
cd.       # Go to /evo/00_DNA
cd..      # Go to /evo/projects
cdp studio # Go to /evo/projects/Evolution_Studio
```

**Evo shortcuts:**
```bash
v         # evo vault
vc        # evo vault check
ve        # evo vault edit
dk        # evo docker
dks       # evo docker status
b         # evo backlog
```

**Git shortcuts:**
```bash
gs        # git status
ga        # git add
gc        # git commit
gp        # git push
gl        # git log --oneline -10
gdna "msg" # Commit DNA with conventional message
```

---

### 7. Obsidian Templates (Zero Overhead)
**Purpose:** Consistent note structure  
**Location:** `00_DNA/.obsidian/templates/`

**Templates:**
- **Decision** - Document architectural decisions
- **Daily Log** - Daily work tracking
- **Meeting Notes** - Meeting documentation

**How to use:**
1. In Obsidian: Ctrl+P → "Templates: Insert"
2. Pick template
3. Fill in details

---

### 8. EditorConfig (Zero Overhead)
**Purpose:** Consistent formatting across editors  
**Location:** `/home/evo/.editorconfig`

**Handles:**
- Indentation (tabs vs spaces)
- Line endings (LF vs CRLF)
- File encoding (UTF-8)
- Trailing whitespace

**Works with:** VS Code, Vim, Emacs, Sublime, etc.

---

## 🎯 Usage Examples

### Daily Workflow
```bash
# Morning check
just check              # Vault, Docker, Doctor

# Start working on content
cdp studio              # cd to Evolution_Studio
evo docker start studio # Start containers
just status             # See current priorities

# End of day
evo docker stop studio  # Free up GPU
gdna "update backlog"   # Commit DNA changes
```

### Finding Things
```bash
# Find a file
ff docker-compose.yml   # Find all docker-compose files

# Search in DNA
sdna "vault"            # Search for "vault" in all DNA docs

# Search in projects
sproj "API_KEY"         # Search code for API_KEY usage

# Fuzzy find
Ctrl+T                  # Type "vault", see matching files
```

### Git Safety
```bash
git add .env            # Try to add secrets
# HOOK BLOCKS: "❌ BLOCKED: Attempting to commit '.env'"

# Won't let you commit by accident
```

---

## ⚡ Performance Impact

| Tool | Startup Time | Memory | Disk |
|------|--------------|--------|------|
| Git hooks | 0ms | 0MB | ~5KB |
| FZF | ~10ms | ~5MB | ~2MB |
| Zoxide | ~5ms | ~1MB | ~100KB |
| Just | 0ms | 0MB | ~2MB |
| Starship | ~20ms | ~2MB | ~5MB |
| Aliases | 0ms | 0MB | ~5KB |

**Total overhead:** ~35ms startup, ~10MB RAM  
**Benefit:** Massive productivity gains

---

## 🔧 Customization

### Add your own aliases
Edit `/home/evo/_config/bash-evo.sh`:
```bash
alias myalias='my command'
```

### Add Just tasks
Edit `/home/evo/Justfile`:
```just
mytask:
    echo "Doing my task"
    my-command
```

### Add Obsidian templates
Create file in `00_DNA/.obsidian/templates/`

---

## 🗑️ Uninstall

Remove from `~/.bashrc`:
```bash
# Remove these lines:
source /home/evo/_config/bash-evo.sh
alias evo="/home/evo/_scripts/evo.sh"
```

Remove hooks:
```bash
rm /home/evo/*/.git/hooks/pre-commit 2>/dev/null
rm /home/evo/*/.git/hooks/post-commit 2>/dev/null
```

---

**Remember: These are tools, not rules. Use what helps, ignore what doesn't.**
