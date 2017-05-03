Import-Module ActiveDirectory

$computers = Import-Csv .\VC-Imprivata_All_Computers.csv | foreach {"$($_.Host)"}

foreach ($comp in $computers){
    Write-host -NoNewline "$comp, "
    try{
        write-host  (Get-ADComputer -Identity $comp -Properties Description | select -ExpandProperty Description)
        }
    catch{
        Write-Host  "Not found in AD"
        
        } 
}
