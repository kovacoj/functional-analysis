.PHONY: clean clean-latex

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

clean: clean-latex

clean-latex:
	find . \( $(LATEX_AUX_EXTENSIONS) \) -type f -delete
