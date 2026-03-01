# 🔐 Secrets & Vault Guide

## The Golden Rule
**ONE vault to rule them all:** `/evo/.env`

## How It Works

```
/evo/.env          ← MASTER (gitignored, never committed)
    ↓ (symlink)
projects/*/         ← All projects read from here
    .env → /evo/.env
```

## Setup

### 1. Create Master Vault
```bash
# Using the helper
evo vault edit                  # Creates from template if missing

# Or manually
cp /evo/_config/.env.template /evo/.env
nano /evo/.env                  # Fill in your keys
chmod 600 /evo/.env            # Secure permissions
```

### 2. Wire Up Projects
```bash
# Check current status
evo vault check

# Manual symlink (if needed)
cd /evo/projects/evolution-platform
ln -sf /evo/.env .env
```

### 3. Project-Specific Overrides (Optional)
```bash
# Create .env.local for project-specific overrides
# It loads AFTER .env, so it can override specific keys
```

## What's In The Vault

| Key | Service | Used By |
|-----|---------|---------|
| `OPENAI_API_KEY` | OpenAI | All content gen |
| `ANTHROPIC_API_KEY` | Claude | Code, analysis |
| `GEMINI_API_KEY` | Gemini | Alternative LLM |
| `KIMI_K2_API_KEY` | Kimi 40GB | Remote heavy work |
| `FIRECRAWL_API_KEY` | Firecrawl | Research scraping |

## Backup

Keep an encrypted backup:
```bash
gpg -c /evo/.env  # Creates .env.gpg
# Store .env.gpg in password manager
```

## Health Check

Verify everything is working:
```bash
evo vault check       # Check symlinks and permissions
evo doctor            # Full sanity check
```

## Never Commit

`.env` is in `.gitignore` everywhere. If you accidentally commit:
```bash
# Rotate the leaked key IMMEDIATELY
# Then:
git filter-branch --force --index-filter \
  'git rm --cached --ignore-unmatch .env' \
  HEAD
```
