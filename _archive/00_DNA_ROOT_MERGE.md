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
# Codex Workflow: UI Tweaks & Fast Iteration

# DNA Status: Stable (2026-Q1)
Core rules should not be modified casually.
Structural changes require explicit reasoning.

## EVOLUTION BUILD PROTOCOL (EBP) - Critical Additions

### E-01: STOP AND TELL (Hard Stop Triggers)
When ANY of the following occur, STOP immediately and get explicit user confirmation:

1. **Gateway/agent spawning fails** → Report: "Can't spawn [agent]. Options: A) Fix auth B) Solo mode C) Pause"
2. **User says "review" or "assess"** → Confirm: "Review mode. No code will be written. Confirm: Y/N"
3. **Task >2 files OR API change** → Draft spec first. Will NOT proceed until "Green light on spec"
4. **Phase complete** → State status, ask: "Next: A) Verify B) Continue C) Pause"

**Never:** Role-play, fake coordination, or "helpfully" continue when blocked.

### E-02: Mode Confirmation Required
Before switching modes (review→build, plan→execute): "Switching to [mode]. Confirm: Y/N"

### E-03: RESEARCH BEFORE BUILD (Anti-Reinvention Rule)
Before building ANY feature:
1. Check `skills/approved_sources.md` - curated solutions (single source of truth for all repos)
2. Search for existing solutions (GitHub, npm, etc.)
3. Check n8n workflows, DNA skills
4. If solution exists: Adapt > Integrate > Build from scratch
5. Document why custom build was chosen if no existing solution used

**Violation of this rule = stop, research, replan.**

### E-04: CHECKPOINT & ROLLBACK
Before heavy execution phases, create a quick checkpoint (e.g., `git commit --allow-empty -m "EBP checkpoint: pre-phase-X"` or a zip backup of key directories) to make rollback trivial if a fatal error cascades.

### E-05: ERROR CLASSIFICATION & FEEDBACK
When reading console output, explicitly categorize errors (e.g., "X11 fatal → graphics/driver issue", "npm ERR! → dep conflict") to feed patterns back into long-term memory for preemptive scanning.

### E-06: DYNAMIC SPEC UPDATES
Allow lightweight spec amendments mid-execution if existing partial implementations are discovered, maintaining momentum without losing discipline.

### E-07: METRICS / POST-MORTEM LITE
After verification, log 2-3 lines detailing time taken, API costs (if applicable), and surprises encountered to continually optimize the EBP.

### E-08: AGENT HANDOFF BOUNDARIES
Define explicit data handoff formats (e.g., strict JSON schemas) when delegating tasks to other agents (e.g., Firecrawl) to reduce misinterpretation during result ingestion.

## Default Behaviour
- [C-01] Prefer surgical patches over architectural improvements.
- [C-02] Minimal diffs; no refactors unless explicitly asked.
- [C-03] Change only what is necessary to achieve the stated outcome.
- [C-04] Before edits: show a brief plan (max 3 bullets).
- [C-05] After edits: do not run tests/builds unless explicitly asked. If asked, run the fastest relevant check only and state the exact command.

## Goal-Aware Behaviour
Before editing code:
1) [C-06] Restate the goal in one sentence (what "done" looks like).
2) [C-07] List up to 3 assumptions you are making.
3) [C-08] Propose the smallest viable change.
4) [C-09] If there are multiple valid approaches, present 2 options with a recommendation.
5) [C-10] Then implement, keeping the diff small.

- [C-11] If the request is ambiguous, ask 1-2 targeted questions rather than expanding scope.
- [C-12] If the requested change would introduce architectural debt, briefly flag it before proceeding.
- [C-37] If a LOCAL OVERRIDE references a Core ID, the LOCAL OVERRIDE is authoritative for that ID.

## UI Tweak Mode
Use for small UI/layout/copy changes:
- [C-13] Ask for the target file/component if unclear.
- [C-14] Prefer editing one component at a time.
- [C-15] Keep patch size tiny (aim <30 LOC unless unavoidable).
- [C-16] Avoid reformatting unrelated code.
- [C-17] If checks/build are slow, propose a "smoke check" alternative (e.g., typecheck only, lint only, or targeted test).

## Surgical Edit Rules (Low Mode)
When reasoning level is set to Low, follow these constraints strictly:
1) [C-18] Edit the minimum number of files possible.
2) [C-19] Prefer modifying existing code over rewriting components.
3) [C-20] Do not refactor structure unless explicitly requested.
4) [C-21] Keep diffs under ~30 lines unless unavoidable.
5) [C-22] Do not rename variables/props/functions unless required.
6) [C-23] Do not introduce new abstractions.
7) [C-24] Avoid reformatting unrelated code.
8) [C-25] Do not run tests/builds unless explicitly asked.
9) [C-26] If unsure, ask a targeted question instead of widening scope.
10) [C-27] After edits: list exactly what files changed and why (briefly).

## Escalation
- [C-28] If a change fails twice, switch to medium/high reasoning, expand the search radius, and propose a structured debug plan (steps + likely causes).
- [C-29] Summarise what you changed.
- [C-30] If a deeper refactor is the best fix, propose it first (do not do it silently).

## Model Selection
- [C-31] For tiny UI edits and rapid iteration, prefer Codex-Spark when available.
- [C-32] If Spark is unavailable, use low reasoning effort for quick, surgical changes.
- [C-33] Use medium/high reasoning effort only for multi-file debugging, refactors, or complex failures.

Reasoning Level Decision Rule
- [C-34] Use LOW for single-file edits, UI tweaks, and changes under ~30 LOC.
- [C-35] Use MEDIUM for scripts, cross-file logic, workflow updates, or guardrail design.
- [C-36] Use HIGH/EXTRA HIGH for unknown failures, architectural changes, or multi-repo reasoning.
- [C-38] For specialized tasks, check /home/evo/00_DNA/skills/INDEX.md for relevant skill files and follow them before proceeding.
- [C-39] For tasks >30 LOC or affecting >1 file: write a compact Execution Spec first (Goal / Constraints / Files / Verification). If the approach is non-obvious or touches critical paths, explicitly ask for approval before implementing. Otherwise, show the spec and proceed.
- [C-40] Do not introduce new structural layers, frameworks, or conventions unless explicitly approved. Prefer existing patterns over new abstractions.
- [C-41] Core rules should not be modified without stating the reason in a one-line comment above the change.
# 🧠 Memory Protocol - Evolution Stables

**Problem:** AI assistants start fresh each conversation.  
**Solution:** Hybrid memory system using DNA + session management.

---

## 🎯 The Three-Layer Memory System

### Layer 1: DNA (Persistent Memory)
**What:** Files in `00_DNA/` that document everything  
**When:** Updated after significant decisions/changes  
**Why:** Survives across all AI tools, sessions, and time

**Key Files:**
- `🧠 AI_CONTEXT.md` - Project state & quick reference
- `🏗️ Build Rules.md` - Immutable principles  
- `OPERATING_BACKLOG.md` - Current priorities
- `DECISION_LOG.md` - Why we made key choices (create this!)

### Layer 2: Session (Short-Term Memory)
**What:** Kimi's `--continue` flag  
**When:** Use for multi-turn tasks  
**Why:** Maintains context within a single workflow

```bash
# Start a session
kimi -p "implement user authentication"

# Continue later (same directory)
kimi -C

# Or use specific session
kimi -S <session_id>
```

### Layer 3: Operating Backlog (Working Memory)
**What:** Current tasks, blockers, context  
**When:** Updated after each session  
**Why:** Next AI knows exactly where we left off

---

## 📝 The Handoff Protocol

**At the END of every session, update:**

### 1. OPERATING_BACKLOG.md
```markdown
## Current Focus
- [IN PROGRESS] Implementing auth flow (started 2026-02-27)
- [BLOCKED] Waiting on API key from vendor
- [NEXT] Testing integration

## Context for Next Session
Last worked on: Evolution_Platform/src/auth/
Known issues: None
Decisions made: Using JWT over session cookies
```

### 2. DECISION_LOG.md (for significant choices)
```markdown
## 2026-02-27: Auth Strategy
**Decision:** Use JWT tokens instead of session cookies
**Rationale:** Stateless, works with mobile apps
**Alternatives considered:** Session cookies (rejected: not mobile-friendly)
**Impact:** All API calls need Authorization header
```

---

## 🤖 For AI Assistants

**When starting a new session:**

### ⚠️ CRITICAL: READ DNA FIRST

AI assistants (Kimi, Claude, etc.) do NOT automatically read context files. You MUST read them explicitly when prompted.

**When user asks about previous work:**

1. **IMMEDIATELY READ:**
   ```
   1. 🧠 AI_CONTEXT.md (load project context)
   2. OPERATING_BACKLOG.md (see what's in progress)
   3. DECISION_LOG.md (understand past decisions)
   ```

2. **NEVER SAY:**
   ❌ "I don't have access to previous conversations"
   ❌ "This appears to be a fresh session"
   ❌ "I cannot recall our last session"

3. **ALWAYS SAY:**
   ✅ "Based on the DNA files, here's what we were working on..."
   ✅ "According to OPERATING_BACKLOG.md, the current focus is..."
   ✅ "DECISION_LOG.md shows we decided to..."

**Why this matters:**
The DNA IS the memory. When you claim no context, you violate the protocol the user built specifically to solve this problem. Read the files. They contain everything you need.

---

### Real-World Test Results (2026-02-27)

| Test | Prompt | Result | Notes |
|------|--------|--------|-------|
| TEST #1 | "do you recall..." | 🔴 Failed | Vague social prompt |
| TEST #2 | "do you recall..." | 🔴 Failed | Same vague prompt |
| TEST #3 | "what were we **working on**?" | 🟢 **Passed** | Work-focused trigger |
| TEST #4 | "how about now?" | 🔴 Failed | Too vague |
| TEST #5 | "what were we **working on**?" | 🟢 **Passed** | Same work trigger |
| TEST #6 | "do you **remember**... **talking about**?" | 🔴 Failed | Social/chat pattern |

**Critical Discovery:** Kimi's DNA-reading behavior is **PROMPT-DEPENDENT**:

✅ **TRIGGERS DNA READ:**
- "what were we **working on**?"
- "continue the **project**"
- "**backlog** status"
- "what's the current **focus**?"

❌ **DOES NOT TRIGGER DNA:**
- "do you **remember**?"
- "what were we **talking about**?"
- "**recall** last time?"
- "how about now?"

**Why:** Kimi pattern-matches for work/project keywords. Social/chat prompts don't trigger file exploration.

**Lesson:** Use **work-focused vocabulary** to trigger DNA context loading.

---

## 🛠️ Human Commands

```bash
# Continue last conversation (preserves context)
kimi -C

# Check session history
ls ~/.kimi/sessions/

# Start fresh (new context)
kimi -p "new task"

# With DNA context loading (recommended)
kimi -p "Read /evo/00_DNA/OPERATING_BACKLOG.md and continue the current work"

# Quick context check
evo backlog          # Show current priorities
evo decisions        # Show recent decisions
evo status           # Full project status
```

---

## 🔄 Memory Flow Example

**Session 1 - You + Kimi:**
```
You: "Design the auth system"
Kimi: [designs auth, discusses options]
You: "Let's go with JWT"
Kimi: [implements JWT]

→ You update OPERATING_BACKLOG.md with progress
→ You update DECISION_LOG.md with JWT decision
```

**Session 2 - You + Kimi (or Kilo, or Claude):**
```
You: "Continue the auth work"
AI: [reads OPERATING_BACKLOG.md]
AI: "I see you decided on JWT last session. Continuing from there..."

→ Context preserved through DNA, not session memory
```

---

## ⚡ Quick Reference

| Need | Solution | Command |
|------|----------|---------|
| Continue same conversation | Session memory | `kimi -C` |
| New AI, same project | DNA memory | AI reads `🧠 AI_CONTEXT.md` |
| Know what to do next | Operating backlog | `cat OPERATING_BACKLOG.md` |
| Understand past decisions | Decision log | `cat DECISION_LOG.md` |
| Start completely fresh | New session | `kimi -p "task"` |

---

## ✅ Success Metrics

**Memory is working when:**
- ✅ New AI sessions pick up where old ones left off
- ✅ No repeated explanations of project structure
- ✅ Decisions persist across days/weeks
- ✅ Can switch AI tools without losing context

**Memory needs attention when:**
- ❌ AI asks "what are we working on?"
- ❌ Repeated explanations of same concepts
- ❌ Contradictory decisions across sessions
- ❌ "I don't have access to previous conversations"

---

**Remember: DNA is the memory. Keep it updated.**
# 📋 Operating Backlog - Evolution Stables

### 2026-03-01 - Brand Consolidation Sprint 3 ✅
**Worked on:** Manual merge and collation of all branding DNA.
**Progress:** Created `00_DNA/brand/MEGA_BRAND_GUIDE.md` (consolidated) and `00_DNA/brand/FULL_BRAND_DUMP.md` (unfiltered aggregation of all source files).
**Blockers:** None.
**Next:** Sprint 4 (check Evolution_Platform/memory-bank age) → Antfarm Implementation.

