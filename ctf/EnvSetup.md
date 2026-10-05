1. xorg for ssh firefox 
2. wireshark-cli and traceroute 
3. need xorg-auth on host machine for ssh x11 forward
4. ssh -X will crash firefox 

this may be a relative to trusted forwarding https://github.com/gravitational/teleport/blob/master/rfd/0051-x11-forwarding.md

https://www.xfree86.org/current/Xsecurity.7.html

5. openvpn too slow ? (ok)
6. qemu bind ip
    method 1 tap 
    method 2 socket 
    Notice -net user performance is very poor, so maybe download too slow is due to it

7. Tap interface setup bridge
https://en.wikibooks.org/wiki/QEMU/Networking
https://unix.stackexchange.com/questions/255484/how-can-i-bridge-two-interfaces-with-ip-iproute2


8. Need a faster proxy method for rdp and ssh, maybe find a way to analysis 
candidate:
(1) cloudflare spectrum - not work only support http/https 
https://www.cloudflare.com/application-services/products/cloudflare-spectrum/ssh/
https://developers.cloudflare.com/tunnel/ 
(2) iptable server for jump - okay but jumper to proxy server only reduce latency 30% 
https://www.cnblogs.com/gaoniaofei/p/18968609
(3) squid proxy with password (good)
