PDFC=pdflatex
BIBTEX=bibtex
MAKEINDEX=makeindex

RELATORIONAME=relatorio

AUXILIARTEX=texbase.tex

hell:
	@$(PDFC) $(RELATORIONAME).tex
	@$(BIBTEX) $(RELATORIONAME).aux
	@$(PDFC) $(RELATORIONAME).tex
	@$(PDFC) $(RELATORIONAME).tex

folderup: hell
	@cp $(RELATORIONAME).pdf ..

.PHONY: clean
	
clean:
	rm -f $(RELATORIONAME).aux
	rm -f $(RELATORIONAME).log
	rm -f $(RELATORIONAME).pdf
	rm -f *~
	rm -f ../$(RELATORIONAME).pdf
	rm -f *.bbl
	rm -f *.blg
	rm -f *.orig
