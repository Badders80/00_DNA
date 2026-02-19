# ComfyUI VRAM Safety

**Goal:** Keep runs stable on RTX 3060 12GB (11.5GB ceiling).

- Prefer smaller latent sizes (512x512 or 768x768) for initial generation; upscale later using Tile Diffusion or iterative refinement.
- Avoid stacking too many heavy nodes (e.g., Ultra-High-Res Fix + 3x ControlNet + 1.5GB LoRAs) in a single pass.
- Keep batch sizes conservative (1-4); increase only after a clean test run.
- **If OOM occurs:** 
  1. Reduce latent resolution.
  2. Move upscales/post-effects to a separate downstream pass.
  3. Use `--lowvram` if using extremely large models (>8GB).
- Verify peak VRAM during the first 10-20 frames/steps before starting long batch runs.
