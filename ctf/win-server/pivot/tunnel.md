# Chisel 

on local

./chisel_1.11.8_linux_amd64 server --port 8888 --reverse --socks5

on remote 

./chisel_1.11.8_linux_amd64 client 10.10.17.229:8888 R:socks

Notice seems cannot use port 1080

# Proxychains setting
cat ~/.proxychains/proxychains.conf 
```
strict_chain
proxy_dns
remote_dns_subnet 224
tcp_read_time_out 15000
tcp_connect_time_out 8000

[ProxyList]
socks5 127.0.0.1 1080
```

# use 
```
proxychains4 nmap -A 172.16.20.1 
```
or just set proxy in browser