$token = Get-Nttoken -Effective -Pseudo
$sd = New-NtSecurityDescriptor -Token $token -Type Mutant
Format-NtSecurityDescriptor $sd -HideHeader

Get-NtAccessMask (0x0001F0001 -band 0x0000F000F) -ToSpecificAccess Mutant
$parent = New-NtSecurityDescriptor -Type Directory
Add-NtSecurityDescriptorAce $parent -KnownSid CreatorOwner -Flags ContainerInherit, InheritOnly -Access GenericWrite
Add-NtSecurityDescriptorAce $parent -KnownSid CreatorGroup -Flags ContainerInherit, InheritOnly -Access GenericRead
Format-NtSecurityDescriptor $parent -Summary -SecurityInformation Dacl

$token = Get-nttoken -Effective -Pseudo
$sd = New-NtSecurityDescriptor -Token $token -Parent $parent -Type Directory -Container

Format-NtSecurityDescriptor $sd -Summary -SecurityInformation Dacl
$token = get-Nttoken -Duplicate -IntegrityLevel Low
$sd = New-NtSecurityDescriptor -Token $token -Type Mutant
Format-NtSecurityDescriptor $sd -SecurityInformation Label -Summary

get-help Add-NtSecurityDescriptorAce
Get-Win32SecurityDescriptor "$env:WinDir"
Format-Win32SecurityDescriptor "MACHINE\SOFTWARE" -Type RegistryKey -Summary


$path = Join-path "$env:Temp" "TestFolder"
Search-Win32SecurityDescriptor $path | Format-Table
$path = Join-Path $path "new.txt"
"Hello" | Set-Content $path

ls NtKey:\ | select Name, {$_.SecurityDescriptor.Owner.Sid}
ls C:\ | Get-Acl | Select path,Owner # permission check
(get-acl C:\ | ConvertTo-NtSecurityDescriptor).Owner.sid # permission to sid

