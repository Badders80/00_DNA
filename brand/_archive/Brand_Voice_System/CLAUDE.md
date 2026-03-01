# CLAUDE.md - Brand Voice System

## What this repository is
`Brand_Voice_System` defines the reusable voice framework for Evolution Stables content operations. It provides:
- A kernel of non-negotiable language rules.
- Scenario modules for specific voice contexts.
- Routing logic for module selection.

## Scope and standards
- Formats: Markdown (`.md`) and JSON (`.json`) only.
- Language standard: Plain English (British spelling) and declarative sentences.
- Audience terminology: Use explicit audience language (`aspirational pre-ownership audience`, `ownership-ready audience`), not shorthand labels.
- Quality rule: No placeholder files or undefined references.

## Repository structure
```text
Brand_Voice_System/
├── 00_kernel/
│   └── brand_kernel_v0.3.md
├── 01_modules/
│   ├── brand_corporate.md
│   ├── founder_personal.md
│   ├── racing_updates.md
│   └── regulatory_business.md
├── 02_logic/
│   └── routing_rules.json
└── CLAUDE.md
```

## Module intent
- `brand_corporate`: public-facing company description and positioning.
- `founder_personal`: founder-authored communication.
- `racing_updates`: race-related communications from inside the sport.
- `regulatory_business`: governance, risk, and regulatory communication.

## Routing logic
Routing rules are defined in `02_logic/routing_rules.json`.
- If multiple rules apply, use the most constrained voice.

## Local path
- `/home/evo/00_DNA/brand-identity/Brand_Voice_System/`

## Adjacent source files
For brand system alignment, also reference:
- `/home/evo/00_DNA/brand-identity/EVOLUTION_INTELLIGENCE.md`
- `/home/evo/00_DNA/brand-identity/EVOLUTION_STABLES.md`
- `/home/evo/00_DNA/brand-identity/VISUAL_SYSTEM.md`
