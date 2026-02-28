# Evolution Stables — Architecture Strategy (Domain-Split)
# Version: 1.0 | Last Updated: February 2026
# Status: CANONICAL — Replaces Monorepo proposals.

---

## 🏗️ THE DOMAIN-SPLIT ARCHITECTURE
To avoid the maintenance tax of a monolith, the ecosystem is split into three technical domains.

### **1. THE INTERFACE (The Face)**
- **Repo:** `/home/evo/projects/EvolutionStudio/`
- **Stack:** Next.js / TypeScript / Tailwind
- **Role:** The unified storefront. Jobs are triggered here; reports and videos are reviewed here.
- **Merge Target:** UI logic from `Content-Builder` and `Pitch_Deck_Builder` will be ported here.

### **2. THE PRODUCTION API (The Muscle)**
- **Repo:** `/home/evo/projects/EvolutionContent/` (NEW)
- **Stack:** Python / FastAPI / Docker
- **Role:** The execution engine. Handles the **Persona Layer**, video rendering (ComfyUI/FFmpeg), and 4MAT report formatting.
- **Merge Target:** Combines the backends of `Evolution-Content-Factory` and `Evolution-Content-Builder`.

### **3. THE INTELLIGENCE (The Scout)**
- **Repo:** `/home/evo/projects/EvolutionIntelligence/`
- **Stack:** Python / Firecrawl
- **Role:** Independent scraping and data gathering. Feeds structured data into the Production API.

---

## 🛡️ SAFETY & MODULARITY
1. **Dependency Isolation:** Python AI dependencies never touch Node.js web dependencies.
2. **Blast Radius:** A failure in the video rendering pipeline does not take down the user interface.
3. **API-First:** Communication between domains happens via strictly defined REST/JSON contracts.
