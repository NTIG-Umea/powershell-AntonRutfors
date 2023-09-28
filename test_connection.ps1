$taken_ip_adresses = @();
$not_taken_ip_adresses = @();

for($x = 44; $x -lt 48; $x++) {
    for($i = 1; $i -lt 256; $i++) {
        if(Test-Connection "10.80.$x.$i" -Quiet -Count 1){
            $taken_ip_adresses += "10.80.$x.$i";
            Write-Output "Tested 10.80.$x.$i it is taken";
        }
        else{
            $not_taken_ip_adresses += "10.80.$x.$i";
            Write-Output "Tested 10.80.$x.$i it is not taken";
        }
    }
}
Out-File .\taken_ip_adresses.txt -InputObject $taken_ip_adresses -Encoding ASCII;
Out-File .\not_taken_ip_adresses.txt -InputObject $not_taken_ip_adresses -Encoding ASCII;