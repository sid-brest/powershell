# Import from JSON file to HashTable
Get-Content -Path .\Output12\ChromeProcToJson.json | ConvertFrom-Json -OutVariable ImportJsonData | Out-Null
$HashTableJson = foreach ($ImportJsonItem in $ImportJsonData) {
    @{ $ImportJsonData.IndexOf($ImportJsonItem) = @{ Name = "$($ImportJsonItem.Name)"; 
            Id = "$($ImportJsonItem.Id)"; StartTime = "$($ImportJsonItem.StartTime)"; 
            PagedMemorySize = "$($ImportJsonItem.PagedMemorySize)" 
        } 
    }
}
$HashTableJson[0..$ImportJsonData.Count].Values