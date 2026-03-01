# ✈️ Travel Setup Checklist

## Before You Leave

### PC Setup (The "Server")
- [ ] PC will stay on and connected
- [ ] SSH enabled: `sudo systemctl enable ssh`
- [ ] Test OpenClaw bot responds
- [ ] Note your PC's IP address: `curl ifconfig.me`

### Laptop Setup (The "Client")
- [ ] Install: Telegram (for OpenClaw)
- [ ] Install: SSH client
- [ ] Optional: VS Code with Remote-SSH extension
- [ ] Bookmark: Kimi K2 web interface

## While Traveling

### Daily Workflow
```bash
# Check status anywhere
Telegram → OpenClaw Bot → /status

# Big analysis work
Kimi K2 (40GB) → Paste code → Ask questions

# Emergency edit (rare)
SSH → code-server → Edit → Deploy
```

### What's Available

| What | How | Good For |
|------|-----|----------|
| **Status checks** | Telegram/OpenClaw | Quick monitoring |
| **Big analysis** | Kimi K2 40GB | Refactors, review |
| **Light edits** | code-server | Emergency fixes |
| **Full dev** | Remote Desktop | Rare, needs good wifi |

### What's NOT Available (by design)
- Running ComfyUI (13GB - stays on PC)
- Local model inference
- Heavy video processing

## Emergency Contacts
- OpenClaw Bot: @YourOpenClawBot
- PC IP: [WRITE THIS DOWN]
- SSH: `ssh evo@[PC_IP]`
