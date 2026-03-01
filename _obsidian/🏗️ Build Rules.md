# 🏗️ Build Rules

**The immutable principles of Evolution Stables development.**

---

## The Three Commandments

### 1. DNA is Source of Truth
All standards live in `00_DNA/`. If it's not here, it's not a standard.

### 2. Infrastructure ≠ Intelligence ≠ Content
- **Infrastructure** = Hardware, models, heavy deps → `infrastructure/`
- **Intelligence** = Code, logic, scrapers → `evolution-intelligence/`
- **Content** = What users see → `evolution-content/`, `evolution-platform/`

See: [[SEPARATION_OF_CONCERNS]]

### 3. One Vault to Rule Them All
All API keys in `/evo/.env`. Projects symlink to it.

---

## Quick Reference

| Decision | Rule |
|----------|------|
| Where do models go? | `infrastructure/` |
| Where does scraper code go? | `evolution-intelligence/` |
| Where do API keys go? | `/evo/.env` |
| Where do external tools go? | `_external/` |
| Where do backups go? | `_backups/` |
| Where do scripts go? | `_scripts/` |

---

## Deep Dives

- [[SEPARATION_OF_CONCERNS]] - Infrastructure/Intelligence/Content split
- [[Master_Config_2026]] - Hardware & WSL setup
- [[storage-optimization]] - 990 PRO best practices
- [[safe-path-architecture]] - File structure standards

---

## Adding New Rules

1. Pattern must be proven (3+ uses)
2. Document WHY, not just WHAT
3. Include examples and anti-examples
4. Link from this index

---

**Break rules intentionally, not accidentally.**
