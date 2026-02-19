# Evolution Stables — Typography System
# Version: 1.0 | Last Updated: February 2026
# Status: ACTIVE — Guidelines for Platform, Content, and Future Branding

---

## 🏗️ ERA 1: THE ACTIVE STANDARD (PLATFORM & UI)
**Status:** CURRENT — Primary system for all new development.

### **1. Primary Sans: Geist Sans**
- **Usage:** UI Elements, Navigation, Body Text, Professional reporting.
- **Source:** `/public/fonts/GeistSans-VF.woff2`
- **Logic:** Data-forward, modern, and highly legible at small sizes. Reinforces the "Institutional-Grade" pillar.

### **2. Technical Mono: Geist Mono**
- **Usage:** GTI Intelligence layers, Price Tickers, Data Tables, Code blocks.
- **Source:** `/public/fonts/GeistMono-VF.woff2`
- **Logic:** Communicates technical precision and "Bloomberg-style" market intelligence.

---

## 📜 ERA 3: THE CONTENT STANDARD (LEGACY & NEWSLETTER)
**Status:** SUPPORTED — Used for editorial content and long-form updates.

### **1. Editorial Serif: Playfair Display**
- **Usage:** Newsletter Headlines, "First Gear" updates, high-end editorial feel.
- **Logic:** Provides a traditional, sophisticated contrast to the technical UI.

### **2. Universal Sans: Inter**
- **Usage:** Email templates, legacy HTML updates.
- **Logic:** High compatibility across all mail clients and legacy browsers.

---

## 🚀 ERA 2: THE FACELIFT CANDIDATE (ON ICE)
**Status:** TAGGED — Reserved for upcoming Website Facelift / DRC Partnership launch.

### **1. Premium Display: Audi Type**
- **Candidate Fonts:** 
  - `AudiType-WideBold` (Headlines)
  - `AudiType-ExtendedNormal` (Subheaders)
  - `AudiType-Normal` (Premium body text)
- **Source Files:** Located in `Evolution-3.1/public/fonts/`
- **Strategy:** To be reviewed and activated during the facelift to elevate the brand to "Institutional/Automotive" levels of prestige. **Do not activate in main CSS until facelift begins.**

---

## 🛠️ IMPLEMENTATION NOTES
- **Variables:** Use `--font-sans`, `--font-mono`, and `--font-display` in Tailwind/CSS.
- **Fallbacks:** Always fallback to `system-ui, sans-serif` for Geist and `serif` for Playfair.
- **Weight Mapping:** Standardize on 300 (Light), 400 (Regular), and 600 (Semi-Bold).
