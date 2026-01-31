# LLM Architecture Philosophy

**Evolution Studio's approach to AI integration**

---

## Core Principles

### 1. Local-First Intelligence
- Run models locally whenever possible
- Maintain control over data and processing
- Reduce dependency on external APIs
- Balance cost with capability

### 2. Specialized Over General
- Use purpose-built models for specific tasks
- evolution-designer for creative content
- evolution-coder for technical work
- Task-appropriate model selection

### 3. Composable Services
- Each service has a single responsibility
- MCP servers provide modular capabilities
- Agents orchestrate complex workflows
- Clean interfaces between components

### 4. Resource-Aware Design
- Respect VRAM limitations (12GB)
- One heavy model loaded at a time
- Smaller models for frequent tasks
- Monitor and optimize resource usage

---

## Architecture Layers

```
┌─────────────────────────────────────┐
│   Application Layer                 │
│   (Gemini Agents, Custom Scripts)   │
├─────────────────────────────────────┤
│   Orchestration Layer               │
│   (MCP Servers, Bridges)            │
├─────────────────────────────────────┤
│   Model Layer                       │
│   (Ollama + Custom Models)          │
├─────────────────────────────────────┤
│   Infrastructure Layer              │
│   (GPU, Storage, Networking)        │
└─────────────────────────────────────┘
```

### Application Layer
- User-facing agents and scripts
- High-level workflows
- Business logic
- Content generation pipelines

### Orchestration Layer
- MCP servers for filesystem, tools
- API bridges and connectors
- Service coordination
- Event handling

### Model Layer
- Ollama runtime
- Custom fine-tuned models
- Model selection logic
- Inference optimization

### Infrastructure Layer
- GPU compute (RTX 3060)
- Storage architecture (Samsung 990 PRO)
- Network services
- System monitoring

---

## Model Selection Philosophy

### Speed vs. Capability Tradeoff

**Fast & Lightweight** → **Capable & Slow**
```
liquid-ai-2.6b → evolution-* → qwen2.5-14b
(0.5-2s)        (2-5s)         (3-8s)
```

### When to Use Each Model

**liquid-ai-2.6b:**
- Prototyping and iteration
- Simple Q&A
- Real-time interactions
- Testing prompts

**evolution-designer:**
- Marketing copy
- Horse descriptions
- Creative content
- Brand voice consistency

**evolution-coder:**
- Script generation
- API integrations
- Technical documentation
- Code reviews

**qwen2.5-14b:**
- Strategic planning
- Complex analysis
- Multi-step reasoning
- Final production work

---

## Integration Patterns

### Pattern 1: Progressive Enhancement
Start fast, enhance selectively:
1. Draft with liquid-ai (fast iteration)
2. Refine with specialized model (domain expertise)
3. Finalize with qwen2.5 (deep reasoning)

### Pattern 2: Parallel Processing
Multiple lightweight models > one heavy model:
- Run liquid-ai instances for different sub-tasks
- Aggregate results at application layer
- Better throughput for simple operations

### Pattern 3: Hybrid Local + Cloud
- Local models for core operations
- Cloud APIs for specialized needs (video, voice)
- MCP bridges for seamless integration
- Cost-effective scaling

---

## Future-Proofing

### Designed for Evolution
- Modular architecture allows swapping models
- MCP servers enable adding new capabilities
- Agent configurations are declarative (YAML)
- Clean separation of concerns

### Expected Enhancements
- Larger models as GPU upgrades occur
- More specialized fine-tunes
- Additional MCP server integrations
- Enhanced orchestration workflows

### Migration Paths
- Easy model replacement (Ollama API standard)
- Agent configs survive system changes
- MCP servers are platform-independent
- Documentation-first approach

---

## Lessons Learned

### What Works
✅ Local models for high-frequency tasks  
✅ Specialized fine-tunes for domain work  
✅ MCP servers for tool integration  
✅ VRAM-aware scheduling  

### What Doesn't
❌ Running multiple large models simultaneously  
❌ Using general models for specialized tasks  
❌ Ignoring resource constraints  
❌ Over-complicated orchestration  

### Best Practices Discovered
1. Always profile VRAM before deploying
2. Document model selection rationale
3. Keep configs in version control
4. Test with smallest model first
5. Monitor production metrics

---

**Last Updated:** 2026-01-31  
**Document Owner:** Evolution CTO (Gemini Agent)
