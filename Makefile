# GNU Make rules
# ------------------------------------------------------------------------------

TEXMAINS  = tex/topic.tex tex/terms.tex
TEXINPUT := $(shell find tex -mindepth 2 -type f)
PDFMAINS := $(TEXMAINS:.tex=.pdf)
COLMAINS := $(TEXMAINS:.tex=-collated.tex)

tex: $(PDFMAINS) $(COLMAINS)

%.pdf: %.tex $(TEXINPUT)
	cd $(<D) && latexmk -pdf -bibtex $(<F)

%-collated.tex: %.tex %.pdf
	cd $(<D) && latexpand --keep-comments --expand-bbl $(<F:.tex=.bbl) $(<F) -o $(@F)

clean:
	cd tex && latexmk -C
	rm -f $(COLMAINS)

.PHONY: tex clean
