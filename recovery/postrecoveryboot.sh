#!/sbin/sh

# Resets the boot counter and the bcb instructions
mkdir /rom
mount /dev/block/mmcblk0p5 /rom
mkdir /bootdata
mount /dev/block/mmcblk0p6 /bootdata

# Zero out the boot counter
dd if=/dev/zero of=/rom/devconf/BootCnt bs=1 count=4
dd if=/dev/zero of=/bootdata/BootCnt bs=1 count=4

# Reset the bootloader control block (bcb) file
dd if=/dev/zero of=/rom/bcb bs=1 count=1088
dd if=/dev/zero of=/bootdata/BCB bs=1 count=1088


umount /rom
rmdir /rom
umount /bootdata
rmdir /bootdata

