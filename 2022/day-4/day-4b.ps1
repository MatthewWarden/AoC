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

    $LenA = [int]($uboundA-$lboundA) + 1
    $LenB = [int]($uboundB-$lboundB) + 1

        $ValuesA = @(0..($lenA -1))
        $ValuesB = @(0..($lenB -1))
    
        for($i=0;$i -lt ($LenA);$I++)
        {
            $ValuesA[$i] = ($lBoundA + $i )
        }
        for($i=0;$i -lt ($LenB);$I++)
        {
            $ValuesB[$i] = ($lBoundB + $i )
        }

        if((($ValuesA + $Valuesb) | group |  measure -Property count -Maximum).Maximum -gt 1) {$Overlaps += 1}
        
    }

$Overlaps