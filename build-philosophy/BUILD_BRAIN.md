# BUILD_BRAIN

## Build Methodology Selection

When starting a new task, choose exactly one build methodology.

### Use Superpowers

Use `obra/superpowers` when all of these are true:
- You are working in Codex or Claude Code.
- The task needs full lifecycle execution: `brainstorm -> spec -> plan -> TDD -> review -> finish`.
- Work includes feature delivery, new components, or test-touching changes.
- Subagent parallelism is beneficial for delivery speed.

### Use GSD

Use `gsd-build/get-shit-done` when all of these are true:
- The project is already scoped/planned and you are executing a focused milestone.
- You need disciplined execution without restarting full discovery/spec cycles.
- `snarktank/antfarm` is handling orchestration for multi-agent execution where needed.

### Non-Negotiables

- Never run Superpowers and GSD simultaneously on the same task.
- Superpowers is the default for new end-to-end feature lifecycles.
- GSD is the default for constrained execution inside an approved plan.
