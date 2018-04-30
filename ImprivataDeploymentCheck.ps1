$ServerName = Import-Csv .\deployment.csv | foreach {"$($_.Hostname)"}

$outArray = @()

foreach ($Server in $ServerName) {

    $results = "" | Select "Host", "Online", "Installed", "Running", "ReaderInstalled"    
    
    $results.Host = $Server  
    Write-Host '============'

    if (test-connection -ComputerName $Server -Count 1 -Quiet ) {
        Write-Host "$Server is Online" -ForegroundColor Green
        $results.Online = "True"
    }
    else {
        Write-Host "$Server is NOT Pinging" -ForegroundColor Yellow
        $results.Online = "False"
        continue
    }

    if (Test-Path \\$Server\C$\'Program Files (x86)\Imprivata\OneSign Agent\x64') {
        Write-Host -NoNewline 'Imprivata Installed' -ForegroundColor Green
        $results.Installed = "True"
        #add catch for get-process
        if (Get-Process -ComputerName $Server "ISXAgeent" -EA SilentlyContinue | Select-Object -ExpandProperty ProcessName ) {
            Write-Host ' and ISXAgent is Running' -ForegroundColor Green
            $results.Running = "True"
        }
        else {
            Write-Host ' but ISXAgent is Not Running' -ForegroundColor Yellow
            $results.Running = "False"
        }
    
    }
    else {
        Write-Host 'Imprivata is NOT installed' -ForegroundColor Yellow
        $results.Installed = "False"
        }
        
    $RFIDeas = Get-WmiObject -computername $Server -class Win32_PnPEntity | where {$_.deviceid -like "usb\vid_0C27*"} | Select-Object -ExpandProperty deviceid
          
    if (Get-WmiObject -computername $Server -class Win32_PnPEntity | where {$_.deviceid -like "usb\vid_0C27*"} | Select-Object -ExpandProperty deviceid) {
        Write-Host 'RFIDeas Badge Reader IS Connected' -ForegroundColor Green
        $results.ReaderInstalled = "True"
    }
    else {
        Write-Host 'RFIDeas Badge Reader Not Connected' -ForegroundColor Yellow
        $results.ReaderInstalled = "False"
    }

    Write-Host '============'      
    
    $outArray += $results

    $results = $null
}

$outArray | Export-Csv "DeploymentResults.csv"
