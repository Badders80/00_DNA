# 🏯 Evolution Studio Master Configuration Guide

**Version:** v2026.1 (Hardware-Verified Edition)  
**Status:** ACTIVE | Role: Installation Ninja

This is the definitive "Source of Truth" for maintaining the Evolution Studio workstation. It maps specific AMD/NVIDIA hardware to the "Safe-Path" standard to prevent crashes, path drift, and performance bottlenecks.

---

## 🗑️ The "Graveyard" (Obsolete Elements)

These methods are BANNED. If found in old documentation, ignore them.

| 💀 Obsolete Element | ✅ Replacement Standard | 💡 Why it changed? |
|---------------------|------------------------|-------------------|
| scratch.vhdx (Virtual Disk) | Direct Bind Mount | VHDX files confuse the OS. We now map the physical Samsung 990 PRO directly to WSL. |
| UUID in fstab | /mnt/s Binding | UUIDs can shift. Binding the S: drive letter is permanent and crash-proof. |
| Metadata Flag | Native NTFS Permissions | The metadata flag caused "Read Only" errors. We now use standard user mapping. |
| wsl --mount | Automount Script | No manual mounting needed. The system auto-bridges the drives at login. |

---

## ⚡ Compute & Processing Architecture

**Protocol:** Headless / Compute-Only (Hybrid AMD/NVIDIA)

### 🚀 The Engine (GPU 0: NVIDIA RTX 3060 12GB)

**Role:** Strictly AI Inference, Training, and Image Generation (CUDA).

**Configuration:**
- **Driver Mode:** WDDM 3.x (WSL2 Passthrough).
- **VRAM Strategy:** 100% Dedicated. The RTX 3060 is relieved of Windows display duties by the iGPU.
- **OOM Safety:** If a model exceeds 11.5GB, enable quantization (GGUF) or --lowvram mode immediately.

### 🧠 The Orchestrator (CPU: AMD Ryzen 5 7600X)

**Specs:** 6 Cores / 12 Threads @ 4.7GHz+

**Role:** Logic, Vector Database Management (Chroma/FAISS), and Compilation.

**Configuration Strategy (The "10/2 Split"):**
- **WSL Allocation:** 10 Threads assigned to Linux for heavy lifting.
- **Windows Reservation:** 2 Threads reserved for Windows 11/VS Code to maintain system responsiveness.

### 🧠 Memory Architecture (32GB DDR5 6000MT/s)

- **WSL Allocation:** 24GB (Hard limit via .wslconfig).
- **Windows Buffer:** 8GB reserved for OS stability.
- **Swap Strategy:** 8GB Swap File located on the high-speed S: drive to prevent crashes during overflows.

---

## 🖥️ Storage Architecture

### 1. OS Drive (C:) - HP SSD FX700

- **Windows Path:** C:\
- **Purpose:** Windows 11, WSL2 System Image, Temp files.
- **RESTRICTION:** ⛔ NO AI DATA. No models, no active project code.

### 2. Production Drive (S:) - Samsung 990 PRO

- **Windows Path:** S:\
- **Linux Path:** /mnt/scratch/ (Bind Mount)
- **Purpose:** The "Hot" Drive. High-IOPS workspace for all active development.

---

## 📂 The "Safe-Path" Directory Standard

All commands must target this structure:

```
/mnt/scratch/ (Mapped from S:\)
├── projects/          # ✅ YOUR ACTIVE WORKSPACE
│   ├── Evolution-3.1/ # Active Agent Code
│   ├── ComfyUI/       # Image Gen (Uses RTX 3060)
│   └── Local_LLM/     # Text Gen (Ollama/LlamaCPP)
├── models/            # 📦 HEAVY ASSETS (>500MB)
│   ├── Checkpoints/   # SDXL / Flux Files
│   ├── GGUF/          # Quantized LLMs
│   └── VAE/           # Encoders
├── vault/             # 🔐 SECURE STORAGE (Keys, .env backups)
└── venv/              # 🐍 PYTHON ENVIRONMENTS
```

---

## 🚦 The "North Star" Rules

### Home Directory is Lava (~)

- Never run git clone in ~ or /home/evo/.
- ALWAYS cd /mnt/scratch/projects/ first.