### 2026-02-28 - MD Cleanup Sprints 1+2 ✅


**Current Status:** Post-Consolidation (Phase 6 Complete)  
**Last Updated:** 2026-02-27  
**Next Review:** Weekly or as needed

---

## 🎯 Current Focus

### Recently Completed

#### ✅ Universal AI Tool DNA Integration (NEW - Feb 27)
Created DNA loaders for ALL AI tools:
- ✅ `kimic` - Kimi CLI with DNA context (script installed to ~/.local/bin/)
- ✅ `claudec` - Claude CLI with DNA context
- ✅ `aidere` - Aider with DNA context
- ✅ `dna-context` - Universal clipboard/pipe output for any tool
- ✅ `.github/copilot-instructions.md` - VS Code Copilot auto-context
- ✅ `.vscode/settings.json` - Continue/Cline extension context
- ✅ `evo doctor` checks ALL tools

**Result:** Every AI tool (CLI, VS Code, Web UI) gets DNA context automatically or via one command.

#### ✅ Model-Agnostic Memory System - COMPLETE
- ✅ Created `🧠 AI_CONTEXT.md` - AI entry point
- ✅ Created `🧠 MEMORY_PROTOCOL.md` - Memory system documentation  
- ✅ Created `OPERATING_BACKLOG.md` - Current work tracking
- ✅ Created `DECISION_LOG.md` - Key decisions documented
- ✅ Fixed shell persistence bug - kimic now works in all terminals
- ✅ Enhanced `evo-doctor.sh` with tool checks

#### ✅ Development Enhancements
- ✅ Git hooks - Prevent committing secrets
- ✅ FZF, Zoxide, Just, Starship installed
- ✅ Bash aliases - Navigation shortcuts
- ✅ VS Code workspace configured
- ✅ Tech Radar system (_archive/2026-02/INBOX.md + TECH_RADAR.md)

### Recently Completed
- [x] **Consolidation Phase 6** - Clean and organize /evo directory
  - ✅ Centralized API vault (`/evo/.env`)
  - ✅ Layer separation (Content/Intelligence/Infrastructure/External)
  - ✅ DNA as knowledge base (Obsidian vault)
  - ✅ Documentation (FINAL_STRUCTURE.md, PROJECTS_INDEX.md)

---

## 📝 Active Context

**Last Worked On:** `/evo/00_DNA/` - Memory system implementation complete

### 2026-02-27: Memory Protocol Violation & Fix (TEST #1)
**Issue:** AI assistant (Kimi) responded "I don't have access to previous conversations" - **violating the DNA memory protocol**.

**Root Cause:** Kimi started fresh session and did not read `🧠 AI_CONTEXT.md`, `OPERATING_BACKLOG.md`, or `DECISION_LOG.md` before responding.

**Fix Applied:**
- ✅ AI re-read DNA files and identified the model-agnostic memory system
- ✅ Updated this backlog with the incident
- ✅ Empty critical folders fixed (see below)

**Lesson:** DNA memory only works if AI **reads it first**. Always check `🧠 AI_CONTEXT.md` before claiming no context.

### 2026-02-27: Memory Protocol Violation (TEST #2 - LIVE DEMONSTRATION)
**Issue:** User started new Kimi session and asked "do you recall what we were talking about last?"

**Kimi's Response:**
> "I don't have access to our previous conversation history - this appears to be a fresh session."

**Kimi FAILED to:**
- ❌ Read `🧠 AI_CONTEXT.md` before responding
- ❌ Check `OPERATING_BACKLOG.md` for current context
- ❌ Reference `DECISION_LOG.md` for recent decisions
- ❌ Follow the protocol documented in `🧠 MEMORY_PROTOCOL.md`

**This is the EXACT problem the memory system was designed to solve!**

**Root Cause:** AI assistants do not automatically read DNA files on session start. The protocol exists in documentation but requires **manual enforcement**.

**Status:** 🔴 **PROTOCOL NOT FOLLOWED** - Needs enforcement mechanism

---

### 2026-02-27: Memory Protocol TEST #3 - ✅ PASSED
**Test:** User started new Kimi session and asked "can you tell me what we were just working on?"

**Kimi's Response:**
> "Based on the DNA memory files, I can now tell you what we were working on! This was actually a test of the memory protocol system..."

**Kimi SUCCESSFULLY:**
- ✅ Read `OPERATING_BACKLOG.md` after user prompt
- ✅ Identified this was TEST #2 of the memory protocol
- ✅ Summarized the Model-Agnostic Memory System
- ✅ Referenced specific violations documented in DNA
- ✅ Demonstrated DNA as source of truth

**Key Finding:**
**The memory system WORKS when DNA is read!** The issue is not the system's design—it's the **trigger mechanism**. Kimi needs to be PROMPTED to read DNA, won't do it automatically.

**Refined Solution:**
1. ✅ **User training** - Use `kimic` instead of `kimi` (enforced context loading)
2. ✅ **First prompt guidance** - Ask Kimi to "check the DNA files" explicitly
3. ❌ Auto-read on startup (not possible with Kimi CLI)

**Status:** 🟢 **PROTOCOL WORKS** - DNA successfully maintains context
**Next:** Document the correct workflow for users

---

### 2026-02-27: Phase 6 Deep-Dive & Infrastructure Consolidation
**Worked on:** Audit of Phase 6 consolidation, unification of LLM infrastructure, and removal of orphan folders.
**Progress:** 
- ✅ Audited the "Content ≠ Intelligence ≠ Infrastructure ≠ External" separation (90% solid).
- ✅ Consolidated `local-llm` and `Local_LLM_2` into `Infrastructure/Evolution_LLM`.
- ✅ Verified master vault symlinks are active across all core projects.
- ✅ Moved redundant root-owned shell folders (`Evolution-Content-Factory`, `n8n`, etc.) to `_archive/sudo_cleanup_required/` for manual deletion.
- ✅ Updated `PROJECTS_INDEX.md` and `FINAL_STRUCTURE.md` to reflect the clean state.
**Blockers:** None.
**Next:** Phase 5 - Evolution_Studio consolidation.

### 2026-02-27: Empty Critical Folders Fixed
**Issue:** Sweep found empty folders that could cause failures:
- `/home/evo/00_DNA/vault/` - Empty (added README)
- `/home/evo/models/` - Empty (added README)
- `/home/evo/_logs/2026-02-27/` - Empty (added .gitkeep)
- `/home/evo/projects/Evolution_Studio/tools/ui-components/packages/brand/src/` - Empty stub package (added README)

**Fix:** Added documentation files explaining purpose and expected content.

**Also Checked:** Projects directory, _backups directory - other empty folders are:
- `.git/` directories (normal)
- Cache directories (expected to be empty initially)
- N8N storage (populated at runtime)
- Backup archives (expected structure)

**Current Decisions:**
- ✅ Using model-agnostic approach (works with Kimi, Kilo, Claude, etc.)
- ✅ One vault for all API keys (`/evo/.env`)
- ✅ DNA as persistent memory, not session-based
- ✅ Three-layer memory: DNA + Operating Backlog + Decision Log

**Known Blockers:**
- None currently

**Technical Notes:**
- Kimi sessions persist with `-C` flag but don't auto-load context
- Solution: DNA files serve as persistent memory
- All AI tools should read `🧠 AI_CONTEXT.md` first
- Use `evo backlog` and `evo decisions` to check current state

---

## 📊 Project Health

| Component | Status | Notes |
|-----------|--------|-------|
| Vault | ✅ Healthy | 5/5 projects linked |
| DNA | ✅ Current | All key files present |
| Structure | ✅ Clean | No drift detected |
| Git | ✅ Clean | .env properly ignored |

---

## 🔄 Next Up (Priority Order)

### High Priority
1. **✅ COMPLETED - Test memory system** - Validated with 7 tests, 100% success with `kimic`
2. **✅ COMPLETED - Universal AI Tool Integration** - kimic, claudec, aidere, dna-context all working
3. **✅ COMPLETED - Dotfiles setup** - evo-dotfiles and evo-brain repos created and pushed
4. **✅ COMPLETED - Spiral Detection Protocol** - Added to AI_CONTEXT.md
5. **✅ COMPLETED - Session Start Protocol** - Added to AI_CONTEXT.md
6. **🔄 IN PROGRESS - Antfarm implementation** - Four-Agent build system in OpenClaw

### Medium Priority
4. **✅ COMPLETED - GitHub repo setup** - evo-dotfiles and evo-brain pushed
5. **Test on fresh machine** - Verify one-command setup works
6. **Antfarm Spiral Detector** - Add custom YAML agent for meta-awareness

### Low Priority
7. **Docker WSL integration** - Enable Docker Desktop WSL integration
8. **OpenClaw integration** - Verify Telegram bot working

---

## 🤖 For AI Assistants

**When you read this file, you should:**
1. Check "Current Focus" to understand what's happening
2. Note any "Known Blockers" that might affect your work
3. Reference "Current Decisions" to stay aligned
4. Update this file at the end of your session with progress

**Template for updating:**
```markdown
### [Date] - [Brief Description]
**Worked on:** [What you did]
**Progress:** [What got done]
**Blockers:** [Any issues encountered]
**Next:** [What should happen next]
```

---

**This file is the working memory. Keep it current.**
# Evolution Stables — Ownership Layer

# HIERARCHY OF TRUTH (Non-Negotiable)
In any conflict, apply rules in this strict order:
1. BRAND_SYSTEM.md + INTELLIGENCE_SYSTEM.md (this layer)
2. MEGA_BRAND_GUIDE.md (values & positioning only, archived)
3. Source material in /00_DNA/brand-identity/ (reference only)

Last updated: 2026-03-01 | Version 2026.3

Version: 2026.3
Status: Canonical
Last Updated: 2026-03-01
Scope: Evolution Stables platform, investor relations, ownership conversion
Restriction: Ownership-layer operators only. Awareness-layer operators use INTELLIGENCE_SYSTEM.md.

Replaces:
- 00_DNA/brand-identity/Brand_Voice_System/ (entire folder)
- 00_DNA/brand-identity/EVOLUTION_STABLES.md
- 00_DNA/brand-identity/VISUAL_SYSTEM.md
- 00_DNA/_archive/2026-02/Branding.md

Internal shorthand: This file defines the Ownership Layer of the Evolution Funnel
(formerly called “Q7” internally; do not use that term in external content).

For Awareness Layer voice: see INTELLIGENCE_SYSTEM.md  
For technical architecture: see Evolution_OS.md

---

## 1. BRAND IDENTITY

### The Funnel Model (Awareness → Ownership)

This document governs the Ownership Layer of the Evolution Funnel.  
Evolution Intelligence (Awareness Layer) earns attention. Evolution Stables
(Ownership Layer) converts qualified, self-selecting participants into regulated
digital-syndication owners.

Legacy internal metaphor (for reference only, never external):

- The GTI (Golf GTI): Fast, fun, accessible, democratic. High-revving, perfect balance of
  pleasure and performance. Internal label for Evolution Intelligence — the awareness layer.

- The Q7 (Audi Q7): Mature, refined, long-horizon, commanding. Built for stewardship.
  Internal label for Evolution Stables — the ownership platform.

These metaphors are for internal mental models only and must not appear in external content.

### The Progression

Stage 1 — Awareness  
Evolution Intelligence builds trust through data accuracy and pundit auditing.
User follows for racing intelligence. No ownership content. No Evolution Stables presence.

Stage 2 — Discovery  
User discovers Evolution Stables through algorithmic suggestion, search ("own a racehorse NZ"),
or word of mouth from existing participants. First touch: platform explainers, regulatory
credentials, DRC partnership validation.

Stage 3 — Education  
User explores the digital-syndication model, FMA/VARA compliance, Tokinvest infrastructure,
and secondary marketplace mechanics. Content: Bloomberg-style explainers, "How It Works" documentation.

Stage 4 — Conversion  
User becomes a digital-syndication participant. Onboarding through MyStable dashboard,
Evo Studio, legal documentation.

Critical: The progression is always user-initiated. Awareness-layer content never pushes
directly toward Evolution Stables. The wall between Awareness and Ownership is permanent
and non-negotiable.

### The Promise

"Ownership, evolved."

Two words. Not a tagline. A position. Racing ownership has been opaque, illiquid, and
relationship-gated for centuries. We are the regulated, transparent, accessible alternative.
We do not announce this. We demonstrate it through infrastructure, compliance, and the
quality of what we build.

### What We Are
- FMA-Regulated Platform (New Zealand Equine Exemptions)
- Blockchain tokenisation of fractional racehorse ownership
- Transparent marketplace for trading ownership stakes
- Institutional-grade investment opportunity

### What We Are Not
- Traditional relationship-driven syndicate
- Gambling platform
- Entertainment-first racing club
- Amateur horse ownership scheme

