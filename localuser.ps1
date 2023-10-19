$person = Read-Host("Skriv in användare du letar efter:");
$users = Get-LocalUser *$person*;

foreach($user in $users){
    Write-Host $user.Name $user.Description;
}