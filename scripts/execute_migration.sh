#!/bin/bash
# Evolution Stables - Hybrid Migration Script
# Creates new structure with symlinks for Git repos

set -e  # Exit on any error

echo "=========================================="
echo "Evolution Stables - Hybrid Migration"
echo "=========================================="
echo ""

BASE_DIR="/home/evo/projects"
cd "$BASE_DIR" || exit 1

# Safety check
echo "⚠️  PRE-FLIGHT CHECKS"
echo "--------------------"

# Check if Evolution-3.1 has uncommitted work
if [ -d "Evolution-3.1/.git" ]; then
    cd Evolution-3.1
    if [ -n "$(git status --porcelain)" ]; then
        echo "❌ Evolution-3.1 has uncommitted changes!"
        echo "   Run: ./00_DNA/workflows/commit_evolution_3.1.sh first"
        exit 1
    fi
    cd "$BASE_DIR"
fi

# Check if Evolution_Guru has uncommitted work
if [ -d "Evolution_Guru/.git" ]; then
    cd Evolution_Guru
    if [ -n "$(git status --porcelain)" ]; then
        echo "❌ Evolution_Guru has uncommitted changes!"
        echo "   Run: ./00_DNA/workflows/review_evolution_guru.sh first"
        exit 1
    fi
    cd "$BASE_DIR"
fi

echo "✅ All repos have clean working directories"
echo ""

# Show what will happen
echo "📋 MIGRATION PLAN"
echo "-----------------"
echo ""
echo "Will create:"
echo "  01_Platform/"
echo "  02_Content_Factory/"
echo "  03_Tools/mcp-servers/"
echo "  04_Intelligence/"
echo "  05_Archive/"
echo ""
echo "Symlinks (Git repos stay in place):"
echo "  01_Platform/evolution-3.1 → ../Evolution-3.1"
echo "  04_Intelligence/gemini-workspace → ../Evolution_Guru"
echo ""
echo "Moves (non-Git items):"
echo "  Evolution_Studio → 05_Archive/evolution-studio"
echo "  comfyui-mcp-server → 03_Tools/mcp-servers/comfyui"
echo "  gemini-mcp-server → 03_Tools/mcp-servers/gemini"
echo ""

read -p "Proceed with migration? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Migration cancelled"
    exit 0
fi

echo ""
echo "🚀 EXECUTING MIGRATION"
echo "----------------------"

# Create directory structure
echo "Creating directories..."
mkdir -p 01_Platform
mkdir -p 02_Content_Factory/{comfyui,workflows,output,templates}
mkdir -p 03_Tools/{mcp-servers,cli-tools,automation}
mkdir -p 04_Intelligence/{agent-configs,knowledge-base,skills}
mkdir -p 05_Archive
mkdir -p _scratch

echo "✅ Directories created"
echo ""

# Create symlinks for active Git repos
echo "Creating symlinks for Git repositories..."

if [ -d "Evolution-3.1" ]; then
    ln -sf ../Evolution-3.1 01_Platform/evolution-3.1
    echo "✅ Linked: 01_Platform/evolution-3.1 → Evolution-3.1"
fi

if [ -d "Asset_Generation" ]; then
    ln -sf ../Asset_Generation 02_Content_Factory/pipeline
    echo "✅ Linked: 02_Content_Factory/pipeline → Asset_Generation"
fi

if [ -d "Evolution-Studio-MCP" ]; then
    ln -sf ../Evolution-Studio-MCP 03_Tools/mcp-servers/evolution-studio
    echo "✅ Linked: 03_Tools/mcp-servers/evolution-studio → Evolution-Studio-MCP"
fi

if [ -d "Evolution_Guru" ]; then
    ln -sf ../Evolution_Guru 04_Intelligence/gemini-workspace
    echo "✅ Linked: 04_Intelligence/gemini-workspace → Evolution_Guru"
fi

if [ -d "ComfyUI" ]; then
    ln -sf ../ComfyUI 02_Content_Factory/comfyui-main
    echo "✅ Linked: 02_Content_Factory/comfyui-main → ComfyUI"
fi

echo ""

# Move non-Git items
echo "Moving non-Git items..."

if [ -d "Evolution_Studio" ]; then
    mv Evolution_Studio 05_Archive/evolution-studio
    echo "✅ Moved: Evolution_Studio → 05_Archive/evolution-studio"
fi

if [ -d "comfyui-mcp-server" ]; then
    mv comfyui-mcp-server 03_Tools/mcp-servers/comfyui
    echo "✅ Moved: comfyui-mcp-server → 03_Tools/mcp-servers/comfyui"
fi

if [ -d "gemini-mcp-server" ]; then
    mv gemini-mcp-server 03_Tools/mcp-servers/gemini
    echo "✅ Moved: gemini-mcp-server → 03_Tools/mcp-servers/gemini"
fi

echo ""

# Create README in _scratch
cat > _scratch/README.md << 'EOF'
# _scratch - Temporary Workspace

This folder is for experiments, temporary files, and work-in-progress that hasn't found its permanent home yet.

**Rules:**
- Nothing here is permanent
- Clean up weekly
- Don't commit large files
- Move completed work to proper folders

**Good for:**
- Testing new ideas
- Temporary downloads
- Quick experiments
- Debugging

**Not for:**
- Production code
- Important documents
- Large model files
- Anything you want to keep
EOF

echo "✅ Created _scratch/README.md"
echo ""

# Verification
echo "=========================================="
echo "✅ MIGRATION COMPLETE"
echo "=========================================="
echo ""
echo "New structure:"
tree -L 2 -d --noreport "$BASE_DIR" | head -30
echo ""

# Verify Git still works
echo "🔍 Verifying Git repositories..."
echo ""

if [ -d "Evolution-3.1/.git" ]; then
    cd Evolution-3.1
    echo "Evolution-3.1:"
    echo "  Remote: $(git remote get-url origin)"
    echo "  Branch: $(git branch --show-current)"
    cd "$BASE_DIR"
fi

if [ -d "Evolution_Guru/.git" ]; then
    cd Evolution_Guru
    echo "Evolution_Guru:"
    echo "  Remote: $(git remote get-url origin)"
    echo "  Branch: $(git branch --show-current)"
    cd "$BASE_DIR"
fi

echo ""
echo "=========================================="
echo "✅ ALL DONE"
echo "=========================================="
echo ""
echo "Your repos are still in their original locations with working Git remotes."
echo "The new structure uses symlinks for easy navigation."
echo ""
echo "Next steps:"
echo "1. Test Git operations: cd Evolution-3.1 && git pull"
echo "2. Update Jules codebase paths if needed"
echo "3. Verify all tools still work"
echo ""
