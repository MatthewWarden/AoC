$data = Get-Content .\2022\day-2\input-2.txt

function ScoreGame
{
    param(
        [char] $playerOne,
        [char] $playerTwo
    )

    $Score = 0
    
    switch ($PlayerTwo) {
        "X" { $Score += 1  }
        "Y" { $Score += 2  }
        "Z" { $Score += 3  }
    }
    
    # Win conditions
    if(($playerTwo -eq "Y") -and ($playerOne -eq "A")){$Score += 6}
    if(($playerTwo -eq "Z") -and ($playerOne -eq "B")){$Score += 6}
    if(($playerTwo -eq "X") -and ($playerOne -eq "C")){$Score += 6}

    # Draw conditions
    if(($playerOne -eq "A") -and ($playerTwo -eq "X")){$Score += 3}
    if(($playerOne -eq "B") -and ($playerTwo -eq "Y")){$Score += 3}
    if(($playerOne -eq "C") -and ($playerTwo -eq "Z")){$Score += 3}

    return $Score
}

$TotalScore = 0
$data | ForEach-Object {

    $plays = ($_ -split " ")

    $TotalScore += (ScoreGame -playerOne $plays[0] -playerTwo $plays[1])
}

$TotalScore