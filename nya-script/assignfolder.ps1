# syntax:
# assignfolder.ps1 <name of file> <name of group>

$fileName = $args[0]
$pathToFolder = "\\adc-a\Anton mapp\$fileName"
$groupName = $args[1]

New-Item -Path $pathToFolder -ItemType "directory"

$aclRule = Get-Acl -Path $pathToFolder

$fileSystemRights = "Modify"
$type = "Allow"
$fileSystemAccessRuleArgumentList = $groupName, $fileSystemRights, $type

$folderRights = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $fileSystemAccessRuleArgumentList

$aclRule.SetAccessRule($folderRights)
Set-Acl -Path $pathToFolder -AclObject $aclRule