.PHONY: all clean

all: abstract.pdf poster.pdf

abstract.pdf: abstract.txt
	rst2pdf $<

poster.pdf: poster.tex
	-rm poster.aux 
	pdflatex poster
	bibtex poster
	pdflatex poster
	pdflatex poster
	pdftk poster.pdf cat output poster-fixed.pdf
	mv poster-fixed.pdf poster.pdf

clean:
	rm -f *.aux *.bbl *.blg *.log
