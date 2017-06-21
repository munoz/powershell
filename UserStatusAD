Import-Module ActiveDirectory

Function Get-FileName($initialDirectory)
{
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
    
    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.initialDirectory = $initialDirectory
    $OpenFileDialog.filter = "CSV (*.csv)| *.csv"
    $OpenFileDialog.ShowDialog() | Out-Null
    $OpenFileDialog.filename
}

$csvFile = Get-FileName "C:\"

$users = Import-Csv $csvFile | foreach {"$($_.User)"}

$outarray = @()

foreach ($user in $users) {
    $userObj = "" | Select "User", "Enabled"

    $userObj.User =  $user
    $userObj.Enabled = (get-aduser -Identity $user | select -ExpandProperty enabled)

    $outarray += $userObj

    $userObj = $null
    }

$outarray | Export-Csv "UserStatusAD.csv"
