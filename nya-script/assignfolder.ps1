# syntax:
# assignfolder.ps1 <path to file to create> <name of group>

$pathToFolder = $args[0]
$groupName = $args[1]

New-Item -Path $pathToFolder -ItemType "directory"

$aclRule = Get-Acl -Path $pathToFolder

$fileSystemRights = "Modify"
$type = "Allow"
$fileSystemAccessRuleArgumentList = $groupName, $fileSystemRights, $type

$folderRights = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $fileSystemAccessRuleArgumentList

$aclRule.SetAccessRule($folderRights)
Set-Acl -Path $pathToFolder -AclObject $aclRule