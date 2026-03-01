# 🧠 Evolution Studio LLM Stack

**Status:** Active & Operational  
**Primary Engine:** Ollama v0.13.5  
**Last Updated:** 2026-01-31

---

## Architecture Overview

```
┌─────────────────────────────────────────────────┐
│        Evolution Studio LLM Pipeline            │
├─────────────────────────────────────────────────┤
│                                                 │
│  ┌──────────┐         ┌──────────────────┐     │
│  │  Ollama  │◄───────►│   MCP Server     │     │
│  │ (11434)  │         │  (Filesystem)    │     │
│  └────┬─────┘         └──────────────────┘     │
│       │                                         │
│       │ VRAM: 12GB RTX 3060                     │
│       │ Mode: Low VRAM Optimization             │
│       │                                         │
│       ▼                                         │
│  ┌──────────────────────────────────────┐      │
│  │     Custom Evolution Models          │      │
│  │  • evolution-designer   (6.2GB)      │      │
│  │  • evolution-coder      (6.3GB)      │      │
│  │  • qwen2.5-14b          (8.6GB)      │      │
│  │  • liquid-ai-2.6b       (2.7GB)      │      │
│  │                                      │      │
│  │  Total: 14.8GB model storage         │      │
│  └──────────────────────────────────────┘      │
│                                                 │
│  ┌──────────────────────────────────────┐      │
│  │    Gemini Agent Workspace            │      │
│  │  Location: 04_Intelligence/          │      │
│  │  • Evolution CTO                     │      │
│  │  • File Watcher                      │      │
│  │  • Organiser                         │      │
│  │  • Root Agent                        │      │
│  │  • Transcriber                       │      │
│  │  • Extractor                         │      │
│  └──────────────────────────────────────┘      │
└─────────────────────────────────────────────────┘
```

---

## Custom Ollama Models

### evolution-designer (6.2GB)
**Purpose:** Design and creative content generation  
**Use Cases:**
- Racehorse descriptions and bios
- Branding and marketing copy
- Content strategy
- Creative ideation

**Usage:**
```bash
ollama run evolution-designer "Create a compelling bio for [horse name]"
```

**Modified:** 2 weeks ago  
**Performance:** 2-5s response time (moderate)

---

### evolution-coder (6.3GB)
**Purpose:** Code generation and technical tasks  
**Use Cases:**
- Python script generation
- Data processing automation
- API integration code
- Technical documentation

**Usage:**
```bash
ollama run evolution-coder "Write a Python function to [task description]"
```

**Modified:** 2 weeks ago  
**Performance:** 2-5s response time (moderate)

---

### qwen2.5-14b (8.6GB)
**Purpose:** General-purpose reasoning and analysis  
**Use Cases:**
- Complex multi-step reasoning
- Data analysis and insights
- Strategic planning
- Technical documentation review

**Usage:**
```bash
ollama run qwen2.5-14b "Analyze [topic] and provide insights"
```

**Modified:** 2 weeks ago  
**Performance:** 3-8s response time (slower but deeper reasoning)

---

### liquid-ai-2.6b (2.7GB)
**Purpose:** Fast, lightweight responses  
**Use Cases:**
- Quick queries and answers
- Real-time interactions
- Simple tasks
- Prototyping and testing

**Usage:**
```bash
ollama run liquid-ai-2.6b "Quick answer: [question]"
```

**Modified:** 2 weeks ago  
**Performance:** 0.5-2s response time (very fast)

---

## Ollama Configuration

### Service Details
- **Daemon:** `systemd` managed
- **Port:** 11434 (localhost only)
- **VRAM Mode:** Low VRAM optimization (for 12GB GPU)
- **Storage:** `~/.ollama/` (system default location)
- **Version:** 0.13.5

### Management Commands

```bash
# List all installed models
ollama list

# Check service status
systemctl status ollama

# Restart service
sudo systemctl restart ollama

# Pull new model from registry
ollama pull [model:tag]

# Remove model
ollama rm [model:tag]

# Run model interactively
ollama run [model-name]

# Run model with prompt
ollama run [model-name] "Your prompt here"
```

### Model Storage Location
```bash
~/.ollama/models/  # Model files
~/.ollama/blobs/   # Model data blobs
```

---

## MCP Server Integration

**Process:** `mcp-server-filesystem`  
**Scope:** `/home/evo/projects`  
**Purpose:** Provides file system access to AI agents

