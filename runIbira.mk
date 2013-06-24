runIbira: runIbiraProphet runIbiraMaxProp runIbiraSprayAndPray runIbiraEpidemic runIbiraFirstContact runIbiraDirectDelivery
	

runIbiraProphet:
	cd one_1.4.1; ./one.sh -b 1 ../cenarios/ParqueIbirapuera/cenario_Prophet.txt
runIbiraMaxProp:
	cd one_1.4.1; ./one.sh -b 1 ../cenarios/ParqueIbirapuera/cenario_MaxProp.txt
runIbiraSprayAndPray:
	cd one_1.4.1; ./one.sh -b 1 ../cenarios/ParqueIbirapuera/cenario_SprayAndWait.txt
runIbiraEpidemic:
	cd one_1.4.1; ./one.sh -b 1 ../cenarios/ParqueIbirapuera/cenario_Epidemic.txt
runIbiraFirstContact:
	cd one_1.4.1; ./one.sh -b 1 ../cenarios/ParqueIbirapuera/cenario_FirstContact.txt
runIbiraDirectDelivery:
	cd one_1.4.1; ./one.sh -b 1 ../cenarios/ParqueIbirapuera/cenario_DirectDelivery.txt