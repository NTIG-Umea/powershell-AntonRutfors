$names = Import-Csv names.csv;

foreach($name in $names){
    Write-Host $name.firstname $name.lastname
}