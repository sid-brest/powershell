# .\task2.ps1 "Ents or talking trees are derived from the Old English word for giant"

#write argument into variable
$UserInput = $args[0]
#use search pattern, match one word from the end
$InputMatch = '(\w+)$'
#use regular expression for matching input with pattern
$Match = [regex]::Matches($UserInput, $InputMatch).Value
Write-Host($Match)