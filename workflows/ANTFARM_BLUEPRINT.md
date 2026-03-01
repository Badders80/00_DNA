# Antfarm Swarm Blueprint

**Version:** 2026.1 | **Status:** Implementation Phase
**Role:** Multi-Agent Orchestration Protocol

---

## 1. Overview
The Antfarm is a specialized swarm of agents designed to automate the end-to-end lifecycle of content and code production within the Evolution Stables ecosystem. It enforces the "Hierarchy of Truth" and ensures that no content is produced without research, planning, and auditing.

---

## 2. The Swarm

| Agent | Role | Input | Output | DNA Source |
| :--- | :--- | :--- | :--- | :--- |
| **🐜 Scout** | Researcher | Raw Idea / Command | Scout Brief | `ops/TECH_RADAR.md` |
| **🐜 Architect** | Planner | Scout Brief | Architect Blueprint | `brand/BRAND_SYSTEM.md` |
| **🐜 Builder** | Maker | Architect Blueprint | Rendered Asset / Code | `build-philosophy/BUILD_SYSTEM.md` |
| **🐜 Auditor** | Gatekeeper | Builder Report | Validation Report | `brand/INTELLIGENCE_SYSTEM.md` |

---

## 3. Orchestration Flow (The Handoff)

1.  **Initiation:** Human operator provides a high-level command (e.g., "Analyze the weekend results at Trentham").
2.  **Scout Phase:** Scout researches the topic, fetches market data, and identifies the "Signal."
3.  **Architect Phase:** Architect reviews the Signal and writes a `4MAT` script and a technical execution plan.
4.  **Builder Phase:** Builder executes the generation (ComfyUI, FFmpeg, Python) and saves the results to the `Safe-Path`.
5.  **Auditor Phase:** Auditor verifies the result against brand standards and "The Wall."
6.  **Completion:** Auditor sends a Telegram notification to the human operator for final `APPROVE` / `REJECT`.

---

## 4. Usage Instructions

To trigger the Antfarm swarm, use the `antfarm` CLI utility (to be implemented):

```bash
antfarm "Your task description here"
```

The system will automatically route the task through the four agents and provide a status report for each phase.

---

## 5. Directory Mapping
- **Agents:** `/home/evo/.openclaw/agents/antfarm/`
- **Workspace:** `/home/evo/.openclaw/workspace/`
- **DNA Pointers:** Each agent has hard-coded paths to its respective `00_DNA` source of truth.
