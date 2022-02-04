# 1..3 | Get-ValueFromPipe
# @("First", "Second") | Get-ValueFromPipe
function Get-ValueFromPipe {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true,ValueFromPipeline=$true)]
        [string]$UserInput
    )
    process {

        $UserInput | % { Write-host "Value from pipe: " $_ }
    }
}