# S Drive Cleanup & Population Plan

**Date:** 2026-01-27  
**Goal:** Clean up loose items, populate DNA properly, ensure AI-agnostic structure

---

## 🗂️ S: Drive Structure (Current)

```
S:\ (or /home/evo/)
├── _archive/                    # Old archive folder
├── 04_Core_Infrastructure/      # What's in here?
├── models/                      # AI models (keep here)
├── projects/                    # ← Our newly organized area
├── vault/                       # Secure storage (keep here)
├── venv/                        # Python environments (keep here)
├── WSL/                         # WSL-specific files
└── wsl-swap                     # Swap file (needed)
```

---

## 📋 Cleanup Actions Needed

### In `/home/evo/projects/`

**Keep as-is (working structure):**
- ✅ `00_DNA/` through `05_Archive/`
- ✅ `Asset_Generation/`, `ComfyUI/`, `Evolution-3.1/`, etc. (original repos)
- ✅ `_scratch/` (temp workspace)

**Move/Organize these loose items:**

1. **`.npm-global/`** 
   - Current: Root of projects
   - Should be: System-level (leave at `/home/evo/projects/.npm-global`)
   - Action: Keep here (needed for global npm packages)

2. **`.planning/`**
   - Current: Root of projects  
   - Should be: Either in `00_DNA/workflows/` or delete if obsolete
   - Action: Review contents first

3. **`.gemini.md`** (file)
   - Current: Root of projects
   - Should be: Stay here (Gemini reads from workspace root)
   - Action: Keep here (working as designed)

4. **`brand_voice`** (symlink)
   - Current: Symlink to `/home/evo/vault/brand_voice`
   - Should be: Copy actual content into `00_DNA/brand-identity/`
   - Action: Extract and document in DNA

5. **`lib64`** (symlink)
   - Current: System library symlink
   - Action: Keep (system requirement)

---

## 🎯 Population Tasks

### 1. Extract Brand Voice Content

```bash
# Read the actual brand_voice content
cat /home/evo/vault/brand_voice > /home/evo/projects/00_DNA/brand-identity/BRAND_VOICE_ORIGINAL.md

# Compare with what we created
diff /home/evo/projects/00_DNA/brand-identity/BRAND_VOICE.md \
     /home/evo/projects/00_DNA/brand-identity/BRAND_VOICE_ORIGINAL.md
```

### 2. Review .planning Folder

```bash
# Check what's in .planning
ls -la /home/evo/projects/.planning/

# If useful: Move to DNA
# If obsolete: Delete or archive
```

### 3. Organize Vault Content

```bash
# Check what's in vault
ls -la /home/evo/vault/

# Should contain:
# - Sensitive configs (.env backups)
# - API keys
# - Credentials
# - Brand assets (if not in DNA yet)
```

### 4. Review 04_Core_Infrastructure

```bash
# Check what's in there
ls -la /home/evo/04_Core_Infrastructure/

# Determine if it should:
# - Stay at S: root (infrastructure-level)
# - Move into projects structure
# - Be archived
```

---

## 🤖 AI-Agnostic Structure Verification

### Current AI-Agnostic Elements ✅

**DNA System Prompts:**
- ✅ Separate configs for Claude, Gemini, ChatGPT, Jules
- ✅ Universal context block works with any AI
- ✅ No hardcoded platform assumptions

**Project Structure:**
- ✅ Standard folder names (not "claude-workspace" or "chatgpt-only")
- ✅ MCP servers work with any compatible client
- ✅ Git repos accessible by any agent

**Documentation:**
- ✅ Markdown files (universal format)
- ✅ No proprietary formats
- ✅ Clear, human-readable

### Potential Issues to Fix ⚠️

**Platform-Specific Items:**
1. **`.gemini.md`** - Gemini-specific, but okay (stays in root)
2. **`jules_workspace/`** - If exists, should be generic "04_Intelligence/"
3. **Any Claude-only MCP configs** - Should work with any MCP client

