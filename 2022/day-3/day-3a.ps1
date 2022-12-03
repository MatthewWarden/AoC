$data = Get-Content .\2022\day-3\input-3.txt

$Total = 0 

$data | ForEach-Object {

    $Half = $_.length / 2
    $ArrA = $_[0..($Half - 1)]
    $ArrB = $_[$Half..$_.length]

    ($ArrA | Where-Object { $arrB -ccontains $_ }) | Select-Object -unique |  ForEach-Object {

        $Val = [byte][char]$_
        if ($Val -ge 97) {
            # Lower case
            $Total += ($Val - 96)
        }
        else {
            
            # Upper case
            $Total += ($val - 38)
        }
    }
}
$Total