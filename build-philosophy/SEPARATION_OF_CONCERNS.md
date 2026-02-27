# Build Rule: Separation of Concerns

**Golden Rule:** Infrastructure ≠ Intelligence ≠ Content

---

## The Three Layers

```
┌─────────────────────────────────────────┐
│  CONTENT          (What users see)      │  evolution-content/
│  - Video pipelines                       │  evolution-platform/
│  - User interfaces                       │
├─────────────────────────────────────────┤
│  INTELLIGENCE     (What system knows)   │  evolution-intelligence/
│  - Scrapers, analysis                    │  evolution-command/
│  - Business logic                        │
├─────────────────────────────────────────┤
│  INFRASTRUCTURE   (What runs it)        │  infrastructure/
│  - Models (GBs of weights)               │  _external/
│  - Heavy dependencies                    │
└─────────────────────────────────────────┘
```

---

## Rule 1: Infrastructure Stays Separate

**NEVER put in intelligence/content:**
- ❌ AI model files (>100MB)
- ❌ Python virtual environments
- ❌ Build artifacts (node_modules, .next)
- ❌ Docker images or layers
- ❌ Binary dependencies

**ALWAYS goes to infrastructure/:**
- ✅ LLM models (llama.cpp, GGUF files)
- ✅ Image generation models (ComfyUI checkpoints)
- ✅ Vector databases (Chroma, etc.)
- ✅ Heavy dev tools (if shared)

---

## Rule 2: Intelligence is Code-Only

**evolution-intelligence/ must be:**
- Lightweight (<10MB without deps)
- Portable (clone and run)
- Fast CI/CD (seconds not minutes)

**Connects to infrastructure via:**
- Environment variables (`LOCAL_LLM_URL`)
- API clients (REST, gRPC)
- Service discovery

---

## Rule 3: External Tools are External

**Third-party tools go to `_external/`:**
- n8n (workflow automation)
- firecrawl (scraping service)
- supabase (database)

**Connect via:**
- Docker compose networks
- API clients
- Environment-configured URLs

---

## Directory Structure

```
projects/
├── evolution-platform/        # Web app (content layer)
├── evolution-content/         # Content pipeline (content layer)
├── evolution-intelligence/    # Scrapers, AI logic (intelligence layer)
│   └── connectors/            # Clients to infrastructure
├── evolution-command/         # Monitoring (intelligence layer)
├── brand-voice/               # Brand system (content layer)
├── infrastructure/
│   ├── local-llm/             # 25GB models + llama.cpp
│   ├── comfyui/               # 13GB image generation
│   └── shared/                # Common heavy deps
└── _external/
    ├── n8n/                   # Workflow automation
    └── firecrawl/             # Scraping service
```

---

## Why This Matters

| Without Separation | With Separation |
|-------------------|-----------------|
| Clone = 30 min, 25GB | Clone = 30 sec, 10MB |
| Can't develop on laptop | Laptop = thin client |
| CI/CD times out | CI/CD seconds |
| "Works on my machine" | Reproducible anywhere |
| Backup = hours | Backup = minutes |

---

## Migration Guide

**Moving heavy stuff out:**
```bash
# 1. Create infrastructure folder
mkdir -p infrastructure/local-llm

# 2. Move models
mv evolution-intelligence/models infrastructure/local-llm/

# 3. Create connector
cat > evolution-intelligence/connectors/local_llm.py << 'CODE'
import os
LLM_URL = os.getenv("LOCAL_LLM_URL", "http://localhost:8080")
# ... client code
CODE

# 4. Update .env
# LOCAL_LLM_URL=http://localhost:8080

# 5. Test
python evolution-intelligence/test_connector.py
```

---

## Examples

### ✅ Good: Intelligence → Infrastructure
```python
# evolution-intelligence/research/llm_client.py
import requests
import os

LLM_URL = os.getenv("LOCAL_LLM_URL")

def generate(prompt: str) -> str:
    """Calls local LLM running in infrastructure."""
    resp = requests.post(f"{LLM_URL}/generate", 
                        json={"prompt": prompt})
    return resp.json()["text"]
```

### ❌ Bad: Bundling Models
```python
# DON'T DO THIS
def generate(prompt: str) -> str:
    model = load_model("./models/llama-70b.gguf")  # ❌ 40GB file
    return model.generate(prompt)
```

---

## Related Rules

- [[Master_Config_2026]] - Hardware setup
- [[safe-path-architecture]] - File organization
- [[storage-optimization]] - 990 PRO best practices

---

**Remember:** Your laptop doesn't need 25GB of models to write code that USES them.
