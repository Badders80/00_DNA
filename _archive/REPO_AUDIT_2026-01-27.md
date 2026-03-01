# Evolution Stables Repository Audit
**Date:** 2026-01-27  
**Purpose:** Track Jules work and determine reorganization needs

## Jules GitHub Repositories (From Screenshots)

### 1. Badders80/Asset_Generation
- **Status:** Active - 1 in-progress task
- **Recent Work:** "Review where we are at. Just looking for the tldr version"
- **Needs:** Clarification - mentioned production readiness check
- **Action Required:** Git pull + status check

### 2. Badders80/Evolution-3.1  
- **Status:** Complete work 5 days ago
- **Recent Work:** SEO Audit & Recommendations
- **Action Required:** Git pull to sync latest

### 3. Badders80/Evolution-Studio-MCP
- **Status:** Complete work 5 days ago  
- **Recent Work:** Augmentcode MCP analysis
- **Link:** https://docs.augmentcode.com/context-services/mcp/overview
- **Action Required:** Git pull + review MCP integration docs

### 4. Other Jules Codebases Visible:
- Badders80/Brand_Voice
- Badders80/ComfyUI
- Badders80/ComfyUI_Workflows

## Pre-Reorganization Checklist

- [ ] Pull all Jules repos to see actual file state
- [ ] Check if Evolution_Guru and Evolution_Studio are active or archivable
- [ ] Verify ComfyUI workflows location and if they should stay separate
- [ ] Determine if Brand_Voice is the same as our brand_voice file
- [ ] Review Asset_Generation for content factory migration

## Questions to Answer

1. **Evolution_Guru vs Evolution_Studio** - What's the difference? Are both active?
2. **Evolution-Studio-MCP** - Is this the MCP server implementation or just docs?
3. **Asset_Generation** - Is this the Content Factory pipeline?
4. **Brand_Voice repo** - Does this contain the brand guidelines we need?

## Reorganization Blocking Items

**Must Do Before Moving:**
1. Git pull all 6 Jules repos
2. Check for uncommitted changes
3. Verify no work-in-progress will be lost
4. Document current repo purposes

**Safe to Archive:**
- Anything not touched in 30+ days with no active Jules sessions
- Duplicate or superseded implementations
- Experimental repos marked as such

## Next Steps

1. Run git status on each repo from Windows/WSL
2. Create migration map: Current Location → New DNA Structure Location
3. Use symlinks if repos need to stay in place for Jules GitHub sync
4. Update Jules codebases list to point to new structure
