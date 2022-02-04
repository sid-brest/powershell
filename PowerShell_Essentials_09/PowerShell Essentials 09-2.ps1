$text = Get-Content -Path .\WikiPowerShell.txt -Raw
-split $text | Group-Object -NoElement | Sort-Object Count | Select-Object -Last 10 