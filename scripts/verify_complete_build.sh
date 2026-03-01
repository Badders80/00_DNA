#!/bin/bash
# Verify COMPLETE build - check actual contents vs expected

echo "=========================================="
echo "COMPLETE BUILD VERIFICATION"
echo "=========================================="
echo ""

BASE="/home/evo/projects"
cd "$BASE" || exit 1

# ============================================
# CHECK 1: DNA Completeness
# ============================================

echo "📚 DNA COMPLETENESS CHECK"
echo "-----------------------------------"
echo ""

echo "Expected DNA structure:"
cat << 'EOF'
00_DNA/
├── README.md                          ✓
├── INDEX.md                           ✓
├── QUICK_REFERENCE.md                 ✓
├── INFORMATION_GAPS.md                ✓
├── OPERATIONAL_CONFIG_DRAFT.md        ✓
├── DNA_POPULATION_STATUS.md           ✓
├── ACTION_PLAN.md                     ✓
├── REORGANIZATION_COMPLETE.md         ✓
├── READY_TO_BUILD.md                  ✓
├── CLEANUP_PLAN.md                    ✓
│
├── brand-identity/
│   ├── BRAND_VOICE.md                 ✓
│   └── visual/
│       └── VISUAL_SYSTEM.md           ✓
│
├── build-philosophy/
│   └── Master_Config_2026.md          ✓
│
├── system-prompts/
│   └── PROMPT_LIBRARY.md              ✓
│
└── workflows/
    ├── STANDARD_WORKFLOWS.md          ✓
    ├── MIGRATION_STRATEGY.md          ✓
    ├── audit_jules_repos.sh           ✓
    ├── comprehensive_audit.sh         ✓
    ├── fix_broken_items.sh            ✓
    └── (other scripts)                ✓
EOF

echo ""
echo "Checking actual DNA contents:"
echo ""

find 00_DNA -type f -name "*.md" | sort
echo ""
find 00_DNA -type f -name "*.sh" | sort

echo ""

# ============================================
# CHECK 2: Numbered Folders - Content Depth
# ============================================

echo ""
echo "🔍 NUMBERED FOLDERS - DEEP CONTENT CHECK"
echo "-----------------------------------"
echo ""

for folder in 01_Platform 02_Content_Factory 03_Tools 04_Intelligence 05_Archive; do
    echo "=== $folder ==="
    
    if [ -d "$folder" ]; then
        # Show structure 2 levels deep
        tree -L 2 "$folder" 2>/dev/null || find "$folder" -maxdepth 2 -type d | head -20
        
        # Count actual files vs symlinks
        total_items=$(find "$folder" -maxdepth 2 | wc -l)
        symlinks=$(find "$folder" -maxdepth 2 -type l | wc -l)
        files=$(find "$folder" -maxdepth 2 -type f | wc -l)
        dirs=$(find "$folder" -maxdepth 2 -type d | wc -l)
        
        echo ""
        echo "Stats: $total_items items ($symlinks symlinks, $files files, $dirs dirs)"
        echo ""
    else
        echo "❌ MISSING"
        echo ""
    fi
done

# ============================================
# CHECK 3: Original Repos - Are they complete?
# ============================================

echo ""
echo "📦 ORIGINAL REPOS - COMPLETENESS CHECK"
echo "-----------------------------------"
echo ""

for repo in Evolution-3.1 Asset_Generation Evolution-Studio-MCP Evolution_Guru ComfyUI; do
    echo "=== $repo ==="
    
    if [ -d "$repo" ]; then
        cd "$repo"
        
        # Check Git status
        if [ -d ".git" ]; then
            echo "Git: $(git branch --show-current)"
            uncommitted=$(git status --porcelain | wc -l)
            if [ "$uncommitted" -gt 0 ]; then
                echo "⚠️  $uncommitted uncommitted changes"
            else
                echo "✅ Clean working directory"
            fi
        fi
        
        # Check for key files
        echo "Key files:"
        [ -f "package.json" ] && echo "  ✓ package.json"
        [ -f "README.md" ] && echo "  ✓ README.md"
        [ -f "pyproject.toml" ] || [ -f "requirements.txt" ] && echo "  ✓ Python deps"
        [ -d "node_modules" ] && echo "  ✓ node_modules installed"
        [ -d "venv" ] && echo "  ✓ venv exists"
        
        # Check size
        size=$(du -sh . 2>/dev/null | cut -f1)
        echo "Size: $size"
        
        cd "$BASE"
        echo ""
    else
        echo "❌ MISSING"
        echo ""
    fi
done

# ============================================
# CHECK 4: Models Directory
# ============================================

echo ""
echo "🤖 MODELS DIRECTORY - WHAT'S ACTUALLY THERE?"
echo "-----------------------------------"
echo ""

if [ -d "/home/evo/models" ]; then
    echo "Total models size: $(du -sh /home/evo/models | cut -f1)"
    echo ""
    echo "Files in models root:"
    ls -lh /home/evo/models/*.safetensors 2>/dev/null | wc -l | xargs echo "  .safetensors files:"
    echo ""
    
    echo "Subdirectories:"
    for dir in /home/evo/models/*/; do
        if [ -d "$dir" ]; then
            dirname=$(basename "$dir")
            file_count=$(find "$dir" -type f | wc -l)
            size=$(du -sh "$dir" | cut -f1)
            echo "  $dirname: $file_count files, $size"
        fi
    done
