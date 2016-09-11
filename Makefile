.PHONY: help clean open report

FILE = sample
TX_FILE = $(FILE).tex
OP_FILE = $(FILE).pdf
LTXENGINE     = pdflatex
LTXOPTS	      = -interaction batchmode \
		-halt-on-error \
		-file-line-error
VWENGINE      = evince
BUILDDIR      = $(PWD)

# for ubuntu make sure texlive is installed is properly
ifeq ($(shell which $(LTXENGINE) >/dev/null 2>&1; echo $$?), 1)
$(error The '$(LTXENGINE)' was not found. Make sure you have texlive installed)
endif

all: compile clean 

compile:
	@echo "Invoking report"
	$(LTXENGINE) $(LTXOPTS) $(TX_FILE) 1>/dev/null
	@echo "completed "

open:
	@echo "Invoking report"
	$(VWENGINE) $(OP_FILE)

clean:
	rm -rf *.log *.aux
help:
	@echo " Convert tex to pdf "

