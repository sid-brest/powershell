class Rev {
    $TempArray
    Reverse([string]$userPhrase) {
        $this.TempArray = $userPhrase.ToCharArray()
        [array]::Reverse($this.TempArray)
        Write-Host ($this.TempArray -join "")
    }
}
$MyCustomObject = New-Object Rev
$MyCustomObject.Reverse("Nostromo")