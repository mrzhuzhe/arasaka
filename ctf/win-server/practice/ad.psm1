Get-LocalUser | Select-Object name, enabled, sid
get-Ntsid -Name $env:computername
$password = Read-Host -AsSecureString -Prompt "password"
$name = "test"
New-LocalUser -Name $name -Password $password -Description "test user"

get-ntsid
get-ntsid -name "$env:COMPUTERNAME\$name"

Get-LocalGroup | Select-Object name,sid
Get-LocalGroupMember -Name "awesome users"
Get-LocalGroupMember -Name "power users"

Get-LocalGroupMember -Name "administrators"
New-LocalGroup -Name "awesome group" -Description "test group"
get-Ntsid -name "$env:COMPUTERNAME\awesome group"
Add-LocalGroupMember -Name "awesome group" -Member "$env:USERDOMAIN\$emv:test"
Add-LocalGroupMember -Name "awesome group" -Member "$env:USERDOMAIN\$emv:USERNAME"

Add-LocalGroupMember -Name "awesome group" -Member "$env:USERDOMAIN\test"
Add-LocalGroupMember -Name "awesome group" -Member "test"
Get-LocalGroupMember -name "awesome group"
