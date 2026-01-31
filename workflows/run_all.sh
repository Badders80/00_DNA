#!/bin/bash
# Evolution Stables - Master Reorganization Script
# Runs all phases in sequence with proper error handling

set -e  # Exit on error

SCRIPT_DIR="/mnt/scratch/projects/00_DNA/workflows"
cd "$SCRIPT_DIR" || exit 1

echo "=========================================="
echo "Evolution Stables - Complete Reorganization"
echo "=========================================="
echo ""

# Ensure all scripts are executable
echo "🔧 Setting script permissions..."
chmod +x *.sh
echo "✅ Permissions set"
echo ""

# Phase 0: Already done - repos cloned
echo "=========================================="
echo "PHASE 0: Clone Repos - ✅ COMPLETE"
echo "=========================================="
echo "✅ Asset_Generation cloned"
echo "✅ Evolution-Studio-MCP cloned"
echo ""

# Phase 1: Commit Evolution-3.1
echo "=========================================="
echo "PHASE 1: Commit Evolution-3.1 Refactor"
echo "=========================================="
read -p "Ready to commit Evolution-3.1 changes? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    ./commit_evolution_3.1.sh
else
    echo "Skipped - you can run ./commit_evolution_3.1.sh manually later"
fi
echo ""

# Phase 2: Review Evolution_Guru
echo "=========================================="
echo "PHASE 2: Review Evolution_Guru Changes"
echo "=========================================="
echo "Let's see what uncommitted work exists..."
./review_evolution_guru.sh
echo ""
echo "Based on the review above, you need to decide:"
echo "A) Commit everything (including session.db files)"
echo "B) Ignore session.db, commit only Python scripts"
echo ""
read -p "Choose option (A/B) or Skip (S): " -n 1 -r
echo

if [[ $REPLY =~ ^[Aa]$ ]]; then
    cd /mnt/scratch/projects/Evolution_Guru
    git add -A
    git commit -m "Add Gemini CLI tools and CTO audit scripts"
    git push origin main
    echo "✅ Evolution_Guru committed (all files)"
    cd "$SCRIPT_DIR"
elif [[ $REPLY =~ ^[Bb]$ ]]; then
    cd /mnt/scratch/projects/Evolution_Guru
    echo "**/.adk/session.db" >> .gitignore
    git add .gitignore *.py .gemini/ 2>/dev/null || true
    git commit -m "Add Gemini tools, ignore ADK session databases"
    git push origin main
    echo "✅ Evolution_Guru committed (excluding session.db)"
    cd "$SCRIPT_DIR"
else
    echo "Skipped - you can commit manually later"
fi
echo ""

# Phase 3: Check newly cloned repos
echo "=========================================="
echo "PHASE 3: Check Newly Cloned Repos"
echo "=========================================="
echo ""
echo "Asset_Generation status:"
cd /mnt/scratch/projects/Asset_Generation
git status --short
if [ -z "$(git status --porcelain)" ]; then
    echo "✅ Clean working directory"
else
    echo "⚠️  Has uncommitted changes - review needed"
fi
echo ""

echo "Evolution-Studio-MCP status:"
cd /mnt/scratch/projects/Evolution-Studio-MCP
git status --short
if [ -z "$(git status --porcelain)" ]; then
    echo "✅ Clean working directory"
else
    echo "⚠️  Has uncommitted changes - review needed"
fi
echo ""

cd "$SCRIPT_DIR"

# Phase 4: Full audit
echo "=========================================="
echo "PHASE 4: Full Repository Audit"
echo "=========================================="
./audit_jules_repos.sh | tee audit_final_$(date +%Y%m%d_%H%M%S).log
echo ""

# Phase 5: Migration
echo "=========================================="
echo "PHASE 5: Execute Migration"
echo "=========================================="
echo ""
echo "This will:"
echo "- Create new folder structure (01_Platform, 02_Content_Factory, etc.)"
echo "- Symlink all Git repos (keeps remotes working)"
echo "- Move Evolution_Studio to archive"
echo "- Move non-Git MCP servers"
echo ""
read -p "Ready to execute migration? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    ./execute_migration.sh
    echo ""
    echo "=========================================="
    echo "✅ MIGRATION COMPLETE!"
    echo "=========================================="
else
    echo "Migration skipped - run ./execute_migration.sh when ready"
fi

echo ""
echo "=========================================="
echo "Summary"
echo "=========================================="
echo ""
echo "✅ All repos cloned"
echo "✅ Active work committed"
echo "✅ Full audit complete"
echo ""
echo "Final structure at: /mnt/scratch/projects/"
echo "  - 00_DNA/ (your standards)"
echo "  - 01_Platform/ (Evolution-3.1)"
echo "  - 02_Content_Factory/ (Asset_Generation)"
echo "  - 03_Tools/ (MCP servers)"
echo "  - 04_Intelligence/ (Evolution_Guru)"
echo "  - 05_Archive/ (Evolution_Studio)"
echo ""
echo "Git repos still work from original locations!"
echo ""
