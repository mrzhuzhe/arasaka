# ssh not vnc
printf -v macaddr "52:54:%02x:%02x:%02x:%02x" $(( $RANDOM & 0xff)) $(( $RANDOM & 0xff )) $(( $RANDOM & 0xff)) $(( $RANDOM & 0xff ))
echo $macaddr
qemu-system-x86_64 \
    -smp 8 \
    -cpu host \
    -nographic  \
    -display vnc=127.0.0.1:0 \
    -nic user,hostfwd=tcp::10022-:2222,mac="$macaddr" \
    -drive if=pflash,format=raw,file=OVMF.fd \
    -m 4096 \
    -enable-kvm \
    -drive file=archlinux_sec.qcow2,format=qcow2

# archlinux x86
# ssh -p 10022 sanszhu@127.0.0.1
# This image can build linux kernel