### Venv Location Strategy

Create venvs inside the project folder on S:

```bash
python -m venv /mnt/scratch/projects/[name]/venv
```

### The "Big File" Rule

- Any file >500MB goes to /mnt/scratch/models/.
- Never save large .safetensors to the project folder itself.

### Hardware Isolation

- User evo (UID 1000) owns /mnt/scratch.
- GPU 0 (RTX 3060) is reserved for Python/CUDA processes.

---

## 🛡️ "Anti-Crash" Safety & Recovery

### Startup Automation

**Task Scheduler:** Evolution_Studio_AutoMount

**Action:** `wsl -u root mount --bind /mnt/s /mnt/scratch`

**Effect:** Ensures S:\ is visible as /mnt/scratch instantly upon login.

### Emergency Reset (.bat)

**File:** Desktop\EVO_RESET.bat

(Run this if ls /mnt/scratch returns empty)

```batch
@echo off
echo [EVO-STATION] Hardware Reset Initiated...
echo 1. Terminating WSL Instances...
wsl --shutdown
echo 2. Verifying Samsung 990 PRO (S:)...
if exist S:\ ( echo [OK] S: Drive Found ) else ( echo [FAIL] S: Drive Missing! Check cables. & pause & exit )
echo 3. Restarting & Binding Mount...
timeout /t 3
wsl -u root -e mkdir -p /mnt/scratch
wsl -u root -e mount --bind /mnt/s /mnt/scratch
echo [SUCCESS] Evolution Studio Online. RTX 3060 Ready.
pause
```

---

## ⚙️ Hardware Configuration File

**File:** C:\Users\[User]\.wslconfig

```ini
[wsl2]
memory=24GB
processors=10
swap=8GB
swapFile=S:\\wsl-swap.vhdx
localhostForwarding=true
guiApplications=false
```

---

## 🛠️ Core Configuration & Path Structure

Your ComfyUI is located at `/mnt/scratch/WSL/projects/ComfyUI` on your high-speed S: drive.

**Model Paths:** ComfyUI is configured to look for models in `/mnt/scratch/models/GGUF/` and its own internal subfolders. You likely use an extra_model_paths.yaml file to link these central "Vault" models without duplicating large files.

**Workflows:** You have a dedicated directory at `/mnt/scratch/WSL/projects/ComfyUI_Workflows`. These are stored as JSON files or embedded in generated PNG metadata, allowing you to "drag and drop" a previous creation back into the UI to instantly rebuild the logic.

---

## 🔌 The "MCP" Integration

The comfyui-mcp-server folder in your projects directory indicates that ComfyUI is "plugged in" to your AI agents via the Model Context Protocol (MCP).

**Cline Integration:** This allows Cline (or other MCP-compatible agents) to programmatically build, execute, and manage image generation workflows.

**Automation:** Through this bridge, you can ask an agent like Cline to "Generate a realistic horse logo in ComfyUI using the Flux model," and the agent will automatically call the generate_image or execute_workflow tool on your local server.

---

## 🚀 Hardware Optimization (Early 2026)

As of early 2026, your setup likely leverages advanced local drivers:

**VRAM Management:** It is configured to handle large models like Flux.1 (32B parameters) by intelligently offloading to your 12GB RTX 3060 VRAM and using your 24GB of system RAM as a secondary buffer.

**WSL Performance:** By running within WSL, you gain near-native Linux performance for Python-heavy tasks, which is critical for the newest Wan 2.2 and LTX-Video models.

**Server Access:** Your server is set to --listen 0.0.0.0 if you access it from your Windows browser at localhost:8188 or other devices on your local network.

---

## 📊 Comparison of Your Workflow

| Feature | Traditional UI (Midjourney/DALL-E) | Your ComfyUI Setup |
|---------|-------------------------------------|-------------------|
| Control | "Black Box" (Limited sliders) | Granular (Full node-based logic) |
| Privacy | Cloud-based (Sent to external servers) | 100% Local (Private & Secure) |
| Customization | Standard models only | LoRAs & ControlNets (Surgical control) |
| Agentic Power | Manual prompts only | MCP-Enabled (Autonomous AI generation) |
