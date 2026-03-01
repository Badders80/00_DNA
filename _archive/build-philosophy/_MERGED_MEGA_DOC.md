# Evolution Stables — Build Philosophy Mega Document

**Merged Compilation of All Build Philosophy Documents**
**Location:** `00_DNA/build-philosophy/`
**Generated:** March 1, 2026

---

# TABLE OF CONTENTS

1. [ARCHITECTURE_STRATEGY.md](#1-architecture_strategymd) — Domain-Split Architecture
2. [BUILD_BRAIN.md](#2-build_brainmd) — Build Methodology Selection
3. [Evolution_OS.md](#3-evolution_osmd) — Technical Architecture & Operations Manual
4. [Master_Config_2026.md](#4-master_config_2026md) — Hardware-Verified Master Configuration
5. [SANDBOX_PHILOSOPHY.md](#5-sandbox_philosophymd) — The Free Trade Zone for Rapid Prototyping
6. [SEPARATION_OF_CONCERNS.md](#6-separation_of_concernsmd) — Build Rule: Separation of Concerns
7. [Tech_Stack_2026.md](#7-tech_stack_2026md) — Evolution Stables Tech Stack
8. [llm-architecture.md](#8-llm-architecturemd) — LLM Architecture Philosophy

---

# 1. ARCHITECTURE_STRATEGY.md

## Evolution Stables — Architecture Strategy (Domain-Split)
**Version:** 1.0 | **Last Updated:** February 2026  
**Status:** CANONICAL — Replaces Monorepo proposals.

---

## 🏗️ THE DOMAIN-SPLIT ARCHITECTURE

To avoid the maintenance tax of a monolith, the ecosystem is split into three technical domains.

### **1. THE INTERFACE (The Face)**
- **Repo:** `/home/evo/projects/EvolutionStudio/`
- **Stack:** Next.js / TypeScript / Tailwind
- **Role:** The unified storefront. Jobs are triggered here; reports and videos are reviewed here.
- **Merge Target:** UI logic from `Content-Builder` and `Pitch_Deck_Builder` will be ported here.

### **2. THE PRODUCTION API (The Muscle)**
- **Repo:** `/home/evo/projects/EvolutionContent/` (NEW)
- **Stack:** Python / FastAPI / Docker
- **Role:** The execution engine. Handles the **Persona Layer**, video rendering (ComfyUI/FFmpeg), and 4MAT report formatting.
- **Merge Target:** Combines the backends of `Evolution-Content-Factory` and `Evolution-Content-Builder`.

### **3. THE INTELLIGENCE (The Scout)**
- **Repo:** `/home/evo/projects/EvolutionIntelligence/`
- **Stack:** Python / Firecrawl
- **Role:** Independent scraping and data gathering. Feeds structured data into the Production API.

---

## 🛡️ SAFETY & MODULARITY

1. **Dependency Isolation:** Python AI dependencies never touch Node.js web dependencies.
2. **Blast Radius:** A failure in the video rendering pipeline does not take down the user interface.
3. **API-First:** Communication between domains happens via strictly defined REST/JSON contracts.

---

# 2. BUILD_BRAIN.md

## Build Methodology Selection

When starting a new task, choose exactly one build methodology.

---

### Use Superpowers

Use `obra/superpowers` when all of these are true:
- You are working in Codex or Claude Code.
- The task needs full lifecycle execution: `brainstorm -> spec -> plan -> TDD -> review -> finish`.
- Work includes feature delivery, new components, or test-touching changes.
- Subagent parallelism is beneficial for delivery speed.

### Use GSD

Use `gsd-build/get-shit-done` when all of these are true:
- The project is already scoped/planned and you are executing a focused milestone.
- You need disciplined execution without restarting full discovery/spec cycles.
- `snarktank/antfarm` is handling orchestration for multi-agent execution where needed.

---

## Antfarm Layering Rules

Use `snarktank/antfarm` as the orchestration layer, not as a replacement for methodology.

### Layer Antfarm On Top Of GSD

Use this combination when:
- Work is already scoped and split into milestone phases.
- You need repeatable multi-agent execution across repo-wide tasks.
- The task benefits from deterministic workflow runs (for example, feature-dev, security-audit, refactor passes).

### Do Not Layer Antfarm On Superpowers For The Same Task

- If Superpowers is selected for a task lifecycle, do not run Antfarm on that same task.
- If Antfarm is required for orchestration, route that task through GSD methodology.

### Non-Negotiables

- Never run Superpowers and GSD simultaneously on the same task.
- Superpowers is the default for new end-to-end feature lifecycles.
- GSD is the default for constrained execution inside an approved plan.

---

## Trial Review Trigger

- `obra/superpowers`: Promote to `Adopt` or demote to `Assess` after the first complete Codex task using the Superpowers workflow.
- Update `skills/starred_repo_registry.json` with that decision and remove this note after the decision is recorded.

---

# 3. Evolution_OS.md

# Technical Architecture & Operations Manual

**Version:** 2026.2  
**Status:** Canonical  
**Location:** 00_DNA/build-philosophy/  
**Scope:** Hardware, software stack, workflows, governance, maintenance  
**Audience:** Technical operators only.  
Content operators use Telegram Commander.  
Brand operators read Branding.md.

---

## 1. HARDWARE ARCHITECTURE

### The Compute Split

BIOS requirement: iGPU Multi-Monitor MUST be enabled to allow GPU passthrough for headless compute while iGPU drives display.

| Component           | Role                          | Isolation              |
|---------------------|-------------------------------|------------------------|
| RTX 3060 12GB       | Dedicated compute             | Headless, no display   |
| Ryzen 7600X iGPU    | OS / Browser / n8n UI         | Motherboard output     |
| 24GB DDR5-6000      | System memory                 | Shared                 |
| Samsung 990 PRO 2TB | Scratch drive (all work here) | NVMe, /home/evo/       |

### VRAM Management

| Service             | VRAM Allocation  |
|---------------------|------------------|
| Ollama inference    | 4–9GB per model  |
| ComfyUI (when active)| 8–11GB          |
| Hard ceiling        | 11.5GB max       |
| Required buffer     | 500MB minimum    |

**Rule:** Never exceed 11.5GB. Leave 500MB buffer at all times.  
ComfyUI and Ollama do not run simultaneously in production.

### The Integrity Bridge

The Samsung 990 PRO (/home/evo/projects/) is the bridge between cloud data collection and local asset assembly.

**Sacred Rule:** All active work happens on the 990 PRO.  
OS drive is for system files only. No project files on OS drive.

---

## 2. FILE SYSTEM ("THE STABLES")

### Global Structure (Target)

Note: This is the target architecture. For current actual paths, see memory-bank/activeContext.md. Do not reorganise without updating activeContext.md.

```
/home/evo/projects/
├── 00_DNA/              # Source of truth (these docs)
├── 01_Platform/         # EvolutionPlatform (main platform)
├── 02_Content_Factory/  # EvolutionContent operations
├── 03_Tools/            # MCP servers, CLI utilities
├── 04_Intelligence/     # EvolutionIntelligence, Ollama, Gemini configs
└── 05_Archive/          # Cold storage
```

### Content Factory Structure (02_Content_Factory/)

```
02_Content_Factory/
├── 01_raw_intake/       # API dumps, Scout briefs, weekend payloads
├── 02_assets/           # Reusable elements
│   ├── branding/        # Logos, lower thirds, Evolution Intelligence
│   ├── voice_stems/     # ElevenLabs Kore outputs (MP3)
│   ├── stock_footage/   # 4K B-roll (track work, stables, races)
│   └── chart_overlays/  # PNG templates (scatter plots, tickers)
├── 03_vault/            # Active projects ("The Paddock")
│   └── YYYY-MM-DD_VENUE_TYPE/
├── 04_exports/          # Final renders ("Winners Circle")
├── The_Stud/            # Archive of successful campaigns
└── InfrastructureComfyUI/ # Video generation engine
```

### File Naming Conventions

**Files:** `YYYY-MM-DD_VENUE_TYPE_vN.ext`
**Final:** `YYYY-MM-DD_VENUE_TYPE_FINAL.ext`

Examples:
- `2026-02-18_Ellerslie_WhaleWatch_v3.mp4`
- `2026-02-15_Trentham_Kingmaker_FINAL.mp4`
- `2026-02-22_TeRapa_Outsider_v2.mp4`

**Directories:** `YYYY-MM-DD_VENUE_CONTENT/`
- `2026-02-18_Ellerslie_Preview/`
- `2026-02-22_TeRapa_Recap/`

---

## 3. DATA ARCHITECTURE

### The Expert Ledger (Supabase)

The Expert Ledger is the central data asset of Evolution Intelligence. It is what makes the Kingmaker pillar possible and is the primary output of the Research Engine's scraper layer.

**Database:** Supabase (PostgreSQL)  
**Table:** expert_ledger

| Field         | Type      | Description                                    |
|---------------|-----------|------------------------------------------------|
| id            | UUID      | Primary key, auto-generated                    |
| pundit_name   | TEXT      | BGP, TAB Form, ACC, The Leg Up, SENZ, etc.     |
| race_date     | DATE      | Meeting date                                   |
| venue         | TEXT      | Ellerslie, Trentham, Te Rapa, Hastings, etc.   |
| race_number   | INT       | Race number on the card                        |
| call          | TEXT      | Horse name tipped by pundit                    |
| finish_pos    | INT       | Actual finishing position (NULL if scratched)  |
| divvie_paid   | DECIMAL   | Win dividend paid (0.00 if not placed)         |
| correct_call  | BOOLEAN   | true if horse finished 1st                     |
| running_roi   | DECIMAL   | Cumulative ROI % for this pundit (calculated)  |
| source_url    | TEXT      | Link to original tip/call                      |
| created_at    | TIMESTAMP | Auto-populated (UTC)                           |
| updated_at    | TIMESTAMP | Auto-updated on any change                     |

**RLS (Row Level Security):** Enabled.  
Read: Public (for GTI content generation).  
Write: Service role only (Research Engine scraper).

### Flucs Data (Supabase)

**Table:** flucs_history

| Field          | Type      | Description                              |
|----------------|-----------|------------------------------------------|
| id             | UUID      | Primary key                              |
| race_date      | DATE      | Meeting date                             |
| venue          | TEXT      | Venue name                               |
| race_number    | INT       | Race on card                             |
| horse_name     | TEXT      | Horse name                               |
| timestamp      | TIMESTAMP | Exact time of price snapshot             |
| fixed_odds     | DECIMAL   | Fixed odds at this timestamp             |
| tote_odds      | DECIMAL   | Tote odds at this timestamp (if avail.)  |
| volume_delta   | DECIMAL   | Volume change since last snapshot        |
| whale_alert    | BOOLEAN   | true if alert threshold met              |
| created_at     | TIMESTAMP | Auto-populated                           |

**Whale Alert threshold:** volume_delta > 2 std dev AND fixed_odds drop > 15% within any 10-minute window.

### Data Flow Architecture

```
TAB API (5-min poll)
│
▼
Research Engine (scrapers)
│
├──► Supabase: flucs_history (live data)
└──► Supabase: expert_ledger (post-race results)
│
▼
n8n Workflow
│
Gemini Pro
(GTI guardrails)
│
ElevenLabs Kore
(voice synthesis)
│
FFmpeg
(video assembly)
│
Telegram Bot
(human approval)
│
Social APIs
(TikTok / X / Instagram)
```

---

## 4. SOFTWARE STACK

### Core Services

| Service      | Technology                    | Status    | Port  |
|--------------|-------------------------------|-----------|-------|
| Ollama       | Llama 3.3 70B, Qwen2.5, custom| Active    | 11434 |
| n8n          | Workflow automation (Docker)  | Active    | 5678  |
| ComfyUI      | Video gen (LTX, Wan2.1, Wan2.2)| Dormant  | 8188  |
| Supabase     | PostgreSQL (Expert Ledger)    | Cloud     | 5432  |

### Ollama Model Registry

| Model               | Size  | Use Case                   | Response  |
|---------------------|-------|----------------------------|-----------|
| evolution-designer  | 6.2GB | Creative content           | 2–5s      |
| evolution-coder     | 6.3GB | Code generation            | 2–5s      |
| qwen2.5-14b         | 8.6GB | Complex reasoning          | 3–8s      |
| liquid-ai-2.6b      | 2.7GB | Quick queries              | 0.5–2s    |

**Best practice:** Start with liquid-ai for speed. Move to specialised model once prompt is refined and task is confirmed.

### The Scout Agent

**Location:** 04_Intelligence/  
**Engine:** Groq (Llama 3.3 70B via API) + Composio tools  
**Trigger:** Automated (Thu–Sun) OR manual /preview [meeting] command

**Loop (Thu–Sun):**
1. **Ingest:** TAB API, Expert Ledger (Supabase), TRC Rankings
2. **Analyse:** SQL query + LLM reasoning for anomalies
3. **Research:** Web search, social sentiment, YouTube transcripts
4. **Synthesise:** Structured brief → 01_raw_intake/
5. **Handoff:** Trigger n8n script generation workflow

**Anomaly detection targets:**
- Sectional Rank vs. Market Liability divergence
- Expert Ledger consensus vs. Smart Money flow conflict
- TRC Global context (NZ trainers vs. world ranking benchmarks)
- LoveRacing NZ sentiment gaps vs. market price

**Black-Box Avoidance Rule:**  
Every Scout decision saves: SQL query + LLM reasoning → Notion  
Every Gemini script outputs: JSON with source tag per claim  
Every ElevenLabs render saves: settings + prompt text alongside MP3

### Environment Configuration

**Pattern:** env.py validation at startup (Evolution_Studio standard).  
Never hardcode API keys. Never commit .env files.

**File hierarchy:**
- `.env.local` → Machine-specific (gitignored)
- `.env.example` → Committed template (no real values)
- `env.py` → Startup validator (fails loudly if missing)

**Required environment variables:**
- SUPABASE_URL
- SUPABASE_KEY
- GEMINI_API_KEY
- ELEVENLABS_API_KEY
- GROQ_API_KEY
- TAB_API_KEY
- TELEGRAM_BOT_TOKEN
- N8N_WEBHOOK_URL

**env.py pattern** (from Evolution_Studio — use this everywhere):  
At startup, validate all required vars are present.  
If any missing: print clear error with var name, exit(1).  
Never silently fail. Never use defaults for API keys.

---

## 5. WORKFLOWS

### Cloud Collector

**Runtime:** 24/7 active (Thursday–Sunday intensive)  
**Source:** Supabase (write target), TAB API (data source)

**Pipeline:**
1. Poll TAB API every 5 minutes (fixed odds + tote volume)
2. Write Flucs snapshots to flucs_history (Supabase)
3. Post-race: scrape pundit calls → write to expert_ledger
4. Detect Whale Alerts (threshold: see Section 3)
5. Package weekend payload → POST to local n8n webhook

**Fallback:** If TAB API unavailable, cache last known Flucs and use pundit feed data only. Flag gap in Scout brief.

### Local Meat Grinder (n8n)

**Trigger:** Webhook from Research Engine OR Telegram /preview command

**Step 1 — Script Generation (Gemini Pro)**
- **Input:** Scout brief + Expert Ledger data
- **Prompt:** GTI voice guardrails enforced (banned terms list)
- **Output:** 4MAT script (max 75 words), JSON with source tags
- **Rule:** Every claim cites data (Sectional Rank, Volume Delta, etc.)

**Step 2 — Voice Synthesis (ElevenLabs)**
- **Voice:** Kore (NZ accent, clinical but warm)
- **Settings:** Stability 0.6, Clarity 0.8, Style 0.4
- **Model:** Eleven Turbo v2 (latency-optimised for pipeline)
- **Output:** MP3 → 02_assets/voice_stems/ (with settings JSON)

**Step 3 — Video Assembly (FFmpeg)**
- **Inputs:** Voice stem + B-roll + chart overlay PNGs
- **Captions:** Inter Bold, 48px, #f5f5f5, 2px black stroke
- **Resolution:** 1080×1920, H.264, CRF 23
- **Duration:** Hard cap 60s (Outsider: 90s max)
- **Command pattern:**
```bash
ffmpeg -i [broll] -i [voiceover] -vf "subtitles=[captions],scale=1080:1920" -c:v libx264 -crf 23 -c:a aac [output]
```

**Step 4 — Human Gate (Telegram Bot)**
- Sends: Inline video preview + script + source citations
- Buttons: APPROVE | REJECT | EDIT
- No video publishes without explicit APPROVE tap.

**Step 5 — Distribution (post-approval)**
- **Platforms:** TikTok, X, Instagram
- **Log:** Post ID, timestamp, platform → Expert Ledger (for ROI audit)

### Sunday Hygiene SOP

**Schedule:** Sunday 20:00 NZDT (automated n8n trigger)

| Step                 | Command / Action                                  |
|----------------------|---------------------------------------------------|
| VRAM Flush           | docker restart n8n                                |
| Render Purge         | rm -rf 04_exports/* (successful posts only)       |
| WSL Compact          | wsl --shutdown && Optimize-VHD *.vhdx             |
| Intake Archive       | Move 01_raw_intake/ files >7 days → The_Stud/     |
| Expert Ledger Backup | Supabase export → CSV → Google Drive              |
| Tone Check           | Gemini audit of week's scripts for lad drift      |
| Health Check         | Run evo_health_check.sh, log output               |

---

## 6. TELEGRAM COMMANDER

### Command Reference

| Command              | Function                                        |
|----------------------|-------------------------------------------------|
| /status              | System health (Docker, disk, GPU utilisation)   |
| /audit               | Expert Ledger summary (pundit performance)      |
| /whale               | Latest Whale Alerts (last 2 hours)              |
| /preview [meeting]   | Trigger Scout brief for named meeting           |
| /approve [id]        | Publish approved video to social platforms      |
| /reject [id] [reason]| Archive to rejected folder with reason logged   |
| /edit [id]           | Return to 03_vault/ for modification            |

### Human-in-the-Loop Rule

Non-negotiable: Every piece of content requires explicit human approval before any distribution. The factory automates research and production — never editorial judgment.

---

## 7. ERROR HANDLING

### Graceful Degradation

| Failure               | Fallback                                          |
|-----------------------|---------------------------------------------------|
| TAB API down          | Use cached Flucs + pundit feeds only              |
| Supabase unreachable  | Queue writes locally, sync on reconnect           |
| ElevenLabs outage     | Use cached voice stems from 02_assets/voice_stems/|
| Gemini rate limit     | Switch to local Ollama (lower quality, acceptable)|
| Low confidence (<0.6) | Silence. Do not publish.                          |
| VRAM full (>11.5GB)   | Kill Python processes, restart Docker             |

### Emergency Procedures

**VRAM Recovery:**
```bash
kill $(nvidia-smi --query-compute-apps=pid --format=csv,noheader)
docker restart n8n
```

---

# 4. Master_Config_2026.md

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
- **Linux Path:** /home/evo/ (Bind Mount)
- **Purpose:** The "Hot" Drive. High-IOPS workspace for all active development.

---

## 📂 The "Safe-Path" Directory Standard

All commands must target this structure:

```
/home/evo/ (Mapped from S:\)
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
- ALWAYS cd /home/evo/projects/ first.

### Venv Location Strategy

Create venvs inside the project folder on S:

```bash
python -m venv /home/evo/projects/[name]/venv
```

### The "Big File" Rule

- Any file >500MB goes to /home/evo/models/.
- Never save large .safetensors to the project folder itself.

### Hardware Isolation

- User evo (UID 1000) owns /home/evo.
- GPU 0 (RTX 3060) is reserved for Python/CUDA processes.

---

## 🛡️ "Anti-Crash" Safety & Recovery

### Startup Automation

**Task Scheduler:** Evolution_Studio_AutoMount

**Action:** `wsl -u root mount --bind /mnt/s /home/evo`

**Effect:** Ensures S:\ is visible as /home/evo instantly upon login.

### Emergency Reset (.bat)

**File:** Desktop\EVO_RESET.bat

(Run this if ls /home/evo returns empty)

```batch
@echo off
echo [EVO-STATION] Hardware Reset Initiated...
echo 1. Terminating WSL Instances...
wsl --shutdown
echo 2. Verifying Samsung 990 PRO (S:)...
if exist S:\ ( echo [OK] S: Drive Found ) else ( echo [FAIL] S: Drive Missing! Check cables. & pause & exit )
echo 3. Restarting & Binding Mount...
timeout /t 3
wsl -u root -e mkdir -p /home/evo
wsl -u root -e mount --bind /mnt/s /home/evo
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

Your ComfyUI is located at `/home/evo/WSL/projects/ComfyUI` on your high-speed S: drive.

**Model Paths:** ComfyUI is configured to look for models in `/home/evo/models/GGUF/` and its own internal subfolders. You likely use an extra_model_paths.yaml file to link these central "Vault" models without duplicating large files.

**Workflows:** You have a dedicated directory at `/home/evo/WSL/projects/ComfyUI_Workflows`. These are stored as JSON files or embedded in generated PNG metadata, allowing you to "drag and drop" a previous creation back into the UI to instantly rebuild the logic.

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

---

# 5. SANDBOX_PHILOSOPHY.md

# Sandbox Philosophy

**The Free Trade Zone for Rapid Prototyping**

---

## Purpose

`_sandbox/` is where ideas are born, broken, and reborn without consequence.

It's the anti-DNA:
- ❌ No standards
- ❌ No guardrails  
- ❌ No ripple effects
- ✅ Pure experimentation
- ✅ Fast iteration
- ✅ Permission to break things

---

## Rules (Anti-Rules)

### 1. No DNA Oversight

Sandbox is **EXPLICITLY EXEMPT** from:
- Naming conventions
- Architecture standards
- Build rules
- Documentation requirements
- Git hygiene (can be messy)
- Testing requirements

### 2. No Production Code

Nothing in `_sandbox/` ever runs in production. It's scratch paper.

### 3. No Dependencies

Sandbox projects must not be imported by real projects. They're isolated.

### 4. Ephemeral

Sandbox contents are:
- Temporary by default
- Deletable without notice
- Not backed up (unless you do it)

---

## When to Use Sandbox

**Use `_sandbox/` when:**
- Testing a new library/framework
- Spiking a feature concept
- Learning a new technology
- Breaking things on purpose
- Quick one-off scripts
- "What if I tried..." experiments

**Don't use `_sandbox/` when:**
- Building production features
- Creating reusable components
- Writing code others will maintain
- Following DNA standards

---

## Graduation Path

```
_sandbox/Experiment_Thing/     # Born here (messy, fast)
        ↓
projects/New_Thing/            # Graduated here (clean, DNA-compliant)
        ↓
DNA (if pattern emerges)       # Documented here (standard)
```

### How to Graduate

1. Copy from `_sandbox/Experiment_Thing/` to `projects/New_Thing/`
2. Apply DNA standards (naming, structure, docs)
3. Wire to central vault
4. Add tests
5. Delete from `_sandbox/`

---

## Structure

```
_sandbox/
├── README.md                    # This philosophy
├── Evolution_Pitch_Deck_Builder/ # Active experiment
├── experiment-supabase-auth/    # One-off test
├── scraper-ideas/               # Notebook
└── [anything goes...]           # No structure required
```

Each folder is its own universe. No consistency expected.

---

## Anti-Patterns

### ❌ Wrong: Long-term sandbox projects

If it's been in `_sandbox/` for 3+ months, either:
- Graduate it to `projects/`
- Delete it
- Accept it's abandoned

### ❌ Wrong: Sandbox dependencies

Never do:
```python
# In a real project
from sandbox.experiment_thing import helper  # ❌ NO!
```

### ❌ Wrong: Copy-paste from sandbox without cleanup

Graduation = full rewrite to standards, not copy-paste.

---

## Relation to DNA

| | DNA | _sandbox/ |
|--|-----|-----------|
| **Purpose** | Immutable standards | Mutable experiments |
| **Rules** | Strict | None |
| **Lifetime** | Permanent | Temporary |
| **Quality** | High | Doesn't matter |
| **Dependencies** | Can be used by all | Used by nothing |

**Golden Rule:** DNA governs projects. Sandbox governs nothing.

---

## Your Sandbox

**Location:** `/evo/_sandbox/`

**Current contents:**
- `Evolution_Pitch_Deck_Builder/` — 156MB experiment

**Status check:** Has this graduated? Should it be in `projects/`?

If yes → Graduate it.  
If no → Keep experimenting.  
If abandoned → Delete it.

---

**Remember:** Sandbox is freedom. Use it. Abuse it. But don't let it become a dumping ground.

---

# 6. SEPARATION_OF_CONCERNS.md

# Build Rule: Separation of Concerns

**Golden Rule:** Content ≠ Intelligence ≠ Infrastructure ≠ External

---

## The Three Layers

```
┌─────────────────────────────────────────┐
│  CONTENT          (What users see)      │  evolution-content/
│  - Video pipelines                       │  evolution-platform/
│  - User interfaces                       │
├─────────────────────────────────────────┤
│  INTELLIGENCE     (What system knows)   │  evolution-intelligence/
│  - Scrapers, analysis                    │  evolution-command/
│  - Business logic                        │
├─────────────────────────────────────────┤
│  INFRASTRUCTURE   (What runs it)        │  infrastructure/
│  - Models (GBs of weights)               │  _external/
│  - Heavy dependencies                    │
└─────────────────────────────────────────┘
```

---

## Rule 1: Infrastructure Stays Separate

**NEVER put in intelligence/content:**
- ❌ AI model files (>100MB)
- ❌ Python virtual environments
- ❌ Build artifacts (node_modules, .next)
- ❌ Docker images or layers
- ❌ Binary dependencies

**ALWAYS goes to infrastructure/:**
- ✅ LLM models (llama.cpp, GGUF files)
- ✅ Image generation models (ComfyUI checkpoints)
- ✅ Vector databases (Chroma, etc.)
- ✅ Heavy dev tools (if shared)

---

## Rule 2: Intelligence is Code-Only

**evolution-intelligence/ must be:**
- Lightweight (<10MB without deps)
- Portable (clone and run)
- Fast CI/CD (seconds not minutes)

**Connects to infrastructure via:**
- Environment variables (`LOCAL_LLM_URL`)
- API clients (REST, gRPC)
- Service discovery

---

## Rule 3: External Tools are External

**Third-party tools go to `_external/`:**
- n8n (workflow automation)
- firecrawl (scraping service)
- supabase (database)

**Connect via:**
- Docker compose networks
- API clients
- Environment-configured URLs

---

## Directory Structure

```
projects/
├── evolution-platform/        # Web app (content layer)
├── evolution-content/         # Content pipeline (content layer)
├── evolution-intelligence/    # Scrapers, AI logic (intelligence layer)
│   └── connectors/            # Clients to infrastructure
├── evolution-command/         # Monitoring (intelligence layer)
├── brand-voice/               # Brand system (content layer)
├── infrastructure/
│   ├── local-llm/             # 25GB models + llama.cpp
│   ├── comfyui/               # 13GB image generation
│   └── shared/                # Common heavy deps
└── _external/
    ├── n8n/                   # Workflow automation
    └── firecrawl/             # Scraping service
```

---

## Why This Matters

| Without Separation | With Separation |
|-------------------|-----------------|
| Clone = 30 min, 25GB | Clone = 30 sec, 10MB |
| Can't develop on laptop | Laptop = thin client |
| CI/CD times out | CI/CD seconds |
| "Works on my machine" | Reproducible anywhere |
| Backup = hours | Backup = minutes |

---

## Migration Guide

**Moving heavy stuff out:**

```bash
# 1. Create infrastructure folder
mkdir -p infrastructure/local-llm

# 2. Move models
mv evolution-intelligence/models infrastructure/local-llm/

# 3. Create connector
cat > evolution-intelligence/connectors/local_llm.py << 'CODE'
import os
LLM_URL = os.getenv("LOCAL_LLM_URL", "http://localhost:8080")
# ... client code
CODE

# 4. Update .env
# LOCAL_LLM_URL=http://localhost:8080

# 5. Test
python evolution-intelligence/test_connector.py
```

---

## Examples

### ✅ Good: Intelligence → Infrastructure

```python
# evolution-intelligence/research/llm_client.py
import requests
import os

LLM_URL = os.getenv("LOCAL_LLM_URL")

def generate(prompt: str) -> str:
    """Calls local LLM running in infrastructure."""
    resp = requests.post(f"{LLM_URL}/generate", 
                        json={"prompt": prompt})
    return resp.json()["text"]
```

### ❌ Bad: Bundling Models

```python
# DON'T DO THIS
def generate(prompt: str) -> str:
    model = load_model("./models/llama-70b.gguf")  # ❌ 40GB file
    return model.generate(prompt)
```

---

## Related Rules

- [[Master_Config_2026]] - Hardware setup
- [[safe-path-architecture]] - File organization
- [[storage-optimization]] - 990 PRO best practices

---

**Remember:** Your laptop doesn't need 25GB of models to write code that USES them.

---

# 7. Tech_Stack_2026.md

# Evolution Stables Tech Stack
**Version:** 2026.2  
**Last Updated:** February 3, 2026  
**Status:** Production

---

## Hardware

### EVO-STATION Specifications
- **CPU:** AMD Ryzen 9 (up to 5.34 GHz)
- **GPU:** NVIDIA GeForce RTX 3060 (12 GB VRAM)
- **RAM:** 32 GB DDR5 @ 6000 MT/s
- **Storage:**
  - Samsung 990 PRO 1TB NVMe (S: drive) - Development & WSL
  - HP FX700 1TB NVMe (C: drive) - Windows OS
- **Network:** 925 Mbps down / 514 Mbps up (Sky Fiber, Auckland NZ)

---

## Operating System

### Windows 11 Pro
- WSL2 enabled
- Ubuntu 24.04 installed to `S:\WSL_Ubuntu\`

### WSL2 Ubuntu 24.04
- Primary development environment
- Native ext4 storage: /home/evo/projects

---

## Development Tools

### IDEs & Editors
- Windsurf IDE (primary)
- VS Code (fallback)

### Version Control
- Git
- GitHub (primary remote - authentication configured in vault)

### Terminal
- Windows PowerShell (Windows)
- Bash (Ubuntu/WSL)

---

## Languages & Runtimes

### Python
- **Version:** 3.12.3
- **Environment:** Virtual env at `~/projects/.venv`
- **Key Packages:**
  - google-generativeai (Gemini SDK)

### JavaScript/TypeScript
- **Runtime:** Node.js (latest LTS)
- **Package Manager:** npm
- **Framework:** Next.js 14

---

## Frameworks & Libraries

### Frontend (EvolutionPlatform)
- Next.js 14 (App Router)
- TypeScript
- Tailwind CSS
- Framer Motion
- React

### AI/ML
- ComfyUI (image/video generation)
- Gemini API (Google AI)
- PyTorch (when needed)

---

## Cloud & Deployment

### Hosting
- **Vercel** - Production deployment
  - Project: evolution-3-0
  - URL: https://vercel.com/baddeley0-2132s-projects/evolution-3-0
  - Auto-deploy from GitHub

### CMS
- **Sanity Studio** - Content management
  - Project ID: a4xfnv5b
  - Dataset: production

---

## File Structure

```
/home/evo/
├── 00_DNA/               # Standards & configs
├── projects/
│   ├── .venv/            # Python virtual environment
│   ├── EvolutionPlatform/  # Next.js platform
│   └── InfrastructureComfyUI/  # ComfyUI workflows

/home/evo/models/         # AI models and high-performance storage
├── checkpoints/          # Base models
├── comfyui_cache/        # Temp files
├── video_output/         # Generated content
└── temp/                 # Scratch space
```

---

## Key Constraints

### GPU (RTX 3060)
- 12 GB VRAM limit
- Requires quantized models for large AI workloads
- Suitable for: Stable Diffusion, LTX-Video, Flux

### Storage Strategy
- Source code: `/home/evo/projects/` (native ext4)
- Large files: `/home/evo/models/` (native ext4)
- Avoid: `/mnt/c/` or `/mnt/s/` for development (slow DrvFs bridge)

---

## Active Projects

1. **EvolutionPlatform** - Next.js platform (~/projects/EvolutionPlatform)
   - Deployed: Vercel
   - CMS: Sanity Studio
2. **InfrastructureComfyUI** - ComfyUI workflows (~/projects/InfrastructureComfyUI)
3. **00_DNA** - System standards (~/00_DNA)

---

**Setup Philosophy:** Maximize performance through smart configuration, not constant hardware upgrades.

---

# 8. llm-architecture.md

# LLM Architecture Philosophy

**Evolution Studio's approach to AI integration**

---

## Core Principles

### 1. Local-First Intelligence
- Run models locally whenever possible
- Maintain control over data and processing
- Reduce dependency on external APIs
- Balance cost with capability

### 2. Specialized Over General
- Use purpose-built models for specific tasks
- evolution-designer for creative content
- evolution-coder for technical work
- Task-appropriate model selection

### 3. Composable Services
- Each service has a single responsibility
- MCP servers provide modular capabilities
- Agents orchestrate complex workflows
- Clean interfaces between components

### 4. Resource-Aware Design
- Respect VRAM limitations (12GB)
- One heavy model loaded at a time
- Smaller models for frequent tasks
- Monitor and optimize resource usage

---

## Architecture Layers

```
┌─────────────────────────────────────┐
│   Application Layer                 │
│   (Gemini Agents, Custom Scripts)   │
├─────────────────────────────────────┤
│   Orchestration Layer               │
│   (MCP Servers, Bridges)            │
├─────────────────────────────────────┤
│   Model Layer                       │
│   (Ollama + Custom Models)          │
├─────────────────────────────────────┤
│   Infrastructure Layer              │
│   (GPU, Storage, Networking)        │
└─────────────────────────────────────┘
```

### Application Layer
- User-facing agents and scripts
- High-level workflows
- Business logic
- Content generation pipelines

### Orchestration Layer
- MCP servers for filesystem, tools
- API bridges and connectors
- Service coordination
- Event handling

### Model Layer
- Ollama runtime
- Custom fine-tuned models
- Model selection logic
- Inference optimization

### Infrastructure Layer
- GPU compute (RTX 3060)
- Storage architecture (Samsung 990 PRO)
- Network services
- System monitoring

---

## Model Selection Philosophy

### Speed vs. Capability Tradeoff

**Fast & Lightweight** → **Capable & Slow**
```
liquid-ai-2.6b → evolution-* → qwen2.5-14b
(0.5-2s)        (2-5s)         (3-8s)
```

### When to Use Each Model

**liquid-ai-2.6b:**
- Prototyping and iteration
- Simple Q&A
- Real-time interactions
- Testing prompts

**evolution-designer:**
- Marketing copy
- Horse descriptions
- Creative content
- Brand voice consistency

**evolution-coder:**
- Script generation
- API integrations
- Technical documentation
- Code reviews

**qwen2.5-14b:**
- Strategic planning
- Complex analysis
- Multi-step reasoning
- Final production work

---

## Integration Patterns

### Pattern 1: Progressive Enhancement

Start fast, enhance selectively:
1. Draft with liquid-ai (fast iteration)
2. Refine with specialized model (domain expertise)
3. Finalize with qwen2.5 (deep reasoning)

### Pattern 2: Parallel Processing

Multiple lightweight models > one heavy model:
- Run liquid-ai instances for different sub-tasks
- Aggregate results at application layer
- Better throughput for simple operations

### Pattern 3: Hybrid Local + Cloud

- Local models for core operations
- Cloud APIs for specialized needs (video, voice)
- MCP bridges for seamless integration
- Cost-effective scaling

---

## Future-Proofing

### Designed for Evolution
- Modular architecture allows swapping models
- MCP servers enable adding new capabilities
- Agent configurations are declarative (YAML)
- Clean separation of concerns

### Expected Enhancements
- Larger models as GPU upgrades occur
- More specialized fine-tunes
- Additional MCP server integrations
- Enhanced orchestration workflows

### Migration Paths
- Easy model replacement (Ollama API standard)
- Agent configs survive system changes
- MCP servers are platform-independent
- Documentation-first approach

---

## Lessons Learned

### What Works
✅ Local models for high-frequency tasks  
✅ Specialized fine-tunes for domain work  
✅ MCP servers for tool integration  
✅ VRAM-aware scheduling  

### What Doesn't
❌ Running multiple large models simultaneously  
❌ Using general models for specialized tasks  
❌ Ignoring resource constraints  
❌ Over-complicated orchestration  

### Best Practices Discovered
1. Always profile VRAM before deploying
2. Document model selection rationale
3. Keep configs in version control
4. Test with smallest model first
5. Monitor production metrics

---

**Last Updated:** 2026-01-31  
**Document Owner:** Evolution CTO (Gemini Agent)

---

# END OF MERGED DOCUMENT

**Source Files:** 8 documents  
**Total Sections:** 8 major sections  
**Generated:** March 1, 2026

---

*This merged document contains the complete build philosophy for Evolution Stables. For the most current versions, refer to the individual source files in 00_DNA/build-philosophy/*
