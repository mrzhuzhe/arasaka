sudo tshark -i tun0 -f "tcp port 80"

# request headers
tshark -i tun0 -f "tcp port 80" -V -Y "http.request"