# Angelo Mele

Source for [meleangelo.github.io](https://meleangelo.github.io). This branch is a Quarto redesign. It is not the live GitHub Pages site until you review it and choose a deploy method.

## Prerequisites

- [Quarto](https://quarto.org/docs/get-started/) 1.4 or later
- A browser for local preview

During this redesign, Quarto 1.10.18 was used from a user-local install at `~/opt/quarto/bin/quarto` after the Homebrew cask installer asked for a password. Any normal Quarto install is fine.

```sh
quarto --version
```

## Preview

From this repository:

```sh
quarto preview
```

The preview server renders into `_site/` and does not publish anything. Do not run `quarto publish` from this branch.

## Build

```sh
quarto render
```

Output is `_site/`. Source files stay in the repository root. `_site/` is gitignored so a local render cannot overwrite the live root files on `master`.

This branch is Quarto-only. The previous R Markdown sources and generated root HTML remain on `master` and `redesign-2025`.

## What not to deploy yet

- Do not push this branch to `master`.
- Do not add a GitHub Action that runs on this branch.
- Do not change the repository Pages source until you have reviewed the site.
- The file `.github/workflows/publish.yml.example` is an example only. It is not an active workflow.

## Adding content

### Paper

1. Add one entry to `data/publications.yml`.
2. Set `kind` to `journal`, `proceedings`, `working-paper`, `in-progress`, or `archive`.
3. Add `paper`, `doi`, `preprint`, or `code` only when the URL exists. Leave missing links out.
4. To feature a paper on the homepage, set `featured: true` and `featured_order`.
5. Run `quarto preview` and check Research and Home.

### Project

Edit `projects.qmd`. Keep the problem / approach / contribution / evidence / limits structure. Do not add confidential or invented results.

### Article

1. Copy `_drafts/template.qmd` to `posts/yyyy-mm-dd-short-slug/index.qmd`.
2. Remove `draft: true` only when the article is finished.
3. Do not move files out of `_drafts/` until they are ready. That folder is excluded from the build.

### CV or resume

Replace `cv.pdf` only after you have reviewed the replacement. The current file is dated December 30, 2024 and still lists Johns Hopkins as current. A separate industry resume should be a different file, not a rewritten copy of the academic CV. After a current file exists, add a download link on Home and About.

### News item

Add an entry to `data/news.yml`. Use `homepage: true` for at most three current items. Older items stay in the About archive.

## Analytics

No analytics are enabled. To add Quarto’s built-in Google Analytics later, set `website: google-analytics: G-XXXXXXXX` in `_quarto.yml` with a real measurement ID. Do not commit a placeholder ID.
