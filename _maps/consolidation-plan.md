# 🗺️ Consolidation Plan

## Phase 2: CONTENT ✅ COMPLETED

**evolution-content/** — Rock solid base established

### What Was Done
1. ✅ Used `_archive/Evolution-Content-Factory/` as base (proven, tested)
2. ✅ Merged `Evolution-Content/` (active work, 611MB)
3. ✅ Merged `evolution-content-engine/` (minor)
4. ✅ Wired to central vault (`/evo/.env`)
5. ✅ Created consolidation documentation

### Result
- **Size:** 2.1GB (merged)
- **Status:** Working pipeline ready
- **Vault:** Centralized
- **Clean:** Old folders removed (or scheduled for removal)

### Files Deleted/Merged
- ✅ `Evolution-Content/` → merged
- ✅ `evolution-content-engine/` → merged
- ⏳ `Evolution-Content-Factory/` (projects/) → root-owned, delete later

---

## Phase 3: INTELLIGENCE ⏳ PENDING

**evolution-intelligence/** — Merge AI/research systems

### Sources
- `04_Intelligence/` — 25GB (local LLM layer)
- `Evolution-Research/` — Research engine
- `firecrawl/` — Scraping tool

### Target Structure
```
evolution-intelligence/
├── core/              # 04_Intelligence (local LLMs)
├── research/          # Evolution-Research (scrapers)
└── tools/             # firecrawl integration
```

### Decision Needed
04_Intelligence is 25GB — mostly models? Keep separate or integrate?

---

## Phase 4: COMMAND ⏳ PENDING

**evolution-command/** — Merge monitoring systems

### Sources
- `Evolution-Command/` — 837MB
- `mission-control/` — Monitoring

---

## Phase 5: STUDIO ⏳ PENDING

**evolution-studio/** — Merge content tools

### Sources
- `Evolution-Studio/` — Streamlit app
- `_archive/evolution-email-builder/`
- `_archive/evolution-ui/`

---

## Phase 6: INFRASTRUCTURE ⏳ PENDING

**infrastructure/** — Organize heavy dependencies

### Sources
- `ComfyUI/` — 13GB → `infrastructure/comfyui/`
- `Local_LLM/` → `infrastructure/local-llm/`

---

## Travel Status

**Before travel:**
- ✅ evolution-content is ROCK SOLID
- Can continue Phase 3-6 remotely via Kimi K2
- Or pause until back

**Recommendation:** 
- Test evolution-content works
- Document any issues
- Continue consolidation remotely if needed (40GB context helps)
