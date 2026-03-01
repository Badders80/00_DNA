#!/usr/bin/env bash
set -euo pipefail

PROJECTS_DIR="/home/evo/projects"
CORE_FILE="/home/evo/00_DNA/AGENTS.core.md"
GEN_HEADER="# Auto-generated file. Do not edit directly."

# Guard: core must exist and be readable
[ -r "$CORE_FILE" ] || { echo "ERROR: CORE_FILE missing or unreadable: $CORE_FILE" >&2; exit 1; }

core_ids="$(grep -oE 'C-[0-9]+' "$CORE_FILE" | sort -u || true)"
repos_synced=0
repos_updated=0
overrides_found=0
unknown_override_ids=0

for repo in "$PROJECTS_DIR"/*; do
  [ -d "$repo" ] || continue
  [ -d "$repo/.git" ] || continue
  repos_synced=$((repos_synced + 1))

  output="$repo/AGENTS.md"
  tmp="$(mktemp)" || { echo "ERROR: Failed to create temporary file" >&2; exit 3; }

  # Guard: do not overwrite a non-generated AGENTS.md
  if [ -f "$output" ] && ! grep -qF "$GEN_HEADER" "$output"; then
    echo "WARN: $output exists but is not marked auto-generated; skipping." >&2
    rm -f "$tmp"
    continue
  fi

  {
    echo "$GEN_HEADER"
    echo "# Edit /home/evo/00_DNA/AGENTS.core.md and/or $repo/AGENTS.local.md then re-run sync."
    echo
    echo "=== CORE ==="
    echo
    cat "$CORE_FILE"

    if [ -f "$repo/AGENTS.local.md" ]; then
      echo
      echo "=== LOCAL OVERRIDES ==="
      echo
      cat "$repo/AGENTS.local.md"
    fi
  } > "$tmp"

  # Only overwrite if content changed
  if [ -f "$output" ] && cmp -s "$tmp" "$output"; then
    rm -f "$tmp"
  else
    mv "$tmp" "$output"
    repos_updated=$((repos_updated + 1))
  fi

  local_file="$repo/AGENTS.local.md"
  if [ -f "$local_file" ] && grep -qE '^OVERRIDE:[[:space:]]*C-[0-9]+' "$local_file"; then
    overrides_found=1
    echo "WARN: Overrides in: $repo"
    grep -nE '^OVERRIDE:[[:space:]]*C-[0-9]+' "$local_file" | sed 's/^/  /'

    while IFS= read -r line_with_num; do
      line_num="${line_with_num%%:*}"
      line="${line_with_num#*:}"
      id="$(printf '%s\n' "$line" | grep -oE 'C-[0-9]+' | head -n1 || true)"
      if [ -n "${id:-}" ] && ! printf '%s\n' "$core_ids" | grep -qx "$id"; then
        echo "  ERROR: $repo/AGENTS.local.md:$line_num: Unknown core ID referenced: $id" >&2
        unknown_override_ids=1
      fi
    done < <(grep -nE '^OVERRIDE:[[:space:]]*C-[0-9]+' "$local_file" 2>/dev/null || true)
  fi
done

echo
echo "OK: Repos synced: $repos_synced"
echo "OK: Repos updated: $repos_updated"
if [ "$overrides_found" -eq 1 ]; then
  echo "Action: review overrides above. Decide: keep local / promote to core / remove."
else
  echo "OK: No local overrides declared."
fi

if [ "$unknown_override_ids" -eq 1 ]; then
  echo "ERROR: Unknown override IDs detected."
  exit 2
fi
