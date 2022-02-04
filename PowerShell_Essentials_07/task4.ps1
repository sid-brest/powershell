# .\task4.ps1 "09-17-1991"

#write argument into variable
$UserInput = $args[0]

#split userinput
$InputSplit = $UserInput -split '-'

#replace days & months
$NewDate = ($InputSplit[1] + "-" + $InputSplit[0] + "-" + $InputSplit[2])

Write-Host($NewDate)
