#!/bin/bash
# ═══════════════════════════════════════════════════════════
# Kimi Startup Hook - Enforce DNA Memory Protocol
# Source this in .bashrc: source /home/evo/00_DNA/scripts/shell/kimi-startup.sh
# ═══════════════════════════════════════════════════════════

EVO_ROOT="/home/evo"

# Override kimi command to include DNA context
kimi() {
    # Check if this is a "new session" command (not --continue, -C, etc.)
    local is_new_session=true
    
    for arg in "$@"; do
        case "$arg" in
            -C|--continue|-S*|--session*)
                is_new_session=false
                break
                ;;
        esac
    done
    
    # If new session and no explicit prompt, load DNA context
    if [[ "$is_new_session" == true && -z "$1" ]]; then
        echo "🧠 Loading DNA context..."
        
        # Create temporary context file
        local context_file=$(mktemp)
        
        cat > "$context_file" << 'EOF'
Read these DNA files FIRST before responding:
1. /home/evo/00_DNA/agents/AI_CONTEXT.md - Project state
2. /home/evo/00_DNA/agents/OPERATING_BACKLOG.md - Current work
3. /home/evo/00_DNA/ops/DECISION_LOG.md - Recent decisions

Do NOT say "I don't have access to previous conversations."
DNA is the persistent memory. Read it.
EOF
        
        # Start kimi with context pre-loaded
        command kimi -p "$(cat "$context_file")" "$@"
        
        # Cleanup
        rm -f "$context_file"
    else
        # Continue existing session or explicit command - pass through
        command kimi "$@"
    fi
}

# Alternative: Explicit DNA-aware kimi commands
kimic() {
    # Start with full DNA context
    command kimi -p "Read /home/evo/00_DNA/agents/AI_CONTEXT.md, /home/evo/00_DNA/agents/OPERATING_BACKLOG.md, and /home/evo/00_DNA/ops/DECISION_LOG.md. Summarize what we're working on."
}

kimil() {
    # Continue last session
    command kimi -C
}

kimif() {
    # Fresh session (no DNA - for truly new work)
    command kimi "$@"
}

echo "🐎 Kimi DNA hooks loaded"
echo "   kimic  = Start with DNA context"
echo "   kimil  = Continue last session"
echo "   kimif  = Fresh session (no context)"
