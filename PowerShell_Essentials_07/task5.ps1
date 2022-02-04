#.\task5.ps1 "Tue Sep 15 2020 15:39:48 GMT+0300 (Belarus Local Time)"

#write argument into variable
$UserInput = $args[0]

#match a word at least 6 characters long in a string
$InputMatch = '\b(\w{6,})\b'

#use regular expression for matching input with pattern
$Match = [regex]::Matches($UserInput, $InputMatch).Value
Write-Host($Match)