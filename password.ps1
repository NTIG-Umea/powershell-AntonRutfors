$password = "";

for($i = 0; $i -lt 3; $i++){
    $randomnum = Get-Random -min 65 -max 90; #Uppercase characters
    $password += [char]$randomnum;
    $randomnum = Get-Random -min 97 -max 122; #Lowercase characters
    $password += [char]$randomnum;
    $randomnum = Get-Random -min 48 -max 57; #Numbers
    $password += [char]$randomnum;
    $randomnum = Get-Random -min 33 -max 47; #Symbols
    $password += [char]$randomnum;
}

Write-Output $password;