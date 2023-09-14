for($last_octet = 1; $last_octet -lt 256; $last_octet++) {
    Write-Output "192.168.0.$last_octet"
}