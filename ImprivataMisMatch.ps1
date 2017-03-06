
#kiosk policy but single agent
#Import-Csv .\ComputerDetails.csv | Where-Object {$_."Policy Name" -like "*kiosk*" -and $_."Agent Type" -like "*single*"} | export-csv .\singleAgentWithKioskPol.csv

#single policy with kiosk agent
#Import-Csv .\ComputerDetails.csv | Where-Object {$_."Policy Name" -like "*single*" -and $_."Agent Type" -like "*kiosk*"} | export-csv .\kioskAgentWithSinglePol.csv

#Bedside PCs with Single Agent
#Import-Csv .\ComputerDetails.csv | Where-Object {$_."Host" -like "*bed*" -and $_."Agent Type" -like "*single*"} | export-csv .\bedsideWithSingleAgent.csv

#Nurse station PCs with Single Agent
#Import-Csv .\ComputerDetails.csv | Where-Object {$_."Host" -like "*nur*" -and $_."Agent Type" -like "*single*"} | export-csv .\nurseWithSingleAgent.csv

#All Single Policy computers
#Import-Csv .\ComputerDetails.csv | Where-Object {$_."Policy Name" -like "std. single*" -and $_."Agent Type" -like "*single*"} | export-csv .\singlePolicyComputers.csv

Import-csv .\AllKiosk.csv | Where-Object {$_."Host" -like "Audio*"} | Export-Csv .\kiosk\audio.csv
Import-csv .\AllKiosk.csv | Where-Object {$_."Host" -like "CRANIO*"} | Export-Csv .\kiosk\CRANIO.csv
Import-csv .\AllKiosk.csv | Where-Object {$_."Host" -like "ENT*"} | Export-Csv .\kiosk\ENT.csv
Import-csv .\AllKiosk.csv | Where-Object {$_."Host" -like "GASTRO*"} | Export-Csv .\kiosk\GASTRO.csv
Import-csv .\AllKiosk.csv | Where-Object {$_."Host" -like "INFEC*"} | Export-Csv .\kiosk\INFEC.csv
Import-csv .\AllKiosk.csv | Where-Object {$_."Host" -like "MEDSURGSUB*"} | Export-Csv .\kiosk\MEDSURGSUB.csv
Import-csv .\AllKiosk.csv | Where-Object {$_."Host" -like "NEPHRO*"} | Export-Csv .\kiosk\NEPHRO.csv
Import-csv .\AllKiosk.csv | Where-Object {$_."Host" -like "NEUROSURG*"} | Export-Csv .\kiosk\NEUROSURG.csv
#Import-csv .\singlePolicyComputers.csv | Where-Object {$_."Host" -like "PMMG*"} | Export-Csv .\PMMG.csv
Import-csv .\AllKiosk.csv | Where-Object {$_."Host" -like "Psa*"} | Export-Csv .\kiosk\Psa.csv
Import-csv .\AllKiosk.csv | Where-Object {$_."Host" -like "Pulmo*"} | Export-Csv .\kiosk\Pulmo.csv