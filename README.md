# Functional Analysis for Physicists

LaTeX-based study materials for a functional analysis course, built from handwritten lecture notes and course reference documents.

The repo contains:
- exam-focused rewritten lecture notes
- appendix summaries
- short ancillary notes for easy-to-forget definitions and concepts
- oral-exam answer sheets
- a compiled theorem sheet
- the original handwritten/reference PDFs used as source material

## Repository Layout

- `lectures/latex/`: source `.tex` files for lecture notes, appendices, and ancillary notes
- `lectures/pdf/`: compiled lecture, appendix, and ancillary PDFs
- `oral/latex/`: source `.tex` files for oral-exam sheets
- `oral/pdf/`: compiled oral-exam PDFs
- `theorems/`: theorem-sheet source and compiled PDF
- `handwritten/`: original handwritten lecture and appendix PDFs
- `references/`: syllabus, exam info, sample exam, textbook, and other course reference PDFs
- `fa-macros.tex`: shared math macros
- `fa-theorems.tex`: shared theorem content used by oral sheets / theorem materials
- `fa-style-base.tex`: shared LaTeX styling primitives
- `Makefile`: main build and cleanup entry point

## Build

Prerequisites:
- a working LaTeX installation with `latexmk` and `pdflatex`
- Git LFS, because PDFs are tracked with LFS

Common commands:

```bash
make
```

Builds the theorem sheet, all lecture outputs, all ancillary/appendix outputs, and all oral sheets.

```bash
make theorems
make lectures
make oral
```

Build a single area.

```bash
make clean
```

Removes LaTeX auxiliary/build files.

## Notes On The Workflow

- The canonical source files live under `lectures/latex/`, `oral/latex/`, and `theorems/`.
- The canonical compiled outputs live under `lectures/pdf/`, `oral/pdf/`, and `theorems/`.
- The study notes are intentionally concise and exam-oriented rather than literal transcriptions.
- Ancillary notes are small standalone explainers for definitions and basic concepts that are easy to forget.

## Existing Note Types

Lecture/appendix notes:
- numbered lecture notes `01-...` through `11-...`
- appendix notes `appendix-...`

Ancillary notes:
- `ancillary-isometries.tex`
- `ancillary-basic-mapping-properties.tex`
- `ancillary-dense-open-closed-compact.tex`
- `ancillary-kernel-image-range-cokernel.tex`
- `ancillary-bounded-vs-continuous.tex`
- `ancillary-weak-vs-weak-star.tex`

Oral sheets:
- one source file per oral topic under `oral/latex/`

## Git LFS

PDFs are tracked with Git LFS via `.gitattributes`.

If cloning fresh:

```bash
git lfs install
git lfs pull
```

## Recommended Editing Pattern

For most changes:
1. edit the relevant `.tex` source
2. rebuild with `make` or `make lectures` / `make oral`
3. inspect the generated PDF
4. commit both source and compiled PDF changes

## Scope

This repo is a course-notes workspace, not a general-purpose LaTeX package. The styles and structure are optimized for these specific functional analysis materials.
