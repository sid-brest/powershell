$text = (Get-Content -Path .\TextExample.txt -Raw).ToLower()
$GroupByLetter = -split $text -replace '[^a-z]' | Sort-Object | Select-Object -Unique | 
Group-Object { 
    if ($_.Length -gt 1) {
        $_.Substring(0, 1).ToUpper() 
    }
}
foreach ($letter in $GroupByLetter) {
    if ($letter.Name -ne "") {
        Set-Content -Path (".\Output11_2\" + $letter.Name + ".txt") -Value $letter.Group
    }
}