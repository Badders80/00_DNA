# Agents Folder: Session Memory & Agent Rules

**Purpose:** This is the START HERE folder for all AI sessions. It provides model-agnostic memory, agent mandates, and live tracking to persist context across tools and sessions. Always load AI_CONTEXT.md first.

**Key Rules:**
- Read AI_CONTEXT.md + OPERATING_BACKLOG.md + DECISION_LOG.md before any response.
- Update OPERATING_BACKLOG.md and DECISION_LOG.md at session end.
- Follow Spiral Detection Protocol: Stop if looping (same error >2x, task >20min).
- End-of-Session: Commit changes with `git commit -m "docs: session update"`.

**Contents:**
- AI_CONTEXT.md: Master entry point (TL;DR state, project status).
- AGENTS.core.md: Agent mandates and coding rules.
- MEMORY_PROTOCOL.md: How we persist context model-agnostically.
- OPERATING_BACKLOG.md: Live priorities, progress, and blockers.

**Last Updated:** 2026-03-01
