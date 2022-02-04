$inputString1 = "the-stealth-warrior"
$inputString2 = "The_Stealth_Warrior"

#replace not alphabetic strings with "space" symbol
$ToPascal = $inputString1 -Replace '[^A-Z]', ' '

#convert strings to Pascal title case and remove "space" symbol
(Get-Culture).TextInfo.ToTitleCase($ToPascal) -Replace ' '

#replace not alphabetic strings with "space" symbol, split user input into 2 variables
$FirstWord, $LastPart = $inputString2 -Replace '[^A-Z]', ' ' -Split ' ', 2

#convert strings to Camel title case
$FirstWord.Tolower() + (Get-Culture).TextInfo.ToTitleCase($LastPart) -Replace ' '