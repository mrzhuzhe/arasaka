# Host only network
# https://wiki.archlinux.org/title/QEMU#Tap_networking_with_QEMU

ip link add name br0 type bridge
ip addr add 172.20.0.1/16 dev br0
ip link set br0 up
dnsmasq -C /dev/null --interface=br0 --bind-interfaces --dhcp-range=172.20.0.2,172.20.255.254