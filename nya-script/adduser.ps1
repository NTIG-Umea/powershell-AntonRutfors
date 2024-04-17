$usernames = Import-Csv ./names.csv

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

    Write-Host "creating user: $newuser"
    new-aduser -name $newuser -path "OU=Antons anvandare,DC=walters,DC=labb"
}