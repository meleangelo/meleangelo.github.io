# Quarto Website Revamp (Option B) — Detailed Structure Guide
**Goal:** Modernize `meleangelo.github.io` into a Quarto site optimized for an *economist + data scientist in tech*, while keeping maintenance low.

This document is designed to be dropped into Cursor as a build guide/spec.

---

## 0) Guiding principles
1. **Above-the-fold clarity:** In <20 seconds, a visitor should know *who you are, what you do, and what to click next*.
2. **Tech-sector proof over chronology:** “Selected work” + “case studies” beat a long “News” feed.
3. **Two audiences, two paths:**  
   - *Industry*: Hiring managers, product/data leaders, founders → want impact, methods, case studies.  
   - *Academia*: Researchers/students → want papers, talks, teaching, replication/code.
4. **Maintainability:** Prefer Quarto-native features (cards, listings, bibliographies) and simple data files (`.yml`, `.bib`).

---

## 1) Proposed site map (navigation)
**Top navbar:**
- Home
- Research (Academic)
- Writing (Notes)
- CV
- Contact

**Footer:**
- LinkedIn, GitHub, Google Scholar, X (optional)
- Copyright
- Short tagline

**Note:** “Work (Industry)” page is deferred for now; can be added later as `work.qmd` if needed. Optional: keep a minimal `work.qmd` (e.g. “Coming soon”) and hide it from the navbar until content is ready, to reserve the URL.

**Rationale:** Your current site is paper-centric and “news”-forward. The revamp makes *positioning + proof* primary, while preserving the academic library.

---

## 2) Repository / folder structure
Recommended layout inside your existing GitHub Pages repo:

```
.
├── _quarto.yml
├── index.qmd
├── research.qmd
├── writing.qmd
├── cv.qmd
├── contact.qmd
├── styles.scss
├── assets/
│   ├── img/
│   │   ├── headshot.jpg
│   │   ├── social-card.png
│   │   └── favicon.png
│   └── files/
│       ├── cv.pdf
│       └── (optional) one-page-resume.pdf
├── data/
│   ├── papers.yml
│   ├── talks.yml
│   ├── projects.yml
│   └── links.yml
├── posts/
│   ├── _metadata.yml
│   ├── 2026-02-xx-pricing-elasticity-marketing.qmd
│   └── 2026-02-xx-network-systemic-risk.qmd
└── README.md
```

### Notes
- `data/*.yml` keeps content clean and easy to edit.
- **Phase 1 (launch):** Content can live in the `.qmd` files or a single `data/site.yml`; keep it simple.
- **Phase 2 (when ready):** Split into `papers.yml`, `projects.yml`, etc. and wire pages to render from them.
- `posts/` uses Quarto “listing” to generate a blog/notes feed.
- `assets/files/cv.pdf` gives you a stable URL and no rendering surprises.
- **Placeholders:** Use a placeholder for `social-card.png` and `favicon.png` (e.g. same image or a simple 1200×630 PNG) until final art is ready, so Open Graph and Twitter cards don’t break.

---

## 3) Global config: `_quarto.yml` specification
### 3.1 Required fields
- `project: type: website`
- `website: title`, `site-url`, `repo-url`
- `navbar` with the pages above
- `page-footer` with social links
- `format: html:` theme + typography + code tools

### 3.2 SEO and social
Include:
- `site-url` (your canonical)
- `open-graph: true`
- `twitter-card: true`
- `favicon`
- `metadata` (author, description)
- Add `assets/img/social-card.png` for link previews.

### 3.3 Analytics (optional)
- Plausible or GA4. Keep optional; don’t block launch.

**Rationale:** Tech audiences share links; social previews and good metadata materially increase click-through.

---

## 4) Style system: `styles.scss`
### 4.1 Brand goals
- Clean, high-contrast, modern (Bootstrap 5 feel)
- Comfortable reading width
- Cards for scanability
- Avoid “academic wiki page” vibe

### 4.2 SCSS targets
- Increase base font size and line height
- Limit content width (e.g., 820–920px for text pages)
- Card styling: subtle shadow, rounded corners
- Button styles: consistent “PDF / Code / Slides” pills
- Link styling: understated but clear (hover underline)

