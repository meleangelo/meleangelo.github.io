# Migration checklist

## Hosting

The live user site is `https://meleangelo.github.io`, served from the `master` branch repository root. This redesign branch renders to `_site/` and should not be published until you say so.

No GitHub Action is active. `.github/workflows/publish.yml.example` is an example for later review. It is written to run only on `master` plus manual dispatch, and only after you rename it.

Do not point Pages at this preview branch.

## Preserved URLs

| Old path | New behavior |
| --- | --- |
| `/` | New homepage |
| `/index.html` | New homepage |
| `/research.html` | New research page |
| `/teaching.html` | New teaching page |
| `/contact.html` | New contact page |
| `/cv.pdf` | Same PDF, unchanged |
| `/files/*` | Same files, plus `files/SyllabusF1.pdf` |
| `/images/Angelo_Mele.jpg` | Same portrait |
| `/blog.html` | Redirect page to `/writing.html` |
| `/links.html` | Redirect page to `/about.html` |

## New URLs

- `/writing.html`
- `/about.html`
- `/projects.html`

## Removed from this branch

These remain on `master` and `redesign-2025` if you need them later:

- Old R Markdown sources (`index.Rmd`, `research.Rmd`, `teaching.Rmd`, `contact.Rmd`, `links.Rmd`)
- Old generated root HTML and `site_libs/`
- `_site.yml`, `README.html`, and the RStudio project file
- `new_website_idea/`, a duplicate copy of papers and an unused experiment

## Kept

- Paper PDFs, appendices, example data, and the existing CV PDF at their old URLs
- The portrait at `images/Angelo_Mele.jpg`

## Known limitations

- The existing CV PDF is outdated and is not promoted.
- Empty writing listing has no published posts.
- Draft outlines live in `_drafts/` and must stay out of `_site/`.
- Optional listing filters need JavaScript; the full publication lists are in the HTML without it.
- Local preview was the only intended deployment path for this branch.
