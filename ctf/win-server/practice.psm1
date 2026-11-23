New-NtSecurityDescriptor
$var = 3, 2, 1, 0
$var[1]
"You are fucked $var"
$env
$pid
"Hello".ToCharArray()
[System.Guid]"6c0a3a17-4459-4339-a3b6-1cdb1b3e8973"
[System.Guid]::NewGuid()
Get-Item -Path "C:\Windows"
Get-Item "C:\Windows"
Get-Command -Name *SecurityDescriptor*

Get-Command -Module NtObjectManager -Name Start-*

Get-Help Start-NtWait
Get-help Start-NtWait -Parameter Object
Get-help Start-ntwait -Examples
Get-Help Start-NtWait -ShowWindow
New-Alias -Name fuck -Value "fuck you"

Get-alias fuck

function Get-NameValue { 
    param([string]$Name, $Value)
    return "fuck $Name you $Value"
}
Get-NameValue -Name "fuck" -Value "you"
$script = { Write-Output "Hello" }
& $script
Get-Process
Get-Process | Select-Object Id, ProcessName
Get-Process | Format-List
Get-Process | Format-List *
Get-Process | Get-Member -Type Property
Get-Process | Get-Member -Type Method
Get-Process | out-host -Paging
$output = Write-Host "Hello"
Get-Process | Where-Object { $_.ProcessName -eq "explorer" }
Get-Process | Where-Object { $_.ProcessName -Match "svc" }
Get-Process | Where-Object { $_.ProcessName -Match "sshd" }
Get-Process | Sort-Object Handlers

Get-Process | Sort-Object Handles -Descending
Get-Process | group-object ProcessName
Get-Process | group-object ProcessName | where-object Count -GT 10 | Sort-object Count

Get-Process | Out-File process.txt

Get-Process > process.txt
Get-Process | Select-Object Id, ProcessName | Export-Csv .\process.csv
Get-Process | Select-Object Id, ProcessName | Export-Clixml .\process.xml


get-nttype
get-help get-nttype

ls NtObject:\
ls NtObject:\ | Sort-Object Name
ls NtObject:\Dfs

ls NtObject:\Dfs | Select-Object SymbolicLinkTarget
get-item NtObject:\Device\dfsClient


Get-NtStatus
Get-NtDirectory


get-nttypeaccess -type file
get-nttypeaccess -type file | select SDKname, value

get-ntaccessmask -FileAccess GenericRead, ReadAttributes, ReadControl

(New-NtMutant).GrantedAccessMask
(New-NtMutant).GrantedAccess

Get-Nthandle -ProcessId $pid
Get-Nthandle -ProcessId $pid
Get-NtObjectInformationClass process

Get-NtProcess
Get-NtProcess -Current
$proc = Get-NtProcess -Current
$proc
Get-NtObjectInformation $proc ProcessTimes
Get-NtObjectInformation $proc ProcessTimes -Length 32
Get-NtObjectInformation $proc ProcessTimes
Get-NtObjectInformation $proc ProcessTimes -AsObject
$proc | Format-List
Get-NtObjectInformationClass key -Set
ls NtObject:\Device | where Name -match 'hard' 

Get-NtKernelModule
Get-NtProcess -InfoOnly
Get-NtThread -InfoOnly

$proc.CommandLine
$proc.Win32ImagePath
Get-NtVirtualMemory

$addr = Add-NtVirtualMemory -Size 1000 -Protection ReadWrite
Get-NtVirtualMemory -Address $addr
Get-NtVirtualMemory -Size 1000 -Protection ReadWrite
$addr = Add-NtVirtualMemory -Size 1000 -Protection ReadWrite
$addr
Get-NtVirtualMemory -Address $addr
Get-NtVirtualMemory
Read-NtVirtualMemory -Address $addr -Size 4 | Out-HexDump

