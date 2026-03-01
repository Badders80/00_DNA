#!/bin/bash
# Evolution_Guru Work Review
# Check what Gemini ADK work needs committing

echo "=========================================="
echo "Evolution_Guru - Gemini ADK Work Review"
echo "=========================================="

cd /home/evo/projects/Evolution_Guru || exit 1

echo ""
echo "📊 Modified Files:"
git status --short

echo ""
echo "🐍 New Python Scripts:"
ls -lh *.py 2>/dev/null || echo "No .py files in root"

echo ""
echo "📁 New .gemini/ Directory:"
if [ -d ".gemini" ]; then
    ls -lah .gemini/
else
    echo ".gemini/ not found"
fi

echo ""
echo "🔍 Session Database Changes:"
echo ""
echo "These are typically temporary and can be ignored:"
git diff --stat **/.adk/session.db

echo ""
echo "=========================================="
echo "Decision Time"
echo "=========================================="
echo ""
echo "Options:"
echo "1. Commit Python scripts + .gemini/ (keep session.db changes)"
echo "2. Add session.db to .gitignore (ignore temp data)"
echo "3. Review each file individually"
echo ""
