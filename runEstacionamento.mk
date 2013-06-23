runEstacionamento: runEstacionamentoProphet runEstacionamentoMaxProp runEstacionamentoSprayAndPray runEstacionamentoEpidemic runEstacionamentoFirstContact runEstacionamentoDirectDelivery
	

runEstacionamentoProphet:
	cd one_1.4.1; ./one.sh -b 1 ../cenarios/Estacionamento/cenario_Prophet.txt
runEstacionamentoMaxProp:
	cd one_1.4.1; ./one.sh -b 1 ../cenarios/Estacionamento/cenario_MaxProp.txt
runEstacionamentoSprayAndPray:
	cd one_1.4.1; ./one.sh -b 1 ../cenarios/Estacionamento/cenario_SprayAndWait.txt
runEstacionamentoEpidemic:
	cd one_1.4.1; ./one.sh -b 1 ../cenarios/Estacionamento/cenario_Epidemic.txt
runEstacionamentoFirstContact:
	cd one_1.4.1; ./one.sh -b 1 ../cenarios/Estacionamento/cenario_FirstContact.txt
runEstacionamentoDirectDelivery:
	cd one_1.4.1; ./one.sh -b 1 ../cenarios/Estacionamento/cenario_DirectDelivery.txt