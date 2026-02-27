# 🚀 Session Starter Guide

**Quick start templates for new AI sessions.**

---

## Option 1: Full Context Load (Recommended)

Use this when starting ANY new AI session:

```bash
# For Kimi
kimi -p "Read /evo/00_DNA/🧠 AI_CONTEXT.md, /evo/00_DNA/OPERATING_BACKLOG.md, and /evo/00_DNA/DECISION_LOG.md. Summarize what we're working on and what I should know."

# For other AI tools (Claude, Kilo, etc.)
# Just paste this prompt:
```
> Read `/evo/00_DNA/🧠 AI_CONTEXT.md`, `/evo/00_DNA/OPERATING_BACKLOG.md`, and `/evo/00_DNA/DECISION_LOG.md`. Summarize what we're working on and what I should know.

---

## Option 2: Continue Previous Session

If you were just working with Kimi:

```bash
# Continue last conversation (preserves short-term memory)
kimi -C

# Or continue specific session
kimi -S <session_id>
```

**Note:** `-C` only works if you haven't started a new session elsewhere. When in doubt, use Option 1.

---

## Option 3: Quick Status Check

Just want to know current state without AI?

```bash
evo backlog      # Show current priorities
evo decisions    # Show recent decisions
evo doctor       # Full health check
```

---

## 📝 End-of-Session Protocol

**Before ending any session, update the memory:**

### 1. Update OPERATING_BACKLOG.md

Add to the bottom:
```markdown
### 2026-02-27 - [Brief task name]
**Worked on:** [What you did]
**Progress:** [What got done / what's left]
**Blockers:** [Any issues]
**Next:** [What should happen next]
```

### 2. Update DECISION_LOG.md (if you made significant choices)

Use the template in that file to document WHY you chose X over Y.

### 3. Commit DNA changes

```bash
cd /evo/00_DNA
git add .
git commit -m "docs: update backlog - [brief summary]"
```

---

## 🎯 Example Workflow

**Starting work:**
```bash
kimi -p "Read /evo/00_DNA/🧠 AI_CONTEXT.md, /evo/00_DNA/OPERATING_BACKLOG.md, and /evo/00_DNA/DECISION_LOG.md. Summarize what we're working on."
# AI loads context
# You work together
```

**Ending work:**
```bash
# Tell AI: "Update the OPERATING_BACKLOG.md with what we did today"
# AI updates the file
# You commit: cd /evo/00_DNA && git commit -am "docs: update backlog"
```

**Next day / Different AI:**
```bash
# Same command as before - full context loads from DNA
kimi -p "Read /evo/00_DNA/🧠 AI_CONTEXT.md..."
# AI knows exactly where you left off
```

---

## 💡 Pro Tips

1. **Always start with context** - 10 seconds of loading saves 10 minutes of re-explaining
2. **Update backlog religiously** - Future you (and other AIs) will thank you
3. **Document decisions immediately** - Context fades, written decisions persist
4. **Commit DNA often** - It's your memory backup
5. **Use `evo` commands** - Quick status without starting AI session

---

**Remember: DNA is the memory. The AI is just the processor.**
