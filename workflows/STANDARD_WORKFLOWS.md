# Evolution Stables - Standard Operating Procedures

**Version:** 1.0  
**Purpose:** Define repeatable workflows and automation patterns

---

## Daily Operations

### Morning Routine

```bash
#!/bin/bash
# Morning check - verify all systems operational

cd /home/evo/projects

# 1. Check Git status across all repos
cd 00_DNA/workflows
./audit_jules_repos.sh | head -100

# 2. Pull latest changes
cd /home/evo/projects/01_Platform/evolution-3.1
git pull

cd /home/evo/projects/02_Content_Factory/pipeline
git pull

cd /home/evo/projects/04_Intelligence/gemini-workspace
git pull

# 3. Check hardware status
nvidia-smi  # Verify GPU available
df -h /home/evo  # Check disk space
```

---

## Git Workflows

### Feature Development

```bash
# 1. Create feature branch
cd /home/evo/projects/01_Platform/evolution-3.1
git checkout -b feature/description

# 2. Work on feature
# ... make changes ...

# 3. Commit incrementally
git add .
git commit -m "feat: descriptive message

- Detail 1
- Detail 2"

# 4. Push to remote
git push origin feature/description

# 5. Create PR on GitHub
# (manual via GitHub web interface)

# 6. After merge, cleanup
git checkout main
git pull
git branch -d feature/description
```

### Hotfix Process

```bash
# For urgent production fixes
cd /home/evo/projects/01_Platform/evolution-3.1

# Create hotfix branch from main
git checkout -b hotfix/critical-issue

# Fix the issue
# ... changes ...

# Commit with clear urgency marker
git add .
git commit -m "hotfix: critical issue description"

# Push and deploy immediately
git push origin hotfix/critical-issue

# Merge to main ASAP
```

### Commit Message Standards

Format: `type: short description`

**Types:**
- `feat:` New feature
- `fix:` Bug fix
- `refactor:` Code restructure (no behavior change)
- `docs:` Documentation only
- `style:` Formatting, whitespace
- `test:` Add tests
- `chore:` Maintenance (dependencies, configs)

**Good Examples:**
- `feat: add wallet connection for token purchases`
- `fix: resolve VRAM overflow in batch generation`
- `refactor: consolidate MCP server configs`
- `docs: update API documentation for marketplace`

**Bad Examples:**
- `update stuff` (too vague)
- `WIP` (never commit WIP to main)
- `asdfasdf` (meaningless)

---

## Content Generation Pipeline

### Workflow: Bloomberg-Style Racing Intelligence

```bash
# 1. Navigate to content factory
cd /home/evo/projects/02_Content_Factory/pipeline

# 2. Start ComfyUI server (if not running)
cd /home/evo/projects/02_Content_Factory/comfyui-main
python main.py --listen 0.0.0.0 &

# 3. Generate content
cd /home/evo/projects/02_Content_Factory/pipeline
python generate_image.py \
  --prompt "3YO thoroughbred in barrier trial, professional racing photography" \
  --model "flux-schnell" \
  --output "./output/$(date +%Y%m%d)/"

# 4. Review and approve
# Manual review of generated content

# 5. Publish to platform
# Copy approved assets to platform static assets
```

### Batch Content Generation

```bash
# Generate multiple assets in one run
cd /home/evo/projects/02_Content_Factory/pipeline

# Create batch prompts file
cat > batch_prompts.txt << EOF
Horse portrait, professional lighting, stable background
Action shot, horse in full gallop, track environment
Close-up, horse head, dramatic lighting
Wide shot, horse with jockey, pre-race atmosphere
EOF

# Run batch generation
while read prompt; do
  python generate_image.py --prompt "$prompt" --model "flux-schnell"
done < batch_prompts.txt

# Harvest and organize
./harvest_assets.sh
```

---

## Jules AI Integration

### Starting New Jules Session

1. **Open Jules Dashboard**
2. **Select Codebase:**
   - Evolution-3.1 (platform work)
   - Asset_Generation (content pipeline)
   - Evolution-Studio-MCP (MCP integration)
3. **Provide Context:**
   - Link to relevant 00_DNA docs
   - Specify which standards apply
   - Clarify hardware constraints
4. **Set Clear Objectives:**
   - What needs to be built/fixed
   - Definition of done
   - Approval criteria

### Jules Session Management

**Before Starting:**
```bash
# Ensure local is synced
cd /home/evo/projects/Evolution-3.1
git pull
git status  # Should be clean
```

**During Session:**
- Jules works in cloud environment
- Changes sync to GitHub
- Monitor PR notifications

**After Session:**
```bash
# Pull Jules's changes
cd /home/evo/projects/Evolution-3.1
git pull

# Review changes
git log -5  # See recent commits
git diff HEAD~1  # Review last commit

# Test locally
npm run dev  # or appropriate command

# If good, merge
# If issues, create follow-up tasks
```

---

## MCP Server Management

### Starting MCP Servers

