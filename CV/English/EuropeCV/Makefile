all: Kaushik.tex 
	pdflatex Kaushik.tex
	pdftk Kaushik.pdf cat 1-2 output Kaushik_s.pdf
	rm Kaushik.pdf
	mv Kaushik_s.pdf Kaushik.pdf
d: Kaushik_d.tex 
	pdflatex Kaushik_d.tex

clean:
	rm *.log *.aux Kaushik.pdf *.out

clean_d:
	rm *.log *.aux Kaushik_d.pdf *.out
