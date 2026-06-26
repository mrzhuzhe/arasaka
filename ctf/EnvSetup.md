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