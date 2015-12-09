.PHONY: clean
.PHONY: all

all: clean report.pdf

wordcount: ~/Documents/texCount/texcount.pl report.tex
	~/Documents/texCount/texcount.pl report.tex -utf8

report.pdf: report.tex bibliography.bib
	pdflatex $<
	bibtex report.aux
	pdflatex $<
	pdflatex $< #Two runs for references
	$(MAKE) clean

clean:
	rm -f *.aux *.log *.nav *.out *.snm *.toc *.lot *.loc *.bbl *.blg \
*.fdb_* *.gz *.lof *.lol *.tdo *.fls *.synctex.gz
