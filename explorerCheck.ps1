$computers = Import-Csv C:\Users\s0210478\Desktop\uptimeList.csv | foreach {"$($_.host)"}

$outArray = @()

foreach ($computer in $computers) {

    $results = "" | Select "Host", "uptime", "lastBoot", "lastUserLogin", "explorerStart"    
    
    $results.Host = $computer  
    Write-Host '============'

    if (test-connection -ComputerName $computer -Count 1 -Quiet ) {
        Write-Host "$computer is Online" -ForegroundColor Green
       
    }
    else {
        Write-Host "$computer is NOT Pinging" -ForegroundColor Yellow
        #$results.Online = "False"
        continue
    }

    $uptime = Get-Uptime -computerName $computer
    $results.lastBoot = $uptime.LastBootTime
    $results.uptime = $uptime.Uptime
    $results.explorerStart = Get-WmiObject Win32_Process -Filter "Name like 'explorer.exe'" | foreach-Object{[System.Management.ManagementDateTimeConverter]::ToDateTime($_.CreationDate)}

    Write-Host '============'      
    
    $outArray += $results
    $uptime = $null
    $results = $null
}

$outArray | Export-Csv "uptimeResults.csv"
