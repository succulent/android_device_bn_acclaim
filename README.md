Device configuration for the acclaim (Nook Tablet)

Copyright (C) 2011 The CyanogenMod Project

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0
-----------------------------------------------------------------------------------------------------------

Initial pull and modify from whistlestop repo as a base.

Other reference bases: android_device_bn_encore, android_device_motorola_targa, android_device_lge_p920. 

Instructions on compiling CM7 for Nook Tablet (assuming you have set your cm7 repo and have neccessary packages installed):

In your terminal, redirect to your cm7 build directory.
- $ mkdir device/bn
- $ mkdir device/bn/acclaim
- $ git clone https://github.com/succulent/android_device_bn_acclaim
- $ mv android_device_bn_acclaim device/bn/acclaim
- $ mkdir vendor/bn
- $ mkdir vendor/bn/acclaim
- $ git clone https://github.com/succulent/android_vendor_bn_acclaim
- $ mv android_vendor_bn_acclaim vendor/bn/acclaim
- $ make clean
- $ . build/envsetup.sh && brunch acclaim

Outputted flashable roms,
- cyanogen_acclaim-ota-eng.hd.zip
- update-cm-7.2.0-RC1-acclaim-UNOFFICIAL-signed.zip
- location, out/target/product/acclaim/

Setting up sdcard,
- Format micro sdcard with FAT32 LBA Boot (tested with 2GB SanDisk/Kingston microSD)
-    For Windows 7, Use EASEUS Partition Master Home Edition (free)
-    Format sdcard,
-       Partition Label: Boot
-       File System: FAT32
-       Cluster Size 16KB
-       set status Active
-       apply patch
- Copy recovery.img from the out from out/target/product/acclaim/ onto the root of your sdcard
- Rename recovery.img to boot.img or use contents here, https://github.com/succulent/acclaim_recovery_sdcard
- Copy contents (flashing_boot.img, MLO, and u-boot.bin) onto the root of your sdcard
- Copy update-cm-7.2.0-RC1-acclaim-UNOFFICIAL-signed.zip onto the root of your sdcard
- Power off device (Nook Tablet)
- insert sdcard to device
- hold power button for a couple of seconds to power on
- wait until device boot into recovery

Installing rom from recovery,
- install zip from sdcard
-    navigate with volume keys and select with home button
- choose zip from sdcard
- update-cm-7.2.0-RC1-acclaim-UNOFFICIAL-signed.zip (wait up to a couple minutes)
- press power button  to go back
- wipe data/factory reset (1st time installing)
- wipe cache partition (1st time installing)
- reboot system now (restart device)

First time booting sequence,
- Initial BN n logo
- Custom n logo (a couple of seconds)
- 2 androids logo (wait up to a minute)
- CM7 android logo (wait up to a couple minutes)

Other flashable Files
- flash_recovery.zip (use to flash it. no more sdcard recovery)
- Hold Power & "n button" down until the device turns on and off again. 
- Then press Power to turn the device on normally and access the recovery. 
- You can also boot to recovery by issuing command "reboot recovery" in adb or terminal
- flash_boot.zip (a backup boot.img if needed to reflash)
- DO NOT FLASH it with other rom besides the rom created with these source and kernel.

--HD (succulent on XDA)
- For help go here, http://forum.xda-developers.com/showthread.php?t=1545766
- Prebuilt rom, http://http://iamafanof.wordpress.com/
