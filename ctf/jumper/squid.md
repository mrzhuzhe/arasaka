https://www.digitalocean.com/community/tutorials/how-to-set-up-squid-proxy-on-ubuntu-20-04

apt update
apt install squid
apt install apache2-utils

# generate password
htpasswd -c /etc/squid/passwords proxyman


# config
vim /etc/squid/squid.conf

http_port 3389

auth_param basic program /usr/lib/squid/basic_ncsa_auth /etc/squid/passwords
auth_param basic realm proxy
acl authenticated proxy_auth REQUIRED
http_access allow authenticated

# check 
squid -k parse

curl -v -x http://aaa:bbb%40ccc%21e@124.156.140.104:3389 https://starofus.xyz

# restart 
systemctl restart squid
systemctl status squid

# quic 
when high load squid is good way for avoid quic throating
