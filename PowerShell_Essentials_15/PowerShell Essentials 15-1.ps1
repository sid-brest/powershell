# Write-ColoredMessage -Text "Hello there!" -Red
function Write-ColoredMessage {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Text,
        [switch]$red,
        [switch]$yellow,
        [switch]$green,
        [switch]$blue
        )
 if ($red) {
    Write-Host $Text -ForegroundColor Red
    }
if ($yellow) {
        Write-Host $Text -ForegroundColor Yellow
        }
if ($green) {
        Write-Host $Text -ForegroundColor Green
            }
if ($blue) {
        Write-Host $Text -ForegroundColor Blue
            }
}