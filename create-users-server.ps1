$ErrorActionPreference = 'silentlycontinue'

$users = Import-Csv .\users2.csv;
$log;

foreach($user in $users){
    $username = $user.firstname + "." + $user.lastname;
    $newuser = $username;
    $counter = 2;

    while(get-aduser -identity $newuser) {
        $log += "user $newuser exists`n";
        $newuser = $username + $counter;
        $counter++;
    }

    $log += " - creating user: $newuser`n";

    new-aduser -name $newuser -path "OU=LightSalmon,DC=colors,DC=labb";
}

$log >> log.txt