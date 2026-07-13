# this version use passt to get better network performance but seems not work
passt -f &
# ssh not vnc
printf -v macaddr "52:54:%02x:%02x:%02x:%02x" $(( $RANDOM & 0xff)) $(( $RANDOM & 0xff )) $(( $RANDOM & 0xff)) $(( $RANDOM & 0xff ))
echo $macaddr
qemu-system-x86_64 \
    -smp 8 \
    -cpu host \
    -nographic  \
    -display vnc=127.0.0.1:0 \
    -device virtio-net-pci,netdev=s,mac="$macaddr" \
    -netdev stream,id=s,server=off,addr.type=unix,addr.path=/tmp/passt_1.socket \
    -drive if=pflash,format=raw,file=OVMF.fd \
    -m 4096 \
    -enable-kvm \
    -drive file=archlinux_sec.qcow2,format=qcow2

