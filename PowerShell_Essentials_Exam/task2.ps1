$FilePath = $args[0]
# Create path to accounts_new.csv 
$NewFilePath = $FilePath.replace('accounts.csv','accounts_new.csv')
$ImportCsvData = Import-Csv -Path $FilePath
$NewCsvData = foreach ($Item in $ImportCsvData) {
    # Uppercase first letters in name  
    $Item.name = (Get-Culture).TextInfo.ToTitleCase($Item.name)
    # Prepare email login: lowercase text and split by space  
    $FirstPartLogin,$SecondPartLogin  = $Item.name.Tolower().Split(" ");
    # Create new emails for all users
    $NewEmail = $FirstPartLogin[0] + $SecondPartLogin + $Item.location_id + "@abc.com";
    # Wrire column email with new emails
    $Item.email = $NewEmail
    $Item
}
$NewCsvData | Export-Csv -Path $NewFilePath