write-NtVirtualMemory -Address $addr -Data @(1,2,3,4)
Read-NtVirtualMemory -Address $addr -Size 4 | Out-HexDump
Set-NtVirtualMemory -Address $addr -Protection ExecuteRead -Size 4
Get-NtVirtualMemory -Address $addr
remove-NtVirtualMemory -Address $addr
Get-NtVirtualMemory -Address $add


$s = New-NtSection -Size 4096 -Protection ReadWrite
$m = Add-NtSection -Section $s -Protection ReadWrite
Get-NtVirtualMemory $m.BaseAddress
Remove-NtSection -Mapping $m
Get-NtVirtualMemory $m.BaseAddress
Add-NtSection -Section $s -Protection ExecuteRead

Get-NtVirtualMemory -Type Mapped | Where-Object Name -ne ""
Get-NtVirtualMemory -Type Mapped | Where-Object Name -ne "nt"
$sect = New-NtSectionImage -Win32Path "C:\Windows\notepad.exe"

$map = Add-NtSection -Section $sect -Protection ReadOnly

Get-NtVirtualMemory -Type Image -Name "notepad.exe"
Out-HexDump -Buffer $map -ShowAscii -Length 128
 Get-AuthenticodeSignature "C:\WINDOWS\System32\notepad.exe" | Format-List
ls NtObject:\REGISTRY
$key = Get-NtKey \Registry\Machine\Software\Microsoft\.NetFramework
Get-NtKeyValue -Key $key
$hs = Get-NtHandle -ObjectType File | Where-Object Name -Match Windows

$hs | Select-Object ProcessId, Handle, name

$ss = Get-NtHandle -ObjectType Secion -GroupByAddress
$ss = Get-NtHandle -ObjectType Secion -GroupByAddress | Where-Object ShareCount -eq 2
$mask = Get-NtAccessMask -SectionAccess MapWrite
$ss = $ss | Where-Object {Test-NtAccessMask $_.AccessIntersection $mask }
Show-NtSection -section $sect

$sect = $handle.GetObject()                                                                                                                                                  ...
$random = Get-RandomByte -Size $map.Length

Write-NtVirtualMemory -Mapping $map -Data $random
Out-Hexdump -Buffer $map -Length 16 -ShowAddress -ShowHeader
Show-NtSection -Section $sect


$lib = Import-Win32Module -Path "kernel32.dll"
Get-Win32ModuleExport -Module $lib
"{0:X}" -f (Get-Win32ModuleExport -Module $lib -ProcAddress "AllocConsole")


Get-Win32ModuleImport -Path "kernel32.dll" -DllName "ntdll.dll" | Where-Object Name -Match "^Nt"
Get-Win32ModuleImport -Path "kernel32.dll"
Get-NtapiSet api-ms-win-core-rtlsupport-l1-1-0.dll

Get-Win32ModuleImport -Path "kernel32.dll" -ResolveApiSet

ls NtObject:\KnownDlls
Get-NtType WindowStation,Desktop
Get-NtWindowStationName
Get-NtWindowStationName -Current
Get-NtDesktopName
Get-NtDesktopName -Current
$desktop = Get-NtDesktop -Current

Get-NtWindow -Desktop $desktop
$ws = Get-NtWindow

$char_count = 2048
$buf = New-Win32MemoryBuffer -Length ($char_count*2)

$ws = get-ntwindow
foreach($w in $ws) { $len = Send-NtWindowMessage -Window $w -Message 0xD -LParam $buf.DangerousGetHandle() -WParam $char_count -Wait
$txt = $buf.ReadUnicodeString($len.ToInt32())
if ($txt_length -eq 0) { continue}
"PID $($w.ProcessId) - $txt"
}

Get-NtProcess -InfoOnly | Group-Object SessionId
ls NtObjectSession:\ | Group-Object TypeName
get-win32error 5

