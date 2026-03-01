# METRICS_SYSTEM.md
# Evolution Metrics — Awareness & Ownership

Version: 2026.1 (Draft)
Status: Working specification (not canonical)
Scope: Shared definitions for key KPIs used in public or investor-facing content.

---

## 1. Principles

1. No vanity metrics  
   Every metric must tie back to either:
   - Awareness quality (Evolution Intelligence), or
   - Platform health and stewardship (Evolution Stables).

2. Defined or omitted  
   If we can’t define how it’s calculated and over what period, we do not publish it.

3. Traceable  
   All published numbers must be traceable to:
   - Platform analytics, or
   - Expert Ledger, or
   - Regulatory / audit documents.

4. Doctrine alignment  
   - Awareness metrics must never imply tipping or gambling performance.  
   - Ownership metrics must never imply guaranteed or “target” returns.

---

## 2. Awareness Layer Metrics (Evolution Intelligence)

Purpose: Measure quality of Intelligence and depth of audience engagement, not hype.

### 2.1 Content Performance

Examples (formulas to be finalised when dashboards are live):

- View‑through rate (VTR)  
- Save rate / share rate  
- Repeat viewer percentage (returning viewers over 30 days)  
- Completion rate for 30–60s videos

### 2.2 Intelligence Quality

Examples:

- Pundit audit coverage  
  - % of major pundits and services tracked in Expert Ledger for a given jurisdiction.

- Signal follow‑up rate  
  - % of significant pre‑race “signals” that receive a post‑race audit recap.

- Data integrity  
  - % of content pieces with fully cited data sources (markets, sectionals, turnover, Ledger).

### 2.3 Audience Maturity (Funnel)

Examples:

- Ownership‑adjacent search interest  
  - % of Intelligence followers who search for or click on racehorse‑ownership‑related topics.

- Cross‑surface discovery  
  - Click‑throughs from Intelligence content to neutral educational pages (not to Stables directly).

**Rule:**  
Awareness metrics are framed around information quality and audience depth, not “how often you’d have won if you followed X”.

---

## 3. Ownership Layer Metrics (Evolution Stables)

Purpose: Measure platform health, liquidity, and stewardship with institutional discipline.

### 3.1 Platform Scale

Examples:

- Active horses on platform  
- Active participants (with funded accounts or current holdings)  
- Secondary marketplace turnover (rolling 30/90 days)

### 3.2 Liquidity & Usage

Examples:

- Average time‑to‑trade for secondary stakes  
- Percentage of stakes listed vs held over defined periods  
- Fill rate on new offerings (e.g. % of units sold within X days of listing)

### 3.3 Performance & Stewardship

Examples:

- Aggregate performance vs benchmark (index or peer set, where appropriate)  
- Volatility measures (to contextualise returns, never to promise them)  
- Welfare / retirement outcomes:
  - % of retired horses with documented rehoming or aftercare outcomes.

### 3.4 Institutional Proof

Examples:

- Years of continuous NZTR/FMA compliance  
- VARA / other license milestones achieved  
- Recognised institutional partnerships and press (DRC, BusinessDesk, Arabian Business)

**Mandatory Warning for Performance Metrics:**  
Any performance or returns metrics must include:

- Period (e.g. “1 year”, “since inception”),  
- Basis (e.g. net of fees / gross, realised vs unrealised), and  
- Text: “Past performance is not indicative of future results.”

---

## 4. Implementation Notes

- Actual formulas and dashboards live in:
  - Analytics tooling (e.g. Looker, Metabase, internal dashboards), and
  - Data notebooks maintained by engineering / analytics.

- This file stays at the level of:
  - Metric names,
  - Categories,
  - Public usage rules.

When dashboards and formulas are stable:

- Promote specific metric definitions into this file.  
- Update `Version` and add an entry to a `VERSION HISTORY` section.  
- Reflect any non‑negotiable rules (e.g. standard benchmarks) in `BRAND_SYSTEM.md` or `INTELLIGENCE_SYSTEM.md` if they affect public messages.
