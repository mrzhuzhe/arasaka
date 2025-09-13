

1. libiio https://wiki.analog.com/resources/eval/user-guides/ad-fmcdaq2-ebz/software/linux/applications/libiio
2. libairspy https://airspy.com/quickstart/
3. sdr++ https://github.com/AlexandreRouma/SDRPlusPlus
4. openwifi srslte 
5. https://www.isc.org/dhcp/

```
sudo screen /dev/ttyUSB1 115200

sudo sysctl -w net.ipv4.ip_forward=1
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo ip route add 192.168.13.0/24 dev eth0 
```

## dependence 
1. sdr++ libhackrf-dev librtaudio-dev libairspy-dev libvolk-dev libfftw3-dev libad9361-dev librtlsdr-dev

## problem 
1. 5g wifi is too close maybe a better way to make it wider 