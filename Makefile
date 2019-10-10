# GNU Make rules
# ------------------------------------------------------------------------------

TEXFILES := $(wildcard tex/*.tex)
PDFFILES := $(TEXFILES:.tex=.pdf)

tex: $(PDFFILES)

%.pdf: %.tex
	cd tex && latexmk -pdf -quiet $(notdir $<)

clean:
	cd tex && latexmk -C

.PHONY: tex clean
