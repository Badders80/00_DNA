# Evolution Stables Tech Stack
**Version:** 2026.2  
**Last Updated:** February 3, 2026  
**Status:** Production

---

## Hardware

### EVO-STATION Specifications
- **CPU:** AMD Ryzen 9 (up to 5.34 GHz)
- **GPU:** NVIDIA GeForce RTX 3060 (12 GB VRAM)
- **RAM:** 32 GB DDR5 @ 6000 MT/s
- **Storage:**
  - Samsung 990 PRO 1TB NVMe (S: drive) - Development & WSL
  - HP FX700 1TB NVMe (C: drive) - Windows OS
- **Network:** 925 Mbps down / 514 Mbps up (Sky Fiber, Auckland NZ)

---

## Operating System

### Windows 11 Pro
- WSL2 enabled
- Ubuntu 24.04 installed to `S:\WSL_Ubuntu\`

### WSL2 Ubuntu 24.04
- Primary development environment
- Native ext4 storage: /home/evo/projects

---

## Development Tools

### IDEs & Editors
- Windsurf IDE (primary)
- VS Code (fallback)

### Version Control
- Git
- GitHub (primary remote - authentication configured in vault)

### Terminal
- Windows PowerShell (Windows)
- Bash (Ubuntu/WSL)

---

## Languages & Runtimes

### Python
- **Version:** 3.12.3
- **Environment:** Virtual env at `~/projects/.venv`
- **Key Packages:**
  - google-generativeai (Gemini SDK)

### JavaScript/TypeScript
- **Runtime:** Node.js (latest LTS)
- **Package Manager:** npm
- **Framework:** Next.js 14

---

## Frameworks & Libraries

### Frontend (EvolutionPlatform)
- Next.js 14 (App Router)
- TypeScript
- Tailwind CSS
- Framer Motion
- React

### AI/ML
- ComfyUI (image/video generation)
- Gemini API (Google AI)
- PyTorch (when needed)

---

## Cloud & Deployment

### Hosting
- **Vercel** - Production deployment
  - Project: evolution-3-0
  - URL: https://vercel.com/baddeley0-2132s-projects/evolution-3-0
  - Auto-deploy from GitHub

### CMS
- **Sanity Studio** - Content management
  - Project ID: a4xfnv5b
  - Dataset: production

---

## File Structure

/home/evo/
├── 00_DNA/ # Standards & configs
├── projects/
│ ├── .venv/ # Python virtual environment
│ ├── EvolutionPlatform/ # Next.js platform
│ └── InfrastructureComfyUI/ # ComfyUI workflows

/home/evo/models/ # AI models and high-performance storage
├── checkpoints/ # Base models
├── comfyui_cache/ # Temp files
├── video_output/ # Generated content
└── temp/ # Scratch space

text

---

## Key Constraints

### GPU (RTX 3060)
- 12 GB VRAM limit
- Requires quantized models for large AI workloads
- Suitable for: Stable Diffusion, LTX-Video, Flux

### Storage Strategy
- Source code: `/home/evo/projects/` (native ext4)
- Large files: `/home/evo/models/` (native ext4)
- Avoid: `/mnt/c/` or `/mnt/s/` for development (slow DrvFs bridge)

---

## Active Projects

1. **EvolutionPlatform** - Next.js platform (~/projects/EvolutionPlatform)
   - Deployed: Vercel
   - CMS: Sanity Studio
2. **InfrastructureComfyUI** - ComfyUI workflows (~/projects/InfrastructureComfyUI)
3. **00_DNA** - System standards (~/00_DNA)

---

**Setup Philosophy:** Maximize performance through smart configuration, not constant hardware upgrades.