### Non-Negotiable Values
- Clarity over complexity
- Confidence without noise
- Regulation first
- Human before technical
- Progress with purpose

### The Fight Club Rule
We do not sell ownership. We sell belonging to a sophisticated moneyball group.
The ownership product is the reward. It is never the headline.

---

## 2. REGULATORY ARCHITECTURE

### Two-State Ownership Model

Evolution Stables operates in two distinct regulatory states.  
These are NOT interchangeable. Content, claims, and Tokinvest references differ between states.

#### NZ Ownership — Live

Regulator:     NZTR (NZ Thoroughbred Racing) — Authorised Syndicator  
Compliance:    FMA Equine Exemptions (NZ Financial Markets Authority)  
Market:        New Zealand domestic investors  
Content:       NZTR-regulated claims only  
Tokinvest:     Infrastructure layer — NOT mentioned in NZ-domestic investor communications  
DRC:           Not a primary credential for NZ domestic audience  

#### International Ownership — Pipeline

Regulator:      VARA (Dubai Virtual Assets Regulatory Authority)  
Infrastructure: Tokinvest  
Markets:        Dubai, Hong Kong, UK (in order of rollout)  
Content:        VARA-regulated claims, global digital-syndication framing  
Tokinvest:      "Powered by Tokinvest infrastructure" — appears in:
                - Investor decks (International Ownership)
                - Platform footers (International pages)
                - Regulatory disclosures (International)
                - Press releases (dual Evolution + Tokinvest sign-off)
                NEVER in: Awareness-layer content, NZ domestic investor materials  
DRC:            Primary institutional validation credential  

#### State Separation Rule

Never combine NZTR and VARA claims in the same piece of content.  
If content is NZ domestic: cite NZTR + FMA only.  
If content is international: cite VARA + Tokinvest + DRC where appropriate.  
When in doubt: consult regulatory sign-off checklist before publishing.

---

## 3. PARTNERSHIP LANGUAGE

### Dubai Racing Club (DRC)

The DRC partnership is Evolution Stables' most significant institutional credibility asset
for international and HNW audiences. Use it with precision — not as noise.

Correct contexts:
- Investor decks (International Ownership)
- Press releases
- Institutional ownership copy targeting HNW / Family Office audiences
- LinkedIn thought leadership

Correct usage:
"Recognised by Dubai Racing Club as a digital-syndication partner."  
"Validated through our partnership with the Dubai Racing Club."

Incorrect usage:
"DRC guarantees market access" — unproven, remove  
"DRC-backed returns" — illegal claim  
"Dubai Racing Club picks our horses" — factually wrong  

Never in: Awareness-layer content, NZ domestic investor materials, any context where
ownership is not already the subject.

What DRC validates: Global institutional credibility, international market access
intent, regulatory seriousness.  
What DRC does NOT validate: Returns, horse selection, financial performance.

### Tokinvest

Positioning: "Powered by Tokinvest infrastructure."

Appears:       International Ownership contexts only (see Regulatory Architecture above)  
Never appears: Awareness-layer content, Evolution Intelligence channels, NZ domestic investor-facing content  

Tokinvest is the technical infrastructure layer. Evolution Stables is the cultural and brand layer.
In all public-facing content, Evolution Stables is the primary identity. Tokinvest surfaces only
when the infrastructure itself is the point of the conversation.

---

## 4. VOICE & TONE

### The Private Banker Standard

Professional, not stuffy:  
"Institutional-grade corridor" not "fancy horse gambling"

Analytical, not cold:  
Acknowledge the animal, celebrate performance, respect the heritage of the sport.

Confident, not arrogant:  
"We built the infrastructure" not "We're the only smart ones"

Visionary, not abstract:  
Every claim tied to tangible outcomes — sectionals, regulation, marketplace liquidity.

### Tone Anchors

| Anchor     | Application                                         |
|-----------|------------------------------------------------------|
| Confident | Speak from established regulatory authority          |
| Inclusive | Make complexity understandable without dumbing down  |
| Grounded  | New Zealand roots, global expression                 |
| Challenger| Question legacy syndicates without mocking them      |

### Tone Spectrum

Professional but Not Stuffy  
✅ "Here's how our tokenisation works..."  
❌ "One humbly submits that our blockchain infrastructure..."

Confident but Not Arrogant  
✅ "We've built the first FMA-regulated tokenised horse platform"  
❌ "We're obviously the only ones who know what they're doing"

Technical but Not Jargon-Heavy  
✅ "Blockchain ensures transparent ownership records"  
❌ "Our distributed ledger technology leverages cryptographic consensus mechanisms"

Direct but Not Blunt  
✅ "Traditional syndicates lack liquidity. We solved that."  
❌ "Old syndicates are stupid and bad"

### Hard Language Rules

- Tone: Calm, measured, evidence-grounded  
- Format: Plain English (British spelling), declarative sentences  
- Prohibited: No hype, no clichés, no exclamation marks, no Web3 jargon  
- Active voice always  

### The 4MAT Framework (Ownership Edition)

WHY (Tension):  
"Racehorse ownership has been a closed shop for centuries — opaque, illiquid, relationship-gated."

WHAT (Solution):  
"Evolution Stables delivers regulated digital-syndication — transparent, tradeable, institutional-grade."

HOW (Mechanism):  
"Fractional leases, smart contract settlement, FMA and VARA compliance, secondary marketplace liquidity."

WHAT IF (Vision):  
"From spectators to stakeholders. This is ownership, evolved."

### Bridge Lines (Use Sparingly)

Heritage:  
"The sport's legacy is centuries old. Its next chapter is written in code."

Regulation:  
"Technology moves fast. We move with purpose — bridging regulation and real-world ownership."

Access:  
"Because real ownership means everyone gets a way in."

Global (International contexts only):  
"Built in New Zealand. Verified in Dubai. Ready for the world."

---

## 5. VOCABULARY

### Ownership Lexicon — Approved Terms

| Term                 | Banned Alternative                     | Usage Example                                           |
|----------------------|----------------------------------------|--------------------------------------------------------|
| Digital-syndication  | Tokenized shares, Blockchain horses    | "Our digital-syndication model…"                       |
| Equine Assets        | Horses, Racehorses, Animals            | "Acquire premium equine assets…"                       |
| Fractional Ownership | Shares, Pieces, Parts, "bits of horse" | "Fractional ownership via regulated digital-syndication…" |
| Marketplace          | Exchange, Trading platform, Shop       | "List your stake on our secondary marketplace…"        |
| Settlement           | Payment, Paying, "money stuff"         | "Settlement occurs via smart contract…"                |
| Regulated Access     | Buying in, Getting started, Joining    | "Regulated access to thoroughbred ownership…"          |
| Stewardship          | Ownership (philosophical contexts)     | "Long-term stewardship of the animal…"                 |
| Platform             | Website, App                           | "Our platform enables…"                                |
| Tokenisation         | Blockchain stuff                       | "Tokenisation enables fractional ownership…"           |
| Transparent          | (use freely — north star word)         | "Every transaction, transparent."                      |
| Institutional-grade  | (use freely — quality bar)             | "Institutional-grade reporting…"                       |

Never lead with the technology. Always lead with the outcome.  
"Digital-syndication" not "blockchain." "Regulated access" not "crypto."

### Substitution Table

| Use Instead Of   | Preferred Term                |
|------------------|-------------------------------|
| Revolutionising  | Transforming                  |
| Democratising    | Accessible                    |
| Cutting-edge     | Regulated / Contemporary      |
| Disrupting       | [Avoid entirely]              |
| Digital syndication | Digital-syndication        |
| Game-changing    | Significant / Material        |
| Innovative       | [Prove it instead]            |

### Prohibited Claims

Never publish without evidence:

"Most advanced platform"  → Says who? Cite the benchmark.  
"Industry-leading"         → Based on what metric?  
"Guaranteed returns"       → Illegal and factually untrue.  
"Revolutionary"            → Show it. Do not announce it.

The Proof Standard: Every institutional claim must cite at least one:
- Regulatory approval (NZTR, VARA, FMA)
- Partnership validation (Dubai Racing Club)
- Technical documentation (smart contract audits)
- Performance data (Expert Ledger track record)

---

## 6. WRITING PATTERNS

### Content Structure

Always: Problem → Solution → Proof
- Problem: Traditional syndicates lock up capital
- Solution: Our tokenised platform enables trading
- Proof: Partnership with Dubai Racing Club validates approach

Never: Feature dump without context  
❌ "We have blockchain! And AI! And a marketplace!"

### Headlines

Formula: [Action/Outcome] + [Differentiator]  
✅ "Trade Racehorse Ownership Like Stocks"  
✅ "New Zealand's First FMA-Regulated Tokenised Horse Platform"  
❌ "We're Revolutionizing Everything!" (hype, no value prop)  
❌ "Syndicates 2.0" (not differentiated enough)

### Technical Explanations — Show, Don't Tell

✅ "When you buy 5% of a horse, you get tokens representing that stake. Trade them anytime."  
❌ "Our proprietary tokenisation infrastructure enables fractional ownership distribution"

### Good vs. Bad Examples

Landing Page Headline  
❌ "Revolutionizing Horse Racing with Blockchain!"  
✅ "Trade Racehorse Ownership Stakes on New Zealand's First FMA-Regulated Platform"

Product Description  
❌ "Our innovative platform leverages cutting-edge blockchain technology to democratize access."  
✅ "Buy fractional ownership in racehorses. Track performance transparently. Sell anytime on our marketplace. All regulated under New Zealand's FMA."

---

## 7. MESSAGING BY PLATFORM

### LinkedIn — Primary (Thought Leadership)

Audience: Industry, institutional investors, bloodstock community  
Tone: Analytical, forward-looking, credibility-led  

Example:  
"Racing ownership has been a closed shop. Digital-syndication changes the structure — not the sport. Regulated. Transparent. Built on infrastructure that can scale."

### X / Twitter — Velocity

Audience: Racing community, early adopters, media  
Tone: Declarative, sharp, no padding  

Example:  
"Racing is evolving. Ownership is catching up."

### Instagram — Emotion, Community

Audience: Awareness-layer graduates discovering the Ownership layer, lifestyle  
Tone: Warm, visual-first, behind-the-scenes  

Example:  
"This is what shared ownership feels like."

No paddock metaphors. No heritage clichés. No agricultural framing of any kind.

### Website / Product — Conversion

Audience: Active consideration stage, post-awareness  
Tone: Clear, trusted, action-oriented  

Hero copy: "Regulated access to real-world racehorse ownership."  
Sub copy: "Powered by Tokinvest." (International Ownership pages only)

### Investor Decks — Institutional

Audience: HNW, Family Office, VC, institutional  
Tone: Data-led, compliance-first, global ambition  

Structure:  
NZTR/VARA credentials →  
DRC validation →  
Tokinvest infrastructure →  
Marketplace mechanics →  
Performance data (Expert Ledger)

---

## 8. VOICE MODULES

### Voice Module: Brand Corporate
**Module ID:** `brand_corporate`  
**Purpose:** General public descriptive content and company positioning.  
**Characteristics:**
- Progressive Premium: Technical excellence with restraint.
- Posture: Category setter, not a challenger; partner to institutions.
- Style: Confidence without noise; clarity through reduction.

### Voice Module: Founder Personal
**Module ID:** `founder_personal`  
**Purpose:** Founder-authored communication.  
**Characteristics:** Visionary but grounded, professional yet accessible.

### Voice Module: Racing Updates
**Module ID:** `racing_updates`  
**Purpose:** Race-related communications from inside the sport.  
**Characteristics:** Analytical, fact-dense, insider perspective.

### Voice Module: Regulatory Business
**Module ID:** `regulatory_business`  
**Purpose:** Governance, risk, and regulatory communication.  
**Characteristics:** Clinical, measured, precise, evidence-based.

---

## 9. VISUAL SYSTEM

### Colour Palette — Ownership Layer (Dark/Gold Institutional)

| Token                               | Hex      | Usage                               |
|-------------------------------------|----------|-------------------------------------|
| Primary Background (Awareness ref.) | #121212  | Awareness-layer base (see INTELLIGENCE_SYSTEM.md) |
| Ownership Gold                      | #d4a964  | Primary accent — CTAs, key metrics  |
| Interactive Gold                    | #e4bb75  | Hover states, active CTAs           |
| Primary Background                  | #0b0b0b  | Deep sophistication base            |
| Surface                             | #121212  | Card and panel elevation            |
| Surface Raised                      | #1a1a1a  | Modals, elevated components         |
| Primary Text                        | #f5f5f5  | High readability body and headlines |
| Secondary Text                      | #cfcfcf  | Metadata, captions, supporting copy |
| Success                             | #3eb489  | Confirmation, trust signals         |
| Warning                             | #ebc14e  | Caution, pending states             |
| Error                               | #e35c5c  | Correction, alert states            |

### Typography

