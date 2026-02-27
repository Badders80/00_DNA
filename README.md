# 00_DNA - Evolution Stables Source of Truth

**Version:** 2026.1  
**Status:** Foundation Layer  
**Purpose:** Define HOW we build, not WHAT we build

---

## Philosophy

The DNA folder contains the **immutable principles** that guide all Evolution Stables development:

- **Brand Identity** - Visual standards, voice, positioning
- **Build Philosophy** - Technical architecture, Safe-Path standards, hardware optimization
- **System Prompts** - AI agent configurations (Claude, Gemini, Jules)
- **Workflows** - SOPs, automation patterns, repo management

**Golden Rule:** If a pattern repeats 3+ times, it belongs here as a documented standard.

---

## Structure

```
00_DNA/
├── brand-identity/       # Who we are
│   ├── voice/           # Writing style, tone, vocabulary
│   ├── visual/          # Colors, logos, design tokens
│   └── positioning/     # Market narrative, value props
│
├── build-philosophy/     # How we build
│   ├── Master_Config_2026.md          # Hardware + WSL setup (SOURCE OF TRUTH)
│   ├── safe-path-architecture.md      # File structure standards
│   ├── storage-optimization.md        # Samsung 990 PRO best practices
│   └── graveyard/                     # Banned/obsolete methods
│
├── system-prompts/       # AI agent configs
│   ├── claude/          # Claude-specific prompts
│   ├── gemini/          # Gemini CLI configurations  
│   ├── jules/           # Jules AI workspace prompts
│   └── shared/          # Platform-agnostic patterns
│
└── workflows/            # How we operate
    ├── repo-management.md             # Git strategies, branching
    ├── jules-integration.md           # Working with Jules AI
    ├── content-pipeline.md            # Asset generation flow
    └── audit_jules_repos.sh           # Repo status checker
```

---

## Anti-Patterns (What DNA is NOT)

❌ **Not** project code  
❌ **Not** generated assets  
❌ **Not** temporary experiments  
❌ **Not** client-specific customizations  

✅ **IS** reusable standards  
✅ **IS** decision documentation  
✅ **IS** architecture principles  
✅ **IS** automation templates  

---

## Usage Examples

### When Starting a New Project

1. **Read** `build-philosophy/Master_Config_2026.md` for hardware setup
2. **Check** `system-prompts/` for relevant AI configurations
3. **Follow** `safe-path-architecture.md` for where to create folders
4. **Apply** brand guidelines from `brand-identity/`

### When Onboarding an AI Agent

1. **Load** appropriate system prompt from `system-prompts/`
2. **Reference** Master Config so agent understands hardware constraints
3. **Share** relevant workflow docs for the task

### When Making Architecture Decisions

1. **Check** if pattern already exists in DNA
2. **If yes** → Use existing standard
3. **If no** → Document new pattern here after validation

---

## Maintenance Rules

### Adding New Standards

1. Pattern must be proven (used 3+ times successfully)
2. Document WHY, not just WHAT
3. Include examples and anti-examples
4. Update this README with new file locations

### Updating Existing Standards

1. Mark old version as deprecated in `/graveyard/`
2. Document migration path
3. Update dependent projects
4. Maintain backward compatibility where possible

### Removing Standards

Don't delete - move to `/graveyard/` with explanation of why it failed

---

## Key Documents

### Must-Read for All Agents

- `build-philosophy/Master_Config_2026.md` - Hardware + Safe-Path setup
- `workflows/repo-management.md` - How we organize code (TO BE CREATED)

### Platform-Specific

- Jules users: `system-prompts/jules/` + `workflows/jules-integration.md`
- Claude users: `system-prompts/claude/`
- Gemini users: `system-prompts/gemini/`

---

## Philosophy Sources

Inspired by standards from `skills/approved_sources.md`:
- **get-shit-done** - Clear standards
- **superpowers** - Reusable agent configs
- **awesome-claude-skills** - Composable skill patterns

→ **Full list:** `skills/approved_sources.md` (single source of truth for all tools/repos)

Core principle: **AI-agnostic, human-readable, action-oriented**

---

## Version History

- **v2026.1** - Initial DNA structure, Master Config documented
- **v2026.0** - Pre-organization (scattered docs)

---

**Remember:** DNA is the foundation. Everything else is built on top of this.
