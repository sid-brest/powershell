$PcName = "WIN-SIDSERV"
# Machines are not in the domain. Therefore, you need to launch the following commands.
# net start WinRM
# Enable-PSRemoting -Force
# Set-Item -Path WSMan:\localhost\Client\TrustedHosts -Value "WIN-SIDSERV"

# Connect to client-pc
Enter-PSSession -ComputerName $PcName -Credential Administrator
# CPU model and max clock speed
Get-CimInstance Win32_Processor -ComputerName $PcName | 
Select-Object -Property @{label = "CPU model"; expression = { $_.Name } }, 
@{label = "Max clock speed (MHz)"; expression = { $_.MaxClockSpeed } } -outvariable CPU | Out-Null


# Amount of RAM (total, free)
Get-CimInstance Win32_OperatingSystem -ComputerName $PcName | 
Select-Object @{label = "Total Amount of RAM (GB)"; expression = { [math]::Round($_.TotalVisibleMemorySize / 1MB, 2) } }, 
@{label = "Free Amount of RAM (GB)"; expression = { [math]::Round($_.FreePhysicalMemory / 1MB, 2 ) } } -outvariable RAM | Out-Null


# OS disk free space
Get-CimInstance Win32_logicaldisk -ComputerName $PcName | Where-Object DeviceID -eq "C:" | 
Select-Object -Property @{label = "OS disk free space (GB)"; expression = { [math]::Round($_.FreeSpace / 1GB, 2) } } -outvariable Disk | Out-Null


# OS version
Get-CimInstance Win32_OperatingSystem -ComputerName $PcName | 
Select-Object -Property @{label = "OS version"; expression = { $_.Caption + " build " + $_.Version } } -outvariable OS | Out-Null


# Installed hot fixes
Get-CimInstance Win32_QuickFixEngineering -ComputerName $PcName | Select-Object -Property HotFixID, 
@{label = "Installation  date"; expression = { ($_.InstalledOn).ToString('dd.MM.yyyy') } } -outvariable Hotfixes | Out-Null


# List of stopped services
Get-CimInstance -ClassName Win32_Service -ComputerName $PcName | Where-Object { $_.State -eq "Stopped" } | 
Select-Object -Property @{label = "List of stopped services" ; expression = { $_.Name } }, State -outvariable StopServiceList | Out-Null


Write-Host ($CPU | Out-String)
Write-Host ($RAM | Out-String)
Write-Host ($Disk | Out-String)
Write-Host ($OS | Out-String)
Write-Host ($Hotfixes | Out-String)
Write-Host ($StopServiceList | Out-String)