else
    echo "❌ /home/evo/models doesn't exist"
fi

echo ""

# ============================================
# CHECK 5: Missing Critical Items?
# ============================================

echo ""
echo "🔍 MISSING CRITICAL ITEMS CHECK"
echo "-----------------------------------"
echo ""

critical_missing=()

# Check for node_modules in key projects
if [ ! -d "Evolution-3.1/node_modules" ]; then
    critical_missing+=("Evolution-3.1 node_modules - run npm install")
fi

# Check for venv in Python projects
if [ ! -d "Asset_Generation/venv" ] && [ -f "Asset_Generation/requirements.txt" ]; then
    critical_missing+=("Asset_Generation venv - run python -m venv venv")
fi

# Check for ComfyUI custom nodes
if [ -d "ComfyUI/custom_nodes" ]; then
    custom_node_count=$(ls -1 ComfyUI/custom_nodes | wc -l)
    echo "✅ ComfyUI has $custom_node_count custom nodes"
else
    critical_missing+=("ComfyUI custom_nodes directory")
fi

# Check for actual models
model_count=$(find /home/evo/models -name "*.safetensors" -o -name "*.ckpt" -o -name "*.gguf" 2>/dev/null | wc -l)
if [ "$model_count" -eq 0 ]; then
    critical_missing+=("⚠️  NO AI MODELS FOUND in /home/evo/models")
fi

echo ""
if [ ${#critical_missing[@]} -eq 0 ]; then
    echo "✅ All critical items present"
else
    echo "⚠️  Missing critical items:"
    printf '%s\n' "${critical_missing[@]}" | sed 's/^/  - /'
fi

echo ""

# ============================================
# CHECK 6: What's NOT in the build?
# ============================================

echo ""
echo "❓ WHAT'S NOT IN THIS BUILD?"
echo "-----------------------------------"
echo ""

echo "Items that exist in S: root but NOT in projects/:"
echo ""

# Check S: drive root
if [ -d "/home/evo" ]; then
    echo "S: drive root contents:"
    ls -1 /home/evo | while read item; do
        if [ "$item" != "projects" ]; then
            if [ -d "/home/evo/$item" ]; then
                size=$(du -sh "/home/evo/$item" 2>/dev/null | cut -f1)
                echo "  $item/ - $size"
            else
                echo "  $item (file)"
            fi
        fi
    done
else
    echo "❌ Cannot access /home/evo"
fi

echo ""

# ============================================
# CHECK 7: Build Completeness Score
# ============================================

echo ""
echo "📊 BUILD COMPLETENESS SCORE"
echo "-----------------------------------"
echo ""

score=0
max_score=100

# DNA (20 points)
dna_docs=$(find 00_DNA -name "*.md" | wc -l)
if [ "$dna_docs" -ge 15 ]; then
    score=$((score + 20))
    echo "✅ DNA: 20/20 (Well documented)"
else
    score=$((score + 10))
    echo "⚠️  DNA: 10/20 (Incomplete documentation)"
fi

# Folder structure (20 points)
folders_exist=0
for f in 00_DNA 01_Platform 02_Content_Factory 03_Tools 04_Intelligence 05_Archive; do
    [ -d "$f" ] && folders_exist=$((folders_exist + 1))
done
if [ "$folders_exist" -eq 6 ]; then
    score=$((score + 20))
    echo "✅ Structure: 20/20 (All folders present)"
else
    score=$((score + 10))
    echo "⚠️  Structure: 10/20 (Missing folders)"
fi

# Git repos (20 points)
repos_present=0
for r in Evolution-3.1 Asset_Generation Evolution-Studio-MCP Evolution_Guru ComfyUI; do
    [ -d "$r/.git" ] && repos_present=$((repos_present + 1))
done
repo_score=$((repos_present * 4))
score=$((score + repo_score))
echo "✅ Git Repos: $repo_score/20 ($repos_present/5 repos present)"

# Dependencies installed (20 points)
deps_score=0
[ -d "Evolution-3.1/node_modules" ] && deps_score=$((deps_score + 10))
[ -d "ComfyUI/custom_nodes" ] && deps_score=$((deps_score + 10))
score=$((score + deps_score))
if [ "$deps_score" -eq 20 ]; then
    echo "✅ Dependencies: 20/20 (Installed)"
else
    echo "⚠️  Dependencies: $deps_score/20 (Need installation)"
fi

# AI Models (20 points)
if [ "$model_count" -gt 0 ]; then
    score=$((score + 20))
    echo "✅ AI Models: 20/20 ($model_count models found)"
else
    echo "❌ AI Models: 0/20 (No models found)"
fi

echo ""
echo "=========================================="
echo "TOTAL SCORE: $score/100"
echo "=========================================="
echo ""

if [ "$score" -ge 90 ]; then
    echo "🎉 EXCELLENT - Build is production ready!"
elif [ "$score" -ge 70 ]; then
    echo "✅ GOOD - Build is functional, minor items needed"
elif [ "$score" -ge 50 ]; then
    echo "⚠️  FAIR - Build works but missing key components"
else
    echo "❌ INCOMPLETE - Significant work needed"
fi

echo ""
echo "Next steps based on score:"
if [ "$score" -lt 100 ]; then
    echo "1. Install missing dependencies"
    echo "2. Download required AI models"
    echo "3. Complete any missing documentation"
fi
