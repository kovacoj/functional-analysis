LATEX       := pdflatex
LATEXMK     := latexmk -pdf
NOTES_DIR   := transcribed-notes/latex
NOTES_PDF   := transcribed-notes/pdf
NOTES_SRCS  := $(wildcard $(NOTES_DIR)/[0-9]*.tex)
NOTES_PDFS  := $(patsubst $(NOTES_DIR)/%.tex,$(NOTES_PDF)/%.pdf,$(NOTES_SRCS))
APPENDIX_SRCS := $(wildcard $(NOTES_DIR)/appendix-*.tex)
APPENDIX_PDFS := $(patsubst $(NOTES_DIR)/%.tex,$(NOTES_PDF)/%.pdf,$(APPENDIX_SRCS))

LATEX_AUX_EXTENSIONS = \
	-name "*.aux" -o \
	-name "*.log" -o \
	-name "*.out" -o \
	-name "*.toc" -o \
	-name "*.lof" -o \
	-name "*.lot" -o \
	-name "*.fls" -o \
	-name "*.fdb_latexmk" -o \
	-name "*.synctex.gz"

.PHONY: all theorems notes clean clean-latex

all: theorems notes

theorems: theorems.pdf

theorems.pdf: theorems.tex fa-macros.tex fa-theorems.tex
	$(LATEX) theorems.tex
	$(LATEX) theorems.tex

notes: $(NOTES_PDFS) $(APPENDIX_PDFS)

$(NOTES_PDF)/%.pdf: $(NOTES_DIR)/%.tex $(NOTES_DIR)/study-note-style.tex $(NOTES_DIR)/fa-macros.tex $(NOTES_DIR)/fa-theorems.tex
	$(LATEXMK) -cd -output-directory=$(abspath $(NOTES_PDF)) $<

clean: clean-latex
	$(RM) theorems.pdf
	$(RM) -r $(NOTES_PDF)/*.pdf

clean-latex:
	find . \( $(LATEX_AUX_EXTENSIONS) \) -type f -delete
