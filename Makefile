include names.mk
include runUSP.mk
include runEstacionamento.mk
include runIbira.mk
include runCentroSP.mk

alo:
	@echo "Diga a role exata a ser executada entre 'pdf', 'runAllTests', 'parsereports', 'entrega', 'clearreports', 'clean'"

parsereports:
	@echo parsing reports...
	@./parseReports.py one_1.4.1/reports/ documentation/

pdf: parsereports
	@cd $(DOCDIR); make folderup

$(ENTREGADIR):
	@if [ ! -d $(ENTREGADIR) ]; then echo "criando diretorio novo '$(ENTREGADIR)'"; mkdir $(ENTREGADIR); fi

clearreports:
	@echo "limpando pasta de reports"
	@rm -f $(REPORTSDIR)/*
	@if [ ! -d $(REPORTSDIR) ]; then echo "criando diretorio novo '$(ENTREGADIR)'"; mkdir $(REPORTSDIR); fi

clearandrun:
	$(MAKE) clearreports
	$(MAKE) runAllTests

runAllTests: runUsp runEstacionamento runIbira runCentroSP
	@echo "Concluido"

entrega: $(ENTREGADIR) pdf
	@echo "Criando pacote de entrega '$(ENTREGATAR)'"
	@cp relatorio.pdf $(ENTREGADIR)
	@cp resultados.pdf $(ENTREGADIR)
	@cp -r $(ONEDIR) $(ENTREGADIR)
	@cp -r $(CENARIOSDIR) $(ENTREGADIR)
	@cp Makefile $(ENTREGADIR)
	@cp *.mk $(ENTREGADIR)
	@cp README $(ENTREGADIR)
	@tar $(TARFLAGS) $(ENTREGATAR) $(ENTREGADIR)
	@rm -rf $(ENTREGADIR)

.PHONY: clean
clean:
	rm -rf $(ENTREGATAR)
	@cd $(DOCDIR); make clean
