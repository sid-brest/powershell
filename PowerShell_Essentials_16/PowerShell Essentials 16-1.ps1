# Write an advanced function to show the size of files 
# in specific folder and sort all of them by size.
# Get-FilesSize -Path "c:\Windows"
function Get-FilesSize {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [String]$Path
    )
    Get-ChildItem -Path $Path -File |      
    Select-Object -Property Name, @{label = "Size (MB)"; expression = { $_.Length / 1MB } } |
    Sort-Object -Property "Size" | Format-Table  
} 