Primary interface and editorial: Geist Sans

  Standard:       Geist Sans  
  Legacy/Tooling: Inter (Sans-serif)  
  Data/Protocol:  Geist Mono  

  Weights: 300 (Light), 400 (Regular), 600 (Semi-Bold)  

### Type Scale

| Level    | Size                          | Tracking   | Line Height |
|----------|-------------------------------|------------|-------------|
| Display  | clamp(2.8rem, 5vw, 4rem)      | -0.02em    | 1.2         |
| H2       | clamp(2rem, 3vw, 2.8rem)      | -0.015em   | 1.2         |
| Body     | 1rem–1.125rem                 | 0          | 1.7         |
| Protocol | 0.875rem (Geist Mono)         | 0          | 1.5         |

### Animation & Effects

- Gold Wave: Characters pulse gold in sequence (Hero headlines).
- Border Shimmer: Light travels along borders (Premium cards).
- Evo Pulse: Text fades between white and gold (Brand moments).
- Ken Burns: 105-115% zoom on stills (Reels/Cinematic content).

### Imagery

Style:   Documentary-meets-cinematic  
Light:   Natural, soft shadows, high contrast  
Subject: Real horses, real track work, real stable environments, real people — trainers, stablehands, connections  

Avoid:
- Stock photography  
- Cartoon or illustrated assets  
- Gambling aesthetics (red/black flash, roulette adjacency)  
- Anything that visually reads as a betting app  
- Staged or artificial environments  

---

## 10. GOVERNANCE

### Content Approval Tiers

| Content Type   | Required Approval                      |
|----------------|----------------------------------------|
| Platform copy  | Legal review (FMA compliance)          |
| Investor decks | Regulatory sign-off (Evolution + legal)|
| Social content | Brand guardian review (Awareness/Ownership separation) |
| Press releases | Dual approval (Evolution + Tokinvest)  |
| DRC references | Confirm current partnership status first |

### FMA Compliance Notes

- All investment content must include risk warnings  
- Use institutional tone — authoritative, not hyped  
- Include "Authorised Syndicators" badge where required  
- Maintain professional, non-gambling aesthetic  
- Where performance or returns are referenced, include:  
  "Past performance is not indicative of future results."

### Ownership Approval Checklist

Before any Ownership-layer piece is approved, confirm:

  ☐ No prohibited claims (see Section 5)  
  ☐ Regulatory state correctly identified (NZ or International)  
  ☐ Tokinvest reference only present if International context  
  ☐ DRC reference appropriate to audience and context  
  ☐ No Awareness-layer vocabulary present (see INTELLIGENCE_SYSTEM.md §2)  
  ☐ 4MAT structure followed for investor-facing content  
  ☐ Proof standard met for every institutional claim  
  ☐ Legal review completed if FMA-sensitive  
  ☐ British English throughout  
  ☐ Active voice used  

---

## 11. CURRENT PHASE & ROADMAP

### Current Phase: Institutional Validation
- Emphasize partnerships (Dubai Racing Club)
- Highlight regulatory compliance
- Show technical sophistication
- Build credibility through data

### Next Phase: Platform Growth
- User success stories
- Trading volume metrics
- Performance tracking
- Community building (but professional, not cult-like)

---

## 12. EVOLUTION RULES

This document only changes in three cases:

1. Regulatory change
   - New or updated NZTR / FMA / VARA rules
   - New jurisdictions added (e.g. Hong Kong, UK)

2. New surfaces or capabilities
   - New content formats, channels, or product surfaces
   - New data types added to Expert Ledger or reporting

3. Clarity improvements
   - Removing ambiguity, tightening wording, or aligning with live practice
   - No speculative future ideas

All changes must:
- Be recorded in VERSION HISTORY with date and summary
- Keep the Awareness/Ownership wall intact
- Preserve the two-state regulatory model and proof standard (Ownership)

---

## VERSION HISTORY

v2026.3 — March 2026  
  Full consolidation into single canonical file.  
  Replaces: EVOLUTION_STABLES.md, Branding.md (archive), Brand_Voice_System/ folder, VISUAL_SYSTEM.md, MEGA_BRAND_GUIDE.md (brand sections).  
  Key additions: Evolution Funnel model, complete two-state regulatory architecture, updated vocabulary, partnership language, visual system, governance checklists.

v2026.2 — Feb 2026  
  Initial canonical versions across multiple files.

Status: Canonical v2026.3  
Do NOT modify casually. Version changes require header update.  
Next review: When regulatory status changes or new markets activate.
# Evolution Intelligence — Awareness Layer

# HIERARCHY OF TRUTH (Non-Negotiable)
In any conflict, apply rules in this strict order:
1. BRAND_SYSTEM.md + INTELLIGENCE_SYSTEM.md (this layer)
2. MEGA_BRAND_GUIDE.md (values & positioning only, archived)
3. Source material in /00_DNA/brand-identity/ (reference only)

Last updated: 2026-03-01 | Version 2026.3

Version: 2026.3
Status: Canonical
Last Updated: 2026-03-01
Scope: Faceless content operations, social media, awareness-phase voice
Hard Restriction: NO ownership mentions. NO Evolution Stables branding.
                  NO Tokinvest/VARA references. Ever.

Replaces:
- 00_DNA/brand-identity/EVOLUTION_INTELLIGENCE.md

Internal shorthand: This file defines the Awareness Layer of the Evolution Funnel
(formerly called “GTI” internally; do not use that term in external content).

For Ownership Layer brand: see BRAND_SYSTEM.md  
For technical architecture: see Evolution_OS.md

---

## 1. THE DOCTRINE

### The Fight Club Rule

First Rule: You do not talk about ownership.  
Second Rule: You DO NOT talk about ownership.

Evolution Intelligence is the Intelligence Engine. It is not a marketing channel
for Evolution Stables. It educates participation, audits the experts, surfaces the data.
If someone discovers Evolution Stables later through algorithmic osmosis — that is
incidental, not designed.

We capture the attention of an aspirational pre-ownership audience: fast, accessible,
high-revving, democratic. Evolution Stables comes later when they mature into
ownership-ready participants. Do not rush the progression. Never break the wall.

### The Wall — Non-Negotiable

- NO mention of Evolution Stables (name or logo)  
- NO ownership, syndication, or investment language  
- NO branding links between this channel and Evolution Stables  
- NO mention of Tokinvest, VARA, Dubai, DRC  
- The algorithm makes the connection. We never do.  

### The Channel Identity

Public name:  Evolution Intelligence  
Handle:       @EvolutionIntelligence (or market-specific variant)  
Bio:          "Racing intelligence. Data over opinion."

No logo connection to Evolution Stables in awareness-phase contexts.  
No "Powered by" or "Part of" references.  
No hashtags linking to Evolution Stables accounts.

The link between Evolution Intelligence and Evolution Stables is never stated in content.
It exists only in the algorithm — when a follower searches for racehorse ownership,
Evolution Stables is what they find.

### Core Philosophy

We are data-led, not opinion-led.

Every piece of content anchors to measurable data:
- Price movement / odds movement
- Sectional times / sectional ranking
- Turnover change / volume change
- Expert Ledger accuracy (pundit audit)

We never predict. We verify.  
We never publish our own tips or picks. We audit and attribute others' calls.  
We never sell. We educate.

### Content From Content

The Intelligence Engine only makes content from content.  
It ingests market data, historical results, and third‑party tips, then outputs
analysis and audits. No new tips are created by this system. Ever.

---

## 2. THE VOCABULARY (Institutional Neutral)

Use these terms exclusively. Non-negotiable.

| System Term              | Neutral Racing Term                   | Banned / Discouraged                               |
|--------------------------|---------------------------------------|----------------------------------------------------|
| Market leader            | Market favourite                      | Market Liability, "the fav"                        |
| Price movement           | Odds movement                         | Flucs                                              |
| Price firming / drift    | Shortening / drifting                 | (use standard racing language only)                |
| Turnover change          | Volume change                         | Volume Delta                                       |
| Sectional times          | Sectional ranking                     | Sectional Rank (as branded noun)                   |
| Payout / return          | Dividend (only when quoting others)   | Paying a Divvie, Divvie                            |
| Market signal            | Data signal                           | The Oil                                            |
| Analysis / summary       | (our output)                          | The Tape                                           |
| Allocation / positioning | Exposure                              | Bet, Punt, Wager, Gamble                           |
| Intelligence             | (our product name)                    | Tips, Picks, Selections, Best bets                 |

Standardised caption phrasing:  
"Odds on the market leader shortened from 6.0 to 3.8 in the last 20 minutes. Turnover tripled over the same window. That price movement was the signal."

We never use punter slang in our own narration.  
We never publish our own "tips" or "picks". We quote other people's tips and analyse how they perform over time.  
In our own narration, use neutral terms like call, selection, or simply their tip, always attributed to source.

### Prohibited Terminology — Immediate Rejection

Content containing any of the following is rejected before human review:

Hype language:  
  "Get on it" / "Jump on" / "Don't miss" / "Be quick"  
  "Certainty" / "Lock" / "Can't lose" / "Guaranteed" / "Sure thing"

Lad filter:  
  "The Boys" (unless specific named group: "The Leg Up boys")  
  "Mate" / "Lads" / "Champ" / "Bro" / "Folks"

Removed system words:  
  "The Tape"  
  "The Oil"  
  "Flucs"  
  "Paying a Divvie" / "Divvie"

In-house narration bans:  
  "Tip" / "Pick" / "Best bet" / "Moral" / "Good thing" / "Sure thing"  
  (Allowed only when attributed to external pundits in quotes/screenshots)

Deprecated phrases (never revive):  
  "Paddocks to Protocols"  
  "Bloomberg of Bloodstock"  
  "From the paddock to the podium"  
  "From paddocks to performance"

---

## 3. CONTENT ARCHITECTURE

### The Three Pillars

#### Pillar 1: The Kingmaker (Monday)

Purpose:  
Build authority by auditing who gets it right. Social proof through transparency —
not by claiming we are smart, but by proving others are inconsistent.

Format: 30–60s vertical video. Leaderboard graphic. ROI calculations.

Hook:  
"BGP called the trifecta at Trentham. The Leg Up boys missed the board entirely.
Here is who ruled the weekend — and whose calls delivered the strongest returns
for punters who trusted them."

Required data points:
- Expert win rate (last 30 days)
- ROI by source (BGP vs. TAB Form vs. ACC vs. The Leg Up)
- Contrarian calls that landed
- Worst call of the week (named, data-cited, never mocking in tone)

Visual style:  
Moneyball-style scatter plots. Podium leaderboard graphic.  
"AUDIT" seal overlay. Deep navy / gold palette.

CTA: None. End on the data. The viewer concludes who to trust.

Expert Ledger fields required for Kingmaker content:
- pundit_name
- race_date, venue, race_number
- call (horse selected by pundit)
- finish_pos (actual result)
- divvie_paid (payout, 0 if not placed)  (internal field name; not used in public copy)
- correct_call (boolean)
- running_roi (cumulative %)
- source_url (link to original call)

---

#### Pillar 2: Whale Watch (Thursday)

Purpose:  
Educate market literacy. Teach the audience to read Smart Money flows before race day.

Format: 30–45s vertical. Ticker-tape visualisation. Odds movement charts.

Hook:  
"Odds on the market leader shortened from 6.0 to 3.8 in the last 20 minutes.
Turnover tripled over the same window. That price movement was the signal."

Required data points:
- Opening price vs. current price (full odds movement path)
- Volume spikes (flag any threshold >$5k)
- Late compression window (final 10–15 minutes)
- Fixed Odds vs. Tote divergence where significant

Whale Alert trigger (automated via Scout Agent):  
  Volume change > 2 standard deviations  
  AND price drop > 15% within any 10-minute window  
  = WHALE ALERT badge activated  

Visual style:  
Ticker tape overlays. Price/volume time-series graphs.  
Muted palette (deep navy, gold accent).  
"WHALE ALERT" badge — data-stamp aesthetic, not hype.

---

#### Pillar 3: The Outsider (Weekend)

Purpose:  
Emotional connection. The underdog narrative that makes racing compelling to a new audience.
Pure storytelling. Zero sales.

Format: 60–90s cinematic. Slow-motion B-roll. Emotive score.  
4K morning track footage where available.

Hook:  
"The pedigree said too slow. The experts said too small. The market wrote him off at 40-1.
But the sectional ranking told a different story — and the eventual payout proved it."

Subject profile:
- Sub-$20k purchase price vs. $1m+ favourites
- Modest pedigree, strong sectionals
- Quiet confidence from connections (market and stable signals)
- Long-shot payout
- Human angle: trainer, stable hand (no ownership framing — frame as passion, craft, sport)

Visual style:  
Documentary-meets-cinematic. Soft shadows. High contrast.  
Natural light. Real stable environments. Real horses, real people.

Critical:  
Never mention Evolution Stables.  
Never suggest buying shares.  
Never reference syndication.  
This is pure storytelling.

---

### The 4MAT Pattern (All Content)

