

$KRONOS = 0

$PRD = 0
$SBX = 0
$SUP = 0
$DOWNTIME = 0 #'DOWN TIME - System Read Only'

$ACE = 0

$ISITE = 0

$SOFT = 0
#$SoftIDtxPCLIVE = 0 #'SoftIDtxPC LIVE@CHO' 
#$SoftIDPCLive = 0 #'SoftIDPC LIVE@CHO'
#$SoftIDPCTEST = 0 #'SoftIDPC TEST@CHO'
#$SoftLabMic = 0 #'SoftLabMic LIVE@CHO'

$OTHERS = 0
$ICATOTAL = 0

#sets array with all User (computer name) folders
$computer = Get-ChildItem n:\___ICADUMP\ | 
       Where-Object {$_.PSIsContainer} | 
       Foreach-Object {$_.Name}

#searches ICAs in each folder for PRD, sets array for each
foreach ($value in $computer)
    {
        $ICAfile = Get-ChildItem n:\___ICADUMP\$value\ |  
        Foreach-Object {$_.fullName}

               foreach($value1 in $ICAfile)
            {
                #running count of ICA files
                $ICATOTAL++

                if(get-content -path $value1 | Select-String -pattern "prd")
                {
                    $PRD++  
                }
                elseif(get-content -path $value1 | Select-String -pattern "kronos")
                {
                    $KRONOS++    
                }
                 elseif(get-content -path $value1 | Select-String -pattern "sup")
                {
                    $SUP++    
                }
                 elseif(get-content -path $value1 | Select-String -pattern "sbx")
                {
                    $SBX++    
                }
                 elseif(get-content -path $value1 | Select-String -pattern "Down")
                {
                    $DOWNTIME++    
                }
                 elseif(get-content -path $value1 | Select-String -pattern "ace")
                {
                    $ACE++    
                }
                 elseif(get-content -path $value1 | Select-String -pattern "soft")
                {
                    $SOFT++    
                }
                 elseif(get-content -path $value1 | Select-String -pattern "isite")
                {
                    $ISITE++    
                }
                else
                {
                    $OTHERS++
                }

            }
                         
    }
 
 write-host "Total ICA = " $ICATOTAL      
 write-host "PRD = " $PRD
 write-host "SUP = " $SUP
 write-host "SBX = " $SBX
 write-host "DownTime = " $DOWNTIME
 write-host "KRONOS = " $KRONOS
 write-host "Ace = " $ACE
 write-host "Soft = " $SOFT
 write-host "iSite = " $ISITE
 write-host "OTHERS = " $OTHERS