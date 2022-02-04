#.\task6.ps1 " kube-system   coredns-869cb84759-drhbg                     1/1     Running   0          4h5m"

#write argument into variable
$UserInput = $args[0]

#replce more than one space, with one space
$InputSplit = $UserInput -replace '\s+', ' '

Write-Host($InputSplit)