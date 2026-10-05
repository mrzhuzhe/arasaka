1. iptable server for jump
https://www.cnblogs.com/gaoniaofei/p/18968609


# clear all 
iptables -t nat -F

# Forward incoming TCP and UDP traffic to the final Shadowsocks server
# Rewrite the source IP so the final server knows to reply back through this intermediate server
```
echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -t nat -A PREROUTING -p tcp --dport 3389 -j DNAT --to-destination 64.176.43.49:5390
iptables -t nat -A PREROUTING -p udp --dport 3389 -j DNAT --to-destination 64.176.43.49:5390


iptables -t nat -A POSTROUTING -p tcp -d 64.176.43.49 --dport 5390 -j MASQUERADE
iptables -t nat -A POSTROUTING -p udp -d 64.176.43.49 --dport 5390 -j MASQUERADE

iptables -t nat -L -n
```