**Deliverable:** One SCSS file that overrides theme variables. **Keep it minimal for easy updates:** start with two classes only:
- `.card` (or use Quarto’s built-in card class) for all card layouts (hero chips, papers, selected work).
- `.btn-action` (or similar) for PDF / Code / Slides / Summary buttons.
Add `.paper-card` or `.case-card` only if you later need distinct layouts; avoid extra classes until then.

---

## 5) Page-by-page detailed structure

# 5.1 Home: `index.qmd`
**Purpose:** Immediate positioning + proof + next click.

### Sections (top to bottom)

#### A) Hero (above the fold)
- Headline: 8–14 words
- Subheadline: 1–2 lines with your “triangle” (Economics × ML × Networks/Pricing)
- Proof chips row (3–5 chips):  
  Example chips:
  - Pricing Algorithms (Wayfair)
  - Causal Measurement
  - Network Econometrics
  - Open-source R/Python
  - Platform Markets
- Two primary buttons:
  - “Selected work” → anchors to section
  - “Contact” → contact page

**Rationale:** This is where tech visitors decide relevance.

#### B) What I do (3 cards)
Each card:
- Title
- 2 bullet points (problems you solve)
- 1 bullet (methods)
- Link:
  - Pricing → Research page (or anchor)
  - Causal → Research page
  - Networks → Research page

#### C) Selected work (6–8 items)
A grid of cards. Each card:
- Title
- 1–2 line “why it matters”
- Links row:
  - PDF
  - Code
  - Slides (optional)
  - Summary (optional)

Data source: `data/projects.yml` or curated in-page.

#### D) Featured writing (optional, 3 recent)
Show 3 most recent notes from `posts/`.

#### E) Mini bio + credibility
- 3–5 lines
- Logos or text list of venues (journals, conferences, employers)

#### F) Updates (last 2–3 only)
Keep it short and link to `/writing` or `/updates`.

---

# 5.2 Research (Academic): `research.qmd`
**Purpose:** A skimmable library with categories, selected items, and clean linking.

### Structure

#### A) Selected papers (top)
- 6–10 featured papers (cards)
- Each card includes:
  - Title
  - Authors (small)
  - Year + venue
  - 2–3 line summary:
    - The question
    - The method
    - The result/implication
  - Links:
    - PDF
    - Code
    - Talk (optional)

Data source: `data/papers.yml`

#### B) Topics / Tags
- Pricing / Platforms / Networks / Methods / Causal inference
- Clicking a tag filters (if you keep it simple, just jump to anchors).

#### C) Full publications list
- Chronological, but with:
  - Year headings
  - Compact entries
  - Optional “bib” export link

Optional:
- Use `references.bib` to auto-render citations (Quarto can do this).

---

# 5.3 Writing (Notes): `writing.qmd` + `posts/`
**Purpose:** Demonstrate judgment and technical taste; shareable content.

**Optional at launch:** For v1, implement `writing.qmd` with a short intro and an empty or placeholder listing. Add real posts when you have content; no need to block launch on “Suggested first 3 posts.”

### `writing.qmd`
- Intro: what you write about
- Quarto listing of posts with:
  - title
  - date
  - description
  - categories/tags

### `posts/_metadata.yml`
Default fields:
- author
- format
- toc: true
- code-fold: true
- citations: optional

### Post format
Each post should follow:
- Problem statement (2–4 paragraphs)
- Approach / intuition
- Minimal math, optional appendix
- Implementation snippet
- “So what” takeaway (business relevance)

Suggested first 3 posts (when ready):
1. Marketing × price elasticity interaction: intuition + empirical patterns
2. Measuring causal impact when data are messy: operationalizing ambiguity
3. Network systemic risk and why centrality-based interventions often fail

---

# 5.4 CV: `cv.qmd`
**Two options:**
- **Option 1 (recommended):** A simple page with buttons to download PDF(s).
- **Option 2:** Render a short “web CV” with sections + PDF link.

Structure (if web CV):
- Summary + interests
- Experience (tech + academia)
- Education
- Selected publications
- Talks/teaching
- Service

---

# 5.5 Contact: `contact.qmd`
**Purpose:** frictionless, current.

