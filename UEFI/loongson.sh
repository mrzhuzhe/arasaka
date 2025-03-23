# qemu-system-loongarch64 \
# -m 4G \
# -M virt \
# -smp 2 \
# -cpu la464 \
# -bios outputs/loongson/QEMU_EFI.fd \
# -serial stdio


printf -v macaddr "52:54:%02x:%02x:%02x:%02x" $(( $RANDOM & 0xff)) $(( $RANDOM & 0xff )) $(( $RANDOM & 0xff)) $(( $RANDOM & 0xff ))

qemu-system-loongarch64 \
    -m 4G \
    -cpu la464-loongarch-cpu \
    -machine virt \
    -smp 4 \
    -bios outputs/loongson/QEMU_EFI.fd\
    -serial stdio \
    -device virtio-gpu-pci \
    -net nic,macaddr="$macaddr" \
    -net user \
    -display vnc=127.0.0.1:0 \
    -device nec-usb-xhci,id=xhci,addr=0x1b \
    -device usb-tablet,id=tablet,bus=xhci.0,port=1 \
    -device usb-kbd,id=keyboard,bus=xhci.0,port=2 \
    -hda outputs/archlinux-minimal-2024.04.23-loong64.qcow2 \
    -nographic
