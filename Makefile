include names.mk

alo:
	@echo "Diga a role exata a ser executada entre 'pdf', 'runtests', 'entrega', 'clearreports', 'clean'"

pdf:
	@cd $(DOCDIR); make folderup

$(ENTREGADIR):
	@if [ ! -d $(ENTREGADIR) ]; then echo "criando diretorio novo '$(ENTREGADIR)'"; mkdir $(ENTREGADIR); fi

clearreports:
	@echo "limpando pasta de reports"
	@rm -f $(REPORTSDIR)/*
	@if [ ! -d $(REPORTSDIR) ]; then echo "criando diretorio novo '$(ENTREGaDIR)'"; mkdir $(REPORTSDIR); fi

runtests: clearreports
	@echo "Rodando as simuações"

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