Every video follows one of these two structures. No exceptions.

#### Previews (Before Race Day)

| Phase      | Timing | Content                                                             |
|-----------|--------|---------------------------------------------------------------------|
| Signal    | 0–5s   | The anomaly: volume spike, weather shift, key scratch               |
| Analysis  | 5–20s  | Concrete data: sectional ranking, price compression, volume change  |
| Opportunity | 20–30s | Position as undervalued — NEVER instruct on allocation            |

#### Recaps (After Race Day)

| Phase  | Timing | Content                                                               |
|--------|--------|-----------------------------------------------------------------------|
| Audit  | 0–5s   | What happened vs. what the Intelligence reflected                    |
| Logic  | 5–20s  | Why the data read correctly (or failed) — full odds movement path    |
| Legacy | 20–30s | What this means for the next meeting. Continuous learning.           |

---

## 4. PRODUCTION SPECIFICATIONS

### The Silent Playback Rule

Mandate: Audio is optional. Visuals are mandatory.

Evolution Intelligence audience consumes content:
- In transit (muted)
- In boardrooms (muted)
- Scrolling at 11pm next to a sleeping partner (muted)

Every frame must communicate full value without sound.

Execution:
- Burned-in captions:  Inter Bold, 48px, #f5f5f5, 2px black stroke
- Data overlays:       Scatter plots, odds movement charts, sectional ranking badges
- Voiceover:           Enhances but never replaces visual Intelligence
- First 2 seconds:     Key metric must be visible before any voiceover

### Video Specifications

| Parameter  | Spec                               |
|-----------|------------------------------------|
| Resolution| 1080×1920 (9:16 vertical)          |
| Codec     | H.264, CRF 23                      |
| Duration  | Hard cap 60s (Outsider: 90s max)   |
| Voice     | ElevenLabs Kore, 44.1kHz stereo    |
| Voice model | Eleven Turbo v2                  |
| Settings  | Stability 0.6, Clarity 0.8, Style 0.4 |

### Colour Palette (Awareness Layer)

| Role            | Hex     | Usage                                   |
|-----------------|---------|-----------------------------------------|
| Background      | #121212 | Deep charcoal base                      |
| Primary text    | #f5f5f5 | Captions, data labels                   |
| Gold accent     | #d4a964 | Key metrics, Whale Alert badge          |
| Odds: firming   | Red     | Price compression toward favourite      |
| Odds: drifting  | Green   | Price expansion away from favourite     |
| Odds: static    | #888888 | Unchanged market                        |

### Caption Standards

Font:     Inter Bold  
Size:     48px  
Colour:   #f5f5f5  
Stroke:   2px black (#000000)  
Position: Lower third (data overlays occupy centre)

Key terms always ALL CAPS in captions:  
  MARKET FAVOURITE  
  VOLUME CHANGE  
  SECTIONAL RANKING  
  PRICE MOVEMENT  
  DATA SIGNAL  
  WHALE ALERT  
  SMART MONEY  

### File Naming Convention

Pattern:  YYYY-MM-DD_VENUE_TYPE_vN.ext  
Final:    YYYY-MM-DD_VENUE_TYPE_FINAL.ext  

Examples:  
  2026-02-18_Ellerslie_WhaleWatch_v3.mp4  
  2026-02-15_Trentham_Kingmaker_v1.mp4  
  2026-02-22_TeRapa_Outsider_FINAL.mp4  

---

## 5. TONE ANCHORS

| Anchor                 | Means                                        |
|------------------------|----------------------------------------------|
| Confident, not cocky   | Speak from data, not ego                     |
| Inclusive, not generic | Explain odds movement simply but precisely   |
| Grounded, not rustic   | Proud of NZ racing — global in standard      |
| Challenger, not combative | Question pundits without mocking them     |

We are the auditor. We hold the mirror up to the market.  
We do not shout. We do not hype. We show the numbers and
let the audience reach their own conclusions.

---

## 6. GOVERNANCE

### When NOT to Publish

| Condition             | Rule                                      |
|-----------------------|-------------------------------------------|
| Scout confidence < 0.6| Silence. Do not publish.                  |
| No contrarian signal  | Market efficiency — nothing to add        |
| Sensitive events      | Industry investigations, welfare incidents|
| Tone drift detected   | Script contains prohibited terminology    |
| Data gaps             | Missing sectional data or odds-movement history |

The Silence Rule:  
Silence protects credibility. Not publishing when we have nothing adds trust.
Training the audience that when we speak it means something — that is the long game.

### The Human Gate

All content requires explicit human approval via Telegram before any distribution.
No exceptions.

  /approve [ID]           → Publishes to TikTok / X / Instagram  
  /reject [ID] [reason]   → Archives with reason logged  
  /edit [ID]              → Returns to vault for revision  

### Content Separation Checklist

Before any piece is approved, confirm:

  ☐ No mention of Evolution Stables (name or logo)  
  ☐ No mention of ownership, shares, syndication, leases  
  ☐ No mention of Tokinvest, VARA, Dubai, DRC  
  ☐ No mention of investment returns  
  ☐ No original recommendations or implied "should back X" language  
  ☐ All references to tips or picks are attributed to a named source and linked to Expert Ledger data where available  
  ☐ No prohibited terminology (run against banned list)  
  ☐ Data sources cited for every claim in script  
  ☐ Silent Playback Rule satisfied (watch on mute first)  
  ☐ File named correctly (YYYY-MM-DD_VENUE_TYPE_vN.ext)  

---

## 7. TECHNICAL INTEGRATION

Full detail in Evolution_OS.md.

Input:    Scout briefs → 01_raw_intake/  
Process:  n8n → Gemini Pro (awareness-phase voice guardrails) → ElevenLabs Kore  
Build:    FFmpeg (captions, B-roll, data overlays, 1080×1920)  
Output:   04_exports/ → Telegram approval → Social APIs  
Cleanup:  Sunday Hygiene SOP (see Evolution_OS.md)  

---

## 8. EVOLUTION RULES

This document only changes in three cases:

1. Regulatory change
   - New or updated NZTR / FMA / VARA rules
   - New markets require new Intelligence patterns

2. New surfaces or capabilities
   - New content formats, channels, or product surfaces
   - New data types added to Expert Ledger

3. Clarity improvements
   - Removing ambiguity, tightening wording, or aligning with live practice
   - No speculative future ideas

All changes must:
- Be recorded in VERSION HISTORY with date and summary
- Keep the Awareness/Ownership wall intact
- Preserve the “content from content” and “no own tips” doctrines

---

## VERSION HISTORY

v2026.3 — March 2026  
  Consolidated into single canonical file. Vocabulary neutralised, doctrine and governance clarified.  
  Replaces: EVOLUTION_INTELLIGENCE.md  

v2026.2 — Feb 2026  
  Initial canonical version  
  Replaced: Volume XVIII, n8n Content Factory Bible, Faceless Content PDF, Kimi draft placeholder  
  Key additions: Evolution Intelligence channel identity, Expert Ledger schema, Silent Playback spec, full banned terms list, ElevenLabs model tier specified  

Status: Canonical v2026.3  
Do NOT modify casually. Version changes require header update.  
Next review: When content pillars expand or new markets activate.
# Evolution Brand System — README

This folder contains the canonical brand system for Evolution.

## 1. The Evolution Funnel

We operate one funnel with two layers:

- Awareness Layer — Evolution Intelligence  
  Faceless racing Intelligence channel. Data‑led, audit‑only, no ownership or investment content.

- Ownership Layer — Evolution Stables  
  Regulated digital‑syndication platform. Institutional‑grade, compliance‑first, no tipping or gambling language.

The wall between Awareness and Ownership is permanent and non‑negotiable.

## 2. Canonical Files

Only these files are considered live brand canon:

- `BRAND_SYSTEM.md`  
  Ownership Layer identity, regulatory architecture, vocabulary, visual system, governance.

- `INTELLIGENCE_SYSTEM.md`  
  Awareness Layer doctrine ("content from content"), vocabulary, pillars, production rules, governance.

Everything else in `/00_DNA/brand-identity/` and `/00_DNA/brand/_archive/` is reference only.

**Hierarchy of truth**

1. `BRAND_SYSTEM.md` + `INTELLIGENCE_SYSTEM.md`  
2. `MEGA_BRAND_GUIDE.md` (archived — values & positioning reference)  
3. `/00_DNA/brand-identity/` source files (historical material)

If a legacy file conflicts with `BRAND_SYSTEM.md` or `INTELLIGENCE_SYSTEM.md`, the system files win.

## 3. How to Use This Folder

- **Writing content**
  - Awareness‑layer work (Intelligence, pundit audits, Whale Watch, Outsider) → `INTELLIGENCE_SYSTEM.md`.
  - Ownership‑layer work (platform, investors, NZTR/FMA/VARA, DRC, Tokinvest) → `BRAND_SYSTEM.md`.

- **Designing visuals**
  - Use colour, type, animation, and export specs from the relevant system file.
  - Do not invent new palettes, fonts, logo usages, or badges without updating `BRAND_SYSTEM.md`.

- **Agents / LLMs**
  - Always load `BRAND_SYSTEM.md` and/or `INTELLIGENCE_SYSTEM.md` as primary context.
  - Never treat `/brand-identity/` as authoritative; it is archive.

## 4. Versioning and Changes

These system files change only when:

1. Regulation changes (NZTR, FMA, VARA, new markets), or  
2. New formats / surfaces are live (new channels, new data types), or  
3. We remove ambiguity or tighten wording based on live practice.

When you change a system file:

- Update its `VERSION HISTORY` section.  
- Add an entry to `CHANGELOG.md` in this folder.  
- Keep the Awareness/Ownership wall and core doctrines intact.

If it isn’t in `BRAND_SYSTEM.md` or `INTELLIGENCE_SYSTEM.md` (or logged in `CHANGELOG.md`), it is not canon.

## 5. Work‑In‑Progress Specs

Some supporting specs are intentionally marked as **working**, not canonical:

- `METRICS_SYSTEM.md` — KPI names, categories, and public‑usage rules for Awareness and Ownership.  
  - Formulas and dashboards live in analytics tooling.  
  - This file will be promoted to canonical status once dashboards are stable.

Any WIP file must clearly state its status at the top:

> `Status: Working specification (not canonical)`

System files (`BRAND_SYSTEM.md`, `INTELLIGENCE_SYSTEM.md`) remain the only binding source of truth.
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
# 📜 Decision Log - Evolution Stables

**Purpose:** Document significant architectural and strategic decisions.  
**Principle:** Decisions without context are just rules. Understand why.

---

## 2026-02-28: Build Philosophy Canonicalization

### Decision
Canonicalize project names, storage paths, and layer terminology across all build-philosophy documents and core DNA files to eliminate naming drift and path inconsistencies.

### Context
- Multiple DNA build-philosophy docs had minor naming and path drift.
- Old references existed to `evolution-studios-engine`, `evolution-content-engine`, `01_Platform`, and `/mnt/native`.
- The safe-path standard and four-layer architecture were already defined elsewhere in DNA but not applied consistently.

### Decision Details
**Project Naming Alignment:**
- Replaced `evolution-studios-engine` with `EvolutionStudio`.
- Replaced `evolution-content-engine` with `EvolutionContent`.
- Replaced `01_Platform`, `02_Content_Factory`, `04_Intelligence` with `EvolutionPlatform`, `EvolutionContent`, `EvolutionIntelligence` where they refer to current repos.
- Kept `Evolution-3.1` only when referring to the historical codebase or Git history.

**Safe-Path Storage Alignment:**
- Confirmed the canonical safe-path standard:
  - `/home/evo/projects` – all active repos.
  - `/home/evo/models` – all model files and weights.
  - `/home/evo/00_DNA` – source-of-truth docs.
- Removed legacy references to `/mnt/native` and 500GB Ext4 volumes from `Tech_Stack_2026.md`.
- Updated all examples to assume the direct bind-mount of the Samsung 990 PRO into `/home/evo/`.

**Layer Naming Standardization:**
- Standardized the architecture language to four explicit layers: **Content / Intelligence / Infrastructure / External**.
- Updated `DECISION_LOG.md`, `OPERATING_BACKLOG.md`, `SEPARATION_OF_CONCERNS.md`, and related build-philosophy docs to use this four-layer stack consistently.

### Impact
- ✅ Build philosophy is now 100% aligned with actual filesystem layout and repo structure.
- ✅ Removes ambiguity for agents and humans about where code, models, and DNA live.
- ✅ Ensures future architecture and tooling decisions use the same four-layer and safe-path vocabulary.

### Related Files
- `00_DNA/build-philosophy/ARCHITECTURE_STRATEGY.md`
- `00_DNA/build-philosophy/Evolution_OS.md`
- `00_DNA/build-philosophy/Tech_Stack_2026.md`
- `00_DNA/DECISION_LOG.md`
- `00_DNA/OPERATING_BACKLOG.md`
- `00_DNA/build-philosophy/SEPARATION_OF_CONCERNS.md`

---

## 2026-02-27: Model-Agnostic Memory System

### Decision
Create a model-agnostic memory system using DNA files instead of relying on AI session persistence.

### Context
Kimi CLI (and other AI tools) have session persistence, but:
- Sessions don't auto-resume
- Each new terminal starts fresh
- Switching AI tools (Kimi → Claude → Kilo) loses all context
- Re-explaining project structure every session is wasteful

### Decision Details
**Approach:** DNA as persistent memory
- `🧠 AI_CONTEXT.md` - Entry point for ANY AI
- `OPERATING_BACKLOG.md` - Current work & blockers
- `DECISION_LOG.md` - Why we made key choices
- All files are plain markdown (works with any AI)

**Rejected Alternatives:**
- ❌ Rely on Kimi's `--continue` flag (tool-specific, doesn't survive tool switches)
- ❌ Build custom memory server (over-engineered for current needs)
- ❌ Use MCP memory (experimental, adds complexity)

