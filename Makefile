include names.mk
include runUSP.mk
include runEstacionamento.mk
include runIbira.mk
include runCentroSP.mk

alo:
	@echo "Diga a role exata a ser executada entre 'pdf', 'runtests', 'parsereports', 'entrega', 'clearreports', 'clean'"

parsereports:
	@echo parsing reports...
	@./parseReports.py one_1.4.1/reports/ documentation/reportsparsed.tex

pdf: parsereports
	@cd $(DOCDIR); make folderup

$(ENTREGADIR):
	@if [ ! -d $(ENTREGADIR) ]; then echo "criando diretorio novo '$(ENTREGADIR)'"; mkdir $(ENTREGADIR); fi

clearreports:
	@echo "limpando pasta de reports"
	@rm -f $(REPORTSDIR)/*
	@if [ ! -d $(REPORTSDIR) ]; then echo "criando diretorio novo '$(ENTREGaDIR)'"; mkdir $(REPORTSDIR); fi

clearandrun:
	$(MAKE) clearreports
	$(MAKE) runAllTests

runAllTests: runUsp runEstacionamento runIbira runCentroSP
	@echo "Concluido"


parsereports:
	./parseReports.py one_1.4.1/reports documentation/reportsparsed.tex

entrega: $(ENTREGADIR) pdf
	@echo "Criando pacote de entrega '$(ENTREGATAR)'"
	@cp relatorio.pdf $(ENTREGADIR)
	@cp -r $(REPORTSDIR) $(ENTREGADIR)
	@cp README $(ENTREGADIR)
	@tar $(TARFLAGS) $(ENTREGATAR) $(ENTREGADIR)
	@rm -rf $(ENTREGADIR)

.PHONY: clean
clean:
	rm -rf $(ENTREGATAR)
	@cd $(DOCDIR); make clean
