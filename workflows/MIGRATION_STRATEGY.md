# Evolution Stables - Migration Decision Matrix

## Current State Analysis (Post-Audit)

| Repository | Status | Git State | Uncommitted | Action |
|-----------|---------|-----------|-------------|---------|
| Evolution_Guru | ACTIVE | Up to date | Yes - 3 session.db + new .py files | Review → Commit → Keep in place |
| Evolution_Studio | CLEAN | Up to date | None | Can archive/move safely |
| Evolution-3.1 | ACTIVE REFACTOR | Up to date | Yes - 26 deletions + new app/ | **COMMIT FIRST** → Keep in place |
| comfyui-mcp-server | LOCAL | Not Git | N/A | Can move freely |
| gemini-mcp-server | LOCAL | Not Git | N/A | Can move freely |

---

## Migration Strategy: Hybrid Approach

### Phase 1: Secure Active Work (DO FIRST)

**Evolution-3.1 Refactor:**
```bash
cd /mnt/scratch/projects/Evolution-3.1
git add -A
git commit -m "Refactor: Consolidate into app/ directory structure"
git push origin main
```

**Evolution_Guru Gemini Work:**
```bash
cd /mnt/scratch/projects/Evolution_Guru

# Option A: Commit everything
git add -A
git commit -m "Add Gemini CLI tools and CTO audit scripts"
git push origin main

# Option B: Ignore session databases
echo "**/.adk/session.db" >> .gitignore
git add .gitignore *.py .gemini/
git commit -m "Add Gemini tools, ignore ADK session databases"
git push origin main
```

---

### Phase 2: Create New Structure with Symlinks

**Rationale:** Keep Git repos in original locations, use symlinks for organization

```bash
cd /mnt/scratch/projects/

# Create new structure folders
mkdir -p 01_Platform
mkdir -p 02_Content_Factory/comfyui
mkdir -p 02_Content_Factory/workflows
mkdir -p 03_Tools/mcp-servers
mkdir -p 04_Intelligence
mkdir -p 05_Archive

# Symlink active Git repos (preserves remotes)
ln -s ../Evolution-3.1 01_Platform/evolution-3.1
ln -s ../Evolution_Guru 04_Intelligence/gemini-workspace

# Move clean archive
mv Evolution_Studio 05_Archive/evolution-studio

# Move non-Git tools
mv comfyui-mcp-server 03_Tools/mcp-servers/comfyui
mv gemini-mcp-server 03_Tools/mcp-servers/gemini

# Check for ComfyUI (if exists)
if [ -d "ComfyUI" ]; then
    ln -s ../ComfyUI 02_Content_Factory/comfyui-main
fi
```

---

### Phase 3: Verify Structure

After migration, structure will look like:

```
/mnt/scratch/projects/
├── 00_DNA/                              ✅ Created
│   ├── brand-identity/
│   ├── build-philosophy/
│   ├── system-prompts/
│   └── workflows/
│
├── 01_Platform/
│   └── evolution-3.1 → ../Evolution-3.1    [SYMLINK]
│
├── 02_Content_Factory/
│   ├── comfyui-main → ../ComfyUI           [SYMLINK if exists]
│   └── workflows/
│
├── 03_Tools/
│   └── mcp-servers/
│       ├── comfyui/                        [MOVED]
│       └── gemini/                         [MOVED]
│
├── 04_Intelligence/
│   └── gemini-workspace → ../Evolution_Guru [SYMLINK]
│
├── 05_Archive/
│   └── evolution-studio/                   [MOVED]
│
├── Evolution-3.1/                      [Original location - still Git tracked]
├── Evolution_Guru/                     [Original location - still Git tracked]
├── ComfyUI/                            [If exists - still Git tracked]
└── models/                             [Existing - unchanged]
```

---

## Why This Hybrid Approach?

### ✅ Advantages

1. **Preserves Git History** - Active repos stay where they are
2. **Clean Organization** - New structure visible via symlinks
3. **No Remote Updates** - Git remotes don't need changing
4. **Reversible** - Just delete symlinks if needed
5. **Safe for Jules** - Jules GitHub integration unchanged

### ⚠️ Considerations

1. **Symlinks require understanding** - AI agents might need guidance
2. **Two locations** - Original repo + symlink reference
3. **Windows compatibility** - WSL symlinks work, Windows needs admin for symlinks

---

## Alternative: Full Migration

If you prefer everything in new structure:

**After committing all work:**
```bash
cd /mnt/scratch/projects/

# Move everything into new structure
mv Evolution-3.1 01_Platform/evolution-3.1
mv Evolution_Guru 04_Intelligence/gemini-workspace
mv Evolution_Studio 05_Archive/evolution-studio
mv comfyui-mcp-server 03_Tools/mcp-servers/comfyui
mv gemini-mcp-server 03_Tools/mcp-servers/gemini

# Git still works - remotes are stored in .git/config
cd 01_Platform/evolution-3.1
git remote -v  # Still points to GitHub
```

**Pros:** Cleaner, everything truly in new structure  
**Cons:** Need to update any absolute paths in code

---

## Recommendation: Hybrid Approach

Use symlinks for **active Git repos** (Evolution-3.1, Evolution_Guru)  
Use moves for **everything else** (archives, non-Git tools)

This gives you:
- Clean new structure for navigation
- Safe Git operations in original locations
- Easy rollback if needed
- No risk of breaking Jules integration

---

## Next Steps

1. ✅ Review audit results (DONE)
2. ⏳ Commit Evolution-3.1 refactor (USE commit_evolution_3.1.sh)
3. ⏳ Review Evolution_Guru work (USE review_evolution_guru.sh)
4. ⏳ Commit Evolution_Guru changes
5. ⏳ Execute hybrid migration
6. ⏳ Verify all Git remotes still work
7. ⏳ Update DNA with final structure

---

**Status:** Ready for Phase 1 - Securing active work
