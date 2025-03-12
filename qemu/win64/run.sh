printf -v macaddr "52:54:%02x:%02x:%02x:%02x" $(( $RANDOM & 0xff)) $(( $RANDOM & 0xff )) $(( $RANDOM & 0xff)) $(( $RANDOM & 0xff ))
qemu-system-x86_64 \
    -net nic,macaddr="$macaddr" \
    -net user \
    -drive if=pflash,format=raw,file=debug/OVMF.fd \
    -display vnc=127.0.0.1:0 \
    -m 4096 \
    -enable-kvm \
    -boot order=d \
    -drive file=/mount_point,format=raw