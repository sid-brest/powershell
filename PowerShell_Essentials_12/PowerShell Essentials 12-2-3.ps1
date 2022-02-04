# Import from Xml file to HashTable
[xml]$ImportXmlData = Get-Content -Path .\Output12\ChromeProcToXml.xml
$Properties = $ImportXmlData.Objects.Object.Property
$Properties.SelectNodes("//Name") 
$HashTableXml = $Properties | Select-Object -Property Name, @{Name = "Value"; Expression = { $_.InnerText } }
$HashTableXml