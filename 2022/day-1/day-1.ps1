$data = get-content -path '.\2022\day-1\input-1.txt'

$AllElves = @()

$ThisElf = 0 
$data | foreach-object {

    $Value = [int]$_
    $ThisElf += $Value
    
    if ($Value -eq 0) {

        $AllElves += $ThisElf
    }
    
}
($Elves | Measure-Object -Maximum).Maximum
($Elves | Sort-Object -Descending | Select-Object -first 3 | Measure-Object -Sum).sum
