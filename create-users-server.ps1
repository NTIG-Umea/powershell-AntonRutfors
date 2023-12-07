$users = Import-Csv .\users2.csv;

foreach($user in $users){
    $username = $user.firstname + "." + $user.lastname;

    new-aduser -name $username -path "OU=LightSalmon,DC=colors,DC=labb";
}