1. basic
```
sudo tshark -i tun0 -f "tcp port 80"

# -V introduce more detail 
tshark -i tun0 -f "tcp port 80" -V -Y "http.request"

# -O seems more readable
sudo tshark -i tun0 -O http -Y http.request 
```

2. capture 
```
sudo tshark -i wlan3 \
  -Y "http.request.method == POST" \
  -T fields \
  -e frame.time -e ip.src -e ip.dst -e http.host -e http.request.uri \
  -e urlencoded-form.key -e urlencoded-form.value
```

3. read offline
```
timeout 180 tcpdump -i wlan3 -nn -s0 -w channel6.pcap

tshark -r channel6.pcap \
  -Y 'http.request.method == "POST"' \
  -T fields -e ip.src -e http.host -e http.request.uri \
  -e urlencoded-form.key -e urlencoded-form.value
```

4. check net interface mode and monitor mode
```
iw dev

nmcli device wifi list

ip link set wlan3 down

iw wlan3 set type monitor

ip link set wlan3 up

iw dev

```