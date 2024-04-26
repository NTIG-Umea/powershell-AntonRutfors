$groupName = $args[0]
$username = $args[1]

Add-ADGroupMember -Identity $groupName -Members $username