param(
    $Path, 
    $SoulStone = $false, # creates a recovery folder to save the files
    $Ratio = 0.5, # how many to kill (0.1 means 90% will survive)
    $Resolution = 1000, 
    $Silent = $false, # if you hate fun
    $StrictRatio = $false # doesn't allow script to kill more than the ratio
)

$passingNum = $Ratio * $Resolution


$files = Get-ChildItem -Path $Path -File | ForEach-Object { $_.FullName }
if ($files.Count -eq 0) {
    Write-Output "No files found"
    exit
}

$maxKillCount = $Ratio * $files.Count

$recoveryPath = Join-Path -Path $Path -ChildPath "recovery"

if ($SoulStone) {
    mkdir $recoveryPath -Force | Out-Null
}

$killCount = 0
foreach ($file in $files) {
    $randomNumber = Get-Random -Maximum $Resolution

    if ($StrictRatio -and ($killCount -lt $maxKillCount)) {
        break
    }

    if ($randomNumber -lt $passingNum) {
        # ded
        if ($SoulStone) {   
            Move-Item -Path $file -Destination $recoveryPath
        }
        else {
            Remove-Item -Path $file -Force
        }
        $killCount += 1
    }
}

if (!$Silent) {
    $quotes = @(
        "You should have gone for the head.",
        "Fun isn't something one considers when balancing the universe. But this... does put a smile on my face.",
        "You have my respect, Stark. When I'm done, half of humanity will still be alive. I hope they remember you.",
        "Fine. I'll do it myself.",
        "I ignored my destiny once, I can not do that again. Even for you. I'm sorry, Little One.",
        "I finally rest. And watch the sun rise on a grateful universe. The hardest choices require the strongest wills.",
        "It was. And it was beautiful. Titan was like most planets. Too many mouths, not enough to go around. And when we faced extinction, I offered a solution.",
        "What did it cost? - Everything.",
        "Ah... thank you, daughter. Perhaps I treated you too harshly...",
        "I used the stones to destroy the stones. It nearly killed me, but the work is done. It always will be. I am...inevitable."
    )
    $quote = Get-Random -InputObject $quotes
    Write-Output $quote
}
