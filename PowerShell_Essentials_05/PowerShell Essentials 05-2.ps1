class Print {
    [string]$StringtoSomething

    SetString([string]$user_input) {
        $this.StringtoSomething = $user_input
    }

    PrintString() {
        Write-Host($this.StringtoSomething).ToUpper()
    }    
}

$MyCustomObject1 = New-Object Print
$MyCustomObject1.SetString("You shall not pass!")
$MyCustomObject1.PrintString()

