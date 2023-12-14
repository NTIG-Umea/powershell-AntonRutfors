$users = Get-Aduser -filter *  -Searchbase "OU=lightSalmon,DC=colors,DC=labb"

foreach($user in $users) {
    remove-aduser $user
}