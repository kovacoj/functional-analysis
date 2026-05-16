LATEX       := pdflatex
LATEXMK     := latexmk -pdf
THM_DIR     := theorems
LEC_DIR     := lectures/latex
LEC_PDF     := lectures/pdf
LEC_SRCS    := $(wildcard $(LEC_DIR)/[0-9]*.tex)
LEC_PDFS    := $(patsubst $(LEC_DIR)/%.tex,$(LEC_PDF)/%.pdf,$(LEC_SRCS))
APP_SRCS    := $(wildcard $(LEC_DIR)/appendix-*.tex)
APP_PDFS    := $(patsubst $(LEC_DIR)/%.tex,$(LEC_PDF)/%.pdf,$(APP_SRCS))
ORAL_DIR    := oral/latex
ORAL_PDF    := oral/pdf
ORAL_SRCS   := $(wildcard $(ORAL_DIR)/[0-9]*.tex)
ORAL_PDFS   := $(patsubst $(ORAL_DIR)/%.tex,$(ORAL_PDF)/%.pdf,$(ORAL_SRCS))

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

.PHONY: all theorems lectures oral clean clean-latex

all: theorems lectures

theorems: $(THM_DIR)/theorems.pdf

$(THM_DIR)/theorems.pdf: $(THM_DIR)/theorems.tex fa-macros.tex fa-theorems.tex
	cd $(THM_DIR) && $(LATEX) theorems.tex && $(LATEX) theorems.tex

lectures: $(LEC_PDFS) $(APP_PDFS)

$(LEC_PDF)/%.pdf: $(LEC_DIR)/%.tex $(LEC_DIR)/study-note-style.tex fa-macros.tex fa-theorems.tex
	$(LATEXMK) -cd -output-directory=$(abspath $(LEC_PDF)) $<

oral: $(ORAL_PDFS)

$(ORAL_PDF)/%.pdf: $(ORAL_DIR)/%.tex $(ORAL_DIR)/oral-style.tex fa-macros.tex fa-theorems.tex
	$(LATEXMK) -cd -output-directory=$(abspath $(ORAL_PDF)) $<

clean: clean-latex

clean-latex:
	find . \( $(LATEX_AUX_EXTENSIONS) \) -type f -delete
