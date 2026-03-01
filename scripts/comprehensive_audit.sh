#!/bin/bash
# Evolution Stables - Comprehensive Audit & Setup
# Ensures all folders have PURPOSE and CONTENT

set -e

echo "=========================================="
echo "Evolution Stables - Comprehensive Audit"
echo "=========================================="
echo ""

BASE="/home/evo/projects"
cd "$BASE" || exit 1

# ============================================
# PART 1: Check What Actually Exists
# ============================================

echo "📋 PART 1: Current State Analysis"
echo "-----------------------------------"
echo ""

echo "Folders that exist:"
ls -d */ 2>/dev/null | sort

echo ""
echo "Files in root:"
ls -p | grep -v / | sort

echo ""
echo ""

# ============================================
# PART 2: Check Folder Contents
# ============================================

echo "📊 PART 2: Content Analysis"
echo "-----------------------------------"
echo ""

for dir in 00_DNA 01_Platform 02_Content_Factory 03_Tools 04_Intelligence 05_Archive; do
    if [ -d "$dir" ]; then
        echo "✅ $dir exists"
        item_count=$(find "$dir" -mindepth 1 | wc -l)
        echo "   Items inside: $item_count"
        
        # Check if it's just symlinks or has real content
        if [ -L "$dir" ]; then
            echo "   ⚠️  This is a symlink"
        fi
    else
        echo "❌ $dir missing - needs creation"
    fi
    echo ""
done

echo ""
echo ""

# ============================================
# PART 3: Check Original Repos
# ============================================

echo "📦 PART 3: Original Repository Status"
echo "-----------------------------------"
echo ""

for repo in Asset_Generation ComfyUI Evolution-3.1 Evolution-Studio-MCP Evolution_Guru; do
    if [ -d "$repo" ]; then
        echo "✅ $repo exists"
        size=$(du -sh "$repo" 2>/dev/null | cut -f1)
        echo "   Size: $size"
        
        if [ -d "$repo/.git" ]; then
            cd "$repo"
            echo "   Git: $(git branch --show-current)"
            echo "   Remote: $(git remote get-url origin 2>/dev/null || echo 'none')"
            cd "$BASE"
        fi
    else
        echo "❌ $repo missing"
    fi
    echo ""
done

echo ""
echo ""

# ============================================
# PART 4: Check Models Directory
# ============================================

echo "🤖 PART 4: Models Directory"
echo "-----------------------------------"
echo ""

