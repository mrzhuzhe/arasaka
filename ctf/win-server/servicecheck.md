# Checklist

1. notice there is a grep 

```
    Get-Service | Where-Object { $_.Status -eq 'Running' } | Out-String -Stream | Select-String -Pattern 'remote'
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
```

3. audit 
`wevtutil qe Security /c:5 /rd:true /f:text`

4. schedule task
`schtasks /query /fo LIST /v`

5. AD

6. NTLM


# Reffer

1. https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.localaccounts/new-localuser?view=powershell-5.1