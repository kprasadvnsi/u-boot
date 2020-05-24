# This is an example file to generate boot.scr - a boot script for U-Boot
# This example only target for qspi boot, sameway it can be created for boot
# devices like nand.
# Generate boot.scr:
# ./tools/mkimage -c none -A arm -T script -d sdboot.cmd boot.scr
#
# It requires a list of environment variables used below to be defined
# before load

setenv bootargs console=ttyPS0,115200 earlyprintk root=/dev/mmcblk0p2 rw rootwait panic=10
load mmc 0:1 ${fdt_addr_r} zynq-hex.dtb
load mmc 0:1 ${kernel_addr_r} uImage
bootm ${kernel_addr_r} - ${fdt_addr_r}

