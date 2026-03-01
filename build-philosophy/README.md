# Build-Philosophy Folder: Technical Constitution

**Purpose:** Defines HOW we build (architecture, methodology, hardware/software standards). Enforces the Golden Rule: Content ≠ Intelligence ≠ Infrastructure ≠ External.

**Key Rules:**
- Domain-Split: Interface (EvolutionStudio), Production API (EvolutionContent), Intelligence (EvolutionIntelligence).
- Methodology: Choose one per task (Superpowers, GSD, Antfarm). 
- Safe-Path: All work in /home/evo/projects/; models in /home/evo/models/.
- VRAM Safety: Max 11.5GB usage; mutual exclusion for ComfyUI and Ollama.

**Contents:**
- BUILD_SYSTEM.md: Architecture & Methodology (domain-split, sandbox rules).
- MACHINE_CONFIG.md: Hardware, WSL & VRAM safety standards.
- STACK_2026.md: Software, Services & Model Registry.

**Last Updated:** 2026-03-01
