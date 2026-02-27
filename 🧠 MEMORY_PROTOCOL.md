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
