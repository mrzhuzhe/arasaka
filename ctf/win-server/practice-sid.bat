$token = Get-Nttoken -Effective -Pseudo
$sd = New-NtSecurityDescriptor -Token $token -Type Mutant
Format-NtSecurityDescriptor $sd -HideHeader
