$users = Import-Csv userlist.csv | select *,username,mail,password;

foreach($user in $users){
    $user.username = $user.firstname + "." + $user.lastname;
    $user.mail = $user.firstname + "." + $user.lastname + "@gmail.com";

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
    
    $user.password = $password;
    $password = "";
}

$users;