LECT=ocaml-intro-ag

all:
	latexmk -c
	latexmk -pdf -ps- -dvi- -recorder -shell-escape  -jobname=$(LECT)-talk $(LECT).tex

pub: FORCE
	touch $(LECT).tex
	latexmk -pdf -pdflatex='pdflatex %O -interaction=nonstopmode -synctex=1 "\PassOptionsToClass{handout}{beamer}\input{%S}"'  -ps- -dvi- -recorder -shell-escape $(LECT).tex

both: all pub

clean:
#	latexmk -c
	rm -f *.snm *.nav *.vrb *.synctex.gz *.aux *.fdb_latexmk *.log *.toc *.aux *.out *.fls

FORCE:
