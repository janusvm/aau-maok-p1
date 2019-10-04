# GNU Make rules
# ------------------------------------------------------------------------------

TEXFILES := $(wildcard topic/*.tex)
PDFFILES := $(TEXFILES:.tex=.pdf)

topic: $(PDFFILES)

%.pdf: %.tex
	latexmk -pdf -quiet -cd $<

clean:
	cd topic && latexmk -C

.PHONY: topic clean
