$names = Import-Csv names.csv;

foreach($name in $names){
    $username = $name.firstname[0,1] + $name.lastname[0,1];
    $username = -join $username;
    Write-Host $username;
}