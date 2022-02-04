Function BubbleSort {
    [CmdletBinding()]
    param($RandomArray)
    $ArrayLength = $RandomArray.Length
    Write-Verbose "Sorting random array ($RandomArray) of $ArrayLength elements"
    for ($i = 1; $i -lt $ArrayLength; $i++) {
        for ($j = 0; $j -lt ($ArrayLength - $i); $j++) {
            Write-Verbose "Comparing $($RandomArray[$j]) and $($RandomArray[$j + 1])"
            if ($RandomArray[$j] -gt $RandomArray[$j + 1]) {
                Write-Verbose "Swapping $($RandomArray[$j]) and $($RandomArray[$j + 1])"
                $RandomArray[$j], $RandomArray[$j + 1] = $RandomArray[$j + 1], $RandomArray[$j]
            }
        }
    }
    return $RandomArray
}
$RandomArray = Get-Random -Count 10 -InputObject (1..99)
$UserInput = Read-Host "Would you like to see VERBOSE output? If [Yes] type 'y', if [No] leave blank"
if ($UserInput -eq "y") {
    Write-Host "Generated array was ($RandomArray)"
    $SortedArrayVerbose = BubbleSort $RandomArray -Verbose
    Write-Host "Sorted array is ($SortedArrayVerbose)"
}
else {
    Write-Host "Generated array was ($RandomArray)" 
    $SortedArray = BubbleSort $RandomArray
    Write-Host "Sorted array is ($SortedArray)"
}