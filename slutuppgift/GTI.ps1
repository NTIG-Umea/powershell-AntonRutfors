Write-Output "Skriv in namnet på klassen som ska läggas till:"
$className = Read-Host

Write-Output "Skriv in filsökvägen till csv filen med elevernas namn:"
$pathToStudentNameCsv = Read-Host

$usernames = Import-Csv $pathToStudentNameCsv

# Byt ut <active directory path> med AD:ns sökväg
New-ADOrganizationalUnit -Name $className -Path "<active directory path>"

function Check-IfUserExists {
    param (
        $username
    )
    try {
        get-aduser -identity $username
    }
    catch {
        return $false
    }
    return $true
}

foreach($username in $usernames) {
    $counter = 2
    $completeUsername = $username.firstname + "." + $username.lastname
    $newuser = $completeUsername

    while(Check-IfUserExists -username $newuser) {
        $newuser = $completeUsername + $counter
        $counter++
    }

    Write-Host "creating user: $newuser"
    # Byt ut <active directory path> med AD:ns sökväg
    new-aduser -name $newuser -path "OU=$className,<active directory path>"
}
