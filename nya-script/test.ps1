$smbShare = Get-SmbShare
$smbShare | Add-Member -NotePropertyName Status -NotePropertyValue Done
Write-Output $smbShare