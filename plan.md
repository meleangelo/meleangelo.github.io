# Quarto Website Revamp — Execution Plan

**Source:** [quarto_revamp_option_b_structure.md](quarto_revamp_option_b_structure.md)  
**Branch:** `quarto_revamp`  
**Scope:** Phase 1 (launch): Quarto site with hardcoded/simple content; Phase 2 later: data-driven pages from YAML.

---

## Current state

- **Stack:** R Markdown (_site.yml, index.Rmd, research.Rmd, contact.Rmd, teaching.Rmd, links.Rmd).
- **Assets:** cv.pdf at root, images/ (e.g. Angelo_Mele.jpg), files/ (PDFs, data). No _quarto.yml or .qmd yet.
- **Content to reuse:** Bio, email, links, publication list, and teaching/links structure can be mined from the Rmd files.

---

## Execution order

### 1. Create plan.md and scaffold folders

- Write plan.md in the website folder with this full plan (and a short "How to update" summary from the structure doc §11) for reference.
- Create directory layout per structure §2:
  - `assets/img/` (headshot, social-card, favicon)
  - `assets/files/` (cv.pdf; move or copy from root)
  - `data/` (for Phase 1: minimal or empty; Phase 2: papers.yml, projects.yml, talks.yml, links.yml)
  - `posts/` with `_metadata.yml` (empty listing for v1 is fine)

Do not delete existing Rmd/HTML/files until the Quarto site is verified; keep them during build so we can copy content and switch over cleanly.

### 2. Global config: _quarto.yml

- Add _quarto.yml with:
  - `project: type: website`
  - `website`: title (e.g. "Angelo Mele"), `site-url` (canonical URL), `repo-url`
  - `navbar`: Home, Research, Writing, CV, Contact (order per structure §1)
  - `page-footer`: social links (LinkedIn, GitHub, Google Scholar, X optional), copyright, tagline
  - `format: html`: theme (e.g. flatly or cosmo), typography, code tools
  - SEO/social: `open-graph: true`, `twitter-card: true`, `favicon`, `metadata` (author, description), social-card image path
  - **Output:** `output-dir: docs` so GitHub Pages can publish from `docs` (or document the alternative: _site + GitHub Action)

Footer and contact links should be prepared to pull from a single source (e.g. data/links.yml or a small include) so §6.1 "single source of truth" is satisfied once data files are wired.

### 3. Styles: styles.scss

- Add styles.scss (or Quarto-compatible SCSS) with:
  - Theme variable overrides: base font size, line height, content max-width (e.g. 820–920px)
  - Two main classes only (structure §4.2): one **card** class (e.g. .card or use theme's card), one **action** class (e.g. .btn-action) for PDF / Code / Slides pills
  - Link styling: understated, hover underline
  - No .paper-card / .case-card unless needed later

### 4. Data and links (Phase 1)

- Add data/links.yml with placeholders: github, linkedin, scholar, x, email, cv_pdf_path (point to assets/files/cv.pdf). This will be the single source for footer and contact once wired.
- Optionally add minimal data/papers.yml and data/projects.yml with 1–2 example entries so Research and index "Selected work" can later be wired; for Phase 1, pages can still hardcode content.

### 5. Pages (Quarto)

- **index.qmd:** Hero (headline, subheadline, proof chips, two buttons: "Selected work" anchor, "Contact" link); "What I do" (3 cards → Research); "Selected work" (6–8 item grid, hardcoded or from data); optional "Featured writing" (3 recent from posts); mini bio + credibility; short "Updates" with link to Writing. Reuse/copy bio and positioning from index.Rmd; use hero copy from structure Appendix (Template A/B/C).
- **research.qmd:** Selected papers (cards) then full list; optional topics/tags as anchors. Migrate publication list from research.Rmd into the page (Phase 1) or from data/papers.yml when wired.
- **writing.qmd:** Short intro + Quarto listing of posts/. For v1, listing can be empty or placeholder; add real posts later.
- **cv.qmd:** Simple page with button(s) to download PDF(s); link to assets/files/cv.pdf. Optionally "Last updated" line.
- **contact.qmd:** Email, LinkedIn, optional Calendly; city/timezone optional; one line on what messages you welcome (hiring, research, speaking). Remove legacy institutional address/phone. Use data/links.yml when wired.

Ensure navbar and internal links match _quarto.yml (e.g. Research, Writing, CV, Contact).

### 6. Assets and posts

- Copy or move cv.pdf to assets/files/cv.pdf; fix link in cv.qmd.
- Copy images/Angelo_Mele.jpg to assets/img/headshot.jpg (or keep path and reference it). Add placeholder assets/img/social-card.png (e.g. 1200×630) and assets/img/favicon.png so og/twitter and favicon work.
- Add posts/_metadata.yml with default author, format, toc, code-fold. No posts required for v1; add when ready.

### 7. Build and GitHub Pages

- Run `quarto render` locally and confirm output under docs/ (or chosen output-dir). **Done:** output is in `docs/`.
- Update .gitignore if needed (e.g. ignore Quarto cache but not docs/). **Done:** added `.quarto`.
- Document in README.md or plan.md: "Publish from docs" and how to run `quarto render` (and optionally GitHub Action for deploy). **Done:** see README.md.
- Do not remove old Rmd/site_libs until you cut over; then remove or archive old Rmd/HTML and point GitHub Pages at docs.

### 8. Launch checklist (from structure §7)

- Replace any JHU contact details with current ones in contact and links. **Done:** contact.qmd uses meleangelo@gmail.com; no JHU address.
- Ensure headshot + social-card (placeholder OK). **Done:** assets/img/headshot.jpg, social-card.jpg, favicon.png.
- Verify all PDF links (cv, papers) and mobile layout. **Done:** cv at assets/files/cv.pdf; research links to files/*.pdf; Quarto copies files/ and assets/ to docs/.
- Lighthouse: title, description, og tags, favicon. **Done:** title/description in _quarto.yml; open-graph and twitter-card enabled; favicon set.
- Optional: 3 "selected work" blurbs, 2 seed posts for Writing. (Index has selected work cards; Writing is stub.)

---

## Definition of done (structure §10)

- Home positions you as tech-sector economist/data scientist.
- Research is skimmable and categorized.
- Contact is current and low friction.
- Site builds with `quarto render` and deploys via GitHub Pages (from docs).

---

## Phase 2 (later)

- Populate data/papers.yml, data/projects.yml, data/talks.yml and wire Research and index to render from them.
- Wire footer and contact to data/links.yml (Quarto variables or include).
- Add Writing posts; optionally add Work page (work.qmd) and unhide from navbar.

---

## How to update this site (maintenance)

- **Add a paper:** Edit data/papers.yml (or the relevant .qmd) and add the entry; re-render.
- **Add a post:** Create posts/YYYY-MM-DD-slug.qmd; the Writing listing will pick it up.
- **Update links (email, LinkedIn, etc.):** Edit data/links.yml only; footer and contact pull from it.
- **Rebuild:** Run `quarto render` locally, or push and let CI render and deploy.
- **Update CV:** Replace assets/files/cv.pdf; optionally update the "Last updated" line in cv.qmd.
