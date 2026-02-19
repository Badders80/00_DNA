#!/bin/bash
# Evolution Stables - Repository Status Check
# Run this from Windows WSL or Git Bash to check Jules work status

echo "==================================================="
echo "Evolution Stables - Jules Repository Audit"
echo "Date: $(date)"
echo "==================================================="
echo ""

# Define repos to check (adjust paths as needed)
REPOS=(
    "Asset_Generation"
    "Evolution_Guru"
    "Evolution_Studio"
    "Evolution-Studio-MCP" 
    "Evolution-3.1"
    "comfyui-mcp-server"
    "gemini-mcp-server"
)

# Base path - adjust if your repos are elsewhere
BASE_PATH="/home/evo/projects"

cd "$BASE_PATH" || exit 1

for repo in "${REPOS[@]}"; do
    echo "=========================================="
    echo "Checking: $repo"
    echo "=========================================="
    
    if [ -d "$repo/.git" ]; then
        cd "$repo" || continue
        
        echo "📍 Remote URLs:"
        git remote -v
        
        echo ""
        echo "🌿 Current Branch:"
        git branch --show-current
        
        echo ""
        echo "📊 Status:"
        git status --short
        
        echo ""
        echo "🔄 Behind/Ahead of Remote:"
        git fetch --quiet
        LOCAL=$(git rev-parse @)
        REMOTE=$(git rev-parse @{u} 2>/dev/null)
        BASE=$(git merge-base @ @{u} 2>/dev/null)
        
        if [ "$LOCAL" = "$REMOTE" ]; then
            echo "✅ Up to date"
        elif [ "$LOCAL" = "$BASE" ]; then
            echo "⬇️  Need to pull (behind remote)"
        elif [ "$REMOTE" = "$BASE" ]; then
            echo "⬆️  Need to push (ahead of remote)"
        else
            echo "🔀 Diverged (need to pull and merge)"
        fi
        
        echo ""
        echo "📅 Last Commit:"
        git log -1 --pretty=format:"%h - %an, %ar : %s"
        echo ""
        
        cd "$BASE_PATH" || exit 1
    else
        echo "❌ Not a git repository"
    fi
    
    echo ""
    echo ""
done

echo "==================================================="
echo "Audit Complete"
echo "==================================================="
echo ""
echo "Next steps:"
echo "1. Review repos that need pulling"
echo "2. Check for uncommitted work" 
echo "3. Decide which repos to keep vs archive"
echo ""
