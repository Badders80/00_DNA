# Evolution Build System

**Version:** 2026.1 | **Status:** Canonical
**Scope:** Architecture, Methodology, and Development Rules

---

## 1. Domain-Split Architecture
To avoid the maintenance tax of a monolith, the ecosystem is split into three technical domains.

### 1.1 The Interface (The Face)
- **Repo:** `/home/evo/projects/EvolutionStudio/`
- **Stack:** Next.js / TypeScript / Tailwind
- **Role:** Unified storefront. Jobs are triggered and reviewed here.

### 1.2 The Production API (The Muscle)
- **Repo:** `/home/evo/projects/EvolutionContent/`
- **Stack:** Python / FastAPI / Docker
- **Role:** Execution engine. Handles the Persona Layer, video rendering (ComfyUI/FFmpeg), and 4MAT report formatting.

### 1.3 The Intelligence (The Scout)
- **Repo:** `/home/evo/projects/EvolutionIntelligence/`
- **Stack:** Python / Firecrawl
- **Role:** Independent scraping and data gathering. Feeds structured data into the Production API.

---

## 2. Separation of Concerns
**Golden Rule:** Content ≠ Intelligence ≠ Infrastructure ≠ External

### 2.1 Layering Mandates
- **Infrastructure:** Models (>100MB), venvs, build artifacts, Docker images. Stays in `/home/evo/models/` or dedicated infrastructure folders.
- **Intelligence:** Lightweight code-only repositories (<10MB). Connects to infrastructure via APIs/Env vars.
- **External:** Third-party tools (n8n, Supabase). Isolated in `External/` or Docker networks.

### 2.2 Why This Matters
- Clone speed: 30 seconds vs 30 minutes.
- Portability: Laptop as thin client vs heavy workstation.
- Reliability: Pipeline failures are isolated.

---

## 3. Build Methodology Selection
Choose exactly one methodology per task.

### 3.1 Use Superpowers
Use when in Codex/Claude Code for full lifecycle: `brainstorm -> spec -> plan -> TDD -> review -> finish`.
Default for new end-to-end features.

### 3.2 Use GSD (Get Shit Done)
Use for focused execution of already scoped milestones. 
Default for constrained execution inside an approved plan.

### 3.3 Antfarm Layering
Layer `snarktank/antfarm` on top of GSD for repeatable multi-agent execution across repo-wide tasks.
**Note:** Do not layer Antfarm on Superpowers for the same task.

---

## 4. Sandbox Philosophy
The `/evo/_sandbox/` directory is a **Free Trade Zone** for rapid prototyping.

### 4.1 Sandbox Rules
- ❌ No DNA oversight or naming standards.
- ❌ No production code or dependencies.
- ✅ Pure experimentation and permission to break things.
- ⚠️ Ephemeral: Deletable without notice.

### 4.2 Graduation Path
1. Experiment in `_sandbox/`.
2. Rewrite to standards in `projects/`.
3. Graduate to DNA (standardize patterns).

---

## 5. Safety & Operations
- **Blast Radius:** Failures in rendering must not take down the UI.
- **API-First:** All communication via strictly defined REST/JSON contracts.
- **Dependency Isolation:** Python AI deps never touch Node.js web deps.
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
# Evolution Tech Stack 2026

**Version:** 2026.1 | **Status:** Canonical
**Scope:** Active Software, Services, and Model Registry

---

## 1. Primary Runtimes
- **Python:** 3.12.3 (Venvs at `/home/evo/projects/[project]/venv`)
- **Node.js:** Latest LTS (Next.js 14 / TypeScript)
- **Database:** Supabase (PostgreSQL) for Expert Ledger and Flucs.

---

## 2. LLM Architecture
**Philosophy:** Local-First Intelligence with Cloud-Hybrid fallback.

### 2.1 Model Registry (Ollama)
| Model | Size | Use Case | Response |
| :--- | :--- | :--- | :--- |
| **liquid-ai-2.6b** | 2.7GB | Fast iteration, simple Q&A | < 2s |
| **evolution-designer** | 6.2GB | Creative content, branding | 2–5s |
| **evolution-coder** | 6.3GB | Code generation, docs | 2–5s |
| **qwen2.5-14b** | 8.6GB | Complex reasoning, strategy | 3–8s |

### 2.2 Model Selection Strategy
1. **Draft:** Start with `liquid-ai` for speed.
2. **Refine:** Use specialized `evolution-*` models for domain work.
3. **Finalize:** Use `qwen2.5-14b` for strategic review.

---

## 3. Automation & Content Factory
- **Orchestration:** n8n (Docker-based)
- **Image/Video Gen:** ComfyUI (FLUX.1-dev, LTX-Video, Wan 2.2)
- **Voice:** ElevenLabs API (Kore Voice, Eleven Turbo v2)
- **Assembly:** FFmpeg (NVENC/CPU hybrid)

---

## 4. Service Discovery (Ports)
| Service | Port | Status |
| :--- | :--- | :--- |
| **Ollama** | 11434 | Active |
| **n8n** | 5678 | Active |
| **ComfyUI** | 8189 | Active |
| **Supabase** | 5432 | Cloud |

---

## 5. Workflow Protocols
- **Scout Agent:** Groq (Llama 3.3 70B via API) for market anomaly detection.
- **Human Gate:** All content requires Telegram Bot approval before publishing.
- **Sunday Hygiene:** Automated VRAM flush, WSL compaction, and Expert Ledger backups.
