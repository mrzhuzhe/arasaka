qemu-system-x86_64 \
    -net nic,macaddr="$macaddr" \
    -net user \
    -drive if=pflash,format=raw,file=./outputs/helloworld.efi \
    -display vnc=127.0.0.1:0 \
    -m 4096 \
    -enable-kvm \
    -boot order=d \
    -drive file=test_img,format=raw