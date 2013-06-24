runCentroSP: runCentroSPProphet runCentroSPMaxProp runCentroSPSprayAndPray runCentroSPEpidemic runCentroSPFirstContact runCentroSPDirectDelivery
	

runCentroSPProphet:
	cd one_1.4.1; ./one.sh -b 1 ../cenarios/CentroSP/cenario_Prophet.txt
runCentroSPMaxProp:
	cd one_1.4.1; ./one.sh -b 1 ../cenarios/CentroSP/cenario_MaxProp.txt
runCentroSPSprayAndPray:
	cd one_1.4.1; ./one.sh -b 1 ../cenarios/CentroSP/cenario_SprayAndWait.txt
runCentroSPEpidemic:
	cd one_1.4.1; ./one.sh -b 1 ../cenarios/CentroSP/cenario_Epidemic.txt
runCentroSPFirstContact:
	cd one_1.4.1; ./one.sh -b 1 ../cenarios/CentroSP/cenario_FirstContact.txt
runCentroSPDirectDelivery:
	cd one_1.4.1; ./one.sh -b 1 ../cenarios/CentroSP/cenario_DirectDelivery.txt