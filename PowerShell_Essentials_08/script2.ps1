# & .\script2.ps1 50

$UserInput = $args[0]
[int]$x = 0
[int]$y = 1
Write-Host -NoNewline ($y)
while ($x -lt $UserInput) {
    $y = $x + $y
    $x = $y
    $t;
    $current, $previous = ($current + $previous), $current
    Write-Host -NoNewline (" " + $y)
}
Write-Host -NoNewline ("`n")