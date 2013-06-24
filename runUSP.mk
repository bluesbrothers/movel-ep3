runUsp: runUSPProphet runUSPMaxProp runUSPSprayAndPray runUSPEpidemic runUSPFirstContact runUSPDirectDelivery
	

runUSPProphet:
	cd one_1.4.1; ./one.sh -b 1 ../cenarios/USP/cenario_Prophet.txt
runUSPMaxProp:
	cd one_1.4.1; ./one.sh -b 1 ../cenarios/USP/cenario_MaxProp.txt
runUSPSprayAndPray:
	cd one_1.4.1; ./one.sh -b 1 ../cenarios/USP/cenario_SprayAndWait.txt
runUSPEpidemic:
	cd one_1.4.1; ./one.sh -b 1 ../cenarios/USP/cenario_Epidemic.txt
runUSPFirstContact:
	cd one_1.4.1; ./one.sh -b 1 ../cenarios/USP/cenario_FirstContact.txt
runUSPDirectDelivery:
	cd one_1.4.1; ./one.sh -b 1 ../cenarios/USP/cenario_DirectDelivery.txt