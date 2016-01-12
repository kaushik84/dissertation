all: dissertation.tex ../literatur/bibliography.bib
	latex dissertation.tex
	bibtex dissertation
	latex dissertation.tex
	dvips dissertation.dvi -o dissertation.ps
	ps2pdf dissertation.ps


pdf: dissertation.tex bibliography.bib
	pdflatex dissertation.tex
	bibtex dissertation
	pdflatex dissertation.tex

clean:
	rm *.log *.aux *.bbl *.blg dissertation.pdf *.ps *.dvi *.out *.tcp *.idx *.toc *.tps

