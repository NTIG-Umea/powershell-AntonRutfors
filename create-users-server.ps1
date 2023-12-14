$ErrorActionPreference = 'silentlycontinue'

$users = Import-Csv .\users2.csv;

foreach($user in $users){
    $username = $user.firstname + "." + $user.lastname;
    $newuser = $username;
    $counter = 2;

    while(get-aduser -identity $newuser) {
        $newuser = $username + $counter;
        $counter++;
    }

    new-aduser -name $newuser -path "OU=LightSalmon,DC=colors,DC=labb";
}