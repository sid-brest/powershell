# & .\script4.ps1 6

[int]$InputNumber = $args[0]

Write-Host
ForEach ($Num in (1..10)) {
    Write-Host "$InputNumber X $Num = $($InputNumber * $Num)"
}
