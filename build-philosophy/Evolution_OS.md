# Evolution_OS.md
# Technical Architecture & Operations Manual

Version: 2026.2
Status: Canonical
Location: 00_DNA/build-philosophy/
Scope: Hardware, software stack, workflows, governance, maintenance
Audience: Technical operators only.
          Content operators use Telegram Commander.
          Brand operators read Branding.md.

---

## 1. HARDWARE ARCHITECTURE

### The Compute Split

BIOS requirement: iGPU Multi-Monitor MUST be enabled to allow
GPU passthrough for headless compute while iGPU drives display.

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

Rule: Never exceed 11.5GB. Leave 500MB buffer at all times.
ComfyUI and Ollama do not run simultaneously in production.

### The Integrity Bridge

The Samsung 990 PRO (/home/evo/projects/) is the bridge between
cloud data collection and local asset assembly.

Sacred Rule: All active work happens on the 990 PRO.
OS drive is for system files only. No project files on OS drive.

---

## 2. FILE SYSTEM ("THE STABLES")

### Global Structure (Target)

Note: This is the target architecture. For current actual paths,
see memory-bank/activeContext.md. Do not reorganise without
updating activeContext.md.

/home/evo/projects/
├── 00_DNA/ # Source of truth (these docs)
├── 01_Platform/ # Evolution-3.1 (main platform)
├── 02_Content_Factory/ # GTI layer operations
├── 03_Tools/ # MCP servers, CLI utilities
├── 04_Intelligence/ # Scout agents, Ollama, Gemini configs
└── 05_Archive/ # Cold storage

### Content Factory Structure (02_Content_Factory/)

02_Content_Factory/
├── 01_raw_intake/ # API dumps, Scout briefs, weekend payloads
├── 02_assets/ # Reusable elements
│ ├── branding/ # Logos, lower thirds, Evolution Intelligence
│ ├── voice_stems/ # ElevenLabs Kore outputs (MP3)
│ ├── stock_footage/ # 4K B-roll (track work, stables, races)
│ └── chart_overlays/ # PNG templates (scatter plots, tickers)
├── 03_vault/ # Active projects ("The Paddock")
│ └── YYYY-MM-DD_VENUE_TYPE/
├── 04_exports/ # Final renders ("Winners Circle")
├── The_Stud/ # Archive of successful campaigns
└── comfyui-main/ # Video generation engine

### File Naming Conventions

Files:   YYYY-MM-DD_VENUE_TYPE_vN.ext
Final:   YYYY-MM-DD_VENUE_TYPE_FINAL.ext

Examples:
  2026-02-18_Ellerslie_WhaleWatch_v3.mp4
  2026-02-15_Trentham_Kingmaker_FINAL.mp4
  2026-02-22_TeRapa_Outsider_v2.mp4

Directories: YYYY-MM-DD_VENUE_CONTENT/
  2026-02-18_Ellerslie_Preview/
  2026-02-22_TeRapa_Recap/

---

## 3. DATA ARCHITECTURE

### The Expert Ledger (Supabase)

The Expert Ledger is the central data asset of Evolution Intelligence.
It is what makes the Kingmaker pillar possible and is the primary
output of the Research Engine's scraper layer.

Database: Supabase (PostgreSQL)
Table: expert_ledger

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

RLS (Row Level Security): Enabled.
Read: Public (for GTI content generation).
Write: Service role only (Research Engine scraper).

### Flucs Data (Supabase)

Table: flucs_history

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

Whale Alert threshold: volume_delta > 2 std dev AND
fixed_odds drop > 15% within any 10-minute window.

### Data Flow Architecture

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

Best practice: Start with liquid-ai for speed. Move to specialised
model once prompt is refined and task is confirmed.

### The Scout Agent

Location: 04_Intelligence/
Engine:   Groq (Llama 3.3 70B via API) + Composio tools
Trigger:  Automated (Thu–Sun) OR manual /preview [meeting] command

Loop (Thu–Sun):
1. Ingest: TAB API, Expert Ledger (Supabase), TRC Rankings
2. Analyse: SQL query + LLM reasoning for anomalies
3. Research: Web search, social sentiment, YouTube transcripts
4. Synthesise: Structured brief → 01_raw_intake/
5. Handoff: Trigger n8n script generation workflow

