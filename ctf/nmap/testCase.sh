# scan finger printer
nmap -sV -O -v 192.168.1.1
nmap -sL 6.209.24.0/24 6.207.0.0/22

# 
# nmap -sV -p 444 starofus.xyz
# nmap -sC -p 3306 --system-dns starofus.xyz # sV vs sC
# nmap --top-ports=1000 --min-rate 5000 starofus.xyz
# nmap --top-ports=2000 --system-dns starofus.xyz
# Notice cannot get 6379
# nmap -p 0-9999 --system-dns starofus.xyz 




# reverse shell
# https://gitlab.com/kalilinux/packages/webshells
# ncat -v -n -l -p 1234


# ncat return 200
echo -e "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{"key":"value"}" | ncats -l -p 9091


# more port
nmap -Pn -sV -A -p- -T4 10.129.78.147 --system-dns
