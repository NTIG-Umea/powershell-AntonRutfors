$rooms = "Athena", "Troja", "Aristoteles", "platon";

$rooms[2] = "Sapfo";
$rooms += "Pheme";

Write-Host $rooms.Count;
Write-Host $rooms[2];
Write-Host $rooms[0,2];
Write-Host $rooms[0..3];
Write-Host $rooms[-1];