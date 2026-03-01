---
doc_type: brand-voice-awareness
entity: Evolution Intelligence
last_updated: 2026-02-28
audience: Aspirational pre-ownership audience (racing-curious)
tags: [brand, awareness, faceless, tiktok, intelligence]
---

## What This Is
Evolution Intelligence is the faceless data channel.
Audience: aspirational pre-ownership audience — racing-curious, not yet ownership-ready.
They mature into Evolution Stables participants. We do not rush this.

## The Wall — Non-Negotiable
- NO mention of Evolution Stables
- NO ownership, syndication, or investment language
- NO branding links between this channel and Evolution Stables
- The algorithm makes the connection. We never do.

# Evolution_Content_Factory.md
# The Awareness Layer — Evolution Intelligence Handbook

Version: 2026.2
Status: Canonical
Location: 00_DNA/brand-identity/
Scope: Faceless content operations, social media, awareness-phase voice
Hard Restriction: NO ownership mentions. NO Evolution Stables branding.
                  NO Tokinvest/VARA references. Ever.

---

## 1. THE DOCTRINE

### The Fight Club Rule

First Rule: You do not talk about ownership.
Second Rule: You DO NOT talk about ownership.

Evolution Intelligence is the Intelligence Engine. It is not a marketing
channel for Evolution Stables. It educates participation, audits the
experts, surfaces the data. If someone discovers Evolution Stables later
through algorithmic osmosis — that is incidental, not designed.

We catch users in the aspirational pre-ownership audience: fast, accessible, high-revving,
democratic. Evolution Stables comes later when they mature into ownership-ready participants.
Do not rush the progression. Never break the wall.

### The Channel Identity

Public name:  Evolution Intelligence
Handle:       @EvolutionIntelligence (or market-specific variant)
Bio:          "Racing intelligence. Data over opinion."

No logo connection to Evolution Stables in awareness-phase contexts.
No "Powered by" or "Part of" references.
No hashtags linking to Evolution Stables accounts.

The link between Evolution Intelligence and Evolution Stables is
never stated in content. It exists only in the algorithm — when a
follower of Evolution Intelligence searches for racehorse ownership,
Evolution Stables is what they find.

### Core Philosophy

We are data-led, not opinion-led.

Every piece of content anchors to measurable data:
- Flucs (price/volume movement)
- Sectional Ranks (performance metrics)
- Volume Delta (market flow)
- Expert Ledger accuracy (pundit audit)

We never predict. We verify.
We never tip. We surface Intelligence.
We never sell. We educate.

---

## 2. THE VOCABULARY

### The Hot Hatch Lexicon

Use these terms exclusively. Non-negotiable.

| System Term     | Banned Alternative                         | Usage Example                                              |
|-----------------|--------------------------------------------|------------------------------------------------------------|
| Market Liability| Favorite, Favourite, "the fav"             | "The Market Liability at Ellerslie is showing weakness…"  |
| Volume Delta    | Money coming in, Betting volume, "cash"    | "Volume Delta spiked 400% in the final 10 minutes…"       |
| Sectional Rank  | Speed figure, Time rating, "splits"        | "Sectional Rank #1 on the turn indicates…"                |
| Smart Money     | Big bets, Whales, "the big boys"           | "Smart Money is flowing toward the outsider…"             |
| Paying a Divvie | Dividend, Payout, Win, "return"            | "That horse paid a handsome Divvie at Te Rapa…"           |
| The Oil         | Tips, Insider info, The Tape, "word"       | "The Oil suggests gate speed is key today…"               |
| Flucs           | Odds changes, Market moves, "drift"        | "Flucs show compression into the second favourite…"       |
| Intelligence    | Tips, Picks, Selections, "best bets"       | "Our Intelligence suggests value lies…"                   |
| Allocation      | Bet, Punt, Wager, "have a go"              | "Market positioning requires careful allocation…"         |
| Meeting         | Race day, Card, "the races"                | "Saturday's meeting at Ellerslie…"                        |

Standardized phrasing: "Paying a Divvie" — always this exact form.
In captions: ALL CAPS — PAYING A DIVVIE.
Never: "paying a divvy", "paid divvies", "the dividend".

### Prohibited Terminology — Immediate Rejection

Content containing any of the following is rejected before human review:

Hype language:
  "Get on it" / "Jump on" / "Don't miss" / "Be quick"
  "Certainty" / "Lock" / "Can't lose" / "Guaranteed" / "Sure thing"

Lad filter:
  "The Boys" (unless specific named group: "The Leg Up boys")
  "Mate" / "Lads" / "Champ" / "Bro" / "Folks"

Wrong terms:
  "Tips" / "Picks" / "Selection"     → Use Intelligence
  "Bet" / "Punt" / "Wager" / "Gamble" → Use Allocation
  "The Tape"                          → Use The Oil or Flucs
  "Favourite"                         → Use Market Liability

