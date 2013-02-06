#!/system/bin/sh

PATH=/system/bin:/system/xbin
NVS_BIN=/system/etc/firmware/ti-connectivity/wl1271-nvs.bin

if [ -f "$NVS_BIN" ];
then
   busybox mount -o rw,remount -t ext4 /dev/block/mmcblk0p8 /system
   MAC=`cat /rom/devconf/MACAddress | sed 's/\(..\)\(..\)\(..\)\(..\)\(..\)/\1:\2:\3:\4:\5:/'`
   calibrator set nvs_mac $NVS_BIN $MAC
   busybox mount -o ro,remount -t ext4 /dev/block/mmcblk0p8 /system
fi