### Configuration Location
```bash
~/.config/claude/mcp_settings.json
```

### Current Status
- ✅ Installed via npm global
- ✅ Configured in Claude Desktop
- ⚠️ Connection debugging in progress

### Manual Test
```bash
npx -y @modelcontextprotocol/server-filesystem /home/evo/projects
# Should output: "Secure MCP Filesystem Server running on stdio"
```

---

## Gemini Agent Workspace

**Location:** `/home/evo/projects/04_Intelligence/gemini-workspace`

### Active Agent Configurations

| Agent | Config File | Purpose | Status |
|-------|------------|---------|--------|
| Evolution CTO | `evolution_cto.yaml` | Technical leadership & system audits | Active |
| File Watcher | `file_watcher.yaml` | Monitor project file changes | Active |
| Organiser | `organiser.yaml` | Content organization & structure | Active |
| Root Agent | `root_agent.yaml` | Main orchestrator | Active |
| Transcriber | `transcriber.yaml` | Audio/text processing | Active |
| Extractor | `extractor.yaml` | Data extraction workflows | Active |

### Python Scripts
```bash
# Execute CTO technical audit
python3 run_cto_audit.py

# Quick CTO health check
python3 simple_cto_check.py

# Test API connectivity
python3 test_api.py
```

---

## Performance Notes

### VRAM Usage Guidelines
- **Single Model Inference:** 4-9GB
- **Low VRAM Mode:** Active (12GB total available)
- **Recommendation:** Load one model at a time for optimal performance
- **Buffer:** Always leave 500MB VRAM free

### Response Time Benchmarks
- **liquid-ai-2.6b:** ~0.5-2s (fast, lightweight tasks)
- **evolution-designer:** ~2-5s (moderate, creative work)
- **evolution-coder:** ~2-5s (moderate, code generation)
- **qwen2.5-14b:** ~3-8s (slower but deeper reasoning)

### Model Selection Strategy
| Task Type | Recommended Model | Reason |
|-----------|------------------|---------|
| Quick queries | liquid-ai-2.6b | Fastest response |
| Creative content | evolution-designer | Optimized for creative work |
| Code generation | evolution-coder | Specialized for technical tasks |
| Complex analysis | qwen2.5-14b | Best reasoning capabilities |

---

## Future Integration Points

### Planned
- [ ] Open-WebUI (web interface for Ollama) - deferred
- [ ] ComfyUI integration for visual content generation
- [ ] n8n automation workflows
- [ ] Video generation pipeline (LTX Video, Flux)
- [ ] Fine-tuning pipeline via Unsloth Studio

### In Progress
- [x] Ollama with 4 custom models
- [x] MCP filesystem bridge (connection debugging)
- [x] Gemini agent orchestration
- [ ] MCP server full integration

### Completed
- [x] Ubuntu 24.04 native migration
- [x] RTX 3060 GPU setup with CUDA
- [x] Ollama systemd service configuration
- [x] Custom model installations
- [x] Gemini workspace setup

---

## Troubleshooting

### Ollama Not Responding
```bash
# Check service status
systemctl status ollama

# View logs
journalctl -u ollama -f

# Restart service
sudo systemctl restart ollama
```

### Model Loading Errors
```bash
# Check available VRAM
nvidia-smi

# If VRAM full, stop other processes
# Or use smaller model (liquid-ai-2.6b)
```

### MCP Server Not Connecting
```bash
# Test manual run
npx -y @modelcontextprotocol/server-filesystem /home/evo/projects

# Check config
cat ~/.config/claude/mcp_settings.json

# Verify npm installation
npm list -g | grep mcp-server-filesystem
```

---

## Best Practices

1. **VRAM Management**
   - Monitor with `nvidia-smi`
   - Use one model at a time
   - Prefer smaller models for simple tasks

2. **Model Selection**
   - Start with liquid-ai for speed
   - Use specialized models (designer/coder) for their domains
   - Fall back to qwen2.5 for complex reasoning

3. **Service Maintenance**
   - Run health checks regularly
   - Keep Ollama service running
   - Monitor system resources

4. **Development Workflow**
   - Test prompts with liquid-ai first (fast iteration)
   - Move to specialized models once prompt is refined
   - Use qwen2.5 for final production outputs

---

**Last Updated:** 2026-01-31  
**Maintained By:** Evolution Studio Team  
**Role:** Installation Ninja (Primary maintainer)
