# & .\script1.ps1 60C

$UserInput = $args[0]
if ($UserInput -match "C") {

    [int]$CelsiusInput = $UserInput -replace '[a-zA-Z]'
    $CelsiusOutput = ($CelsiusInput * 9 / 5) + 32
    Write-Host($UserInput + " is " + [int]$CelsiusOutput + " in Fahrenheit")
}
if ($UserInput -match "F") {

    [int]$FarenheitInput = $UserInput -replace '[a-zA-Z]'
    $FarenheitOutput = ($FarenheitInput - 32) * 5 / 9
    Write-Host($UserInput + " is " + [Int]$FarenheitOutput + " in Celsius")
}