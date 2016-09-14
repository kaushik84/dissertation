all: dissertation.tex ../literatur/bibliography.bib
	latex dissertation.tex
	makeindex dissertation
	dvips dissertation.dvi -o dissertation.ps
	ps2pdf -dAutoRotatePages=/None dissertation.ps



full: dissertation.tex ../literatur/bibliography.bib ../literatur/mypaper.bib
	latex dissertation.tex
	bibtex dissertation
	#bibtex K 
	makeindex dissertation
	latex dissertation.tex
	latex dissertation.tex
	dvips dissertation.dvi -o dissertation.ps
	ps2pdf -dAutoRotatePages=/None dissertation.ps


pdf: dissertation.tex bibliography.bib
	pdflatex dissertation.tex
	bibtex dissertation
	pdflatex dissertation.tex

clean:
	rm *.log *.aux *.bbl *.blg dissertation.pdf *.ps *.dvi *.out *.tcp *.idx *.toc *.tps