```bash
# ComfyUI MCP (for image generation tools)
cd /home/evo/projects/03_Tools/mcp-servers/comfyui
node index.js &

# Gemini MCP (for Gemini ADK integration)
cd /home/evo/projects/03_Tools/mcp-servers/gemini
node index.js &

# Evolution Studio MCP
cd /home/evo/projects/03_Tools/mcp-servers/evolution-studio
node index.js &
```

### Testing MCP Integration

```bash
# Verify MCP servers are responding
curl http://localhost:3000/health  # Adjust port as needed

# Check Claude Desktop integration
# Open Claude Desktop → Settings → MCP Servers
# Should see configured servers listed
```

### Troubleshooting MCP

```bash
# Check if server is running
ps aux | grep "node.*mcp"

# Check logs
tail -f /home/evo/projects/03_Tools/mcp-servers/*/logs/*.log

# Restart if needed
pkill -f "node.*mcp"
# Then restart servers individually
```

---

## Hardware Maintenance

### Weekly VRAM Check

```bash
# Check GPU utilization and memory
nvidia-smi

# If VRAM is fragmented or high baseline usage:
# 1. Stop all Python processes
pkill -f python

# 2. Restart ComfyUI
cd /home/evo/projects/02_Content_Factory/comfyui-main
python main.py --listen 0.0.0.0

# 3. Verify clean state
nvidia-smi  # Should show low memory usage when idle
```

### Monthly Disk Cleanup

```bash
# Check disk usage
df -h /home/evo

# Find large files
du -sh /home/evo/projects/*/ | sort -hr | head -20

# Clean up generated content older than 30 days
find /home/evo/projects/02_Content_Factory/*/output -type f -mtime +30 -delete

# Clean up Python cache
find /home/evo/projects -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null

# Clean up node_modules in non-active projects
# (manual review recommended)
```

---

## Backup & Recovery

### Weekly Backup

```bash
#!/bin/bash
# Backup critical files to external storage

BACKUP_DATE=$(date +%Y%m%d)
BACKUP_DIR="/mnt/backup/evolution-${BACKUP_DATE}"

mkdir -p "$BACKUP_DIR"

# Backup DNA (standards and docs)
cp -r /home/evo/projects/00_DNA "$BACKUP_DIR/"

# Backup environment configs
cp /home/evo/.bashrc "$BACKUP_DIR/"
cp /home/evo/.wslconfig "$BACKUP_DIR/" 2>/dev/null || true

# Backup important config files from projects
find /home/evo/projects -name ".env" -o -name "config.json" | \
  xargs -I {} cp {} "$BACKUP_DIR/"

echo "Backup complete: $BACKUP_DIR"
```

### Git Recovery

```bash
# Undo last commit (keep changes)
git reset --soft HEAD~1

# Undo last commit (discard changes)
git reset --hard HEAD~1

# Recover deleted file
git checkout HEAD -- path/to/file

# See deleted files
git log --diff-filter=D --summary

# Recover deleted file from history
git checkout <commit-before-deletion> -- path/to/file
```

---

## Environment Setup (New Machine)

### Fresh Install Checklist

```bash
# 1. Clone DNA first
cd /home/evo/projects
git clone https://github.com/Badders80/Evolution-DNA.git 00_DNA  # If you create this repo

# 2. Read Master Config
cat 00_DNA/build-philosophy/Master_Config_2026.md

# 3. Clone all repos
cd 00_DNA/workflows
./clone_jules_repos.sh

# 4. Set up WSL mount
# (Follow Master_Config_2026.md instructions)

# 5. Install dependencies
# Node.js, Python, CUDA toolkit, etc.
# (Documented in Master_Config_2026.md)

# 6. Configure MCP servers
# (Follow system-prompts/PROMPT_LIBRARY.md)

# 7. Test everything
./audit_jules_repos.sh
nvidia-smi
```

---

## Performance Optimization

### ComfyUI Performance

```bash
# Use quantized models when possible
# 12GB VRAM limit means:
# - Flux Schnell: OK (fits in VRAM)
# - Flux Dev: Requires --lowvram flag
# - SDXL: OK
# - LTX Video 2B: OK

# Monitor VRAM during generation
watch -n 1 nvidia-smi
```

### Build Performance

```bash
# Next.js build optimization
cd /home/evo/projects/01_Platform/evolution-3.1

# Use turbo mode
npm run build -- --turbo

# Check bundle size
npm run analyze  # If configured
```

---

## Questions for AB

1. **Approval Workflows:**
   - What requires review before merge?
   - Who approves production deployments?

2. **Content Generation:**
   - Frequency of content creation?
   - Auto-publish or review-first?

3. **Backup Strategy:**
   - Where should backups go?
   - Retention policy?

4. **Team Coordination:**
   - Solo or team environment?
   - Handoff procedures?

5. **Monitoring:**
   - What metrics to track?
   - Alert thresholds?

---

**Save Location:** `/home/evo/projects/00_DNA/workflows/`

**Related Documents:**
- Master_Config_2026.md (hardware setup)
- BRAND_VOICE.md (content standards)
- PROMPT_LIBRARY.md (AI agent configs)
