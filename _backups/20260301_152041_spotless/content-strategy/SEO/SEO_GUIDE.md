# Evolution Stables — SEO Strategy & Implementation Guide
# Version: 1.0 | Last Updated: February 2026
# Status: ACTIVE — Canonical SEO standards for all platform development.

---

## 🎯 SEO CORE OBJECTIVE
To position Evolution Stables as the primary authority for "Institutional-Grade Racehorse Tokenization" and "Digital Equine Assets" in the NZ and global markets.

---

## 🛠️ TECHNICAL SEO STANDARDS

### **1. Canonical & Meta Management**
- **Rule:** Every unique route MUST have an explicit canonical tag to prevent duplicate content issues.
- **Implementation:** 
  - Home: `https://evolutionstables.com/`
  - Marketplace: `https://evolutionstables.com/marketplace`
  - Valuation: `https://evolutionstables.com/valuation`
- **Metadata:** Each page must have a unique Title and Description. Inheriting from the root layout is BANNED for major routes.

### **2. Heading Hierarchy (The "Hidden H1" Pattern)**
To maintain a minimalist premium design while satisfying search engines, use the "visually hidden" H1 pattern:
- **Home:** `<h1>Evolution Stables - Digital Racehorse Ownership & Tokenized RWA Platform</h1>`
- **Marketplace:** `<h1>Evolution Stables Marketplace - Digital Syndication Opportunities</h1>`

### **3. Structured Data (Schema.org)**
All platform deployments must include the following schema:
- **Organization:** Including links to press articles (BusinessDesk, Arabian Business).
- **WebSite:** Standard search box integration.
- **FAQ Schema:** Mandatory for the homepage to capture "Rich Results" in Google.

---

## 📝 CONTENT & ON-PAGE STANDARDS

### **1. Image Optimization**
- **Alt Text:** Never use generic alt text.
- **Bad:** `alt="Evolution Stables"`
- **Good:** `alt="Majestic racehorses representing Evolution Stables digital ownership in the Hero section"`
- **Requirement:** Include keywords like "Tokenized", "Fractional Ownership", and "Digital Assets".

### **2. Local SEO (New Zealand Market)**
- **Keywords:** Integrate "New Zealand Thoroughbred Racing", "FMA-Regulated", and "NZ Racing Data" into sub-page descriptions.
- **Targeting:** Auckland and wider NZ racing hubs.

### **3. Performance & Accessibility**
- **Viewport:** `user-scalable=yes` MUST be enabled. Restricting zoom is a negative SEO signal.
- **Lighthouse:** Maintain a minimum SEO score of 90+ across all routes.

---

## 📈 EVOLUTION INTELLIGENCE (GTI) SEO HOOKS
When generating AI content (TikTok, X, Instagram):
- **Hook:** Start with a data-driven performance insight (e.g., "Whale Alert: +15% fixed odds drop detected in Race 4...").
- **Keywords:** Use standardized GTI terms: "Market Liability", "Allocation", "Flucs", "Divvie". 
- **The Wall:** Never use Q7 terms (Digital-syndication, Equine Assets) in GTI layer SEO hooks.
- **Linking:** Point to the GTI intelligence landing page or relevant data audit.

---

## 📋 MAINTENANCE CHECKLIST
- [ ] Submit `/sitemap.xml` to Google Search Console after every major refactor.
- [ ] Update `/src/lib/press-articles.ts` with new media mentions to feed the Organization schema.
- [ ] Run monthly Lighthouse SEO audits.
