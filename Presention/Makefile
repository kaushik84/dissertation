ps: diss_pres.tex 
	latex diss_pres.tex
	#biber diss_pres.bcf
	#latex diss_pres.tex
	dvips diss_pres.dvi -o diss_pres.ps
	ps2pdf diss_pres.ps


pdfonly: diss_pres.tex
	pdflatex diss_pres.tex

pdf: diss_pres.tex
	pdflatex diss_pres.tex
	biber diss_pres.bcf
	pdflatex diss_pres.tex

clean:
	rm *.log *.aux *.bbl *.blg *.pdf *.ps *.dvi *.out *.snm *.nav *.toc *.bcf *.xml


cp_pres:
	cp -rf diss_pres.tex diss_pres.pdf Makefile templates/ logos ~/Dropbox/ICC2016/pres/ 	
