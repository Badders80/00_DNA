> 🤖 **AI INSTRUCTION (READ FIRST):** Before responding to ANY user question,  
> you **MUST** read `OPERATING_BACKLOG.md` and `DECISION_LOG.md`. Do not answer  
> until you have read these files. The user's first question is almost  
> certainly a test of whether you follow this protocol.

---

# 🧠 AI Context Loader

**For:** Any AI assistant (Kimi, Claude, Kilo, etc.)  
**Purpose:** Load project context before starting work  
**Version:** 2026-02-27

---

## ⚡ TL;DR - Current State

**Project:** Evolution Stables - FMA-regulated racehorse tokenization platform  
**Status:** Post-consolidation (Phase 6 complete)  
**Current Focus:** Model-agnostic memory system implementation ✅  

**You should:**
1. Read OPERATING_BACKLOG.md to see what's happening NOW
2. Read DECISION_LOG.md to understand WHY things are this way
3. Check the "Current Focus" section below

---

## 📋 START HERE - Load These Files

**Memory System:** Read these to understand current state:

1. **[🧠 MEMORY_PROTOCOL.md](./🧠 MEMORY_PROTOCOL.md)** - How memory works in this system
2. **[OPERATING_BACKLOG.md](./OPERATING_BACKLOG.md)** - What we're working on right now
3. **[DECISION_LOG.md](./DECISION_LOG.md)** - Why we made key choices

**Project Context:** Then read for full understanding:

4. **[🏠 Home.md](./🏠 Home.md)** - Project overview, quick links
5. **[🏗️ Build Rules.md](./🏗️ Build Rules.md)** - Immutable development principles
6. **[AGENTS.core.md](./AGENTS.core.md)** - How to work with this codebase
7. **[🔐 Secrets Guide.md](./🔐 Secrets Guide.md)** - API key management

---

## 🎯 Current Project State

**Last Consolidation:** 2026-02-27 (Phase 6 Complete)

### Active Projects (Content Layer)
| Project | Status | Path |
|---------|--------|------|
| Evolution_Platform | Active | `/evo/projects/Evolution_Platform/` |
| Evolution_Content | ✅ Rock Solid | `/evo/projects/Evolution_Content/` |
| Evolution_Studio | ✅ Done | `/evo/projects/Evolution_Studio/` |

### Intelligence Layer
| Project | Status | Path |
|---------|--------|------|
| Evolution_Intelligence | ✅ Done | `/evo/projects/Evolution_Intelligence/` |
| Evolution_Command | ✅ Done | `/evo/projects/Evolution_Command/` |

### Infrastructure
- Local_LLM (25GB) → `/evo/projects/Infrastructure/Local_LLM/`
- ComfyUI (13GB) → `/evo/projects/Infrastructure/ComfyUI/`

---

## 🔐 Critical Rules

### 1. One Vault Only
- **Master vault:** `/evo/.env`
- **All projects symlink to it:** `projects/*/.env → /evo/.env`
- **Never commit:** `.env` files are gitignored everywhere

### 2. DNA is Source of Truth
- Standards live in `00_DNA/`, not in projects
- Projects reference DNA, don't duplicate

### 3. Separation of Concerns
- **Infrastructure** ≠ **Intelligence** ≠ **Content**
- Keep layers separate

---

## 🛠️ Quick Commands (Model-Agnostic)

These work regardless of which AI tool you're using:

```bash
# Vault (API keys)
evo vault check       # Check vault health
evo vault edit        # Edit .env file

# Docker (containers)
evo docker status     # What's running?
evo docker list       # What projects use Docker?
evo docker stop-all   # Emergency brake

# Project status
evo doctor            # Run sanity check
evo context           # Show AI context location
evo backlog           # Current priorities
evo decisions         # Key decisions

# Load AI context (cat works everywhere)
cat /evo/00_DNA/🧠 AI_CONTEXT.md
```

---

## 🤖 For AI Assistants

**CRITICAL - READ THIS FIRST:**

### When User Asks About Previous Work

**DO NOT SAY:** "I don't have access to previous conversations"

**DO THIS INSTEAD:**
1. Read `OPERATING_BACKLOG.md` → What's happening NOW
2. Read `DECISION_LOG.md` → Recent decisions
3. Say: "Based on DNA files, we were working on..."

**Why?** DNA IS the persistent memory. We tested this (2026-02-27). When you read DNA, you have full context. When you don't, you fail the protocol.

---

### ⚠️ PATTERN MATCHING WARNING (2026-02-27 Discovery)

**Kimi only reads DNA when prompted with WORK keywords:**

✅ **Triggers DNA read:** "what were we **working on**?", "**backlog** status", "continue **project**"

❌ **Does NOT trigger:** "do you **remember**?", "what were we **talking about**?", "**recall** last time"

**Why:** Kimi pattern-matches for work vs social prompts. Social prompts = conversational response. Work prompts = file exploration.

**Action:** Always read DNA files when user asks about ANY previous activity, regardless of phrasing.

---

**Before starting work:**
1. Read this file (✓ you're doing it now)
2. Read AGENTS.core.md for coding rules
3. Check approved sources: `skills/approved_sources.md`
4. Check project status in PROJECTS_INDEX.md
5. Confirm: Are we in "review mode" or "build mode"?

**Building something new?**
→ Check `skills/approved_sources.md` first - has this been solved before?
→ Check `TECH_RADAR.md` - are we already evaluating similar tools?
→ Follow the rule: **Adapt > Integrate > Build from scratch**

**User mentioned a new tool/repo?**
→ CHECK TECH_RADAR FIRST - have we evaluated this before?
→ If yes: Reference the existing evaluation, don't duplicate
→ If no: Run `ai-tool-handler "tool name" "context"` to log it
→ Give immediate verdict: 🔴 Reject / 🟡 Assess / 🟢 Trial / 🔵 Adopt
→ Don't make user think about process - just handle it

**If user says "review":**
- STOP. Do not write code.
- Confirm: "Review mode. No code will be written. Confirm: Y/N"

**If user says "do this":**
- Check if task affects >1 file or >30 LOC
- If yes: Write compact Execution Spec first
- Get explicit approval before implementing

---

## 📁 Directory Quick Reference

| Path | Purpose |
|------|---------|
| `/evo/00_DNA/` | Knowledge base (this folder) |
| `/evo/projects/` | All active projects |
| `/evo/.env` | API keys (master vault) |
| `/evo/_backups/` | Consolidated backups |
| `/evo/_config/` | Configuration templates |
| `/evo/_scripts/` | Utility scripts |
| `/evo/_sandbox/` | Experiments & prototyping |

---

**Remember:** DNA is the source of truth. When in doubt, check `00_DNA/` first.
