#!/bin/bash
# Pre-commit hook to prevent API key leaks
# Scans staged files for common secret patterns

echo "🔍 Scanning for potential secrets in commit..."

# Patterns to detect secrets (one per line)
PATTERN_FILE=$(mktemp)
cat > "$PATTERN_FILE" << 'PATTERNS'
sk-[a-zA-Z0-9]{20,}
sk-[a-zA-Z0-9_-]{32,}
AIza[0-9A-Za-z_-]{35}
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9
api[_-]?key[[:space:]]*=[[:space:]]*["']?[a-zA-Z0-9_-]{20,}
secret[[:space:]]*=[[:space:]]*["']?[a-zA-Z0-9_-]{16,}
password[[:space:]]*=[[:space:]]*["']?[a-zA-Z0-9_-]{8,}
token[[:space:]]*=[[:space:]]*["']?[a-zA-Z0-9_-]{20,}
BEGIN .*PRIVATE KEY
PATTERNS

# Get list of staged files (excluding this hook file)
STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACM 2>/dev/null | grep -v "^\.git/hooks/pre-commit$")

if [ -z "$STAGED_FILES" ]; then
  rm -f "$PATTERN_FILE"
  exit 0
fi

# Track if any secrets found
FOUND=0

for FILE in $STAGED_FILES; do
  # Skip binary files
  if git diff --cached "$FILE" | grep -q "^Binary"; then
    continue
  fi
  
  # Check against patterns
  while IFS= read -r PATTERN; do
    [ -z "$PATTERN" ] && continue
    MATCHES=$(git diff --cached -U0 -- "$FILE" 2>/dev/null | grep -E "^\+" | grep -iE "$PATTERN" 2>/dev/null)
    if [ -n "$MATCHES" ]; then
      echo ""
      echo "❌ POTENTIAL SECRET DETECTED in: $FILE"
      echo "   Pattern matched: ${PATTERN:0:40}..."
      echo "   Content preview:"
      echo "$MATCHES" | head -2 | sed "s/^/     /"
      echo ""
      FOUND=1
    fi
  done < "$PATTERN_FILE"
done

rm -f "$PATTERN_FILE"

if [ $FOUND -eq 1 ]; then
  echo "─────────────────────────────────────────────"
  echo "⚠️  COMMIT BLOCKED: Potential secrets detected"
  echo ""
  echo "Options:"
  echo "  1. Remove secrets from the staged files"
  echo "  2. Use env vars or .env files (not committed)"
  echo "  3. If this is a false positive, commit with:"
  echo "     git commit --no-verify -m \"your message\""
  echo "─────────────────────────────────────────────"
  exit 1
fi

echo "✅ No secrets detected"
exit 0
