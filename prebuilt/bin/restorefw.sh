#!/system/bin/sh
echo Starting

WINTEKPANEL=1
FILENAME="FTS0019U700_Ver14_app.bin"
NEWFWVER="14"
VARX=1

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
	
	
	TPFWVER=`cat /sys/bus/i2c/devices/2-0038/tpfwver`
	echo "TPFWVER=$TPFWVER"
	
	VARX=$((VARX+1))
done
exit
