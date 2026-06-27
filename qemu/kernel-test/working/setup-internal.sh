# this is a internal bridge for test
#  warning: hub 0 is not connected to host network

# ssh not vnc
printf -v macaddr "52:54:%02x:%02x:%02x:%02x" $(( $RANDOM & 0xff)) $(( $RANDOM & 0xff )) $(( $RANDOM & 0xff)) $(( $RANDOM & 0xff ))
echo $macaddr
qemu-system-x86_64 \
    -smp 8 \
    -cpu host \
    -nographic  \
    -display vnc=127.0.0.1:0 \
    -nic bridge,br=br0,mac="$macaddr" \
    -drive if=pflash,format=raw,file=OVMF.fd \
    -m 4096 \
    -enable-kvm \
    -drive file=archlinux_sec.qcow2,format=qcow2

