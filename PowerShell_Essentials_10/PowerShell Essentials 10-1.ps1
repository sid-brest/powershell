# Write a script to list directory that contain files. 
Set-Location -Path "D:\Media\OpenItBrest"
tree . /F
# Output is the same with Get-ChildItem cmdlet. 
Get-ChildItem -Path D:\Media\OpenItBrest -File | 
# Print file size in megabytes (Mb).
Select-Object -Property Name, @{label = "Size (MB)"; expression = { $_.Length / 1MB } } | Format-Table