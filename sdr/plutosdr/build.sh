# 0. apply antsdr pluto-fw-patch
# 1. buildroot cannot use LD_LIBRARY_PATH with empty :
export LD_LIBRARY_PATH=
# 2. VIVADO_VERSION ?= 2025.2
export VIVADO_SETTINGS=~/src/vivado/2025.2/Vivado/settings64.sh
# 3. rename u-boot-xlinx/incluce/libfdt_env.h and libfdt.h to libfdt_env2.h and libfdt2.h for avoid conflict with /usr/include
# 4. buildroot wget and curl need setup proxy 
export http_proxy=http://127.0.0.1:7890/
export https_proxy=http://127.0.0.1:7890/
export ftp_proxy=http://127.0.0.1:7890
export no_proxy="localhost, 127.0.0.1"
# 5. m4-1.4.19 build need under gcc gnu17 replace 
#    GL_LIST_INLINE _GL_ATTRIBUTE_NODISCARD to _GL_ATTRIBUTE_NODISCARD GL_LIST_INLINE    
#    GL_OSET_INLINE _GL_ATTRIBUTE_NODISCARD to _GL_ATTRIBUTE_NODISCARD GL_OSET_INLINE 
# 6. libad9361-iio-0.3 and libini-a467418 update cmake_minimum_required to 3.5
# 7. may migration to vitis -s not xsct
# reffer 
#    (a) https://docs.amd.com/r/en-US/ug1400-vitis-embedded/XSCT-to-Python-API-Migration
#    (b) https://github.com/Xilinx/Vitis-Tutorials/tree/2024.1/Embedded_Software/Feature_Tutorials/04-vitis_scripting_flows
# in pluto-fw/Makefile 
# change bash -c "source $(VIVADO_SETTINGS) && xsct scripts/create_fsbl_project.tcl"
# to bash -c "source $(VIVADO_SETTINGS) && vitis -s scripts/create_fsbl_project.py"
# 8. change build/sdk/fsbl/Release/fsbl to build/sdk/fsbl/export/fsbl/sw/boot/fsbl.elf this seem a change from java style to cpp style