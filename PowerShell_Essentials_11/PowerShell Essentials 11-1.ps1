$text = (Get-Content -Path .\TextExample.txt -Raw).ToLower()
$pipeOutput = -split $text -replace '[^a-z]' | Sort-Object Length | Select-Object -Unique -Last 10
$pipeOutput

for ($i = 0; $i -lt $pipeOutput.Count; $i++) {
    Set-Content -Path .\Output11_1\LongestWord$i.txt -Value $pipeOutput[$i]
}