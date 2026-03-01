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

## Antfarm Layering Rules

Use `snarktank/antfarm` as the orchestration layer, not as a replacement for methodology.

### Layer Antfarm On Top Of GSD

Use this combination when:
- Work is already scoped and split into milestone phases.
- You need repeatable multi-agent execution across repo-wide tasks.
- The task benefits from deterministic workflow runs (for example, feature-dev, security-audit, refactor passes).

### Do Not Layer Antfarm On Superpowers For The Same Task

- If Superpowers is selected for a task lifecycle, do not run Antfarm on that same task.
- If Antfarm is required for orchestration, route that task through GSD methodology.

### Non-Negotiables

- Never run Superpowers and GSD simultaneously on the same task.
- Superpowers is the default for new end-to-end feature lifecycles.
- GSD is the default for constrained execution inside an approved plan.

## Trial Review Trigger

- `obra/superpowers`: Promote to `Adopt` or demote to `Assess` after the first complete Codex task using the Superpowers workflow.
- Update `skills/starred_repo_registry.json` with that decision and remove this note after the decision is recorded.