Content:
- Primary email (current)
- LinkedIn
- Optional: Calendly link
- City/timezone (optional)
- A short line about what kinds of messages you welcome:
  - Hiring conversations
  - Research collaborations
  - Speaking

**Important:** Remove legacy institutional address/phone unless you explicitly want it displayed.

---

## 6) Content data files (YAML) specs

### 6.1 `data/links.yml` (single source of truth for links)
Centralize all external links so **footer and contact page pull from this one file** (e.g. via Quarto variables or a small include). One place to change GitHub, LinkedIn, email, etc.
- github
- linkedin
- scholar
- x
- email
- cv_pdf_path

### 6.2 `data/projects.yml`
Fields per item:
- `title`
- `type` (industry / research / open-source)
- `summary` (1–2 lines)
- `methods` (list)
- `tags` (list)
- `links`: pdf, code, slides, post
- `featured` (true/false)

### 6.3 `data/papers.yml`
Fields per paper:
- `title`
- `authors`
- `year`
- `venue`
- `abstract_blurb` (2–3 lines)
- `tags`
- `links`: pdf/arxiv/ssrn, code, slides
- `featured` (true/false)

### 6.4 `data/talks.yml` (optional)
- title, venue, date, slides link, video link

**Rationale:** Data files make updates painless and consistent.

---

## 7) Launch checklist
- [ ] Replace JHU contact details with current ones
- [ ] Add headshot + social card image (placeholder 1200×630 PNG is fine until final art)
- [ ] Ensure all PDFs are reachable and stable
- [ ] Verify mobile layout (hero + cards)
- [ ] Check Lighthouse basics: title/description, og tags, favicon
- [ ] Add 3 “selected work” blurbs that sound non-academic and outcome-oriented
- [ ] Optional: add 2 short notes posts to seed Writing

---

## 8) Implementation sequence (what Cursor should do)
1. Create `_quarto.yml` with navbar + theme + metadata.
2. Create `styles.scss` with typography + card/button classes.
3. Create `index.qmd` with hero + cards + selected work placeholders.
4. Create `research.qmd` with selected papers + full list structure.
5. Create `writing.qmd` and `posts/` scaffolding with a listing (stub/empty listing is fine for v1).
6. Create `cv.qmd` linking to `assets/files/cv.pdf`.
7. Create `contact.qmd`.
8. Add `data/*.yml` and wire pages to render from them (Phase 1: hardcode in `.qmd`; Phase 2: data-driven).
9. Configure GitHub Pages: set `output-dir: docs` in `_quarto.yml` and point GitHub Pages to publish from the `docs` folder (or use default `_site` and a GitHub Action to deploy).

---

## 9) Copywriting guidance (tone)
- Avoid “marketing fluff”; use **specific problem language**.
- Use active verbs: “I build”, “I estimate”, “I design”, “I measure”.
- For each claim, add one proof anchor (paper / repo / talk / employer).

---

## 10) Acceptance criteria (definition of done)
- Home page clearly positions you as a tech-sector economist/data scientist.
- Research page is skimmable and categorized.
- Contact page is current and low friction.
- Site builds and deploys via GitHub Pages with Quarto.

---

## 11) How to update this site (maintenance)
- **Add a paper:** Edit `data/papers.yml` (or the relevant `.qmd`) and add the entry; re-render.
- **Add a post:** Create `posts/YYYY-MM-DD-slug.qmd`; the Writing listing will pick it up.
- **Update links (email, LinkedIn, etc.):** Edit `data/links.yml` only; footer and contact pull from it.
- **Rebuild:** Run `quarto render` locally, or push and let CI render and deploy.
- **Update CV:** Replace `assets/files/cv.pdf`; optionally update the “Last updated” line in `cv.qmd`.

---

## Appendix: Example homepage hero copy (templates)
Pick one style:

### Template A (direct)
**Economist & data scientist working on pricing, causal inference, and networked markets.**  
I build measurement systems for demand and policy, and develop methods for inference at scale.

### Template B (problem-first)
**I measure demand, design pricing experiments, and study network effects in digital markets.**  
Research + production experience in causal inference, structural models, and ML.

### Template C (hybrid)
**Tech economist focused on pricing algorithms and causal measurement.**  
Background in network econometrics and large-scale inference; open-source contributor.

