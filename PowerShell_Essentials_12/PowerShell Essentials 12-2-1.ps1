# Import from CSV file to HashTable
$ImportCsvData = Import-Csv -Path .\Output12\ChromeProcToCsv.csv
$HashTableCsv = foreach ($ImportCsvItem in $ImportCsvData) {
    @{ $ImportCsvData.IndexOf($ImportCsvItem) = @{ Name = "$($ImportCsvItem.Name)"; 
            Id = "$($ImportCsvItem.Id)"; StartTime = "$($ImportCsvItem.StartTime)"; 
            PagedMemorySize = "$($ImportCsvItem.PagedMemorySize)" 
        } 
    }
}
($HashTableCsv[0..$ImportCsvData.Length].Values)