sysctl net.ipv4.tcp_available_congestion_control

vim /etc/sysctl.conf

net.core.default_qdisc=fq
net.ipv4.tcp_congestion_control=bbr
sysctl -p


# check
sysctl net.ipv4.tcp_congestion_control
show bbr 