# Get Services
Get-CimInstance -ClassName Win32_Service | Where-Object { $_.State -eq "Running" } | Select-Object Name, ProcessId | 
Sort-Object Name -OutVariable OutputForService | Out-Null
# Get Processes
Get-CimInstance Win32_Process | Select-Object Name, ProcessId -OutVariable OutputForProcess | Out-Null
# Merge Services and Processes on ProcessId, check if Process contains a Service
# Install-Module -Name JoinModule
$MergeResults = ForEach ($ProcessOutput in $OutputForProcess) {
    if ($OutputForService.ProcessId -contains $ProcessOutput.ProcessId) {
        $ProcessOutput | leftJoin $OutputForService -On ProcessId | Select-Object -Property Name | 
        Format-Table -HideTableHeaders
    } $_ | Out-Null
}
# Format merged result to text, add header, convert to CSV
$MergeResults | Out-String -OutVariable TextInput | Out-Null
$TextInput1 = $TextInput -replace '{', ''
$TextInput2 = $TextInput1 -replace '\s', ''
$TextInput3 = $TextInput2 -replace '}', "`n"
$Headers = "Process,Service`n"
$TextInput4 = $Headers + $TextInput3
$TextInput4 | ConvertFrom-csv -OutVariable TextInput5 | Out-Null
# Create hash table from CSV 
$HashTable = @{}
foreach ($item in $TextInput5) {
    $HashTable[$item.Process] = $item.Service
}
$HashTable.GetEnumerator() | Sort-Object Name -OutVariable ResultHashTable | Out-Null
$ResultHashTable