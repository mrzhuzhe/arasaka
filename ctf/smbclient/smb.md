1. list files
smbclient //10.129.17.119/Data -L -N

2. samba print protocal 
rpcclient -U "" -N 10.129.17.119 -c "srvinfo"

3. https://www.samba.org/samba/security/CVE-2026-4480.html