qemu-system-x86_64 -nographic -bios outputs/debug/OVMF.fd \
-chardev file,path=debug.log,id=edk2-debug \
-device isa-debugcon,iobase=0x402,chardev=edk2-debug -net none