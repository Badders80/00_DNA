# Evolution Stables Reorganization - Action Plan

**Date:** 2026-01-27  
**Status:** Phase 1 - Foundation Complete  
**Next:** Repository Audit

---

## ✅ Completed

- [x] Created 00_DNA folder structure
- [x] Saved Master_Config_2026.md to build-philosophy/
- [x] Created DNA README with usage guidelines
- [x] Created repo audit script
- [x] Documented Jules work that needs checking

---

## 🎯 Immediate Next Steps (DO THESE NOW)

### 1. Run Repository Audit

**From Windows WSL terminal:**

```bash
cd /mnt/scratch/projects/00_DNA/workflows
chmod +x audit_jules_repos.sh
./audit_jules_repos.sh > repo_audit_output.txt
```

This will show:
- Which repos need pulling
- Uncommitted changes
- Remote sync status
- Last commit info

### 2. Manual Checks for Jules Repos

Based on your screenshots, check these specifically:

```bash
# Asset Generation (has active work)
cd /mnt/scratch/projects/Asset_Generation  # or wherever it is
git status
git pull

# Evolution-3.1 (SEO work completed 5 days ago)
cd /mnt/scratch/projects/Evolution-3.1
git status  
git pull

# Evolution-Studio-MCP (MCP integration work)
cd /mnt/scratch/projects/Evolution-Studio-MCP
git status
git pull
```

### 3. Answer Key Questions

After pulling repos, document:

**Evolution_Guru:**
- [ ] What is its purpose?
- [ ] Last commit date?
- [ ] Can it be archived?

**Evolution_Studio:**  
- [ ] Different from Evolution-Studio-MCP?
- [ ] Still active?
- [ ] Can it be archived?

**Asset_Generation:**
- [ ] Is this the Content Factory?
- [ ] Production ready?
- [ ] Should it move to `02_Content_Factory/`?

---

## 📋 Phase 2 - Migration Planning (AFTER AUDIT)

### Once You Know Repo Status

**Create Migration Map:**

```
Current Location          →  New Location
─────────────────────────────────────────────────
Evolution-3.1/            →  01_Platform/evolution-3.1/
Asset_Generation/         →  02_Content_Factory/pipeline/
ComfyUI/                  →  02_Content_Factory/comfyui/
comfyui-mcp-server/       →  03_Tools/mcp-servers/comfyui/
gemini-mcp-server/        →  03_Tools/mcp-servers/gemini/
Evolution_Studio/         →  05_Archive/ (if inactive)
Evolution_Guru/           →  05_Archive/ (if inactive)
```

### Migration Strategy

**Option A: Move Files (Breaks Git History)**
- Fast, clean
- Lose git remote tracking
- Good for archived/dead repos

**Option B: Symlinks (Keeps Git Working)**
- Maintains remote sync
- Jules can still work in original location
- Good for active development

**Option C: Git Submodules**
- Pro: Proper git integration
- Con: More complex, slower
- Use only if repos truly independent

---

## 🚧 Phase 3 - Full Reorganization (FUTURE)

After audit is done and you've decided what to keep:

### Folder Creation

```bash
cd /mnt/scratch/projects/

# Create new structure
mkdir -p 01_Platform/evolution-3.1
mkdir -p 01_Platform/shared
mkdir -p 02_Content_Factory/{comfyui,models,output,templates}
mkdir -p 03_Tools/{mcp-servers,cli-tools,automation,integrations}
mkdir -p 04_Intelligence/{jules-workspace,agent-configs,knowledge-base,skills}
mkdir -p 05_Archive
mkdir -p _scratch
```

### DNA Population

Move/create these into DNA:

- [ ] `brand_voice` → `00_DNA/brand-identity/voice/`
- [ ] System prompts → `00_DNA/system-prompts/`  
- [ ] Workflow docs → `00_DNA/workflows/`

---

## 🎮 Quick Commands Reference

### Check Everything at Once

```bash
cd /mnt/scratch/projects/
ls -lah | grep "^d" | awk '{print $9}' | while read dir; do
    if [ -d "$dir/.git" ]; then
        echo "=== $dir ==="
        cd "$dir" && git status -s && cd ..
    fi
done
```

### Find Large Files (>500MB)

```bash
cd /mnt/scratch/projects/
find . -type f -size +500M -exec ls -lh {} \; | awk '{print $9, $5}'
```

### Check Disk Usage by Project

```bash
cd /mnt/scratch/projects/
du -sh */ | sort -hr
```

---

## 🛑 Stop Conditions (DO NOT PROCEED IF)

- [ ] WSL mount is unstable (run EVO_RESET.bat first)
- [ ] Samsung 990 PRO not showing as S: drive
- [ ] Active Jules sessions open (check Jules AI)
- [ ] Uncommitted changes you don't understand
- [ ] Any repo shows "diverged" state

---

## 📞 Decision Points

After audit, you need to decide:

1. **Archive vs Keep** - Which repos are truly dead?
2. **Migration Strategy** - Move files or use symlinks?
3. **Google Integration** - How does Gemini CLI fit into 03_Tools/?
4. **Jules Workspace** - Keep as-is or move to 04_Intelligence/?

---

## Success Criteria

**Phase 1 (Now):** ✅ DNA folder exists with core docs

**Phase 2 (Next):**  
- [ ] All repos audited
- [ ] Git status clean
- [ ] Migration map created
- [ ] No Jules work lost

**Phase 3 (Future):**
- [ ] All projects in new structure  
- [ ] DNA fully populated
- [ ] Tools organized
- [ ] Archive created

---

**Current Status:** Ready for repo audit. Run the script and let's see what we're working with.
