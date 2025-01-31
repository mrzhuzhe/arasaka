#  https://documentation.ubuntu.com/server/how-to/graphics/gpu-virtualization-with-qemu-kvm/
#  vfio https://docs.kernel.org/driver-api/vfio.html

find /sys/kernel/iommu_groups/ -name "*$(lspci | awk '/ 3D / {print $1}')*"

ll /sys/kernel/iommu_groups/2/devices/

echo "blacklist nouveau" | sudo tee /etc/modprobe.d/blacklist-nouveau.conf          
echo "options nouveau modeset=0" | sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf
sudo update-initramfs -u                                                         
sudo reboot                                                                      

lspci -v | grep -A 10 " 3D "
