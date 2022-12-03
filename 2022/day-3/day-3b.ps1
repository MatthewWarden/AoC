$data = Get-Content .\2022\day-3\input-3.txt

$Total = 0 
$index = 0 

while ($index -lt $data.Length) {

    $SackA = ($data[$index]).ToCharArray()
    $SackB = ($data[$index + 1]).ToCharArray()
    $SackC = ($data[$index + 2]).ToCharArray()

    $Badge = ($SackA | Where-Object { $SackB -ccontains $_ } | Where-Object { $SackC -ccontains $_ } | Select-Object -Unique)

    $Val = [byte][char]$Badge
    if ($Val -ge 97) {
        # Lower case
        $Total += ($Val - 96)
    }
    else {
        
        # Upper case
        $Total += ($val - 38)
    }

    $index += 3
}
$Total
