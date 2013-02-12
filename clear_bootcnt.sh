#!/system/bin/sh
##################################################################################
#
# File          clear_bootcount.sh
# Description	Clear the bootcount variable to 0 on successful boot
#
##

# Zero out the boot counter
dd if=/dev/zero of=/bootdata/BootCnt bs=1 count=4

# Reset the bootloader control block (bcb) file
dd if=/dev/zero of=/bootdata/BCB bs=1 count=1088
