[String[]]$Computers = @()
#add value to array $Computers += INPUT

$ADGroups = @()
#add value to array $ADGroups += INPUT

[int]$NumOfComputers = 0
[int]$NumOfGroups = 0

$NumOfComputers = Read-Host -Prompt 'How many computers are you working with?'
$NumOfGroups = Read-Host -Prompt 'How many groups are you working with?'

$i = 1
while($i -le $NumOfComputers){
    $Computers += Read-Host -Prompt 'Give me a computer name'; $i++
    }

$i = 1
while($i -le $NumOfGroups){
    $ADGroups += Read-Host -Prompt 'Give me a group name'; $i++
    }

Write-Host $Computers
write-host $ADGroups


#[int]$n = 0

#foreach ($Computer in $Computers)
#{ Add-ADGroupMember -identity $ADGroups[$n] -member $Computer$}

