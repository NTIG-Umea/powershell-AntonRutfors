$username = "Julia.ANDERSSON";
$newuser = $username;

while(get-aduser -identity $newuser ) {
    $counter++;
    $newuser = $username + $counter;
}

new-aduser -name $newuser;