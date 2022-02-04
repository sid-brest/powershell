$PcName = 'WIN-SIDSERV'
$LoginInfo = Get-Credential -Message 'Authenticate please:'
$Connection = New-CimSession -ComputerName $PcName -Credential $LoginInfo
$LogonSessions = Get-CimInstance Win32_LogonSession -CimSession $Connection
$LogonUsers = Get-CimInstance Win32_LoggedOnUser -CimSession $Connection | Select-Object Antecedent, Dependent | Sort-Object Antecedent -Unique
$LogonSessions
$LogonUsers