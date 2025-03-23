qemu-system-loongarch64 \
-m 4G \
-M virt \
-smp 2 \
-cpu la464 \
-bios outputs/loongson/QEMU_EFI.fd \
-serial stdio
