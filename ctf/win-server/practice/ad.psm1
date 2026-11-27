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


$forest = Get-ADForest
$forest.Domains
Get-ADDomain | Format-List PDCEmulator, DomainSid, DNSroot, NEtBIOSName
Get-ADDomainController | Select-Object Name,Domain
Get-ADTrust -Filter * | Select-Object Target, Direction, trusttype
get-aduser -filter * | Select-Object samaccountname, ennabled, sid
Get-ADGroup -filter * | Select-Object samaccountName,sid,groupscope

Get-LsaPrivateData '$MACHINE.ACC' | Out-HexDump -ShowAll
Get-ADRootDSE | Format-List '*NamingContext'
$root_dn = (Get-ADRootDSE).defaultNamingContext

Get-ADObject -SearchBase $root_dn -SearchScope OneLevel -Filter * | Select-Object DistinguishedName, ObjectClass
Get-ADObject -Identity "CN=Builtin,$root_dn" | Format-list
Get-ADObject -Identity "CN=Builtin,$root_dn"  -Properties * | Format-list

Get-ADObject -Identity 'CN=Users,DC=testzz1,DC=com'
$dn = 'CN=Users,DC=testzz1,DC=com'
$obj_sales = Get-ADObject -Identity $dn -Server SALES -Properties *
$obj_sales = Get-ADObject -Identity $dn -Properties *

$schema_dn = (Get-ADRootDSE).schemaNamingContext

Get-ADObject -SearchBase $schema_dn -SearchScope OneLevel -Filter * | Sort-Object Name | Select-Object Name, ObjectClass
Get-ADObject -SearchBase $schema_dn