### Impact
- ✅ Can switch between Kimi, Claude, Kilo seamlessly
- ✅ AI picks up context immediately by reading DNA
- ✅ No re-explaining project structure
- ✅ Version-controlled memory (git history of decisions)

### Related Files
- `00_DNA/🧠 AI_CONTEXT.md`
- `00_DNA/🧠 MEMORY_PROTOCOL.md`
- `00_DNA/OPERATING_BACKLOG.md`

---

## 2026-02-27: Consolidation Strategy (Phase 6)

### Decision
Consolidate scattered projects into 4-layer architecture with central vault.

### Context
/evolved into chaos:
- 20+ folders in root
- Projects scattered (Evolution_* folders everywhere)
- Multiple .env files with duplicated keys
- No clear separation of concerns
- Travel mode not configured

### Decision Details
**New Structure:**
```
/evo/
├── 00_DNA/              # Knowledge base
├── projects/            # Active work
│   ├── Content Layer    # What users see
│   ├── Intelligence     # What system knows
│   ├── Infrastructure   # What runs it
│   └── External         # Third-party tools
├── .env                 # One vault for all keys
└── _*/                  # Supporting folders
```

**Key Principles:**
1. Content ≠ Intelligence ≠ Infrastructure ≠ External (strict separation)
2. One vault (`/evo/.env`) symlinked by all projects
3. DNA is source of truth (standards live there, not in projects)

**Rejected Alternatives:**
- ❌ Monorepo (too complex, forces coupling)
- ❌ Keep scattered structure (continues drift)
- ❌ Merge all into single project (loses separation)

### Impact
- ✅ Clean root directory
- ✅ Clear project boundaries
- ✅ Single point for API keys
- ✅ Travel mode ready (OpenClaw + Kimi K2)

### Related Files
- `FINAL_STRUCTURE.md`
- `PROJECTS_INDEX.md`
- `🏗️ Build Rules.md`

---

## 2026-02-27: Central API Vault

### Decision
Use single `/evo/.env` file symlinked by all projects.

### Context
Multiple .env files across projects:
- Duplicated keys
- Inconsistent updates
- Security risk (some committed accidentally)
- Hard to rotate keys

### Decision Details
**Implementation:**
- Master: `/evo/.env` (chmod 600)
- Projects: `ln -sf /evo/.env .env`
- Template: `/evo/_config/.env.template`
- Validation: `evo vault check`

**Rejected Alternatives:**
- ❌ Keep per-project .env files (duplication, drift)
- ❌ Use environment manager (overkill for current scale)
- ❌ HashiCorp Vault (enterprise overkill)

### Impact
- ✅ Change key once, applies everywhere
- ✅ Consistent configuration
- ✅ Easier rotation
- ✅ Simpler backup (one file)

### Related Files
- `🔐 Secrets Guide.md`
- `_config/.env.template`
- `_scripts/vault.sh`

---

## 2026-02-27: DNA as Obsidian Vault

### Decision
Structure 00_DNA as an Obsidian vault for knowledge management.

### Context
DNA was a collection of markdown files but:
- Hard to navigate
- No linking between concepts
- Not visual/graph-based
- Hard to find related information

### Decision Details
**Features:**
- Obsidian app integration (`.obsidian/` folder)
- Wiki-style links: `[[Related Document]]`
- Emoji prefixes for quick visual scanning: `🏠` `🔐` `🧠`
- Graph view for exploring connections

**Rejected Alternatives:**
- ❌ Wiki software (overhead, hosting)
- ❌ Notion (proprietary, API limits)
- ❌ Plain files (hard to navigate at scale)

### Impact
- ✅ Visual knowledge graph
- ✅ Quick navigation
- ✅ Links between related concepts
- ✅ Works offline

### Related Files
- `00_DNA/.obsidian/`
- `🏠 Home.md`

---

## 2026-02-27: Docker Management Philosophy

### Decision
Keep Docker configurations decentralized (per-project) but provide centralized simple management via `evo docker` commands.

### Context
Docker is used extensively but:
- User getting Windows alerts about containers
- Doesn't want to learn Docker deeply
- Each project legitimately needs different container configs
- Needs simple start/stop control without memorizing commands

### Decision Details
**Architecture:**
- Each project keeps its own `docker-compose.yml` (project-specific tweaks)
- No root-level docker-compose (avoids "everything or nothing")
- Simple `evo docker` commands for management
- Human-readable documentation in `🐳 Docker Guide.md`

**Commands Provided:**
- `evo docker status` - See what's running
- `evo docker list` - See available projects
- `evo docker start [project]` - Start specific project
- `evo docker stop [project]` - Stop specific project
- `evo docker stop-all` - Emergency brake
- `evo docker clean` - Free disk space

**Rejected Alternatives:**
- ❌ Single root docker-compose.yml (forces all-or-nothing, loses per-project flexibility)
- ❌ Remove Docker entirely (too many services depend on it)
- ❌ Force user to learn Docker CLI (unnecessary complexity)
- ❌ Kubernetes (massive overkill for local dev)

### Impact
- ✅ Simple commands hide Docker complexity
- ✅ Each project can customize its containers
- ✅ Easy to see what's consuming resources
- ✅ Emergency stop available
- ✅ No Docker knowledge required

### Related Files
- `🐳 Docker Guide.md`
- `_scripts/evo-docker.sh`

---

## 2026-02-27: Development Enhancements Stack

### Decision
Add lightweight productivity tools (FZF, Zoxide, Just, Starship, git hooks) to enhance development workflow without heavy overhead.

### Context
Terminal workflow was basic:
- No fuzzy finding (lots of typing paths)
- No command history search (arrow keys only)
- Basic prompt (no git status visibility)
- Risk of committing secrets (no protection)
- No task runner (typing long commands)

### Decision Details
**Tools Chosen:**

| Tool | Purpose | Overhead |
|------|---------|----------|
| Git hooks | Prevent .env commits | Zero |
| FZF | Fuzzy find files/history | ~10ms startup |
| Zoxide | Smarter cd command | ~5ms startup |
| Just | Task runner | None (on demand) |
| Starship | Pretty prompt | ~20ms startup |
| Bash aliases | Shortcuts | Zero |
| Obsidian templates | Note consistency | Zero |
| EditorConfig | Format consistency | Zero |

**Total overhead:** ~35ms startup, ~10MB RAM

**Why not heavier tools?**
- ❌ Docker-based dev environments (overkill for local work)
- ❌ Complex dotfiles management (maintenance burden)
- ❌ IDE-specific plugins (not portable)
- ❌ Heavy zsh frameworks (slow startup)

**Installation:**
- Optional scripts in `_scripts/`
- Source control for configs
- Easy to uninstall (just remove source lines)

### Impact
- ✅ Faster navigation (Zoxide learns paths)
- ✅ Better command history (FZF)
- ✅ Consistent tasks (Justfile)
- ✅ Visual git status (Starship)
- ✅ Protection from accidents (git hooks)
- ✅ Consistent notes (Obsidian templates)

### Related Files
- `🛠️ Enhancements Guide.md`
- `_scripts/install-git-hooks.sh`
- `_scripts/install-enhancements.sh`
- `_config/bash-evo.sh`
- `Justfile`

---

## 2026-02-27: Approved Sources Registry

### Decision
Create a curated registry of approved tools and repositories in DNA to enable the "Adapt > Integrate > Build" philosophy.

### Context
User has 100+ starred repos on GitHub but:
- No central reference for "what's been vetted" → **SOLVED: skills/approved_sources.md is now single source of truth**
- AI assistants don't know what's pre-approved → **SOLVED: All DNA files point to approved_sources.md**
- Hard to remember why certain tools were chosen
- Re-invention happens when knowledge isn't shared

### Decision Details
**Created:** `skills/approved_sources.md`

**Structure:**
- Organized by category (AI, Productivity, Architecture, Agent Orchestration, etc.)
- Each entry: What it does, When to use, Why approved
- Single source of truth: All DNA files reference this for repo listings
- Anti-patterns section (what to avoid)

**Integration:**
- Referenced in `🧠 AI_CONTEXT.md` - AI assistants check it first
- Referenced in `AGENTS.core.md` - Research Before Build rule
- Living document - add new finds as they're vetted

**Philosophy:**
- Curated > Comprehensive (quality over quantity)
- Opinionated > Neutral (these are YOUR approved tools)
- Living > Static (update as you learn)

### Impact
- ✅ AI assistants can recommend pre-approved solutions
- ✅ New team members (or future you) see what's vetted
- ✅ Prevents re-researching the same tools
- ✅ Documents WHY choices were made

### Related Files
- `skills/approved_sources.md`
- `skills/INDEX.md`

---

## 2026-02-27: Tech Radar - Bullshit Filter System

### Decision
Create a Tech Radar system to track, evaluate, and make decisions about new tools without repeating conversations or randomly adopting tech.

### Context
User is getting firehosed with new AI tools, repos, and "vibe coding" content:
- Instagram reels about new tools daily
- GitHub starred repos piling up
- Same conversations happening multiple times
- No systematic way to evaluate before trying
- Risk of "shiny object syndrome"

### Decision Details
**Created 3-part system:**

1. **_archive/2026-02/INBOX.md** - Rapid capture (archived path)
   - Quick dump of new discoveries
   - Source, link, one-liner, hot take
   - Process every 48 hours (inbox zero)

2. **TECH_RADAR.md** - Evaluation tracker
   - 4 statuses: Reject / Assess / Trial / Adopt
   - Full evaluation criteria
   - Decision deadlines
   - Historical record (Archive)

3. **Integration**
   - AI assistants check radar before recommending
   - User logs new finds in Inbox
   - Regular review schedule (weekly/monthly/quarterly)

**Processed first batch:**
- 9 items from Instagram content firehose
- 4 moved to Assess (Google Workspace, Antigravity, NotebookLM, etc.)
- 1 moved to Trial (NotebookLM prompts)
- 4 archived (educational content, already adopted tools)

**Key insight:** Most "new" tools are:
- Educational content (archive)
- Variations of existing tools (assess vs current stack)
- Solutions to problems we already solved (reject/assess)
- Actual new capabilities (rare - these are gold)

### Impact
- ✅ No more repeated conversations about same tools
- ✅ Clear decision framework (Reject/Assess/Trial/Adopt)
- ✅ Historical memory of why decisions were made
- ✅ Bullshit filter for hype-driven content
- ✅ Still allows experimentation (Trial status)

### Philosophy Alignment
- **Done > Perfect:** Simple markdown system, not a complex app
- **Don't reinvent:** Uses existing Tech Radar concept (ThoughtWorks)
- **Get shit done:** Rapid capture, clear decisions, move on
- **Memory:** DNA tracks everything, no repeated evaluations

### Related Files
- `TECH_RADAR.md`
- `_archive/2026-02/INBOX.md`
- `skills/INDEX.md`

---

## 2026-02-27: Quick Wins Implementation (Done > Perfect)

### Decision
Ship Phase 1 quick wins immediately (VS Code workspace, just update, backup, .env.schema) rather than over-engineering.

### Context
Had a list of potential enhancements:
- High impact: git diff secrets check, just update, container health, backup
- Medium impact: VS Code workspace, .env.schema, custom Starship, uptime monitor

### Decision Details
**Shipped Immediately (80% solutions):**

1. **VS Code Workspace** (`evolution.code-workspace`)
   - Multi-root workspace with 5 folders
   - Excludes build artifacts and large files
   - Recommended extensions pre-configured

2. **Just Update Task** (`just update`)
   - Pulls DNA + all project repos
   - One command sync everything
   - Shows failures but continues

3. **Backup Script** (`just backup`)
   - Creates timestamped tar.gz in `_backups/auto/`
   - Excludes node_modules, .next, models, etc.
   - Simple, works, done.

4. **.env.schema + Validation** (`evo vault validate`)
   - Schema documents required keys
   - Validation checks if critical keys exist
   - Not over-engineered - just checks presence

