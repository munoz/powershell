## Nightly track board task


$computerList = ("CPDTRK1", "edtrk1", "ed2trk1", "ormhtrk1", "ormhtrk2", "ormhtrk3", "pstrk1", 
                 "oroctrk1", "oroctrk2", "oroctrk3", "orwctrk1", "orwctrk2", "pacuwctrk1", "preopoctrk1", "preopwctrk1")

foreach ($e in $computerList){

    Restart-Computer -ComputerName $e -Force
    #Write-Host $e
    
    #[System.Net.Dns]::GetHostbyAddress([System.Net.Dns]::GetHostAddresses($e).IPAddressToString).HostName
    
    #Test-Connection -ComputerName $e -Count 1 -Quiet

    
    }
    
   