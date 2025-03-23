## Build UEFI
```
# https://github.com/tianocore/edk2/tree/master/OvmfPkg/LoongArchVirt#readme

export WORKSPACE=`/mnt/e28833eb-0c99-4fe2-802a-09fa58d9c9f5/code`
export GCC_LOONGARCH64_PREFIX=loongarch64-unknown-linux-gnu-
export PACKAGES_PATH=$WORKSPACE/edk2
export EDK_TOOLS_PATH=$WORKSPACE/edk2/BaseTools
source ./edksetup.sh BaseTools
build -b RELEASE -t GCC -a LOONGARCH64 -p OvmfPkg/LoongArchVirt/LoongArchVirtQemu.dsc


```