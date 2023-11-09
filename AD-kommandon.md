### AD User:

- New-ADUser -Name <sub>username</sub> -AccountPassword(ConvertTo-SecureString <sub>password</sub> -AsPlainText -Force) -Enabled $true
- Remove-ADUser <sub>username</sub>
- Set-ADUser

### AD Group:

- New-ADGroup -Name <sub>name of group</sub>
- Set-ADGroup -Identity <sub>name of group</sub>
- Remove-ADGroup -Identity <sub>name of group</sub>
- Add-ADGroupMember -Identity <sub>name of group</sub> -members <sub>username</sub>
- Remove-ADGroupMember -Identity <sub>name of group</sub> -members <sub>username</sub> -confirm $false

### AD OU:

- New-ADOrganizationalUnit -Name <sub>name of OU</sub> -Description <sub>description of OU</sub>
- Set-ADOrganizationalUnit -Identity <sub>name of OU</sub> -Description <sub>description of OU</sub>
- Remove-ADOrganizationalUnit -Identity <sub>name of OU</sub>
- Move-ADObject