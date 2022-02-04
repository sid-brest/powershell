# .\task1.ps1 "A Balrog is a powerful fictional monster in Middle-earth"
# .\task1.ps1 "The symbol underscore, also called low_line or low dash."

#write argument into variable
$UserInput = $args[0]
#use search pattern
$InputMatch = '\w*[_-]\w*'
#use regular expression for matching input with pattern
$Match = [regex]::Matches($UserInput, $InputMatch).Value
Write-Host($Match)