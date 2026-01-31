#!/bin/bash
# Evolution-3.1 Commit Helper
# Run this to secure your refactor work before reorganization

echo "=========================================="
echo "Evolution-3.1 - Securing Refactor Work"
echo "=========================================="

cd /mnt/scratch/projects/Evolution-3.1 || exit 1

echo ""
echo "Current Status:"
git status

echo ""
echo "Files to be committed:"
echo "- 26 deleted files (old structure)"
echo "- New app/ directory (new structure)"
echo ""

read -p "Ready to commit? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    git add -A
    git commit -m "Refactor: Clean up root files, consolidate into app/ directory

- Removed outdated documentation files
- Removed old config files  
- Moved code into app/ structure
- Part of Evolution 3.1 → 4.0 transition"
    
    echo ""
    echo "✅ Committed locally"
    echo ""
    read -p "Push to GitHub? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git push origin main
        echo "✅ Pushed to remote"
    fi
else
    echo "Skipped - review changes first"
fi