if [ -d "/home/evo/models" ]; then
    echo "✅ /home/evo/models exists"
    echo ""
    echo "Subdirectories:"
    ls -d /home/evo/models/*/ 2>/dev/null | while read dir; do
        dirname=$(basename "$dir")
        size=$(du -sh "$dir" 2>/dev/null | cut -f1)
        file_count=$(find "$dir" -type f | wc -l)
        
        echo "  $dirname: $size ($file_count files)"
        
        if [ "$file_count" -eq 0 ]; then
            echo "    ⚠️  EMPTY FOLDER - Should delete or populate"
        fi
    done
else
    echo "❌ /home/evo/models missing"
fi

echo ""
echo ""

# ============================================
# PART 5: Google ADK Check
# ============================================

echo "🔍 PART 5: Google ADK Status"
echo "-----------------------------------"
echo ""

# Check for Gemini CLI
if command -v gemini &> /dev/null; then
    echo "✅ Gemini CLI installed"
    gemini --version 2>/dev/null || echo "   (version check failed)"
else
    echo "❌ Gemini CLI not found"
    echo "   Install: npm install -g @google/generative-ai-cli"
fi

echo ""

# Check for ADK in Evolution_Guru
if [ -d "Evolution_Guru" ]; then
    echo "Checking Evolution_Guru for ADK:"
    
    if [ -d "Evolution_Guru/.adk" ]; then
        echo "✅ .adk directory found"
        
        # Count ADK agents
        agent_count=$(find Evolution_Guru -type d -name ".adk" | wc -l)
        echo "   ADK agents: $agent_count"
    else
        echo "❌ No .adk directory - ADK not set up"
    fi
    
    # Check for ADK config files
    if [ -f "Evolution_Guru/adk.config.json" ] || [ -f "Evolution_Guru/.adk/config.json" ]; then
        echo "✅ ADK config found"
    else
        echo "❌ No ADK config found"
    fi
fi

echo ""
echo ""

# ============================================
# PART 6: Check .planning and loose items
# ============================================

echo "📁 PART 6: Loose Items Review"
echo "-----------------------------------"
echo ""

if [ -d ".planning" ]; then
    echo ".planning/ contents:"
    ls -lah .planning/ | head -20
    echo ""
    plan_size=$(du -sh .planning 2>/dev/null | cut -f1)
    echo "Size: $plan_size"
    echo "Action needed: Review and move to DNA or delete"
else
    echo "✅ .planning/ doesn't exist (good)"
fi

echo ""

if [ -L "brand_voice" ]; then
    echo "brand_voice symlink points to:"
    readlink brand_voice
    
    actual_file=$(readlink -f brand_voice)
    if [ -f "$actual_file" ]; then
        echo "✅ Target file exists"
        wc -l "$actual_file" | awk '{print "   Lines: " $1}'
        echo "Action needed: Copy content to DNA"
    else
        echo "❌ Target file missing (broken symlink)"
    fi
else
    echo "✅ brand_voice symlink doesn't exist (good if already in DNA)"
fi

echo ""
echo ""

# ============================================
# PART 7: Purpose Check
# ============================================

echo "🎯 PART 7: Purpose Verification"
echo "-----------------------------------"
echo ""

echo "Checking if folders serve their intended purpose:"
echo ""

# 00_DNA should have docs
if [ -d "00_DNA" ]; then
    md_count=$(find 00_DNA -name "*.md" | wc -l)
    sh_count=$(find 00_DNA -name "*.sh" | wc -l)
    echo "00_DNA: $md_count markdown docs, $sh_count scripts"
    if [ "$md_count" -lt 5 ]; then
        echo "  ⚠️  Should have more documentation"
    else
        echo "  ✅ Well documented"
    fi
fi

# 01_Platform should point to Evolution-3.1
if [ -d "01_Platform" ]; then
    if [ -L "01_Platform/evolution-3.1" ]; then
        echo "01_Platform: ✅ Symlink to Evolution-3.1 exists"
    else
        echo "01_Platform: ❌ Missing Evolution-3.1 symlink"
    fi
fi

# 02_Content_Factory should have ComfyUI and Asset_Generation
if [ -d "02_Content_Factory" ]; then
    has_comfy=$([ -L "02_Content_Factory/comfyui-main" ] && echo "yes" || echo "no")
    has_assets=$([ -L "02_Content_Factory/pipeline" ] && echo "yes" || echo "no")
    echo "02_Content_Factory:"
    echo "  ComfyUI link: $has_comfy"
    echo "  Pipeline link: $has_assets"
fi

# 03_Tools should have MCP servers
if [ -d "03_Tools/mcp-servers" ]; then
    mcp_count=$(ls -1 03_Tools/mcp-servers/ 2>/dev/null | wc -l)
    echo "03_Tools: $mcp_count MCP servers"
fi

# 04_Intelligence should have Gemini workspace
if [ -d "04_Intelligence" ]; then
    if [ -L "04_Intelligence/gemini-workspace" ]; then
        echo "04_Intelligence: ✅ Gemini workspace linked"
    else
        echo "04_Intelligence: ❌ Missing Gemini workspace"
    fi
fi

echo ""
echo ""

# ============================================
# SUMMARY
# ============================================

echo "=========================================="
echo "SUMMARY & RECOMMENDATIONS"
echo "=========================================="
echo ""

echo "✅ = Working correctly"
echo "⚠️  = Needs attention"
echo "❌ = Missing or broken"
echo ""

echo "Next steps:"
echo "1. Fix any broken symlinks"
echo "2. Delete empty model folders (or populate them)"
echo "3. Move .planning to DNA or delete"
echo "4. Copy brand_voice to DNA"
echo "5. Set up Google ADK if not configured"
echo "6. Ensure all numbered folders have PURPOSE"
echo ""

echo "Run specific fixes with:"
echo "  ./fix_broken_items.sh  (to be created based on findings)"