Deprecated phrases (never revive):
  "Paddocks to Protocols"
  "Bloomberg of Bloodstock"
  "From the paddock to the podium"
  "From paddocks to performance"

---

## 3. CONTENT ARCHITECTURE

### The Three Pillars

---

#### Pillar 1: The Kingmaker (Monday)

Purpose:
Build authority by auditing who gets it right. Social proof through
transparency — not by claiming we are smart, but by proving others
are inconsistent.

Format: 30–60s vertical video. Leaderboard graphic. ROI calculations.

Hook:
"BGP called the trifecta at Trentham. The Leg Up boys missed the
board entirely. Here is who ruled the weekend — and who has been
Paying a Divvie to the punters who trusted them."

Required data points:
- Expert win rate (last 30 days)
- ROI by source (BGP vs. TAB Form vs. ACC vs. The Leg Up)
- Contrarian calls that landed
- Worst call of the week (named, data-cited, never mocking in tone)

Visual style:
Moneyball-style scatter plots. Podium leaderboard graphic.
"AUDIT" seal overlay. Deep navy / gold palette.

CTA: None. End on the data. The viewer concludes who to trust.

Expert Ledger fields required for Kingmaker content:
- pundit_name
- race_date, venue, race_number
- call (horse name tipped)
- finish_pos (actual result)
- divvie_paid (payout, 0 if not placed)
- correct_call (boolean)
- running_roi (cumulative %)
- source_url (link to original call)

---

#### Pillar 2: Whale Watch (Thursday)

Purpose:
Educate market literacy. Teach the audience to read Smart Money
flows before race day.

Format: 30–45s vertical. Ticker-tape visualization. Fluc charts.

Hook:
"The Oil is flowing at Ellerslie. Smart Money has compressed the
Market Liability by 30% since gates opened. Volume Delta tells
the rest of the story."

Required data points:
- Opening price vs. current price (full Fluc path)
- Volume spikes (flag any threshold >$5k)
- Late compression window (final 10–15 minutes)
- Fixed Odds vs. Tote divergence where significant

Whale Alert trigger (automated via Scout Agent):
  Volume Delta > 2 standard deviations
  AND price drop > 15% within any 10-minute window
  = WHALE ALERT badge activated

Visual style:
Ticker tape overlays. Price/volume time-series graphs.
Muted palette (deep navy, gold accent).
"WHALE ALERT" badge — data-stamp aesthetic, not hype.

---

#### Pillar 3: The Outsider (Weekend)

Purpose:
Emotional connection. The underdog narrative that makes racing
compelling to a new audience. Pure storytelling. Zero sales.

Format: 60–90s cinematic. Slow-motion B-roll. Emotive score.
4K morning track footage where available.

Hook:
"The pedigree said too slow. The experts said too small. The
market wrote him off at 40-1. But the Sectional Ranks told a
different story — and the punters who read The Oil Paid a Divvie."

Subject profile:
- Sub-$20k purchase price vs. $1m+ favourites
- Modest pedigree, strong Sectionals
- Quiet confidence from connections (The Oil)
- Long-shot Divvie payout
- Human angle: trainer, stable hand (no ownership framing —
  frame as passion, craft, sport)

Visual style:
Documentary-meets-cinematic. Soft shadows. High contrast.
Natural light. Real stable environments. Real horses, real people.

Critical:
Never mention Evolution Stables.
Never suggest buying shares.
Never reference syndication.
This is pure storytelling.

---

### The 4MAT Pattern (All Content)

Every video follows one of these two structures. No exceptions.

#### Previews (Before Race Day)

| Phase       | Timing  | Content                                                      |
|-------------|---------|--------------------------------------------------------------|
| Signal      | 0–5s    | The anomaly: volume spike, weather shift, key scratch        |
| Analysis    | 5–20s   | Concrete data: Sectional Rank, Fluc compression, Delta       |
| Opportunity | 20–30s  | Position as undervalued — NEVER instruct on allocation       |

#### Recaps (After Race Day)

| Phase  | Timing  | Content                                                          |
|--------|---------|------------------------------------------------------------------|
| Audit  | 0–5s    | What happened vs. what the Intelligence predicted                |
| Logic  | 5–20s   | Why the data read correctly (or failed) — full Fluc path         |
| Legacy | 20–30s  | What this means for the next meeting. Continuous learning.       |

---

## 4. PRODUCTION SPECIFICATIONS

### The Silent Playback Rule

Mandate: Audio is optional. Visuals are mandatory.

Evolution Intelligence audience consumes content:
- In transit (muted)
- In boardrooms (muted)
- Scrolling at 11pm next to a sleeping partner (muted)

Every frame must communicate full value without sound.

Execution:
- Burned-in captions:  Inter Bold, 48px, #f5f5f5, 2px black stroke
- Data overlays:       Scatter plots, Fluc charts, Sectional Rank badges
- Voiceover:           Enhances but never replaces visual Intelligence
- First 2 seconds:     Key metric must be visible before any voiceover

