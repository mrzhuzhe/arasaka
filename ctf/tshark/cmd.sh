sudo tshark -i tun0 -f "tcp port 80"

# -V introduce more detail 
tshark -i tun0 -f "tcp port 80" -V -Y "http.request"

# -O seems more readable
sudo tshark -i tun0 -O http -Y http.request 