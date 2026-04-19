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

## How to update

After any content edit, run `quarto render` to refresh `docs/`, then commit and push to deploy. Most update types follow the same pattern: change the source `.qmd`, render, commit, push.

### New slide deck for a paper

1. Recompile in the slides source repo (e.g., `~/Code/MexicoWorkerReferralsSlides`, `~/Code/ChiapasDroughtPaperSlides`). Each of those repos has its own CLAUDE.md with publish-flow instructions.
2. Copy `main.pdf` to `pdf/Pitts<PaperShortName>Slides_<YYYYMMDD>.pdf` — date matches the title-page date.
3. Delete the prior dated slide file from `pdf/`.
4. In both `index.qmd` and `research.qmd`, use `replace_all` on the bare filename (old → new). This updates the `resources:` list and the `[Slides](...)` link in one pass per file.

### New paper draft

1. Recompile in the paper source repo (e.g., `~/Code/ChiapasNetworkPaperDraft`). That repo's CLAUDE.md has the publish-flow instructions.
2. Copy the rebuilt PDF to `pdf/<PaperShortName>_<YYYYMMDD>.pdf` — date matches the title page.
3. Delete the prior dated PDF from `pdf/`.
4. `replace_all` the bare filename in `index.qmd` and `research.qmd`.

### New presentation dates

Edit the "Upcoming talks" section of `index.qmd`. Format:

```
* [Venue Name](URL) on Month Day, YYYY, presenting "Paper Title"
```

Remove past entries once they're no longer upcoming. The CV's "Invited Professional Presentations" section is maintained independently — update the DOC source separately and re-export.

### New replication package

1. Create a public GitHub repo under `spittssj` (mirror `spittssj/ChiapasExperimentReplication`). Before publishing, verify the data is safe (IRB constraints, de-identification, partner agreements).
2. Append `| [Replication](https://github.com/spittssj/<repo>)` to the paper entry in both `index.qmd` and `research.qmd`.

### New CV

1. Drop the new PDF into `pdf/PittsEconResume<Mon>YYYY.pdf`.
2. Update the `href:` and `resources:` entries in `index.qmd` to point at the new filename.
3. Delete the prior dated CV from `pdf/`.

### New media coverage

Add a bullet to the "In the news" list in `index.qmd`. Format mirrors existing entries:

```
* [Headline](URL). M/D/YY. [optional ungated version](pdf/...).
```

If an ungated PDF is included, drop it into `pdf/` and add it to the `resources:` list.

### Working paper becomes published

1. On `index.qmd`, move the entry from `### Working papers` up to `### Published`.
2. Replace the working-paper status with the full journal citation: `*Journal*, year, volume(issue): pages.`
3. Update the link row to `[Journal version](<DOI URL>) · [Open-access PDF](pdf/...)`. Drop the working-paper PDF link.
4. Mirror the same change in `research.qmd` under the appropriate strand.
5. Remove the paper from "Upcoming talks" if it's no longer being actively presented.

### New course / teaching update

1. On `teaching.qmd`, add the course entry under the appropriate role-block. Use the existing `\` line-break convention to keep entries together within the section.
2. If you have a syllabus PDF, drop it into `pdf/syllabus/` and add it to `teaching.qmd`'s `resources:` list. Link inline as `[syllabus](pdf/syllabus/<filename>.pdf)`.

### New community engagement section

1. On `community.qmd`, add a new `##` section with `<Place> (<years>)` header, mirroring the Tijuana / El Paso / Chiapas pattern.
2. Add a paragraph or two describing the work, then a photo block:
   ```
   ::: {layout-ncol=2}
   ![Caption](images/<file>.jpg)

   ![Caption](images/<file>.jpg)
   :::
   ```
3. Drop any new images into `images/` and add them to `community.qmd`'s `resources:` list.

### New fieldwork photos

1. Drop images into `images/chiapas_photos/` (or a parallel folder for a new site).
2. Add references in `chiapas_fieldwork_photos.qmd` following the existing pattern:
   ```
   ![Caption](images/chiapas_photos/<filename>.png){group="chiapas_fieldwork_gallery"}
   ```

### Adding a new top-level page

1. Create `<name>.qmd` with YAML front matter (`title:` plus `resources:` if it links to PDFs).
2. Add an entry to `navbar.left` in `_quarto.yml` with an explicit `text:` (mirror existing entries):
   ```yaml
   - href: <name>.qmd
     text: <Display Name>
   ```
3. Render to verify the page appears.

### Removing a paper or project

1. Delete the entry from `index.qmd` and `research.qmd`.
2. Remove the corresponding `resources:` entries from both files.
3. Delete the PDF, slides, and any associated files from `pdf/` (and `pdf/syllabus/` if applicable). Don't forget the matching files in `docs/pdf/`.
4. If the paper had a replication GitHub repo, decide separately whether to leave it public, archive it, or make it private.

## Outstanding work

See [`TODO.md`](TODO.md) for the running list of website improvements (deferred polish items, summer projects, content additions to make as research develops).
