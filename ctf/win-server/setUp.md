1. enable ISS 
`Install-WindowsFeature -name Web-Server -IncludeManagementTools`
2. download and install msedge
```
echo -e 'HTTP/1.1 200 OK\r\n https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/96f71ebf-d93a-4a10-80af-5c5380af81f5/MicrosoftEdgeEnterpriseX64.msi' | nc -lp 8000

curl -o test.msi https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/96f71ebf-d93a-4a10-80af-5c5380af81f5/MicrosoftEdgeEnterpriseX64.msi
```

3. todo windows compiler or maybe cross compiler

4. windows smb shared

5. sshd https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse?tabs=gui&pivots=windows-server-2025
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'