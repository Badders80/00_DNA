#!/bin/bash
# COMPLETE S: DRIVE AUDIT - EVERYTHING

echo "=========================================="
echo "COMPLETE S: DRIVE AUDIT"
echo "=========================================="
echo ""

# ============================================
# PART 1: S: Drive Root - What's There?
# ============================================

echo "📊 S: DRIVE ROOT (/mnt/scratch/)"
echo "-----------------------------------"
cd /mnt/scratch || exit 1

for item in */; do
    name=$(basename "$item")
    size=$(du -sh "$item" 2>/dev/null | cut -f1)
    file_count=$(find "$item" -type f 2>/dev/null | wc -l)
    
    echo "$name: $size ($file_count files)"
done

echo ""

# ============================================
# PART 2: Projects Folder - EVERYTHING
# ============================================

echo "📁 PROJECTS FOLDER - COMPLETE INVENTORY"
echo "-----------------------------------"
cd /mnt/scratch/projects || exit 1

echo ""
echo "Root level items:"
ls -la | tail -n +4

echo ""
echo ""

# ============================================
# PART 3: Check EVERY numbered folder
# ============================================

for folder in 00_DNA 01_Platform 02_Content_Factory 03_Tools 04_Intelligence 05_Archive; do
    echo "=========================================="
    echo "$folder - COMPLETE CONTENTS"
    echo "=========================================="
    
    if [ -d "$folder" ]; then
        cd "$folder"
        
        # Show everything
        find . -maxdepth 3 -type d | sort
        
        echo ""
        echo "Stats:"
        echo "  Total items: $(find . | wc -l)"
        echo "  Directories: $(find . -type d | wc -l)"
        echo "  Files: $(find . -type f | wc -l)"
        echo "  Symlinks: $(find . -type l | wc -l)"
        echo "  Size: $(du -sh . 2>/dev/null | cut -f1)"
        
        # Check for Git repos
        git_repos=$(find . -name ".git" -type d | wc -l)
        if [ "$git_repos" -gt 0 ]; then
            echo "  Git repos: $git_repos"
            find . -name ".git" -type d | sed 's|/.git||' | sed 's|^./||'
        fi
        
        # Check for empty folders
        empty=$(find . -type d -empty | wc -l)
        if [ "$empty" -gt 0 ]; then
            echo "  ⚠️  Empty folders: $empty"
            find . -type d -empty | sed 's|^./||'
        fi
        
        cd /mnt/scratch/projects
        echo ""
    else
        echo "❌ MISSING"
        echo ""
    fi
done

# ============================================
# PART 4: Find ALL loose repos
# ============================================

echo "=========================================="
echo "LOOSE ITEMS IN ROOT"
echo "=========================================="
echo ""

cd /mnt/scratch/projects

for item in *; do
    # Skip numbered folders and system items
    if [[ ! "$item" =~ ^0[0-9]_ ]] && [[ "$item" != "_scratch" ]] && [[ "$item" != "lib64" ]] && [[ "$item" != ".npm-global" ]] && [[ "$item" != ".gemini.md" ]]; then
        if [ -d "$item" ]; then
            size=$(du -sh "$item" 2>/dev/null | cut -f1)
            
            if [ -d "$item/.git" ]; then
                cd "$item"
                branch=$(git branch --show-current 2>/dev/null)
                remote=$(git remote get-url origin 2>/dev/null)
                echo "📦 $item (Git repo)"
                echo "   Size: $size"
                echo "   Branch: $branch"
                echo "   Remote: $remote"
                echo "   ⚠️  SHOULD BE INSIDE A NUMBERED FOLDER"
                cd ..
            else
                echo "📁 $item (folder)"
                echo "   Size: $size"
                echo "   ⚠️  LOOSE ITEM"
            fi
            echo ""
        fi
    fi
done

# ============================================
# PART 5: Find DUPLICATES
# ============================================

echo "=========================================="
echo "DUPLICATE / CONFLICTING ITEMS"
echo "=========================================="
echo ""

# Check for ComfyUI variations
echo "ComfyUI variations:"
find . -maxdepth 3 -iname "*comfy*" -type d
echo ""

# Check for Evolution variations
echo "Evolution variations:"
find . -maxdepth 3 -iname "*evolution*" -type d
echo ""

# Check for Asset variations
echo "Asset/Content variations:"
find . -maxdepth 3 -iname "*asset*" -o -iname "*content*" -type d | head -20
echo ""

# ============================================
# PART 6: What needs to move WHERE
# ============================================

echo "=========================================="
echo "REQUIRED MOVES"
echo "=========================================="
echo ""

moves_needed=()

# Check Evolution-3.1
if [ -d "Evolution-3.1" ] && [ ! -d "01_Platform/evolution-3.1/.git" ]; then
    moves_needed+=("Evolution-3.1 → 01_Platform/evolution-3.1")
fi

# Check Asset_Generation
if [ -d "Asset_Generation" ] && [ ! -d "02_Content_Factory/pipeline/.git" ]; then
    moves_needed+=("Asset_Generation → 02_Content_Factory/pipeline")
fi

# Check ComfyUI
if [ -d "ComfyUI" ] && [ ! -d "02_Content_Factory/comfyui-main/.git" ]; then
    moves_needed+=("ComfyUI → 02_Content_Factory/comfyui-main")
fi

# Check Evolution_Guru
if [ -d "Evolution_Guru" ] && [ ! -d "04_Intelligence/gemini-workspace/.git" ]; then
    moves_needed+=("Evolution_Guru → 04_Intelligence/gemini-workspace")
fi

# Check Evolution-Studio-MCP
if [ -d "Evolution-Studio-MCP" ] && [ ! -d "03_Tools/mcp-servers/evolution-studio/.git" ]; then
    moves_needed+=("Evolution-Studio-MCP → 03_Tools/mcp-servers/evolution-studio")
fi

if [ ${#moves_needed[@]} -eq 0 ]; then
    echo "✅ All repos are in correct locations"
else
    echo "⚠️  Moves needed:"
    printf '%s\n' "${moves_needed[@]}" | sed 's/^/  /'
fi

echo ""

# ============================================
# SUMMARY
# ============================================

echo "=========================================="
echo "SUMMARY"
echo "=========================================="
echo ""

echo "S: Drive usage:"
cd /mnt/scratch
total_size=$(du -sh . 2>/dev/null | cut -f1)
echo "  Total: $total_size"
echo ""

echo "Projects folder:"
cd /mnt/scratch/projects
projects_size=$(du -sh . 2>/dev/null | cut -f1)
echo "  Size: $projects_size"
echo "  Numbered folders: $(ls -d 0*/ 2>/dev/null | wc -l)/6"
echo "  Loose items: ${#moves_needed[@]}"
echo ""

echo "Action required:"
if [ ${#moves_needed[@]} -gt 0 ]; then
    echo "  1. Move ${#moves_needed[@]} loose repos into numbered folders"
fi

empty_count=$(find 0*/ -type d -empty 2>/dev/null | wc -l)
if [ "$empty_count" -gt 0 ]; then
    echo "  2. Populate $empty_count empty folders"
fi

echo "  3. Review S: drive root structure"
echo "  4. Set up Obsidian in knowledge-base"
echo "  5. Verify no duplicates exist"
