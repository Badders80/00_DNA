#!/bin/bash
# Clone missing Jules repositories

echo "=========================================="
echo "Cloning Missing Jules Repositories"
echo "=========================================="
echo ""

BASE_DIR="/mnt/scratch/projects"
cd "$BASE_DIR" || exit 1

echo "🔍 Checking for missing repos..."
echo ""

# Asset_Generation
if [ ! -d "Asset_Generation" ]; then
    echo "📦 Cloning Asset_Generation..."
    git clone https://github.com/Badders80/Asset_Generation.git
    echo "✅ Asset_Generation cloned"
else
    echo "✅ Asset_Generation already exists"
fi

echo ""

# Evolution-Studio-MCP
if [ ! -d "Evolution-Studio-MCP" ]; then
    echo "📦 Cloning Evolution-Studio-MCP..."
    git clone https://github.com/Badders80/Evolution-Studio-MCP.git
    echo "✅ Evolution-Studio-MCP cloned"
else
    echo "✅ Evolution-Studio-MCP already exists"
fi

echo ""
echo "=========================================="
echo "✅ All Jules repos now local"
echo "=========================================="
echo ""

# Quick status check
for repo in Asset_Generation Evolution-Studio-MCP; do
    if [ -d "$repo/.git" ]; then
        echo "=== $repo ==="
        cd "$repo"
        echo "Branch: $(git branch --show-current)"
        echo "Last commit: $(git log -1 --pretty=format:'%h - %s (%ar)')"
        cd "$BASE_DIR"
        echo ""
    fi
done

echo ""
echo "Next steps:"
echo "1. Review what's in Asset_Generation (your Content Factory)"
echo "2. Review what's in Evolution-Studio-MCP (your MCP integration)"
echo "3. Then proceed with migration"
