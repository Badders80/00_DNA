# Evolution Machine Configuration

**Version:** 2026.1 (Hardware-Verified Edition) | **Status:** Canonical
**Scope:** Hardware Isolation, WSL Standards, and VRAM Safety

---

## 1. Hardware Architecture
The Evolution workstation uses a **Headless/Compute-Split** protocol.

### 1.1 The Engine (GPU 0: NVIDIA RTX 3060 12GB)
- **Role:** Strictly AI Inference, Training, and Image Generation (CUDA).
- **Isolation:** Headless mode. Relieved of Windows display duties by the iGPU.
- **VRAM Strategy:** 100% Dedicated to compute.

### 1.2 The Orchestrator (CPU: AMD Ryzen 5 7600X)
- **Allocation:** 10 Threads assigned to WSL2 for heavy lifting; 2 Threads reserved for Windows/VS Code responsiveness.

### 1.3 Memory (32GB DDR5 6000MT/s)
- **WSL Allocation:** 24GB (Hard limit via `.wslconfig`).
- **Swap Strategy:** 8GB Swap File located on the S: drive.

---

## 2. Storage & "Safe-Path" Standards
All development must target the native Linux filesystem on the NVMe drive.

### 2.1 Drive Mapping
- **Production Drive (S:):** Samsung 990 PRO.
- **Linux Path:** `/home/evo/` (Bind Mount from S:).
- **Restriction:** ⛔ NO AI DATA on OS Drive (C:).

### 2.2 Directory Structure
```text
/home/evo/
├── projects/          # ✅ ACTIVE WORKSPACE
├── models/            # 📦 HEAVY ASSETS (>500MB)
│   ├── Checkpoints/   # SDXL / Flux Files
│   ├── GGUF/          # Quantized LLMs
│   └── VAE/           # Encoders
├── vault/             # 🔐 SECURE STORAGE (Keys, .env backups)
└── venv/              # 🐍 PYTHON ENVIRONMENTS
```

---

## 3. VRAM Safety & OOM Prevention
- **Hard Ceiling:** 11.5GB VRAM usage max.
- **Required Buffer:** 500MB minimum at all times.
- **Protocol:** If usage > 11.5GB, enable quantization (GGUF) or `--lowvram` mode immediately.
- **Mutual Exclusion:** ComfyUI and Ollama inference should not run simultaneously in production.

---

## 4. WSL Configuration
**File:** `C:\Users\[User]\.wslconfig`
```ini
[wsl2]
memory=24GB
processors=10
swap=8GB
swapFile=S:\wsl-swap.vhdx
localhostForwarding=true
guiApplications=false
```

---

## 5. Startup & Recovery
- **Auto-Mount:** Task Scheduler runs `wsl -u root mount --bind /mnt/s /home/evo` at login.
- **Reset Script:** `Desktop\EVO_RESET.bat` kills WSL and re-binds the mount if the directory appears empty.
