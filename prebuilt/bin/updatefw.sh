#!/system/bin/sh
echo Starting

WINTEKPANEL=1
FILENAME="ft5406-sc3052-1024X768.bin"
NEWFWVER="0B"
VARX=1

echo "0x00" > /sys/bus/i2c/devices/2-0038/wmreg

FWID=`cat /sys/bus/i2c/devices/2-0038/wmval`
echo "FWID=$FWID"

VENDORID=`cat /sys/bus/i2c/devices/2-0038/vendorid`
echo "VENDORID=$VENDORID"

TPFWVER=`cat /sys/bus/i2c/devices/2-0038/tpfwver`
echo "TPFWVER=$TPFWVER"

echo "Update firmware using $FILENAME from version $TPFWVER"
while
do
	if [ "$TPFWVER" = "$NEWFWVER" ]; then
		echo "Firmware updated!"
		exit
	else
		echo "Firmware failed to update! $VARX"
		if [ "$VARX" = "20" ]; then
			exit
		fi
	fi
	echo "$FILENAME" > /sys/bus/i2c/devices/2-0038/fwupdate
	
	cat /sys/bus/i2c/devices/2-0038/calibrate
	cat /sys/bus/i2c/devices/2-0038/storecalibrateflash
	
	VENDORID=`cat /sys/bus/i2c/devices/2-0038/vendorid`
	echo "VENDORID=$VENDORID"
	
	TPFWVER=`cat /sys/bus/i2c/devices/2-0038/tpfwver`
	echo "TPFWVER=$TPFWVER"
	
	VARX=$((VARX+1))
done
exit
