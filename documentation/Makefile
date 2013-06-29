PDFC=pdflatex
BIBTEX=bibtex
MAKEINDEX=makeindex

RELATORIONAME=relatorio
RESULTADOSNAME=resultados

AUXILIARTEX=texbase.tex

all: hell result
	
hell:
	@$(PDFC) $(RELATORIONAME).tex
	@$(BIBTEX) $(RELATORIONAME).aux
	@$(PDFC) $(RELATORIONAME).tex
	@$(PDFC) $(RELATORIONAME).tex

result:
	@$(PDFC) $(RESULTADOSNAME).tex

folderup: all
	@cp $(RELATORIONAME).pdf ..
	@cp $(RESULTADOSNAME).pdf ..

.PHONY: clean
	
clean:
	rm -f .aux
	rm -f .log
	rm -f .pdf
	rm -f *~
	rm -f ../$(RELATORIONAME).pdf
	rm -f ../$(RESULTADOSNAME).pdf
	rm -f *.bbl
	rm -f *.blg
	rm -f *.orig
