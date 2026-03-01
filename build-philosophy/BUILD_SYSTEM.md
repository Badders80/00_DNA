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
