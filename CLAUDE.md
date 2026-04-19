# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Stephen Pitts SJ's personal academic website, built with [Quarto](https://quarto.org/) and published via GitHub Pages. Content is a set of `.qmd` (Quarto Markdown) pages; there is no application code.

## Common commands

- `quarto preview` — live-reload local server while editing.
- `quarto render` — rebuild the full site into `docs/`. Run this before committing content changes so the published site updates.
- `quarto render <file>.qmd` — render a single page.

## Architecture / things that bite

- **`_quarto.yml`** defines the site: `type: website`, `output-dir: docs`. GitHub Pages serves from `docs/`, so the built HTML **must be committed** alongside source `.qmd` edits. The navbar is also defined here — adding a new top-level page means editing `_quarto.yml`.
- **PDFs in `pdf/` are not auto-copied.** Quarto only copies a PDF into `docs/pdf/` if it is listed under `resources:` in the front matter of a `.qmd` that links to it (or globbed via `resources: pdf/*.pdf` at the project level in `_quarto.yml`). Recent commits ("Broken link to resume", "Fix link to OSV article") were fixes for PDFs linked from a page whose front matter didn't declare them. When adding a PDF link, add the PDF to the `resources:` list of that page's front matter.
- The front-matter pattern on `index.qmd` shows the convention: every PDF linked in the page body is repeated under `resources:`.
- `_site/` and `.quarto/` are Quarto caches — ignore them; `docs/` is the real build output.
- Images live in `images/` (site imagery) and `images/chiapas_photos/` (fieldwork gallery used by `chiapas_fieldwork_photos.qmd`).

## Content conventions

- Internal links between pages use the rendered `.html` name (e.g. `research.html`), not `.qmd`.
- CV / resume filenames are dated (e.g. `PittsEconResumeApr2026.pdf`). When a new dated CV is dropped into `pdf/`, update the `href` and `resources:` entry in `index.qmd` (and any other page that links to the CV) to point at the new filename — old references to the previous month's file will 404.
