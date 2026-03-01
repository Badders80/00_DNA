# Evolution Stables - Quick Reference

**Last Updated:** 2026-01-27  
**Status:** ✅ Reorganization Complete

---

## 📂 Directory Shortcuts

```bash
# Navigate to any area quickly
alias evo-dna="cd /home/evo/projects/00_DNA"
alias evo-platform="cd /home/evo/projects/01_Platform/evolution-3.1"
alias evo-factory="cd /home/evo/projects/02_Content_Factory"
alias evo-tools="cd /home/evo/projects/03_Tools"
alias evo-ai="cd /home/evo/projects/04_Intelligence"

# Add these to your ~/.bashrc for permanent shortcuts
```

---

## 🗺️ Where Things Are

| What You're Looking For | Location |
|------------------------|----------|
| **Main Platform (Evolution 3.1)** | `01_Platform/evolution-3.1/` |
| **Asset Generation (Content Factory)** | `02_Content_Factory/pipeline/` |
| **ComfyUI** | `02_Content_Factory/comfyui-main/` |
| **MCP Servers** | `03_Tools/mcp-servers/` |
| **Gemini Workspace** | `04_Intelligence/gemini-workspace/` |
| **Brand Guidelines** | `00_DNA/brand-identity/` |
| **System Prompts** | `00_DNA/system-prompts/` |
| **Hardware Config** | `00_DNA/build-philosophy/Master_Config_2026.md` |
| **Archived Projects** | `05_Archive/` |
| **Temp/Experiments** | `_scratch/` |

---

## 🔄 Common Git Operations

### Working with Evolution-3.1

```bash
# Via symlink (new way)
cd /home/evo/projects/01_Platform/evolution-3.1
git pull
git status

# Via original location (still works)
cd /home/evo/projects/Evolution-3.1
git pull
git status

# Both paths point to the same repo!
```

### Working with Asset_Generation

```bash
# Via symlink (new way)
cd /home/evo/projects/02_Content_Factory/pipeline
git pull

# Via original location
cd /home/evo/projects/Asset_Generation
git pull
```

### Audit All Repos

```bash
cd /home/evo/projects/00_DNA/workflows
./audit_jules_repos.sh
```

---

## 🚀 Starting New Work

### New Platform Feature
```bash
cd /home/evo/projects/01_Platform/evolution-3.1
git checkout -b feature/new-thing
# ... do work ...
git add .
git commit -m "Add new feature"
git push origin feature/new-thing
```

### New Content Generation Workflow
```bash
cd /home/evo/projects/02_Content_Factory/workflows
# Create new workflow JSON
```

### New MCP Server
```bash
cd /home/evo/projects/03_Tools/mcp-servers
mkdir my-new-server
cd my-new-server
git init
```

---

## 📋 Daily Workflow

### Morning Check
```bash
cd /home/evo/projects/00_DNA/workflows
./audit_jules_repos.sh | head -50
```

### Before Starting Work
```bash
# Pull latest changes
cd /home/evo/projects/01_Platform/evolution-3.1
git pull

cd /home/evo/projects/02_Content_Factory/pipeline
git pull

cd /home/evo/projects/04_Intelligence/gemini-workspace
git pull
```

### After Work
```bash
# Commit from wherever you are
git add .
git commit -m "Description of work"
git push origin main
```

---

## 🛠️ Tool Access

### ComfyUI
```bash
cd /home/evo/projects/02_Content_Factory/comfyui-main
python main.py --listen 0.0.0.0
# Access at localhost:8188
```

### MCP Servers
```bash
# ComfyUI MCP
cd /home/evo/projects/03_Tools/mcp-servers/comfyui

# Gemini MCP
cd /home/evo/projects/03_Tools/mcp-servers/gemini

# Evolution Studio MCP
cd /home/evo/projects/03_Tools/mcp-servers/evolution-studio
```

---

## 📖 Documentation

### When You Need...

**Hardware Setup Info:**
```bash
cat /home/evo/projects/00_DNA/build-philosophy/Master_Config_2026.md
```

**Brand Guidelines:**
```bash
cd /home/evo/projects/00_DNA/brand-identity
```

**System Prompts:**
```bash
cd /home/evo/projects/00_DNA/system-prompts
```

**Migration History:**
```bash
cat /home/evo/projects/00_DNA/REORGANIZATION_COMPLETE.md
```

---

## 🧪 Using _scratch

```bash
cd /home/evo/projects/_scratch

# Quick test
mkdir test-idea
cd test-idea
# ... experiment ...

# When done, either:
# 1. Delete it: cd .. && rm -rf test-idea
# 2. Move to proper location: mv test-idea ../02_Content_Factory/
```

---

## 🆘 Troubleshooting

### "Symlink broken"
```bash
# Check what it points to
ls -la /home/evo/projects/01_Platform/evolution-3.1

# Should show: evolution-3.1 -> ../Evolution-3.1
# If broken, recreate:
cd /home/evo/projects/01_Platform
ln -sf ../Evolution-3.1 evolution-3.1
```

### "Git says repo not found"
```bash
# You might be in the symlink path. Go to original:
cd /home/evo/projects/Evolution-3.1
git remote -v
# Should show GitHub URL
```

### "Can't find my files"
```bash
# Everything is still in original locations:
ls /home/evo/projects/
# Look for repo name without number prefix
```

---

## 📊 Structure at a Glance

```
projects/
├── 00_DNA/              # Standards & Philosophy
├── 01_Platform/         # Main Platform
├── 02_Content_Factory/  # Asset Generation
├── 03_Tools/            # Production Tools
├── 04_Intelligence/     # AI Workspace
├── 05_Archive/          # Old Projects
├── _scratch/            # Temp Work
├── Asset_Generation/    # ← Real repo
├── ComfyUI/             # ← Real repo
├── Evolution-3.1/       # ← Real repo
├── Evolution-Studio-MCP/# ← Real repo
└── Evolution_Guru/      # ← Real repo
```

**Numbered folders = Organization**  
**Named folders = Actual Git repos**  
**Symlinks connect them**

---

## 🎯 Key Principles

1. **DNA First** - Check 00_DNA for standards before starting
2. **Safe-Path Always** - Follow Master Config for all paths
3. **Git in Original Location** - Repos stay where they are
4. **Organize via Symlinks** - New structure uses symlinks
5. **Document in DNA** - New patterns go in 00_DNA

---

## 🔗 Useful Commands

```bash
# Show real path (resolve symlinks)
pwd -P

# Find large files
find /home/evo/projects -type f -size +500M

# Disk usage by folder
du -sh /home/evo/projects/*/ | sort -hr

# Check all git repos at once
cd /home/evo/projects/00_DNA/workflows
./audit_jules_repos.sh

# Quick commit all changes in current repo
git add -A && git commit -m "Quick save" && git push
```

---

**Keep this file handy for daily reference!**

Save location: `/home/evo/projects/00_DNA/QUICK_REFERENCE.md`
