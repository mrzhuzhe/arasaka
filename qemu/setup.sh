qemu-img create -f raw my_img 16G

printf -v macaddr "52:54:%02x:%02x:%02x:%02x" $(( $RANDOM & 0xff)) $(( $RANDOM & 0xff )) $(( $RANDOM & 0xff)) $(( $RANDOM & 0xff ))
qemu-system-x86_64 \
    -net nic,macaddr="$macaddr" \
    -net user \
    -drive if=pflash,format=raw,file=OVMF.fd \
    -display vnc=127.0.0.1:0 \
    -m 4096 \
    -enable-kvm \
    -cdrom archlinux-2024.12.01-x86_64.iso \
    -boot order=d \
    -drive file=test_img,format=raw


mkfs.ext4 /dev/sda3
mkswap /dev/sda2
mkfs.fat -F 32 /dev/sda1

mount /dev/sda3 /mnt
mount --mkdir /dev/sda1 /mnt/boot
swapon /dev/sda2

pacstrap -K /mnt base linux linux-firmware

arch-chroot /mnt

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB

grub-mkconfig -o /boot/grub/grub.cfg

//  https://wiki.archlinux.org/title/Systemd-networkd#Wired_adapter_using_DHCP

systemctl restart systemd-networkd
systemctl restart systemd-resolved