---

## 📊 Alignment: S: Drive vs Projects

### Root Level (S:\)

**Should stay at root:**
- `models/` - Shared across all projects
- `vault/` - Secure credentials storage
- `venv/` - Python environments (or move into projects?)
- `WSL/` - System-level WSL files
- `wsl-swap` - Swap file (required)
- `04_Core_Infrastructure/` - If truly infrastructure-level

**Projects-specific:**
- `projects/` - Everything we organized (perfect)

### Recommendation: Two-Tier Structure

```
/home/evo/                      # S: Drive Root
│
├── infrastructure/                # Infrastructure-level (rename 04_Core_Infrastructure?)
│   ├── networking/
│   ├── security/
│   └── monitoring/
│
├── models/                        # Shared AI models
├── vault/                         # Sensitive data
├── venv/                          # OR move to projects?
├── WSL/                           # System files
├── wsl-swap                       # Swap file
│
└── projects/                      # Application-level
    ├── 00_DNA/                    # Standards
    ├── 01_Platform/               # Evolution platform
    ├── 02_Content_Factory/        # Content generation
    ├── 03_Tools/                  # MCP servers, utilities
    ├── 04_Intelligence/           # AI workspaces
    └── 05_Archive/                # Old projects
```

---

## 🔧 Execution Script

```bash
#!/bin/bash
# Cleanup and populate DNA

echo "=== Cleanup & Population ==="

# 1. Extract brand voice
if [ -f /home/evo/vault/brand_voice ]; then
    cp /home/evo/vault/brand_voice \
       /home/evo/projects/00_DNA/brand-identity/BRAND_VOICE_ORIGINAL.md
    echo "✅ Extracted brand voice"
fi

# 2. Check .planning
if [ -d /home/evo/projects/.planning ]; then
    echo "📁 .planning contents:"
    ls -la /home/evo/projects/.planning/
    echo "Review and decide: keep, move to DNA, or delete"
fi

# 3. Review 04_Core_Infrastructure
if [ -d /home/evo/04_Core_Infrastructure ]; then
    echo "📁 04_Core_Infrastructure contents:"
    ls -la /home/evo/04_Core_Infrastructure/
    echo "Decide: keep at root, move to projects, or archive"
fi

# 4. Check vault contents
echo "📁 Vault contents:"
ls -la /home/evo/vault/

# 5. Verify AI-agnostic structure
echo ""
echo "=== AI-Agnostic Check ==="
echo "✅ DNA has separate prompts for each platform"
echo "✅ Folder structure uses generic names"
echo "✅ MCP servers are platform-agnostic"

echo ""
echo "=== Manual Review Needed ==="
echo "1. Review .planning/ contents"
echo "2. Decide on 04_Core_Infrastructure location"
echo "3. Compare brand voice files"
echo "4. Organize vault contents"
```

---

## ✅ AI-Agnostic Checklist

### Folder Structure
- [ ] No platform-specific folder names
- [ ] Generic naming (not "claude-only", "chatgpt-workspace")
- [ ] Clear purpose-based organization

### Documentation
- [ ] Universal markdown format
- [ ] No proprietary file types
- [ ] Works with any text editor/AI

### Configurations
- [ ] Separate configs per platform in `00_DNA/system-prompts/`
- [ ] Universal context block that any AI can use
- [ ] No hardcoded platform assumptions

### Tools
- [ ] MCP servers follow standard protocol
- [ ] Scripts use standard tools (bash, python)
- [ ] No platform-locked dependencies

---

## 🎯 Next Steps

1. **Run cleanup script** to extract brand voice
2. **Review .planning/** and decide its fate
3. **Check 04_Core_Infrastructure/** location
4. **Organize vault/** if needed
5. **Verify all DNA folders have README.md** for discoverability
6. **Test with different AI platforms** to confirm agnostic design

---

**Ready to execute? Let me know which items you want to tackle first!**
