# .\task3.ps1 "Reply from 10.8.216.77: bytes=32 time<1ms TTL=128"

#write argument into variable
$UserInput = $args[0]

#match a number between 0-9 that is 1 to 3 digits
$InputMatch = '([0-9]{1,3}\.){3}[0-9]{1,3}'

#use regular expression for matching input with pattern
$Match = [regex]::Matches($UserInput, $InputMatch).Value
Write-Host($Match)