# 🐳 Docker Guide - Evolution Stables

**You don't need to learn Docker.** Use `evo docker` commands instead.

---

## 🤔 Why Docker is Everywhere

Your projects use Docker because:
- **N8N** needs a specific environment to run workflows
- **Firecrawl** needs browser automation containers
- **Evolution Studio** needs GPU access for video processing
- **Local LLM** needs isolation for 25GB+ models

**The problem:** Docker Desktop keeps alerting you about containers.
**The solution:** Use `evo docker` to see and control what's running.

---

## 🎮 Quick Commands (All You Need)

```bash
# See what's running (and eating resources)
evo docker status

# List all projects that use Docker
evo docker list

# Start a project's containers
evo docker start n8n
evo docker start studio

# Stop a project's containers  
evo docker stop studio
evo docker stop llm

# EMERGENCY: Stop everything
evo docker stop-all

# Clean up disk space
evo docker clean
```

---

## 📦 Your Docker Projects

### Always Running
| Project | What it does | Why keep it running? |
|---------|--------------|---------------------|
| **n8n** | Workflow automation | Background tasks, notifications |
| **command** | Monitoring dashboard | System health visibility |

### Start When Needed
| Project | What it does | When to start? |
|---------|--------------|----------------|
| **studio** | Video/audio processing | When creating content |
| **content** | Content pipeline | When generating clips |
| **firecrawl** | Web scraping | When doing research |
| **llm** | Local AI models | When running AI locally |

---

## 🚨 Common Scenarios

### "I'm getting Windows alerts about Docker"
```bash
evo docker status
```
See what's actually running and using resources.

### "I need to free up GPU memory"
```bash
evo docker stop studio
evo docker stop llm
```
Stop the GPU-intensive containers.

### "I want to start working on content"
```bash
evo docker start studio
```
Starts all the Evolution Studio microservices.

### "Everything is running slow"
```bash
evo docker stop-all
```
Nuclear option - stops everything. Then start just what you need.

---

## 🏗️ Architecture (Why This Way)

Each project has its own `docker-compose.yml`:

```
projects/
├── External/N8N/docker-compose.yaml          # N8N workflows
├── External/Firecrawl/docker-compose.yaml    # Scraping
├── Evolution_Studio/docker-compose.yml       # Content microservices
├── Evolution_Command/docker-compose.yml      # Monitoring
├── Evolution_Content/docker-compose.yml      # Content pipeline
└── Infrastructure/Local_LLM/docker-compose.yml # AI models
```

**Why not one big docker-compose?**
- Each project can have its own tweaks
- You can start/stop projects independently
- Prevents "everything or nothing" situations
- Matches our separation of concerns (Infrastructure ≠ Intelligence ≠ Content)

---

## 🔧 Project-Specific Tweaks

Each project can customize its Docker setup. Examples:

### Evolution Studio (GPU-enabled)
```yaml
# projects/Evolution_Studio/docker-compose.yml
services:
  transcription:
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia  # Uses GPU
```

### N8N (Always on, lightweight)
```yaml
# projects/External/N8N/docker-compose.yaml
services:
  n8n:
    restart: unless-stopped  # Auto-restart
    # No GPU, minimal resources
```

---

## 💡 Pro Tips

1. **Check before starting work**
   ```bash
   evo docker status
   ```
   See if containers are already running.

2. **Start minimal, add as needed**
   Don't start everything. Start what you need for the task.

3. **Stop when done**
   Especially GPU services. They eat VRAM even when idle.

4. **Disk space running low?**
   ```bash
   evo docker clean
   ```
   Removes stopped containers and unused images.

---

## ❓ Troubleshooting

### "docker command not found"
Docker Desktop WSL integration isn't enabled:
1. Open Docker Desktop (Windows)
2. Settings → Resources → WSL Integration
3. Toggle ON for Ubuntu
4. Apply & Restart

Or just use Docker Desktop GUI instead.

### "Port already in use"
Something else is using the port. Usually fixed by:
```bash
evo docker stop-all
evo docker start [just-what-you-need]
```

### "Container won't start"
Check the project's logs:
```bash
cd projects/[ProjectName]
docker-compose logs
```

---

## 📊 Resource Management

**GPU Memory (VRAM):**
- Studio transcription: ~4GB
- Local LLM: ~12-24GB (depends on model)
- ComfyUI: ~8GB

**RAM:**
- N8N: ~500MB
- Firecrawl: ~1GB
- Studio (all services): ~2GB

**Disk:**
- Docker images: Can grow to 50GB+
- Run `evo docker clean` monthly

---

## 🎯 Golden Rule

**Start what you need. Stop what you don't.**

Docker is infrastructure - it should work for you, not alert you. Use `evo docker status` to stay in control.

---

**Remember: You don't need to learn Docker. Just use `evo docker`.**
