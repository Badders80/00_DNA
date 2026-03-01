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
