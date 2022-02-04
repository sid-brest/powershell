# Import from Yaml file to HashTable
Import-module powershell-yaml
$ImportYamlData = Get-Content -Path .\Output12\ChromeProcToYaml.Yaml | ConvertFrom-Yaml
$HashTableYaml = $ImportYamlData[0..$ImportYamlData.Count].Values
$HashTableYaml