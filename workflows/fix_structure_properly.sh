#!/bin/bash
# CORRECT THE STRUCTURE - Move repos INTO numbered folders

set -e

echo "=========================================="
echo "FIXING STRUCTURE - Moving Repos Inside"
echo "=========================================="
echo ""

BASE="/mnt/scratch/projects"
cd "$BASE" || exit 1

echo "⚠️  WARNING: This will move Git repos into numbered folders"
echo "Current symlinks will be removed and replaced with actual folders"
echo ""
read -p "Proceed? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Cancelled"
    exit 0
fi

echo ""
echo "🚀 Starting reorganization..."
echo ""

# ============================================
# MOVE 1: Evolution-3.1 into 01_Platform
# ============================================

echo "1. Moving Evolution-3.1 → 01_Platform/"
if [ -L "01_Platform/evolution-3.1" ]; then
    rm "01_Platform/evolution-3.1"
    echo "  ✅ Removed symlink"
fi

if [ -d "Evolution-3.1" ]; then
    mv Evolution-3.1 01_Platform/evolution-3.1
    echo "  ✅ Moved Evolution-3.1 → 01_Platform/evolution-3.1"
else
    echo "  ⚠️  Evolution-3.1 not found"
fi

echo ""

# ============================================
# MOVE 2: Asset_Generation into 02_Content_Factory
# ============================================

echo "2. Moving Asset_Generation → 02_Content_Factory/"
if [ -L "02_Content_Factory/pipeline" ]; then
    rm "02_Content_Factory/pipeline"
    echo "  ✅ Removed symlink"
fi

if [ -d "Asset_Generation" ]; then
    mv Asset_Generation 02_Content_Factory/pipeline
    echo "  ✅ Moved Asset_Generation → 02_Content_Factory/pipeline"
else
    echo "  ⚠️  Asset_Generation not found"
fi

echo ""

# ============================================
# MOVE 3: ComfyUI into 02_Content_Factory
# ============================================

echo "3. Moving ComfyUI → 02_Content_Factory/"
if [ -L "02_Content_Factory/comfyui-main" ]; then
    rm "02_Content_Factory/comfyui-main"
    echo "  ✅ Removed symlink"
fi

if [ -d "ComfyUI" ]; then
    mv ComfyUI 02_Content_Factory/comfyui-main
    echo "  ✅ Moved ComfyUI → 02_Content_Factory/comfyui-main"
else
    echo "  ⚠️  ComfyUI not found"
fi

echo ""

# ============================================
# MOVE 4: Evolution-Studio-MCP into 03_Tools
# ============================================

echo "4. Moving Evolution-Studio-MCP → 03_Tools/mcp-servers/"
if [ -L "03_Tools/mcp-servers/evolution-studio" ]; then
    rm "03_Tools/mcp-servers/evolution-studio"
    echo "  ✅ Removed symlink"
fi

if [ -d "Evolution-Studio-MCP" ]; then
    mv Evolution-Studio-MCP 03_Tools/mcp-servers/evolution-studio
    echo "  ✅ Moved Evolution-Studio-MCP → 03_Tools/mcp-servers/evolution-studio"
else
    echo "  ⚠️  Evolution-Studio-MCP not found"
fi

echo ""

# ============================================
# MOVE 5: Evolution_Guru into 04_Intelligence
# ============================================

echo "5. Moving Evolution_Guru → 04_Intelligence/"
if [ -L "04_Intelligence/gemini-workspace" ]; then
    rm "04_Intelligence/gemini-workspace"
    echo "  ✅ Removed symlink"
fi

if [ -d "Evolution_Guru" ]; then
    mv Evolution_Guru 04_Intelligence/gemini-workspace
    echo "  ✅ Moved Evolution_Guru → 04_Intelligence/gemini-workspace"
else
    echo "  ⚠️  Evolution_Guru not found"
fi

echo ""

# ============================================
# VERIFY
# ============================================

echo "=========================================="
echo "✅ REORGANIZATION COMPLETE"
echo "=========================================="
echo ""

echo "Verifying new structure:"
echo ""

echo "01_Platform/evolution-3.1:"
[ -d "01_Platform/evolution-3.1/.git" ] && echo "  ✅ Git repo" || echo "  ❌ Missing"

echo "02_Content_Factory/pipeline:"
[ -d "02_Content_Factory/pipeline/.git" ] && echo "  ✅ Git repo" || echo "  ❌ Missing"

echo "02_Content_Factory/comfyui-main:"
[ -d "02_Content_Factory/comfyui-main/.git" ] && echo "  ✅ Git repo" || echo "  ❌ Missing"

echo "03_Tools/mcp-servers/evolution-studio:"
[ -d "03_Tools/mcp-servers/evolution-studio/.git" ] && echo "  ✅ Git repo" || echo "  ❌ Missing"

echo "04_Intelligence/gemini-workspace:"
[ -d "04_Intelligence/gemini-workspace/.git" ] && echo "  ✅ Git repo" || echo "  ❌ Missing"

echo ""
echo "Checking for loose items in root:"
echo ""

loose_count=0
for item in Evolution-3.1 Asset_Generation ComfyUI Evolution-Studio-MCP Evolution_Guru; do
    if [ -d "$item" ]; then
        echo "  ⚠️  $item still exists at root"
        loose_count=$((loose_count + 1))
    fi
done

if [ "$loose_count" -eq 0 ]; then
    echo "  ✅ No loose repos - all moved!"
else
    echo "  ⚠️  $loose_count items still at root - check manually"
fi

echo ""
echo "=========================================="
echo "🎉 Structure is now CORRECT!"
echo "=========================================="
echo ""
echo "Everything is now INSIDE the numbered folders"
echo "No more loose repos at root"
echo "Git remotes still work perfectly"