Get-LocalUser -Name sanszhu | Select-Object Name, PasswordLastSet, PasswordExpires, PasswordNeverExpires
Get-ADUser -Identity sanszhu -Properties "msDS-UserPasswordExpiryTimeComputed" | Select-Object Name, @{Name="PasswordExpirationDate"; Expression={[datetime]::FromFileTime($_...
net accounts

$m = New-NtMutant ABC -Win32Path
$m.FullPath

Get-Win32ModuleExport "kernel32.dll" -ProcAddress CreateMutexEx
Get-Win32ModuleExport "kernel32.dll" | Where-Object Name -match CreateMutexEx

Use-NtObject($key = Get-NtKey \REGISTRY\MACHINE\SOFTWARE) {$key.win32Path }
Use-NtObject($key = Get-NtKey -Win32Path "HKCU\SOFTWARE" ) {$key.FullPath }
ls NtKeyUser:\SOFTWARE
ls HKCU:\SOFTWARE
$key = New-Ntkey -Win32Path "HKCU\ABC`OXYZ"
Get-Item "NtKeyUser:\ABC`OXYZ"
Use-NtObject($cdrive = Get-NtSymbolicLink "\??\C:") { $cdrive | Select-Object FullPath, Target }
Add DosDevice Z: C:\Windows

Use-NtObject($zdrive = Get-NtSymbolicLink "\??\Z:") { $zdrive | Select-Object FullPath, Target }

Set-Location $env::Systemroot

Get-NtFilePathType "."
Get-NtFilePath "."
Get-NtFilePath "..\"
Get-NtFilePathType "C:ABC"
Get-NtFilePath "C:ABC"
Get-NtFilePathType "\\?\C:\abc/..\xyz"
Get-NtFilePath "\\?\C:\abc/..\xyz"
(Get-Process -Id $pid).path
(Get-Process -Id $pid).path | Get-Win32ModuleManifest | Select-Object LongpathAware
$proc = New-Win32Process -CommandLine "notepad test.txt"
$proc = New-Win32Process -CommandLine "notepad test.txt" -Applicationname "C:\windows\notepad.exe"
New-Win32Process -CommandLine "document.txt"
$base_key = "NtKey:\MACHINE\SOFTWARE\CLASSES"
Get-item "$base_key\.txt" | Select-Object -ExpandProperty Values
Get-ChildItem "$base_key\txtfile\shell" | Format-Table
Get-item "$base_key\.txt" | Select-Object -ExpandProperty Values | Format-Table
Start-Process "test.txt" -Verb "print"

Start-Process "process.txt" -Verb "print"
Get-Win32Service
$imps = ls "$env:winDir\*exe" | ForEach-Object { Get-Win32ModuleImport -Path $_.FullName }

$imps | where-object Names -Contains "createprocessW" | select-object ModulePath
$key = New-Ntkey -Win32Path "HKCU\SOFTWARE\`OHIDDENKEY"
ls NtKeyUser:\SOFTWARE -RECURSE | Where-Object Name -Match "`o"
$key = New-Ntkey -win32Path "HKCU\SOFTWARE\ABC"
Set-NtKeyValue -Key $key -Name "`OHIDDEN" -String "HELLO"

$token = get-nttoken

Invoke-Nttoken $token { Get-NtDirectory -Path "\" } -ImpersonationLevel Impersonation
Invoke-Nttoken $token { Get-NtDirectory -Path "\" } -ImpersonationLevel Identification
get-nttoken -Anonymous | Format-NtToken

$imp_token = Copy-NtToken -Token $token -ImpersonationLevel Delegation
$imp_token.ImpersonationLevel
get-nttokenGroup $token
get-nttokensid $token -Owner
set-nttokensid -Owner -Sid "S-1-2-3-4"
get-nttokensid $token -Integrity
Set-NttokenIntegritylevel Low -Token $token
Get-NtTokenGroup -Device -Token $token
get-NtTokenPrivilege $token -Privileges SeChangeNotifyPrivilege | Format-list
