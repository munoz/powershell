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

#C:\Users\pmunoz\Downloads\90Day-Users-LastLoginBefore10.25.16-Created1-20-17.xlsx Col. "User"

#add option to save report location
#output report as csv

New-Item C:\Users\$env:UserName\Desktop\ImprivataCleanUpReport1.txt -Type file
$csvFile = Get-FileName "C:\"
$users = Import-Csv $csvFile | % {$_.User}

$imp = Get-ADGroupMember -Identity "imprivata-grp" -Recursive | Select -ExpandProperty SamAccountName
$imp1 = Get-ADGroupMember -Identity "Imprivata1-grp" -Recursive | Select -ExpandProperty SamAccountName
$imp2 = Get-ADGroupMember -Identity "Imprivata2-grp" -Recursive | Select -ExpandProperty SamAccountName


ForEach ($user in $users) {
    If ($imp -contains $user) {
        Remove-ADGroupMember -Identity "imprivata-grp" -Members $user -confirm:$false
        "$user removed from imprivata-grp" >> C:\Users\$env:Username\Desktop\ImprivataCleanUpReport1.txt
    }
    ElseIf ($imp1 -contains $user) {
        Remove-ADGroupMember -Identity "Imprivata1-grp" -Members $user -confirm:$false
        "$user removed from Imprivata1-grp" >> C:\Users\$env:Username\Desktop\ImprivataCleanUpReport1.txt
    } 
    ElseIf ($imp2 -contains $user) {
        Remove-ADGroupMember -Identity "Imprivata2-grp" -Members $user -confirm:$false
        "$user removed from Imprivata2-grp" >> C:\Users\$env:Username\Desktop\ImprivataCleanUpReport1.txt
    }
    Else {
        "$user does not exists in groups" >> C:\Users\$env:Username\Desktop\ImprivataCleanUpReport1.txt
    }
}
