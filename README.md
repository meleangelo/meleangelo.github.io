# Angelo Mele — Website

Personal site: economist & data scientist (pricing, causal inference, networks).

## Build (Quarto)

```bash
quarto render
```

Output is written to `docs/`. GitHub Pages is configured to publish from the `docs` folder.

## Deploy

- Push to `main` (or your Pages branch). If the repo is set to "Deploy from a branch", choose branch `main` and folder `docs`.
- To use a GitHub Action instead: add a workflow that runs `quarto render` and commits `docs/` (or uploads artifact).

## Update content

- **Papers:** Edit `research.qmd` or (Phase 2) `data/papers.yml`.
- **Posts:** Add `posts/YYYY-MM-DD-slug.qmd`; the Writing page will list them.
- **Links (email, LinkedIn, etc.):** Edit `data/links.yml`; footer and contact pull from it once wired.
- **CV / Resume:** Replace `assets/files/cv.pdf` and/or `assets/files/resume.pdf`; optionally update the date in `resume.qmd`.