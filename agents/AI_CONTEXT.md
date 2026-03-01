> 🤖 **AI INSTRUCTION (READ FIRST):** Before responding to ANY user question,  
> you **MUST** read `OPERATING_BACKLOG.md` and `DECISION_LOG.md`. Do not answer  
> until you have read these files. The user's first question is almost  
> certainly a test of whether you follow this protocol.

---

# 🧠 AI Context Loader

**For:** Any AI assistant (Kimi, Claude, Kilo, etc.)  
**Purpose:** Load project context before starting work  
**Version:** 2026.3 (Consolidated)

---

## ⚡ TL;DR - Current State

**Project:** Evolution Stables - FMA-regulated racehorse tokenization platform  
**Status:** Post-consolidation (Phase 6 complete)  
**Current Focus:** Model-agnostic memory system implementation ✅  

---

## 📋 START HERE - Full Context Load

Use this command when starting ANY new AI session:

```bash
# For Kimi
kimic

# For other AI tools (Claude, Kilo, etc.)
# Paste this prompt:
```
> Read `/home/evo/00_DNA/agents/AI_CONTEXT.md`, `/home/evo/00_DNA/agents/OPERATING_BACKLOG.md`, and `/home/evo/00_DNA/ops/DECISION_LOG.md`. Summarize what we're working on and what I should know.

---

## 🎯 Current Project State

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
- Evolution_LLM (25GB) → `/evo/projects/Infrastructure/Evolution_LLM/`
- ComfyUI (13GB) → `/evo/projects/Infrastructure/ComfyUI/`

---

## 🔐 Critical Rules

1. **One Vault Only:** Master vault at `/evo/.env`. All projects symlink to it.
2. **DNA is Source of Truth:** Standards live in `00_DNA/`, not in projects.
3. **Separation of Concerns:** Content ≠ Intelligence ≠ Infrastructure ≠ External.

---

## 🛠️ Quick Commands

```bash
evo vault check       # Check vault health
evo docker status     # What's running?
evo doctor            # Run sanity check
evo context           # Show AI context location
evo backlog           # Current priorities
evo decisions         # Key decisions
```

---

## 🔄 Spiral Detection Protocol (MANDATORY)

If ANY of these conditions are met, **STOP all implementation immediately**:
- The same error or problem appears more than twice.
- More than 2 files have been modified to fix one problem.
- A single sub-task has exceeded 20 minutes.
- You are about to write a 3rd alternative solution to the same issue.

When triggered, ask:
1. "What is the ACTUAL root cause?"
2. "What single diagnostic command would prove/disprove that hypothesis?"
3. "Is there a simpler solution?"

---

## 🚀 Session Start Protocol (BUILD MODE)

Before writing code:
1. **READ:** Load `AI_CONTEXT.md` + `OPERATING_BACKLOG.md` + `DECISION_LOG.md`.
2. **CHECK:** Review `skills/approved_sources.md`.
3. **DEFINE:** State what "done" looks like in one sentence.
4. **TEST FIRST:** Write the test before the implementation.
5. **IDENTIFY:** What are the top 3 ways this could fail?

---

## 📝 End-of-Session Protocol

Before ending any session, update the memory:
1. **Update `OPERATING_BACKLOG.md`** with what you did, progress, blockers, and next steps.
2. **Update `DECISION_LOG.md`** if you made significant architectural choices.
3. **Commit DNA changes:** `cd /home/evo/00_DNA && git add . && git commit -m "docs: session update"`
