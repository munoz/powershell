## This script is used to enable/disable RDP for computers that cannot be accessed via Zenworks
## Enable RDP -Value 0; Disable RDP -Value=1

param([Parameter(Mandatory=$true)][Int32]$mode, [Parameter(Mandatory=$true)][string]$hostname)
try {

    if($mode -eq 1) {
        Invoke-Command -ComputerName $hostname -ScriptBlock {set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -Value 1}
    }
    
    if($mode -eq 0) {
        Invoke-Command -ComputerName $hostname -ScriptBlock {set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -Value 0}
    }
    
}
catch {
        Write-Host "Input '-mode 0' to enable RDP or '-mode 1' to disable RDP." -ForegroundColor Red
    }
