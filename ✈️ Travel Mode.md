# ✈️ Travel Mode Guide

## The Setup

**PC (Home)** → Always-on server, does the heavy lifting  
**Laptop (Travel)** → Thin client, just a window into PC  
**Kimi K2 (Cloud)** → 40GB context for big analysis

## Access Methods

### 1. OpenClaw (Telegram) — PRIMARY
**Best for:** Quick checks, deploys, monitoring

```
Telegram → @YourOpenClawBot
Commands:
  /status    — Check all systems
  /deploy    — Deploy current project
  /logs      — View recent logs
  /restart   — Restart service
```

### 2. Kimi K2 (40GB Context) — ANALYSIS
**Best for:** Big refactors, code review, deep analysis

```
1. Open https://kimik2ai.com
2. Connect via OpenClaw bridge
3. Paste large code sections
4. Ask complex questions
```

**Why 40GB matters:** Can fit entire project context for holistic analysis.

### 3. code-server (Browser IDE) — EMERGENCY
**Best for:** Light edits when SSH isn't practical

```
# On PC (one-time setup)
npm install -g code-server

# Access from anywhere
https://your-pc-ip:8080
```

### 4. SSH + VS Code Remote — FULL DEV
**Best for:** Serious work (rare while traveling)

Requirements:
- Good WiFi
- VS Code with Remote-SSH extension
- PC IP address

```bash
ssh evo@[PC_IP]
# Then open VS Code, connect to remote
```

## What Works Where

| Activity | OpenClaw | Kimi K2 | code-server | SSH |
|----------|----------|---------|-------------|-----|
| Check status | ✅ | ❌ | ✅ | ✅ |
| Deploy | ✅ | ❌ | ✅ | ✅ |
| View logs | ✅ | ❌ | ✅ | ✅ |
| Code review | ⚠️ | ✅ | ✅ | ✅ |
| Refactoring | ❌ | ✅ | ⚠️ | ✅ |
| Heavy dev | ❌ | ❌ | ⚠️ | ✅ |
| ComfyUI | ❌ | ❌ | ❌ | ✅ |

## Pre-Travel Checklist

See [[_config/travel-checklist]] for full list.

Quick version:
- [ ] PC stays on, SSH enabled
- [ ] Test OpenClaw bot
- [ ] Note PC IP: `curl ifconfig.me`
- [ ] Laptop has Telegram + SSH
