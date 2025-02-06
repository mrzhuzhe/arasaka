#!/bin/bash

printf -v macaddr "52:54:%02x:%02x:%02x:%02x" $(( $RANDOM & 0xff)) $(( $RANDOM & 0xff )) $(( $RANDOM & 0xff)) $(( $RANDOM & 0xff ))

# qemu-system-x86_64 \
#     -net nic,macaddr="$macaddr" \
#     -net user \
#     -drive if=pflash,format=raw,file=OVMF.fd \
#     -display vnc=127.0.0.1:0 \
#     -m 4096 \
#     -enable-kvm \
#     -cdrom archlinux-2025.01.01-x86_64.iso \
#     -boot order=d \
#     -drive file=my_img,format=raw



qemu-system-x86_64 \
    -nographic  \
    -smp 4 \
    -net nic,macaddr="$v" \
    -net user,hostfwd=tcp::10022-:22 \
    -device vfio-pci,host=01:00.0,multifunction=on \
    -device vfio-pci,host=01:00.1 \
    -drive if=pflash,format=raw,file=OVMF.fd \
    -m 4096 \
    -enable-kvm \
    -drive file=my_img,format=raw \
    -nographic