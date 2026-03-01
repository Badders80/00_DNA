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
