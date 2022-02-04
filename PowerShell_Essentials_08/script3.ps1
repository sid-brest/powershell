# & .\script3.ps1 10

$HumanAge = $args[0]
if ($HumanAge -le 2) {
    for ($i = 1; $i -le $HumanAge; $i++) {
        $DogAge = $i * 10.5
        Write-Host -NoNewline (" " + [float]$DogAge)
    }
}
if ($HumanAge -gt 2) {
    Write-Host -NoNewline (" 10.5 21")
    for ($i = 3; $i -le $HumanAge; $i++) {
        $DogAge = 21 + ($i - 2) * 4
        Write-Host -NoNewline (" " + [float]$DogAge)
    }
}
Write-Host -NoNewline ("`n")