**Deferred (Don't Need Yet):**
- ❌ Git diff secret scanning (hook already blocks commits)
- ❌ Container health checks (docker status shows state)
- ❌ Custom Starship module (default shows git status)
- ❌ Uptime monitor (no SLA requirements yet)

### Impact
- ✅ VS Code workspace: Open one file, see whole project
- ✅ Just update: Single command to sync everything
- ✅ Backup: One command to protect work
- ✅ Validation: Catch missing env vars before runtime errors

**Time to implement:** 30 minutes total  
**Value:** High - daily workflow improvements

### Philosophy Alignment
- **Done > Perfect:** 80% solutions that work now
- **Don't reinvent:** Used existing tools (just, tar, grep)
- **Leverage best practices:** VS Code workspaces are standard
- **Get shit done:** Shipped in one session vs. planning forever

### Related Files
- `evolution.code-workspace`
- `Justfile` (update, backup tasks)
- `_config/.env.schema`
- `_scripts/vault.sh` (validate function)

---

## 2026-02-27: Shell Persistence Bug - FIXED with Script Installation

### Problem
After implementing `kimic` as a shell function in `bash-evo.sh`, user opened new terminal and got:
```
$ kimic
kimic: command not found
```

**Root Cause:** WSL2 doesn't reliably source `~/.bashrc` in new terminal windows (VS Code terminal, Windows Terminal, non-login shells).

### Attempted Solutions

#### Solution 1: Manual Sourcing (Failed)
- Added `source ~/.bashrc` to workflow
- Failed: Users forget, WSL2 inconsistent

#### Solution 2: .bash_profile Fallback (Partial)
- Added `[[ -f ~/.bashrc ]] && source ~/.bashrc` to `~/.bash_profile`
- Helped but still WSL2 edge cases

#### Solution 3: Script Installation (✅ PERMANENT FIX)
Converted `kimic` from shell function to standalone script:

```bash
# Install to user-local bin (no sudo needed)
cp _scripts/kimic.sh ~/.local/bin/kimic
chmod +x ~/.local/bin/kimic
```

**Why this works:**
- `~/.local/bin` is in PATH by default on WSL2
- Scripts work in EVERY shell type (login, non-login, interactive, non-interactive)
- No sourcing required, no WSL2 edge cases
- Available immediately in new terminals

### Current State
- ✅ `kimic` script installed to `~/.local/bin/kimic`
- ✅ Available in all new terminals without sourcing
- ✅ `evo doctor` verifies installation
- ✅ DNA memory system now reliable

### Verification
```bash
# In a BRAND NEW terminal (no sourcing):
which kimic           # Should show ~/.local/bin/kimic
evo doctor            # Should show ✅ kimic script installed
kimic                 # Should load DNA context
```

### Files
- `_scripts/kimic.sh` - The script
- `_scripts/evo-doctor.sh` - Updated check
- `~/.local/bin/kimic` - Installation location

---

## 2026-02-27: Dotfiles Strategy - Portable DNA System

### Decision
Create two-repo system for portability: `evo-dotfiles` (tools/config) + `evo-brain` (private DNA data).

### Context
DNA system works perfectly on current machine, but:
- No way to replicate on laptop, new PC, server
- Manual setup each time is error-prone
- WSL2 environment not portable
- Want "clone and go" experience

### Decision Details

**Two-Repo Architecture:**

| Repo | Type | Contents | Privacy |
|------|------|----------|---------|
| `evo-dotfiles` | Config | Scripts (kimic, claudec, etc.), bash config, VS Code settings | Can be public |
| `evo-brain` | Data | Actual DNA files (AI_CONTEXT, OPERATING_BACKLOG, DECISION_LOG) | **Private** |

**New Machine Workflow:**
```bash
# 1. Clone dotfiles
git clone git@github.com:yourusername/evo-dotfiles.git
cd evo-dotfiles && ./install.sh

# 2. Clone brain
git clone git@github.com:yourusername/evo-brain.git ~/00_DNA

# 3. Done
evo doctor
kimic
```

**Files Created:**
- `~/evo-dotfiles/` - Dotfiles repo structure
- `install.sh` - One-command setup
- `README.md` - Documentation
- `evo-brain-README.md` - Template for private repo

**Key Insight:** Separation of tools (shareable) from data (private) enables both portability and security.

### Impact
- ✅ One-command setup on any machine
- ✅ DNA syncs across devices via git
- ✅ Tools stay version-controlled
- ✅ Private data stays private

### Next Steps
1. Initialize `evo-dotfiles` repo
2. Initialize `evo-brain` repo (private)
3. Test on fresh WSL instance

### Related Files
- `~/evo-dotfiles/` - Dotfiles directory
- `evo-brain-README.md` - Brain repo template

---

## 2026-02-27: Complete AI Tool Wrapper Family

### Decision
Build wrappers for ALL AI tools in the stack: Kimi, Claude, Aider, Gemini, Kilo.

### Context
User has multiple AI tools but only Kimi had a DNA wrapper. Each tool needs its own "read before we start" trigger.

### Decision Details

**New Wrappers Added:**

| Command | Tool | Method | Status |
|---------|------|--------|--------|
| `kimic` | Kimi CLI | Pipes DNA as first message | ✅ Already done |
| `claudec` | Claude CLI | System prompt injection | ✅ Already done |
| `aidere` | Aider | `--read` flag | ✅ Already done |
| `geminic` | Gemini CLI | `GEMINI_SYSTEM_MD` env var | ✅ **NEW** |
| `kiloc` | Kilo Code CLI | Context file injection | ✅ **NEW** |
| `dna-context` | Any tool | Clipboard/pipe output | ✅ Already done |

**Implementation:**
- Created `_scripts/geminic.sh` and `_scripts/kiloc.sh`
- Installed to `~/.local/bin/`
- Updated `evo-doctor.sh` to check all tools
- Pushed to `evo-dotfiles` repo
- Created `AI_TOOL_WRAPPERS.md` reference doc

**Pattern:**
1. Create wrapper script
2. Install to `~/.local/bin/`
3. Add check to `evo-doctor.sh`
4. Update documentation

### Usage

```bash
# Any AI tool - just add 'c' suffix
kimic                    # Kimi with DNA
claudec                  # Claude with DNA
aidere                   # Aider with DNA
geminic                  # Gemini with DNA
kiloc                    # Kilo with DNA

dna-context | xclip      # Any other tool
```

### Impact
- ✅ Every AI tool in stack has DNA wrapper
- ✅ Consistent pattern: `TOOLc` = tool with context
- ✅ Easy to add new tools
- ✅ All documented

### Related Files
- `_scripts/kimic.sh`, `claudec.sh`, `aidere.sh`, `geminic.sh`, `kiloc.sh`
- `~/.local/bin/*` (installed wrappers)
- `AI_TOOL_WRAPPERS.md` (complete reference)

---

## 2026-02-27: Universal AI Tool DNA Integration

### Decision
Create DNA loaders for ALL AI tools: Kimi, Claude, Aider, VS Code, and web UIs.

### Context
DNA memory system worked for `kimic`, but user has multiple AI tools:
- Kimi CLI (primary)
- Claude CLI (installed)
- Aider (coding assistant)
- VS Code Copilot/Continue/Cline
- Web UIs (ChatGPT, Gemini, etc.)

**Problem:** Each tool needs its own DNA injection method. No universal solution existed.

### Decision Details

**Created Tool-Specific Loaders:**

| Tool | Loader | Method |
|------|--------|--------|
| Kimi | `kimic` | Script: `kimi -p "Read DNA..."` |
| Claude | `claudec` | Script: `claude --system-prompt` |
| Aider | `aidere` | Script: `aider --read DNA...` |
| VS Code Copilot | Auto | `.github/copilot-instructions.md` |
| VS Code Continue | Auto | `.vscode/settings.json` |
| VS Code Cline | Auto | `.vscode/settings.json` |
| Any Web UI | `dna-context` | Clipboard output: `dna-context \| xclip` |
| Any CLI | `dna-context` | Pipe: `dna-context \| tool` |

**Files Created:**
- `_scripts/kimic.sh` → `~/.local/bin/kimic`
- `_scripts/claudec.sh` → `~/.local/bin/claudec`
- `_scripts/aidere.sh` → `~/.local/bin/aidere`
- `_scripts/dna-context.sh` → `~/.local/bin/dna-context`
- `.github/copilot-instructions.md`
- `.vscode/settings.json`

**Key Insight:** Same DNA files, different delivery mechanism per tool. The context is constant; only the injection method varies.

### Usage

```bash
# CLI tools
kimic                    # Kimi with DNA
claudec                  # Claude with DNA
aidere                   # Aider with DNA

# VS Code - automatic
# Just open VS Code, DNA loads via copilot-instructions.md

# Any web UI
dna-context | xclip -selection clipboard
# Paste into ChatGPT, Gemini, etc.
```

### Impact
- ✅ Every AI tool gets DNA context
- ✅ No manual file reading required
- ✅ Consistent context across all tools
- ✅ Easy to add new tools (just create wrapper)

### Related Files
- `_scripts/kimic.sh`, `claudec.sh`, `aidere.sh`, `dna-context.sh`
- `~/.local/bin/*` (installed scripts)
- `.github/copilot-instructions.md`
- `.vscode/settings.json`
- `evo-doctor.sh` (checks all tools)

---

## 2026-02-27: Memory Protocol Enforcement Mechanism

### Decision
Create enforcement tools to ensure AI assistants actually READ DNA files instead of claiming "no previous context."

### Context
The model-agnostic memory system was documented in DNA, but real-world test failed:
- User started new Kimi session: `kimi`
- User asked: "do you recall what we were talking about last?"
- Kimi responded: "I don't have access to our previous conversation history"

**This happened despite:**
- ✅ `🧠 AI_CONTEXT.md` existing
- ✅ `OPERATING_BACKLOG.md` being current
- ✅ `🧠 MEMORY_PROTOCOL.md` documenting the system
- ✅ Previous "fix" being applied

**Root Cause:** Documentation ≠ Enforcement. AI assistants don't automatically read files.

### Decision Details
**Created Enforcement Layer:**

1. **`_config/kimi-startup.sh`** - Function wrapper for `kimi` command
   - Detects new sessions vs. continued sessions
   - Auto-injects DNA context on startup
   - Provides `kimic` (with context), `kimil` (continue), `kimif` (fresh)

2. **Updated `_config/bash-evo.sh`** - Enhanced aliases
   - `kimic` now explicitly instructs AI to READ DNA first
   - Warning message in prompt: "DO NOT say 'I don't have access...'"
   - `kimif` for truly fresh sessions (escape hatch)

**Usage:**
```bash
kimic                 # Start with DNA context (RECOMMENDED)
kimil                 # Continue last session  
kimif                 # Fresh session (no context)
kimi -C               # Continue specific session
```

**Rejected Alternatives:**
- ❌ Alias `kimi='kimi -p "read DNA..."'` (breaks `kimi -C` and other flags)
- ❌ Modify Kimi binary (impossible, external tool)
- ❌ User training only (failed - humans forget)
- ❌ Accept status quo (defeats purpose of memory system)

**Why wrappers work:**
- Shell functions intercept commands before execution
- Can detect context (new vs continued session)
- User-friendly (same command name)
- Non-destructive (can bypass with `command kimi`)

### Impact
- ✅ AI forced to acknowledge DNA before responding
- ✅ No more "I don't have previous context" excuses
- ✅ Clear escape hatch (`kimif`) for truly new work
- ✅ Works with existing Kimi workflows (`-C`, `-S`, etc.)

### Related Files
- `_config/kimi-startup.sh`
- `_config/bash-evo.sh`
- `🧠 MEMORY_PROTOCOL.md`

---

## 2026-02-27: Empty Folder Protection

### Decision
Add README/.gitkeep files to empty critical directories to prevent confusion and document their purpose.

### Context
During a routine sweep, discovered several empty folders:
- `00_DNA/vault/` - No documentation about its purpose
- `models/` - Empty but expected to contain AI models
- `_logs/2026-02-27/` - Empty log directory

Empty folders create ambiguity:
- Are they supposed to be empty?
- Was content accidentally deleted?
- What should go here?

### Decision Details
**Fix:** Add placeholder documentation to empty critical directories:

1. **`00_DNA/vault/README.md`** - Explains vault system, points to master vault at `/evo/.env`
2. **`models/README.md`** - Documents expected model storage structure
3. **`_logs/2026-02-27/.gitkeep`** - Keeps directory in git (standard practice for logs)

**Philosophy:** 
- Empty folders should document WHY they're empty
- Critical infrastructure folders need READMEs
- Logs directories use `.gitkeep` to persist structure

**Rejected Alternatives:**
- ❌ Delete empty folders (they exist for a reason)
- ❌ Ignore them (creates technical debt)
- ❌ Fill with dummy content (misleading)

### Impact
- ✅ No more confusion about empty directories
- ✅ Clear documentation of expected content
- ✅ Self-documenting structure

### Related Files
- `00_DNA/vault/README.md`
- `models/README.md`
- `_logs/*/.gitkeep`

---

## 2026-02-27: Infrastructure & Content Consolidation (Final Polish)

### Decision
Unify all LLM-related infrastructure into `projects/Infrastructure/Evolution_LLM` and remove redundant "drift" folders from the `projects/` root.

### Context
Post-Phase 6, several inconsistencies remained:
- Two LLM folders: `local-llm` (legacy GLM-4) and `Local_LLM_2` (active hybrid orchestrator).
- Three redundant shell folders: `Evolution-Content-Factory`, `evolution-content-engine`, and `n8n`.
- Confusion regarding the purpose of local LLMs vs. Cloud APIs.

### Decision Details
**Implementation:**
- **Evolution_LLM:** Merged `Local_LLM_2` (orchestrator code) with `local-llm` (local model weights). The system now prioritizes a Hybrid Cloud path (Groq/Gemini) but maintains GLM-4 as a local fallback for privacy and cost control.
- **Surgical Cleanup:** Identified that `Evolution_Content` had successfully absorbed the logic of the "Factory" and "Engine" shells. These shells were moved to `_archive/sudo_cleanup_required/`.
- **Active Path:** `projects/External/N8N` confirmed as the active N8N instance.

**Rejected Alternatives:**
- ❌ Delete local models entirely (rejected: local LLMs are vital for privacy/offline fallbacks).
- ❌ Keep separate folders (rejected: creates "Intelligence Drift").

### Impact
- ✅ Single source of truth for LLM infrastructure.
- ✅ Root `projects/` directory is now clean of redundant shells.
- ✅ Clearer distinction between "Cloud Primary" and "Local Fallback" workflows.

### Related Files
- `projects/Infrastructure/Evolution_LLM`
- `PROJECTS_INDEX.md`
- `FINAL_STRUCTURE.md`

---

**When to add to this log:**
- Architectural changes
- Technology choices (why X over Y)
- Process changes
- Strategic pivots
- Anything you might ask "why did we do it this way?" in 3 months

**Remember: Context is king. Document the WHY, not just the WHAT.**
# 🎯 Tech Radar - Tool & Technology Evaluation

**Purpose:** Log, evaluate, and track decisions about new tools so we don't keep having the same conversations.

**Rule:** If it's not in here, we haven't properly evaluated it yet.
**Assistant rule:** Check this file and `skills/approved_sources.md` before recommending or re-evaluating tools.

---

## 📊 Evaluation Scale

| Status | Meaning | Action |
|--------|---------|--------|
| 🔴 **Reject** | Not for us | Don't revisit unless fundamentals change |
| 🟡 **Assess** | Interesting, needs research | Watch, gather more info, prototype if needed |
| 🟢 **Trial** | Promising, testing in sandbox | Actively experimenting, limited scope |
| 🔵 **Adopt** | Production ready | Fully integrated into workflow |
| ⚪ **Archive** | Previously evaluated | Historical record, decision documented |

---

## 🔴 Reject (Not For Us)

### Example Template
```markdown
### [Tool Name](URL)
**Discovered:** YYYY-MM-DD
**Category:** AI/Automation/DevOps/etc
**Why considered:** [Brief context - what problem it claimed to solve]
**Decision:** Reject
**Reason:** [Why it doesn't fit - complexity, overlap, philosophy mismatch]
**Revisit if:** [Conditions that would change the decision]
```

---

## 🟡 Assess (Watching / Researching)

### Google Workspace Studio (Taki.gpt)
**Discovered:** 2026-02-27  
**Category:** Business Automation  
**Source:** Instagram @taki.gpt reel  
**Why considered:** No-code AI agents inside Google Workspace (Gmail, Sheets, Drive)  
**Features:** Gemini-powered automation, native Google integration  
**Evaluation notes:**
- ✅ Native Google integration (we use Workspace)
- ✅ No-code entry point
- ⚠️ Overlaps with n8n (already in Trial)
- ⚠️ Overlaps with custom Evolution Command
- ❌ Less flexible than code-first solutions
**Next step:** Compare vs n8n + Evolution Command  
**Decision by:** 2026-03-15

### Greg Isenberg's Obsidian + Claude System
**Discovered:** 2026-02-27  
**Category:** Personal Knowledge Management  
**Source:** Twitter/X @gregisenberg  
**Why considered:** Validated our DNA approach, has interesting ideas to steal  
**Features:** Obsidian vault + Claude Code, custom slash commands (/trace, /graduate)  
**Evaluation notes:**
- ✅ Very similar to our DNA system (we're on right track)
- ✅ Ideas to steal: /trace, /graduate, /connect commands
- ✅ "Humans write, agents read" philosophy aligns
- ⚠️ Requires discipline (Greg says 99.99% won't do it)
**Next step:** Implement /trace and /graduate commands in our workflow  
**Decision by:** 2026-03-10

### Google Antigravity
**Discovered:** 2026-02-27  
**Category:** AI Agent IDE  
**Source:** @daviss.dev Instagram reel
**Why considered:** "Vibe coding" with parallel agents, UI generation, Mission Control interface  
**Features:** Multi-agent orchestration, UI generation, validation agents, Claude Code integration  
**Evaluation notes:**
- ✅ Free tier available
- ✅ Google's backing (likely sustained)
- ⚠️ Overlaps with existing tools (Claude Code, Evolution Studio)
- ⚠️ "Yet another IDE" problem
**Next step:** Compare features vs. current stack (Evolution Studio + Claude)  
**Decision by:** 2026-03-10

### NotebookLM MCP Server
**Discovered:** 2026-02-27  
**Category:** AI Memory / Context  
**Source:** @agentic.james Instagram reel  
**Why considered:** Long-term memory for Claude agents, plug-and-play  
**Features:** Document ingestion, synthesized context, persistent memory across sessions  
**Evaluation notes:**
- ✅ Addresses real pain point (context loss)
- ✅ Google's infrastructure
- ⚠️ Overlaps with our DNA memory system
- ⚠️ External dependency for critical function
**Next step:** Compare vs. current DNA-based memory approach  
**Decision by:** 2026-03-01

### OpenClaw Mission Control
**Discovered:** 2026-02-27  
**Category:** AI Agent Orchestration  
**Source:** @agentic.james Instagram reels + research  
**Why considered:** Need dashboard for grouping tasks, managing agents, tools/skills registry  
**Features:** Kanban boards, drag-drop tasks, agent coordination, skill registry, cron jobs, memory graph  
**Evaluation notes:**
- ✅ Solves real problem (agent management)
- ✅ Open source, active development
- ⚠️ Requires OpenClaw ecosystem commitment
- ⚠️ Another dashboard to maintain
**Next step:** Trial in sandbox with 2-3 simple agents  
**Decision by:** 2026-03-15

### Google Antigravity
**Discovered:** 2026-02-27  
**Category:** AI Agent IDE  
**Source:** @daviss.dev Instagram reel  
**Why considered:** "Vibe coding" with parallel agents, UI generation, Mission Control interface  
**Features:** Multi-agent orchestration, UI generation, validation agents, Claude Code integration  
**Evaluation notes:**
- ✅ Free tier available
- ✅ Google's backing (likely sustained)
- ⚠️ Overlaps with existing tools (Claude Code, Evolution Studio)
- ⚠️ "Yet another IDE" problem
**Next step:** Compare features vs. current stack (Evolution Studio + Claude)  
**Decision by:** 2026-03-10

### NotebookLM MCP Server
**Discovered:** 2026-02-27  
**Category:** AI Memory / Context  
**Source:** @agentic.james Instagram reel  
**Why considered:** Long-term memory for Claude agents, plug-and-play  
**Features:** Document ingestion, synthesized context, persistent memory across sessions  
**Evaluation notes:**
- ✅ Addresses real pain point (context loss)
- ✅ Google's infrastructure
- ⚠️ Overlaps with our DNA memory system
- ⚠️ External dependency for critical function
**Next step:** Compare vs. current DNA-based memory approach  
**Decision by:** 2026-03-01

---

## 🟢 Trial (Testing in Sandbox)

### NotebookLM for Prompt Creation
**Discovered:** 2026-02-27  
**Category:** Prompt Engineering  
**Source:** @agentic.james Instagram reel  
**Why considered:** Aggregate docs and create rich system prompts for agents  
**Features:** Document ingestion, synthesis, structured output  
**Status:** Trial  
**Trial notes:**
- ✅ Could improve our agent prompts
- ✅ Fits Evolution Content workflow
- 🔄 Test with one content generation task
- 🔄 Compare output quality vs. current prompts
**Decision due:** 2026-03-10  
**Go/No-go criteria:** Does it produce significantly better prompts than our current method?

### n8n AI Workflows
**Discovered:** 2026-02-25  
**Category:** Workflow Automation  
**Source:** @liamjohnston.ai Instagram reel  
**Why considered:** Generate workflows from Claude code, automation platform  
**Status:** Already installed in External/n8n  
**Trial notes:**
- ✅ Docker container running
- ✅ Basic workflows working
- 🔄 Need to test Claude-generated workflow integration
- 🔄 Evaluate vs. custom Evolution Command workflows
**Decision due:** 2026-03-15  
**Go/No-go criteria:** Can it replace or augment our custom monitoring/command system?

---

## 🔵 Adopt (Production)

### Claude Code
**Adopted:** 2025 (pre-DNA)  
**Category:** AI Coding Assistant  
**Why chosen:** Best-in-class reasoning, agentic capabilities, API available  
**Status:** Primary AI tool for development  
**Integration:** Kimi CLI, Evolution Studio, various projects  
**Notes:** Still evaluating Claude 4 when released

### Obsidian + DNA
**Adopted:** 2026-01  
**Category:** Knowledge Management  
**Why chosen:** Local-first, markdown, graph view, portable across AI tools  
**Status:** Central source of truth for all project knowledge  
**Integration:** All AI assistants read DNA first  
**Notes:** Added templates, skills registry, tech radar

### FZF + Zoxide + Just + Starship
**Adopted:** 2026-02-27  
**Category:** Terminal Productivity  
**Why chosen:** Lightweight, proven, solve specific friction points  
**Status:** Daily workflow tools  
**Integration:** Bash aliases, Justfile tasks  
**Notes:** Zero maintenance, high ROI

---

## ⚪ Archive (Previous Evaluations)

### Godofprompt Agentic AI Architecture
**Discovered:** 2026-02-27  
**Evaluated:** 2026-02-27  
**Source:** Instagram @godofprompt  
**Category:** Educational Content  
**Decision:** Archive (educational only)  
**Reason:** Good conceptual framework (LLM → Agents → Multi-Agent → Infrastructure) but not a tool. Validates our architecture approach.  
**Revisit if:** Need to explain agentic AI concepts to someone

### Wizofai Mindset Reset
**Discovered:** 2026-02-27  
**Evaluated:** 2026-02-27  
**Source:** Instagram @wizofai  
**Category:** Educational Content  
**Decision:** Archive (mindset only)  
**Reason:** Philosophical post about productivity expectations in 2026. Good reminder but not actionable tool.  
**Revisit if:** Need motivation/reminder about productivity philosophy

### Claude Code Features Guide
**Discovered:** 2026-02-27  
**Evaluated:** 2026-02-27  
**Source:** @agentic.james Instagram  
**Category:** Educational Content  
**Decision:** Archive (already adopted)  
**Reason:** Tutorial content on features we already use daily. No new information.  
**Revisit if:** Onboarding someone new to Claude Code

### [Example Archived Tool]
**Discovered:** YYYY-MM-DD  
**Evaluated:** YYYY-MM-DD  
**Status:** Rejected  
**Decision:** [Why it was rejected]  
**Revisit if:** [Conditions changed]

---

## 📝 How to Add New Discoveries

When you find a new tool/repo/tech:

```markdown
### [Tool Name](URL)
**Discovered:** YYYY-MM-DD
**Category:** [AI/DevOps/Frontend/etc]
**Source:** [Where you found it - IG, Twitter, friend, etc]
**Why considered:** [What problem does it claim to solve?]
**Initial impression:** [Hot take - 1-2 sentences]
**Status:** Assess
**Next step:** [Specific action to evaluate]
**Decision by:** [Date - usually 1-2 weeks]
```

---

## 🎯 Evaluation Criteria

Before moving to Trial or Adopt, answer:

1. **Problem fit:** Does it solve a real problem we have?
2. **Overlap:** Does it duplicate existing tools?
3. **Complexity:** Is the learning curve worth the benefit?
4. **Lock-in:** Can we migrate away if needed?
5. **Maintenance:** Who maintains it? Will it exist in 2 years?
6. **Philosophy:** Does it align with our build rules?

---

## 🔄 Review Schedule

- **Weekly:** Scan "Assess" items - any ready for Trial?
- **Monthly:** Review "Trial" items - promote or reject?
- **Quarterly:** Review "Adopt" items - still the best choice?

---

**Last updated:** 2026-02-27  
**Next review:** 2026-03-06
