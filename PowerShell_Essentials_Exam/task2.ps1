$FilePath = $args[0]
# Create path to accounts_new.csv 
$NewFilePath = $FilePath.replace('.csv', '_new.csv')
$ImportCsvData = Import-Csv -Path $FilePath
$NewCsvData = foreach ($Item in $ImportCsvData) {
    # Uppercase first letters in name  
    $Item.name = (Get-Culture).TextInfo.ToTitleCase($Item.name)
    # Prepare email login: lowercase text and split by space  
    $FirstPartLogin, $SecondPartLogin = $Item.name.Tolower().Split(" ");
    # Create new email login name for all users
    $NewEmail = $FirstPartLogin[0] + $SecondPartLogin;
    # Wrire column email with new email login
    $Item.email = $NewEmail
    $Item
}
# Filter duplicates from from email logins and export to variable
$NewCsvData | Group-Object -Property email | Where-Object count -gt 1 | 
Select-Object -ExpandProperty group -outvariable Duplicates | Out-Null  
# Filter non-duplicates from from email logins and export to variable
$NewCsvData | Group-Object -Property email | Where-Object count -eq 1 | 
Select-Object -ExpandProperty group -outvariable NoDuplicates | Out-Null
# Add domain name for c email with location id
$DuplicatesWithEmail = foreach ($Item in $Duplicates) {
    $Item.email = $Item.email + $Item.location_id + "@abc.com"
    $Item
}
# Add domain name for non-duplicates email
$NoDuplicatesWithEmail = foreach ($Item in $NoDuplicates) {
    $Item.email = $Item.email + "@abc.com"
    $Item
}
# Сonnect non-duplicates & non-duplicates & sort by id & export to csv
$DuplicatesWithEmail + $NoDuplicatesWithEmail | Sort-Object {[int]$_.id}| Export-Csv -Path $NewFilePath
# $DuplicatesWithEmail + $NoDuplicatesWithEmail | Sort-Object {[int]$_.id} | ConvertTo-Csv -NoTypeInformation -Delimiter ';'| ForEach-Object {$_.Replace('"','')} | Out-File -FilePath $NewFilePath