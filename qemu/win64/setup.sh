qemu-img create -f qcow2 my_img 64G

printf -v macaddr "52:54:%02x:%02x:%02x:%02x" $(( $RANDOM & 0xff)) $(( $RANDOM & 0xff )) $(( $RANDOM & 0xff)) $(( $RANDOM & 0xff ))
qemu-system-x86_64 \
    -net nic,macaddr="$macaddr" \
    -cpu host \
    -smp 4 \
    -drive if=pflash,format=raw,file=OVMF.fd \
    -net user \
    -display vnc=127.0.0.1:0 \
    -m 4096 \
    -enable-kvm \
    -cdrom "./26100.32230.260111-0550.lt_release_svc_refresh_SERVER_EVAL_x64FRE_zh-cn.iso" \
    -boot order=d,menu=on \
    -drive file=WindowsVM.img,format=qcow2 \