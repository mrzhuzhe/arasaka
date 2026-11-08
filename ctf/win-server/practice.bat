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