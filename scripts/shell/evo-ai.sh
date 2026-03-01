#!/bin/bash
# ═══════════════════════════════════════════════════════════
# evo-ai - AI Context Switcher
# Switch between local and remote AI while traveling
# ═══════════════════════════════════════════════════════════

MODE=${1:-local}

case $MODE in
  local)
    echo "🖥️  Switching to LOCAL AI (Claude/Gemini on PC)"
    export EVO_AI_MODE=local
    export CLAUDE_CODE_USE_REMOTE=false
    echo "   Context: Standard (200K-1M tokens)"
    echo "   Latency: Low"
    echo "   Best for: Active development on PC"
    ;;
    
  remote|kimi|k2)
    echo "☁️  Switching to KIMI K2 (40GB Cloud Context)"
    export EVO_AI_MODE=remote
    export KIMI_K2_ACTIVE=true
    echo "   Context: 40GB (massive)"
    echo "   Latency: Higher (cloud)"
    echo "   Best for: Large refactors, deep analysis"
    echo "   Setup: Connects via OpenClaw bridge"
    ;;
    
  travel|laptop)
    echo "✈️  TRAVEL MODE - Laptop as thin client"
    echo "   PC: Always-on server (heavy lifting)"
    echo "   Laptop: SSH + Telegram + Browser"
    echo "   AI: Kimi K2 40GB for big work"
    echo ""
    echo "   Quick commands:"
    echo "     evo status     - Check all systems"
    echo "     evo deploy     - Deploy from anywhere"
    echo "     evo logs       - View recent logs"
    ;;
    
  status)
    echo "📊 AI Configuration Status"
    echo "   Current Mode: ${EVO_AI_MODE:-local}"
    echo "   Kimi K2: ${KIMI_K2_ACTIVE:-false}"
    echo "   OpenClaw: Check Telegram bot"
    ;;
    
  *)
    echo "Usage: evo-ai [local|remote|travel|status]"
    echo ""
    echo "  local    - PC-local AI (development)"
    echo "  remote   - Kimi K2 40GB (heavy analysis)"
    echo "  travel   - Travel mode setup info"
    echo "  status   - Current configuration"
    ;;
esac
