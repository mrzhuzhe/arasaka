qemu-img create -f raw my_img 16G

qemu-system-x86_64 \
    -display vnc=127.0.0.1:0 \
    -vga std \
    -m 4096 \
    -enable-kvm \
    -cdrom archlinux-2024.12.01-x86_64.iso \
    -boot order=d \
    -drive file=my_img,format=raw 