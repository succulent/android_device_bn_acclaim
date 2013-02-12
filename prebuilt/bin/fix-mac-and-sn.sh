#!/system/bin/sh

PATH=/sbin:/vendor/bin:/system/sbin:/system/bin:/system/xbin
NVS_BIN=/system/etc/firmware/ti-connectivity/wl1271-nvs.bin

mount -o remount rw /system
MAC=`cat /rom/devconf/MACAddress | sed 's/\(..\)\(..\)\(..\)\(..\)\(..\)/\1:\2:\3:\4:\5:/'`
calibrator set nvs_mac $NVS_BIN $MAC

SNO=`cat /rom/devconf/SerialNumber`
setpropex ro.boot.serialno $SNO
setpropex ro.serialno $SNO
mount -o remount ro /system

