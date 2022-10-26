$FilePath = $args[0]
# Create path to accounts_new.csv 
$NewFilePath = $FilePath.replace('accounts.csv', 'accounts_new.csv')
$ImportCsvData = Import-Csv -Path $FilePath
$NewCsvData = foreach ($Item in $ImportCsvData) {
    # Uppercase first letters in name  
    $Item.name = (Get-Culture).TextInfo.ToTitleCase($Item.name)
    # Prepare email login: lowercase text and split by space  
    $FirstPartLogin, $SecondPartLogin = $Item.name.Tolower().Split(" ");
    # Create new emails for all users
    $NewEmail = $FirstPartLogin[0] + $SecondPartLogin;
    # $NewEmail = $FirstPartLogin[0] + $SecondPartLogin + $Item.location_id + "@abc.com";
    # Wrire column email with new emails
    $Item.email = $NewEmail
    $Item
}

$NewCsvData | Group-Object -Property email | Where-Object count -gt 1 | 
Select-Object -ExpandProperty group -outvariable Duplicates | Out-Null  
$NewCsvData | Group-Object -Property email | Where-Object count -eq 1 | 
Select-Object -ExpandProperty group -outvariable NoDuplicates | Out-Null
$DuplicatesWithEmail = foreach ($Item in $Duplicates) {
    $Item.email = $Item.email + $Item.location_id + "@abc.com"
    $Item
}
$NoDuplicatesWithEmail = foreach ($Item in $NoDuplicates) {
    $Item.email = $Item.email + "@abc.com"
    $Item
}

$DuplicatesWithEmail + $NoDuplicatesWithEmail | Sort-Object {[int]$_.id}| Export-Csv -Path $NewFilePath