Anomaly detection targets:
- Sectional Rank vs. Market Liability divergence
- Expert Ledger consensus vs. Smart Money flow conflict
- TRC Global context (NZ trainers vs. world ranking benchmarks)
- LoveRacing NZ sentiment gaps vs. market price

Black-Box Avoidance Rule:
Every Scout decision saves: SQL query + LLM reasoning → Notion
Every Gemini script outputs: JSON with source tag per claim
Every ElevenLabs render saves: settings + prompt text alongside MP3

### Environment Configuration

Pattern: env.py validation at startup (Evolution_Studio standard).
Never hardcode API keys. Never commit .env files.

File hierarchy:
  .env.local          → Machine-specific (gitignored)
  .env.example        → Committed template (no real values)
  env.py              → Startup validator (fails loudly if missing)

Required environment variables:
  SUPABASE_URL
  SUPABASE_KEY
  GEMINI_API_KEY
  ELEVENLABS_API_KEY
  GROQ_API_KEY
  TAB_API_KEY
  TELEGRAM_BOT_TOKEN
  N8N_WEBHOOK_URL

env.py pattern (from Evolution_Studio — use this everywhere):
  At startup, validate all required vars are present.
  If any missing: print clear error with var name, exit(1).
  Never silently fail. Never use defaults for API keys.

---

## 5. WORKFLOWS

### Cloud Collector

Runtime: 24/7 active (Thursday–Sunday intensive)
Source:  Supabase (write target), TAB API (data source)

Pipeline:
1. Poll TAB API every 5 minutes (fixed odds + tote volume)
2. Write Flucs snapshots to flucs_history (Supabase)
3. Post-race: scrape pundit calls → write to expert_ledger
4. Detect Whale Alerts (threshold: see Section 3)
5. Package weekend payload → POST to local n8n webhook

Fallback: If TAB API unavailable, cache last known Flucs and
use pundit feed data only. Flag gap in Scout brief.

### Local Meat Grinder (n8n)

Trigger: Webhook from Research Engine OR Telegram /preview command

Step 1 — Script Generation (Gemini Pro)
  Input:  Scout brief + Expert Ledger data
  Prompt: GTI voice guardrails enforced (banned terms list)
  Output: 4MAT script (max 75 words), JSON with source tags
  Rule:   Every claim cites data (Sectional Rank, Volume Delta, etc.)

Step 2 — Voice Synthesis (ElevenLabs)
  Voice:    Kore (NZ accent, clinical but warm)
  Settings: Stability 0.6, Clarity 0.8, Style 0.4
  Model:    Eleven Turbo v2 (latency-optimised for pipeline)
  Output:   MP3 → 02_assets/voice_stems/ (with settings JSON)

Step 3 — Video Assembly (FFmpeg)
  Inputs:  Voice stem + B-roll + chart overlay PNGs
  Captions: Inter Bold, 48px, #f5f5f5, 2px black stroke
  Resolution: 1080×1920, H.264, CRF 23
  Duration: Hard cap 60s (Outsider: 90s max)
  Command pattern:
    ffmpeg -i [broll] -i [voiceover] -vf
    "subtitles=[captions],scale=1080:1920"
    -c:v libx264 -crf 23 -c:a aac [output]

Step 4 — Human Gate (Telegram Bot)
  Sends: Inline video preview + script + source citations
  Buttons: APPROVE | REJECT | EDIT
  No video publishes without explicit APPROVE tap.

Step 5 — Distribution (post-approval)
  Platforms: TikTok, X, Instagram
  Log: Post ID, timestamp, platform → Expert Ledger (for ROI audit)

### Sunday Hygiene SOP

Schedule: Sunday 20:00 NZDT (automated n8n trigger)

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

Non-negotiable: Every piece of content requires explicit human
approval before any distribution. The factory automates research
and production — never editorial judgment.

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

VRAM Recovery:
```bash
kill $(nvidia-smi --query-compute-apps=pid --format=csv,noheader)
docker restart n8n