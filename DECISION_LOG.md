# 📜 Decision Log - Evolution Stables

**Purpose:** Document significant architectural and strategic decisions.  
**Principle:** Decisions without context are just rules. Understand why.

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
1. Infrastructure ≠ Intelligence ≠ Content (strict separation)
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
- No central reference for "what's been vetted"
- AI assistants don't know what's pre-approved
- Hard to remember why certain tools were chosen
- Re-invention happens when knowledge isn't shared

### Decision Details
**Created:** `skills/approved_sources.md`

**Structure:**
- Organized by category (AI, Productivity, Architecture, etc.)
- Each entry: What it does, When to use, Why approved
- Links to user's starred repos (github.com/Badders80?tab=stars)
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

1. **INBOX.md** - Rapid capture
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
- `INBOX.md`
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

## Template for New Decisions

```markdown
## YYYY-MM-DD: [Decision Title]

### Decision
[What was decided]

### Context
[What problem were we solving]

### Decision Details
[How we implemented it]

**Rejected Alternatives:**
- ❌ [Alternative 1] (why rejected)
- ❌ [Alternative 2] (why rejected)

### Impact
- ✅ [Positive impact]
- ⚠️ [Trade-off or risk]

### Related Files
- [Link to relevant files]

---
```

---

**When to add to this log:**
- Architectural changes
- Technology choices (why X over Y)
- Process changes
- Strategic pivots
- Anything you might ask "why did we do it this way?" in 3 months

**Remember: Context is king. Document the WHY, not just the WHAT.**
