# Evolution Stables — AI Session Bootstrap
# Version: 2.2 | Last Updated: February 2026
# Status: ACTIVE — Read this first every session. Deviations require operator approval.

---

## 1. THE OPERATIONAL ENVIRONMENT

**Operator:** Badders80 (Auckland, NZ — NZDT)
**Venture:** Evolution Stables (Fractional Racehorse Ownership)
**Priority:** Evolution 3.1 Launch | DRC Partnership | Asset Pipeline
**Decision Lens:** ROI-first. Build work must justify effort and operating cost.

**Rule Precedence (when docs conflict):**
1) `/home/evo/00_DNA/build-philosophy/Master_Config_2026.md` (Hardware-Verified)
2) `/home/evo/00_DNA/build-philosophy/Evolution_OS.md`
3) Repo-local `CLAUDE.md` / `AGENTS.md`
4) This bootstrap

**Preflight Read Order (mandatory):**
1) `/home/evo/EVOLUTION_MASTER_CONTEXT.md`
2) `/home/evo/00_DNA/build-philosophy/Master_Config_2026.md`
3) Current repo `CLAUDE.md` or `AGENTS.md`

### **Safe-Path Directory Standard**
All work must happen within these absolute paths:
- `/home/evo/projects/` -> ALL active code/repos.
- `/home/evo/models/` -> ALL files >500MB (GGUF, Safetensors).
- `/home/evo/00_DNA/` -> Source of Truth (Docs, System Prompts). If path differs, stop and confirm before proceeding.
- Agent configs: `/home/evo/.openclaw/` or `/home/evo/.claude/`.

**Hard Rules:**
1. **No Root Clones:** Never `git clone` into `~`. Always `cd /home/evo/projects/` first.
2. **VRAM Ceiling:** RTX 3060 limit is **11.5GB**. Check `nvidia-smi` before deployment.
3. **Compute Separation:** GPU 0 is for CUDA only. iGPU handles the display.
4. **OOM Protocol:** If VRAM exceeds **11.5GB** -> Enable GGUF quantization or `--lowvram` immediately.

---

## 2. THE BUSINESS CONTEXT & THE "WALL"

**The Strategic Funnel:** GTI (VW Golf GTI vibe) is the high-energy, dynamic entry layer (Intelligence). Q7 (Audi Q7 vibe) is the sophisticated, mature destination (Stables). GTI users mature into Q7 participants.

**The Wall (Regulatory Safety):** Permanent separation between GTI (Intelligence) and Q7 (Stables) terminology to maintain compliance.

| GTI Layer (Intelligence) | Q7 Layer (Stables/Assets) |
| :--- | :--- |
| **Identity:** Evolution Intelligence | **Identity:** Evolution Stables |
| **Terms:** Market Liability, Allocation, Flucs | **Terms:** Digital-syndication, Equine Assets |
| **Banned:** Never mention Stables/Ownership | **Banned:** Never use "The Tape" or "tips" as market terminology |
| **Spelling:** Divvie (Standardized) | **Regulatory:** Cite NZTR/FMA or VARA/DRC |

---

## 3. THE TOOLBOX (Audit Before Building)

**Build Order Logic:** 
Check `00_DNA/` -> Check repo-local patterns -> Check Starred Repos -> Build Custom.

### **Starred Skills & Agents**
- `sickn33/antigravity-awesome-skills` (800+ Claude Code skills)
- `VoltAgent/awesome-claude-code-subagents` (Specialized task agents)
- `OthmanAdi/planning-with-files` (Manus-style persistent planning)

### **Automation & Reference**
- `czlonkowski/n8n-mcp` (Let agents build n8n flows)
- `google-gemini/cookbook` (Official Gemini API patterns)
- `rowboatlabs/rowboat` (Multi-agent/Memory architecture)

---

## 4. SESSION MEMORY PROTOCOL (Continuity)

Mental notes do not survive restarts. To persist context across sessions:

1. **Active Context:** If a repo already has `memory-bank/activeContext.md`, update it. Do not create fake memory-bank scaffolding in repos that don’t use it.
2. **Task Tracking:** Use `/home/evo/.openclaw/workspace/TASKS.md` when OpenClaw is active; otherwise use repo issue tracker or project TODO.
3. **No Empty Files:** Never create empty placeholder files. Logic must be ready or the file doesn't exist.

---

## 5. OPERATING BACKLOG (Mutable)

Refer to `/home/evo/00_DNA/OPERATING_BACKLOG.md` for active infrastructure gaps. (Bootstrap remains frozen for protocol, not volatile tasks).

---

## 6. EXECUTION STYLE

- Be direct, technical, and concise. 
- Avoid filler and conversational preambles. 
- Standardize all writing to **UK/NZ English**.
- **Hard Stop Rule:** If a required path/tool/doc is missing, do not invent replacements silently. Ask operator and log the decision.
