# GNU Make rules
# ------------------------------------------------------------------------------

TEXFILES := $(wildcard topic/*.tex)
PDFFILES := $(TEXFILES:.tex=.pdf)

topic: $(PDFFILES)

%.pdf: %.tex
	cd topic && latexmk -pdf -quiet $(notdir $<)

clean:
	cd topic && latexmk -C

.PHONY: topic clean
