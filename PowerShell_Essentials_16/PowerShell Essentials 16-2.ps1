# Write an advanced function to delete file from a specific folder 
# if file size greater then specified size in Kb
function DelFileSize {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [String]$Folder,
        [Int]$Size
    )
    Get-ChildItem -Path $Folder -File | Where-Object { ($_.Length / 1KB) -gt $Size } | 
    Remove-Item -Verbose
}