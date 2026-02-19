#!/bin/bash
# FINAL FIX - Clean up ALL issues at once

set -e

echo "=========================================="
echo "FINAL CLEANUP - Fixing All Issues"
echo "=========================================="
echo ""

cd /home/evo/projects || exit 1

# ============================================
# FIX 1: Find and move Evolution-3.1
# ============================================

echo "🔍 FIX 1: Finding Evolution-3.1"
echo "-----------------------------------"

# Check if it exists anywhere
if [ -d "Evolution-3.1" ]; then
    echo "Found at root - moving to 01_Platform/"
    rm -rf 01_Platform/evolution-3.1 2>/dev/null
    mv Evolution-3.1 01_Platform/evolution-3.1
    echo "✅ Moved Evolution-3.1"
else
    echo "⚠️  Evolution-3.1 not found at root"
    
    # Check if already in place
    if [ -d "01_Platform/evolution-3.1/.git" ]; then
        echo "✅ Already in 01_Platform/"
    else
        echo "❌ Evolution-3.1 MISSING - needs investigation"
    fi
fi

echo ""

# ============================================
# FIX 2: Remove duplicate empty comfyui folder
# ============================================

echo "🗑️  FIX 2: Removing duplicate ComfyUI folders"
echo "-----------------------------------"

if [ -d "02_Content_Factory/comfyui" ]; then
    # Check if it's empty
    count=$(find 02_Content_Factory/comfyui -type f | wc -l)
    if [ "$count" -eq 0 ]; then
        rmdir 02_Content_Factory/comfyui
        echo "✅ Removed empty comfyui folder"
    else
        echo "⚠️  comfyui has $count files - review manually"
    fi
else
    echo "✅ No duplicate comfyui folder"
fi

# Check if ComfyUI exists at root
if [ -d "ComfyUI" ]; then
    echo "⚠️  ComfyUI still at root - moving"
    rm -rf 02_Content_Factory/comfyui-main 2>/dev/null
    mv ComfyUI 02_Content_Factory/comfyui-main
    echo "✅ Moved ComfyUI"
fi

echo ""

# ============================================
# FIX 3: Remove ALL empty placeholder folders
# ============================================

echo "🧹 FIX 3: Removing empty folders"
echo "-----------------------------------"

# Remove empty folders but keep the structure folders themselves
find 02_Content_Factory 03_Tools 04_Intelligence -mindepth 1 -maxdepth 1 -type d -empty -delete 2>/dev/null
echo "✅ Removed empty placeholder folders"

echo ""

# ============================================
# FIX 4: Check for any remaining loose items
# ============================================

echo "🔍 FIX 4: Checking for loose items"
echo "-----------------------------------"

loose=0
for item in *; do
    if [[ ! "$item" =~ ^0[0-9]_ ]] && [[ "$item" != "_scratch" ]] && [[ "$item" != "lib64" ]] && [[ "$item" != ".npm-global" ]] && [[ "$item" != ".gemini.md" ]]; then
        if [ -d "$item" ]; then
            echo "⚠️  Loose item: $item"
            loose=$((loose + 1))
        fi
    fi
done

if [ "$loose" -eq 0 ]; then
    echo "✅ No loose items"
fi

echo ""

# ============================================
# VERIFICATION
# ============================================

echo "=========================================="
echo "✅ FINAL VERIFICATION"
echo "=========================================="
echo ""

echo "Checking structure:"
echo ""

# Check 01_Platform
if [ -d "01_Platform/evolution-3.1/.git" ]; then
    size=$(du -sh 01_Platform/evolution-3.1 | cut -f1)
    echo "✅ 01_Platform/evolution-3.1: $size"
else
    echo "❌ 01_Platform/evolution-3.1: MISSING"
fi

# Check 02_Content_Factory
if [ -d "02_Content_Factory/comfyui-main/.git" ]; then
    size=$(du -sh 02_Content_Factory/comfyui-main | cut -f1)
    echo "✅ 02_Content_Factory/comfyui-main: $size"
else
    echo "❌ 02_Content_Factory/comfyui-main: MISSING"
fi

if [ -d "02_Content_Factory/pipeline/.git" ]; then
    size=$(du -sh 02_Content_Factory/pipeline | cut -f1)
    echo "✅ 02_Content_Factory/pipeline: $size"
else
    echo "❌ 02_Content_Factory/pipeline: MISSING"
fi

# Check 03_Tools
if [ -d "03_Tools/mcp-servers/evolution-studio/.git" ]; then
    echo "✅ 03_Tools/mcp-servers/evolution-studio"
else
    echo "❌ 03_Tools/mcp-servers/evolution-studio: MISSING"
fi

# Check 04_Intelligence
if [ -d "04_Intelligence/gemini-workspace/.git" ]; then
    size=$(du -sh 04_Intelligence/gemini-workspace | cut -f1)
    echo "✅ 04_Intelligence/gemini-workspace: $size"
else
    echo "❌ 04_Intelligence/gemini-workspace: MISSING"
fi

echo ""
echo "Root contents:"
ls -1 | grep -v "^0[0-9]_" | grep -v "^_scratch" | grep -v "^lib64" | grep -v "^\\.npm-global" | grep -v "^\\.gemini"

echo ""
echo "=========================================="
echo "🎉 CLEANUP COMPLETE"
echo "=========================================="