### Video Specifications

| Parameter   | Spec                                |
|-------------|-------------------------------------|
| Resolution  | 1080×1920 (9:16 vertical)           |
| Codec       | H.264, CRF 23                       |
| Duration    | Hard cap 60s (Outsider: 90s max)    |
| Voice       | ElevenLabs Kore, 44.1kHz stereo     |
| Voice model | Eleven Turbo v2                     |
| Settings    | Stability 0.6, Clarity 0.8, Style 0.4 |

### Color Palette (Awareness Layer)

| Role              | Hex       | Usage                               |
|-------------------|-----------|-------------------------------------|
| Background        | #121212   | Deep charcoal base                  |
| Primary text      | #f5f5f5   | Captions, data labels               |
| Gold accent       | #d4a964   | Key metrics, Whale Alert badge      |
| Flucs: firming    | Red       | Price compression toward favourite  |
| Flucs: drifting   | Green     | Price expansion away from favourite |
| Flucs: static     | #888888   | Unchanged market                    |

### Caption Standards

Font:       Inter Bold
Size:       48px
Color:      #f5f5f5
Stroke:     2px black (#000000)
Position:   Lower third (data overlays occupy center)

Key terms always ALL CAPS in captions:
  MARKET LIABILITY
  VOLUME DELTA
  SECTIONAL RANK
  PAYING A DIVVIE
  THE OIL
  WHALE ALERT
  SMART MONEY
  FLUCS

### File Naming Convention

Pattern:  YYYY-MM-DD_VENUE_TYPE_vN.ext
Final:    YYYY-MM-DD_VENUE_TYPE_FINAL.ext

Examples:
  2026-02-18_Ellerslie_WhaleWatch_v3.mp4
  2026-02-15_Trentham_Kingmaker_v1.mp4
  2026-02-22_TeRapa_Outsider_FINAL.mp4

---

## 5. TONE ANCHORS

| Anchor                    | Means                                              |
|---------------------------|----------------------------------------------------|
| Confident, not cocky      | Speak from data, not ego                           |
| Inclusive, not generic    | Explain Flucs simply but precisely                 |
| Grounded, not rustic      | Proud of NZ racing — global in standard            |
| Challenger, not combative | Question pundits without mocking them              |

We are the auditor. We hold the mirror up to the market.
We do not shout. We do not hype. We show the numbers and
let the audience reach their own conclusions.

---

## 6. GOVERNANCE

### When NOT to Publish

| Condition               | Rule                                            |
|-------------------------|-------------------------------------------------|
| Scout confidence < 0.6  | Silence. Do not publish.                        |
| No contrarian signal    | Market efficiency — nothing to add              |
| Sensitive events        | Industry investigations, welfare incidents      |
| Tone drift detected     | Script contains prohibited terminology          |
| Data gaps               | Missing Sectionals or Fluc history              |

The Silence Rule:
Silence protects credibility. Not publishing when we have nothing
adds trust. Training the audience that when we speak it means
something — that is the long game.

### The Human Gate

All content requires explicit human approval via Telegram before
any distribution. No exceptions.

  /approve [ID]           → Publishes to TikTok / X / Instagram
  /reject [ID] [reason]   → Archives with reason logged
  /edit [ID]              → Returns to vault for revision

### Content Separation Checklist

Before any piece is approved, confirm:

  ☐ No mention of Evolution Stables (name or logo)
  ☐ No mention of ownership, shares, syndication, leases
  ☐ No mention of Tokinvest, VARA, Dubai, DRC
  ☐ No mention of investment returns
  ☐ No prohibited terminology (run against banned list)
  ☐ Data sources cited for every claim in script
  ☐ Silent Playback Rule satisfied (watch on mute first)
  ☐ File named correctly (YYYY-MM-DD_VENUE_TYPE_vN.ext)

---

## 7. TECHNICAL INTEGRATION

Full detail in Evolution_OS.md.

Input:    Scout briefs → 01_raw_intake/
Process:  n8n → Gemini Pro (awareness-phase voice guardrails) → ElevenLabs Kore
Build:    FFmpeg (captions, B-roll, data overlays, 1080×1920)
Output:   04_exports/ → Telegram approval → Social APIs
Cleanup:  Sunday Hygiene SOP (see Evolution_OS.md)

---

## VERSION HISTORY

v2026.2 — Feb 2026
  Initial canonical version
  Replaces: Volume XVIII, n8n Content Factory Bible,
            Faceless Content PDF, Kimi draft placeholder
  Key additions: Evolution Intelligence channel identity,
  Expert Ledger schema, Silent Playback spec, full banned
  terms list, ElevenLabs model tier specified

---

Status: Canonical v2026.2
Location: 00_DNA/brand-identity/Evolution_Content_Factory.md
Next review: When content pillars expand or new markets activate
Do NOT modify casually. Version changes require header update.
For platform brand: see Branding.md
For technical architecture: see Evolution_OS.md
