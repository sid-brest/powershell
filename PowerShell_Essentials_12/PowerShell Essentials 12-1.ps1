$ChromeProc = Get-Process -Name "chrome" | Select-Object -Property Name, Id, StartTime, PagedMemorySize
# Export to csv
$ChromeProc | ConvertTo-Csv | Set-Content -Path .\Output12\ChromeProcToCsv.csv
# Export to json
$ChromeProc | ConvertTo-Json | Set-Content -Path .\Output12\ChromeProcToJson.json
# Export to xml
$Xml = [xml]$($ChromeProc | ConvertTo-Xml -Depth 2)
$Xml.Save( $( Resolve-Path ./).Path + ".\Output12\ChromeProcToXml.xml")
# Get-Module -Name "powershell-yaml" -ListAvailable
# Install-Module -Name powershell-yaml
# Export to yaml
$YamlHashTable = foreach ($process in $ChromeProc) {
    @{ $ChromeProc.IndexOf($process) = @{ Name = "$($process.Name)"; Id = "$($process.Id)"; 
            StartTime = "$($process.StartTime)"; PagedMemorySize = "$($process.PagedMemorySize)" 
        } 
    }
}
ConvertTo-Yaml -Data $YamlHashTable -OutFile $( $( Resolve-Path ./).Path + ".\Output12\ChromeProcToYaml.yaml") -Force