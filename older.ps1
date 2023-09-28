$my_age = 17;
$user_age = Read-Host("What's your age");

if($user_age -gt $my_age){
    Write-Output "You are older than me";
}
elseif($user_age -lt $my_age){
    Write-Output "You are younger than me";
}
else{
    Write-Output "We are the same age";
}