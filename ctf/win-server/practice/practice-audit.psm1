Get-NtAuditPolicy
Get-NtAuditPolicy | Select-Object Name, Id
Get-NtAuditPolicy -Category System -ExpandCategory
Enable-NtTokenPrivilege SeSecurityPrivilege
Set-NtAuditPolicy -Category ObjectAccess -Policy Success, Failure -PassThru
Set-NtAuditPolicy -Category ObjectAccess -Policy None
Get-NtAuditPolicy -Category System -ExpandCategory
$sid = get-ntsid
Get-NtAuditPolicy -User $sid -Category ObjectAccess -ExpandCategory
Get-NtAuditPolicy -AllUser
$sd = Get-NtAuditSecurity
Format-NtSecurityDescriptor $sd -Summary -MapGeneric

$fileter = @{logname = 'Security'; id =@(4656)}
Get-WinEvent -FilterHashtable $fileter | Select-Object -ExpandProperty Message
