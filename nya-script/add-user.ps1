$usernames = Import-Csv "names.csv"

function Check-IfUserExists {
    param (
        $username
    )
    try {
        get-aduser -identity $username;
    }
    catch {
        return $false
    }
    return $true
}

foreach($username in $usernames) {
    $counter = 2
    $completeUsername = $username.firstname + "." + $username.lastname
    $newuser = $completeUsername

    while(Check-IfUserExists -username $newuser) {
        $newuser = $completeUsername + $counter
        $counter++
    }
    #while($true) {
    #    try {
    #        get-aduser -identity $newuser;
    #    }
    #    catch {
    #        new-aduser -name $newuser -path "OU=Antons Anvandare,DC=walters,DC=labb";
    #        break;
    #    }
    #    $newuser = $completeUsername + $counter;
    #    $counter += 1;
    #}
}


#new-aduser -name $username -path "OU=Antons Anvandare,DC=walters,DC=labb";
