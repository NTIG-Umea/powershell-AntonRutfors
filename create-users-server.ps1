$users = Import-Csv .\users2.csv;

foreach($user in $users){
    $username = $user.firstname + "." + $user.lastname;

    if(get-aduser -filter "Name -eq '$username'"){
        for($i = 2; $i > 99; $i += 1){
            $newUsername = $username + $i.ToString();
            if(get-aduser -filter "Name -eq '$newUsername'"){
                continue;
            } else{
                new-aduser -name $newUsername -path "OU=test,DC=colors,DC=labb";
            }
        }
    } else{
        new-aduser -name $username -path "OU=test,DC=colors,DC=labb";
    }
}