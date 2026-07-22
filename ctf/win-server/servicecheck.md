# Checklist

1. notice there is a grep 

```
    # all server
    
    Get-Service | Where-Object { $_.Status -eq 'Running' } | Out-String -Stream | Select-String -Pattern 'remote'
    
    # all process
    
    Get-Process

    # all port 
    
    Get-NetTCPConnection | Where-Object { $_.State -eq 'Listen' }
    Get-NetTCPConnection | Select-Object LocalPort, State, OwningProcess
    Get-Process -Id 1234

    # firewall

    Get-NetFirewallRule -Name *OpenSSH-Server* |select Name, DisplayName, Description, Enabled
    Set-NetFirewallProfile -Profile Domain, Private, Public -LogBlocked True

    # netstat

    netstat -nao | find /i '":22"'

```

2. services and account
```
    # stop a service 
    Set-Service -Name "RemoteRegistry" -StartupType Disabled
    Stop-Service -Name "RemoteRegistry"


    # checkfirewal rules 

    Get-NetFirewallRule -Enabled True

    # list admin

    Get-LocalGroupMember -Group "Administrators"

    # add group member
    Add-LocalGroupMember -Group "Administrators" -Member "sanszhu"

    # switch user
    Get-Credential
    Enter-PSSession -Credential $credential

    # search log

    Get-WinEvent -FilterHashtable @{LogName='System'; ProviderName='Service Control Manager'} | Where-Object {$_.Message -like "*ssh*"} | Format-List TimeCreated, Message

    Get-WinEvent -LogName "OpenSSH/Operational" | Where-Object { $_.Id -in 4, 11, 12, 13 } | Format-Table TimeCreated, Id, Message -AutoSize


```

3. audit 
`wevtutil qe Security /c:5 /rd:true /f:text`

4. schedule task
`schtasks /query /fo LIST /v`

5. AD

6. NTLM


# Reffer

1. https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.localaccounts/new-localuser?view=powershell-5.1