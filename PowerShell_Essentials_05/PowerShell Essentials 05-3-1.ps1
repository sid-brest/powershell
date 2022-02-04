class Rev {
  
    [string]Reverse([string]$userPhrase) {
        return ([regex]::Matches($userPhrase, '.', 'RightToLeft') | ForEach { $_.value }) -join ''
    }
}
$MyCustomObject = New-Object Rev
$MyCustomObject.Reverse("Nostromo")