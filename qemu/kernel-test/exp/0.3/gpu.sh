#  https://documentation.ubuntu.com/server/how-to/graphics/gpu-virtualization-with-qemu-kvm/
#  vfio https://docs.kernel.org/driver-api/vfio.html
#  https://mathiashueber.com/pci-passthrough-ubuntu-2004-virtual-machine/   
#  https://forum.level1techs.com/t/ubuntu-24-04-dual-quadro-vfio-quick-start/212639

# find /sys/kernel/iommu_groups/ -name "*$(lspci | awk '/ 3D / {print $1}')*"

# ll /sys/kernel/iommu_groups/2/devices/

# echo "blacklist nouveau" | sudo tee /etc/modprobe.d/blacklist-nouveau.conf          
# echo "options nouveau modeset=0" | sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf
# sudo update-initramfs -u                                                         
# sudo reboot                                                                      

# lspci -v | grep -A 10 " 3D "

PREREQ=""

prereqs()
{
   echo "$PREREQ"
}

case $1 in
prereqs)
   prereqs
   exit 0
   ;;
esac

for dev in 0000:0c:00.0 0000:0c:00.1 
do 
 echo "vfio-pci" > /sys/bus/pci/devices/$dev/driver_override 
 echo "$dev" > /sys/bus/pci/drivers/vfio-pci/bind 
done

exit 0
