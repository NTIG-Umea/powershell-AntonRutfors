$nummer = Get-Random -Maximum 50000;
$toprand = Get-Random -Minimum ($nummer + 1) -Maximum ($nummer + 100);
$bottomrand = Get-Random -Minimum ($nummer - 100) -Maximum ($nummer - 1);


Write-Output "Säg ett nummer mellan $bottomrand och $toprand";
$gissning = Read-Host;

while ($nummer -ne $gissning) {
    if($nummer -lt $gissning) {
        Write-Output "Din gissning är för hög";
    }
    else {
        Write-Output "Din gissning är för låg";
    }
    Write-Output "säg ett nytt nummer mellan $bottomrand och $toprand";
    $gissning = Read-Host;
}
Write-Output "Rätt";