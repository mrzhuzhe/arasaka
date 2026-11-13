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


