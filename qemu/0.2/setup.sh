# ssh not vnc
printf -v macaddr "52:54:%02x:%02x:%02x:%02x" $(( $RANDOM & 0xff)) $(( $RANDOM & 0xff )) $(( $RANDOM & 0xff)) $(( $RANDOM & 0xff ))
echo $macaddr
qemu-system-x86_64 \
    -smp 4 \
    -nographic  \
    -net nic,macaddr="$v" \
    -net user,hostfwd=tcp::10022-:22 \
    -drive if=pflash,format=raw,file=OVMF.fd \
    -m 4096 \
    -enable-kvm \
    -drive file=test_img,format=raw


