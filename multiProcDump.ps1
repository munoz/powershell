#This creates a dump file for each process named iexplore

$ids = Get-Process -Name iexplore | Select -ExpandProperty Id

workflow processDump {
    param ([string[]]$ids)

    foreach -parallel ($id in $ids) {
        Invoke-Expression 'C:\Utils\procdump64.exe -ma $id -accepteula "C:\Utils\Dumps\$($id).dmp"' 
    }
    
}

processDump -ids $ids
	
