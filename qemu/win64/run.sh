printf -v macaddr "52:54:%02x:%02x:%02x:%02x" $(( $RANDOM & 0xff)) $(( $RANDOM & 0xff )) $(( $RANDOM & 0xff)) $(( $RANDOM & 0xff ))
echo $macaddr
qemu-system-x86_64 \
    -cpu host \
    -smp 4 \
    -drive if=pflash,format=raw,file=OVMF.fd \
    -nic user,mac="$macaddr",hostfwd=tcp::13389-:3389,hostfwd=tcp::10023-:22
    -display vnc=127.0.0.1:1 \
    -m 4096 \
    -enable-kvm \
    -boot order=d \
    -drive file=WindowsVM.img,format=qcow2