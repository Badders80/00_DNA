# 🏯 Evolution Studio Operational Configuration

**Version:** v2026.1 (Ubuntu Native Edition)  
**Last Updated:** 2026-01-31  
**Status:** Active Production Environment

---

## ⚡ System Architecture

### Hardware Configuration

| Component | Specification | Purpose |
|-----------|--------------|---------|
| **CPU** | AMD Ryzen 5 7600X (6C/12T @ 4.7GHz+) | Primary orchestration & processing |
| **GPU** | NVIDIA RTX 3060 12GB VRAM | CUDA compute for AI inference |
| **RAM** | 24GB DDR5 | System memory |
| **Storage** | Samsung 990 PRO NVMe | Primary scratch drive |
| **OS** | Ubuntu 24.04 LTS (Native) | Production environment |

### Storage Architecture

**Primary Mount:** `/home/evo`  
**Capacity:** 839GB total, ~697GB free  
**Purpose:** Production workspace for all Evolution Studio operations

---

## 📂 The "Safe-Path" Modular Standard

All development follows the **00-05 architecture** at `/home/evo/projects/`

```
/home/evo/projects/
├── 00_DNA/              # System configuration, health scripts, master docs
├── 01_Platform/         # Core orchestration tools and bridges
├── 02_Content_Factory/  # ComfyUI (dormant), future video generation
├── 03_Tools/            # Custom automation scripts
├── 04_Intelligence/     # MCP Servers, Gemini workspace, Ollama
├── 05_Archive/          # Legacy projects and cold storage
└── models/              # Global .safetensors vault (~22GB, 7 models)
```

### Directory Purposes

| Index | Directory | Role | Status |
|-------|-----------|------|--------|
| `00_DNA` | Configuration | System knowledge base, health monitoring | **ACTIVE** |
| `01_Platform` | Infrastructure | Core orchestration (future n8n, automation) | Planned |
| `02_Content_Factory` | AI Engines | ComfyUI workflows, video generation | Dormant |
| `03_Tools` | Utilities | Custom scripts and automation | **ACTIVE** |
| `04_Intelligence` | AI Agents | Ollama, MCP servers, Gemini workspace | **ACTIVE** |
| `05_Archive` | Vault | Legacy projects, cold storage | Archive |
| `models/` | Assets | Global model library (shared across tools) | **ACTIVE** |

---

## 🛠️ Active Services

### Ollama (Primary LLM Engine)
- **Status:** Running on port 11434
- **Service:** `systemd` managed
- **Location:** System-wide installation
- **Models:** 4 custom Evolution models (14.8GB total)
- **VRAM Mode:** Low VRAM optimization (12GB GPU)

**Management:**
```bash
systemctl status ollama
ollama list
ollama run <model-name>
```

### MCP Server (Filesystem Bridge)
- **Process:** `mcp-server-filesystem`
- **Scope:** `/home/evo/projects`
- **Purpose:** File system access for AI agents
- **Status:** Configured (connection debugging in progress)

### ComfyUI (Dormant)
- **Location:** `/home/evo/projects/02_Content_Factory/ComfyUI`
- **Status:** Installed but not in active use
- **Port:** 8188 (when running)
- **Future:** Video generation pipeline integration

---

## 🛡️ Operational Protocols

### 1. The "Lava" Protocol
**NEVER install or clone projects in `/home/evo/`**

- ❌ **FORBIDDEN ZONE:** `/home/evo/` (causes filesystem conflicts)
- ✅ **SAFE ZONE:** `/home/evo/projects/` (all work happens here)
- ✅ **VENV RULE:** Virtual environments must be within project folders

**Why?** The home directory has caused mount issues, path conflicts, and storage problems. All work must live in the scratch drive structure.

### 2. Health Check Script
Location: `/home/evo/projects/evo_health_check.sh`

```bash
# Run health check
/home/evo/projects/evo_health_check.sh
```

**Monitors:**
- Scratch drive space (should show ~697GB free)
- VRAM usage (11.7GB available = healthy)
- Active services (Ollama, MCP, workflows)
- ComfyUI status

### 3. Model Management
- Models >500MB live in `/home/evo/models/`
- Reference globally via absolute paths
- Never duplicate models across projects
- Total model storage: ~22GB

---

## 🔧 Recovery & Maintenance

### Mount Verification
```bash
df -h /home/evo  # Should show ~697GB free
ls -la /home/evo/projects/  # Verify 00-05 structure
```

### VRAM Safety
```bash
nvidia-smi  # Monitor GPU usage
# Threshold: 11.5GB max (leave 500MB buffer)
```

### Service Status
```bash
# Check Ollama
systemctl status ollama

# Check MCP server
ps aux | grep mcp | grep -v grep

# Check active processes
htop  # or top
```

### Emergency Restart
```bash
# Restart Ollama
sudo systemctl restart ollama

# Kill runaway GPU processes
nvidia-smi --query-compute-apps=pid --format=csv,noheader | xargs -n1 kill
```

---

## 📊 Performance Baselines

### GPU (RTX 3060 12GB)
- **Ollama Inference:** 4-9GB VRAM per model
- **ComfyUI Workflows:** 8-11GB VRAM (when active)
- **Safe Concurrent Use:** 1 major service at a time

### Storage (Samsung 990 PRO)
- **Read Speed:** ~7000 MB/s
- **Write Speed:** ~5000 MB/s
- **Current Usage:** ~142GB / 839GB

### CPU (Ryzen 7600X)
- **Base Clock:** 4.7GHz
- **Boost:** Up to 5.3GHz
- **Cores:** 6C/12T
- **Best For:** Parallel processing, orchestration

---

## 🚨 Known Issues & Workarounds

### Issue: MCP Server Connection
**Status:** Configured but not connecting from claude.ai  
**Config:** `~/.config/claude/mcp_settings.json`  
**Workaround:** Use deployment scripts for now, debug MCP later

### Issue: ComfyUI Dormant
**Status:** Installed but not in regular workflow  
**Reason:** Video generation pipeline not yet active  
**Future:** Integrate when Evolution 4.0 content needs ramp up

---

## 📝 Change Log

**2026-01-31:**
- Migrated from WSL2 to Ubuntu 24.04 native
- Updated hardware specs (AMD Ryzen 7600X, RTX 3060)
- Documented active Ollama models (4 custom)
- Established "Lava Protocol" (no home directory installs)
- Added MCP server configuration (debugging connection)

---

**Maintained By:** Evolution Studio Team  
**Role:** Installation Ninja (Primary maintainer)
