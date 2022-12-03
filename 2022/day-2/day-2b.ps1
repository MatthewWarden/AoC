$data = Get-Content .\2022\day-2\input-2.txt

function ScoreGame {
    param(
        [char] $playerOne,
        [char] $gameOutcome
    )

    $Score = 0
    
    switch ($gameOutcome) {
        "X" {
            $Score += 0  # Lose
            if ($playerOne -eq "A") { $Score += 3 } # Lose to Rock      = Scissors
            if ($playerOne -eq "B") { $Score += 1 } # Lose to Paper     = Rock
            if ($playerOne -eq "C") { $Score += 2 } # Lose to Scissors  = Paper
        }
        "Y" {
            $Score += 3 # Draw 
            if ($playerOne -eq "A") { $Score += 1 } # Rock
            if ($playerOne -eq "B") { $Score += 2 } # Paper
            if ($playerOne -eq "C") { $Score += 3 } # Scissors
        }
        "Z" { 
            $Score += 6 # Win 
            if ($playerOne -eq "A") { $Score += 2 } # Win to Rock      = Paper
            if ($playerOne -eq "B") { $Score += 3 } # Win to Paper     = Scissors
            if ($playerOne -eq "C") { $Score += 1 } # Win to Scissors  = Rock
        }
    }
    

    return $Score
}

$TotalScore = 0
$data | ForEach-Object {

    $plays = ($_ -split " ")

    $TotalScore += (ScoreGame -playerOne $plays[0] -gameOutcome $plays[1])
}

$TotalScore