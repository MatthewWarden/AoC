$data = Get-Content .\2022\day-4\input-4.txt

$Overlaps =0
$Duplicates=0
$data | ForEach-Object {


    $ArrA = ($_ -split ",")[0]
    $lboundA = [int]($ArrA -split "-")[0]
    $uBoundA = [int]($ArrA -split "-")[1]
    
    $ArrB = ($_ -split ",")[1]
    $lBoundB = [int]($ArrB -split "-")[0]
    $uBoundB = [int]($ArrB -split "-")[1]

    if(($lBoundA -ge $lboundB) -and ($uBoundA -le $uBoundB)){
         $Overlaps +=1
        }
    if(($lBoundB -ge $lboundA) -and ($uBoundB -le $uBoundA)){ 
        $Overlaps +=1
    }
    if(($lBoundB -eq $lboundA) -and ($uBoundB -eq $uBoundA))
    {
        $Duplicates += 1    # Shameful
    }
}

$Overlaps -$Duplicates