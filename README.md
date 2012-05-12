<pre><strong> Device configuration for the acclaim (Nook Tablet)</strong>

<strong> Copyright (C) 2011 The Android Open-Source Project</strong>

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

<strong><code> http://www.apache.org/licenses/LICENSE-2.0</code></strong>

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "<strong>AS IS</strong>" <strong>BASIS</strong>,
 <strong>WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND</strong>, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.</pre>

<hr />

<strong>Initial pull and modify from WhistleStop repo as a base.</strong>

<strong>Other reference bases: android_device_bn_encore, android_device_motorola_targa, android_device_lge_p920.</strong>
<a name="nook_tablet_and_cm7"></a>
<span style="color:#ff0000;"><strong>Contents</strong></span>
<ol>
	<li><strong><a href="#how_to_compile_cm7">How to compile CM7</a></strong></li>
	<li><strong><a href="#setting_up_recovery_sdcard">Setting up recovery sdcard</a></strong></li>
	<li><strong><a href="#backup_using_recovery">Backup using recovery</a></strong></li>
	<li><strong><a href="#installing_rom_from_recovery">Installing rom from recovery</a></strong></li>
	<li><strong><a href="#first_time_booting_sequence">First time booting sequence</a></strong></li>
	<li><strong><a href="#other_flashable_files">Other flashable files (Did you messed up your Nook Tablet?)</a></strong></li>
</ol>
<a name="how_to_compile_cm7"></a>
<span style="color:#ff0000;"><strong>1) How to compile CM7</strong></span> <a href="#nook_tablet_and_cm7">^</a>

<span style="color:#ff6600;"><strong>Install <span style="text-decoration:underline;"><span style="color:#ff0000;text-decoration:underline;"><a title="VirtualBox" href="https://www.virtualbox.org/wiki/Downloads" target="_blank"><span style="color:#ff0000;text-decoration:underline;">VirtualBox</span></a></span></span> and <span style="text-decoration:underline;"><span style="color:#ff0000;text-decoration:underline;"><a title="Ubuntu" href="http://www.ubuntu.com/download/desktop" target="_blank"><span style="color:#ff0000;text-decoration:underline;">Ubuntu</span></a></span></span> with at least 20GB.</strong></span>

<span style="color:#ff6600;"><strong>Install the Build Packages
Install using the package manager of your choice:</strong></span>

<span style="color:#ff6600;"><strong>For 32-bit &amp; 64-bit systems:</strong></span>
<ul>
	<li><strong> $ sudo apt-get install git-core gnupg flex bison gperf libsdl1.2-dev libesd0-dev libwxgtk2.6-dev squashfs-tools build-essential zip curl libncurses5-dev zlib1g-dev sun-java6-jdk pngcrush schedtool</strong></li>
</ul>
<span style="color:#ff6600;"><strong>For 64-bit only systems:</strong></span>
<ul>
	<li><strong>$ sudo apt-get install g++-multilib lib32z1-dev lib32ncurses5-dev lib32readline5-dev gcc-4.3-multilib g++-4.3-multilib</strong></li>
</ul>
<span style="color:#3366ff;"><strong>NOTE: gcc-4.3-multilib g++-4.3-multilib is no longer available for Ubuntu 11.04 64-bit, but should still build without issue. </strong></span>

<span style="color:#3366ff;"> <strong>NOTE: On Ubuntu 10.10, and variants, you need to enable the parter repository to install sun-java6-jdk:</strong></span>
<ul>
	<li><strong>$ add-apt-repository "deb <a href="http://archive.canonical.com/" rel="nofollow" target="_blank">http://archive.canonical.com/</a> maverick partner"</strong></li>
</ul>
<span style="color:#ff6600;"><strong>Create the Directories
You will need to set up some directories in your build environment.</strong></span>

<span style="color:#ff6600;"><strong>To create them:</strong></span>
<ul>
	<li><strong>$ mkdir -p ~/bin </strong></li>
	<li><strong> $ mkdir -p ~/android/system</strong></li>
</ul>
<span style="color:#ff6600;"><strong>Install the Repository</strong></span>

<span style="color:#ff6600;"><strong>Enter the following to download make executable the "repo" binary:</strong></span>
<ul>
	<li><strong>$ curl <a href="https://dl-ssl.google.com/dl/googlesource/git-repo/repo" rel="nofollow" target="_blank">https://dl-ssl.google.com/dl/googlesource/git-repo/repo</a> &gt; ~/bin/repo </strong></li>
	<li><strong> $ chmod a+x ~/bin/repo</strong></li>
</ul>
<span style="color:#3366ff;"><strong>NOTE: You may need to reboot for these changes to take effect. </strong></span>

<span style="color:#ff6600;"><strong>Now enter the following to initialize the repository:</strong></span>
<ul>
	<li><strong> $ cd ~/android/system/ </strong></li>
	<li><strong> $ repo init -u git://github.com/CyanogenMod/android.git -b gingerbread</strong></li>
</ul>
<span style="color:#ff6600;"><strong>If you don't want to download unnecessary device projects, open .repo/manifest.xml. Remove devices between device/common and external/alsa-lib.</strong></span>
<ul>
	<li><strong>&lt;project path="device/common" name="CyanogenMod/android_device_common" /&gt;</strong></li>
	<li><strong> - delete devices -</strong></li>
	<li><strong> &lt;project path="external/alsa-lib" name="CyanogenMod/android_external_alsa-lib" /&gt;</strong></li>
</ul>
<ul>
	<li><strong>$ repo sync</strong></li>
</ul>
<span style="color:#3366ff;"><strong>NOTE: This step takes a long time, depending on your internet speed. It will download several gigabytes of data. I recommend that you have a lot of hard drive space.</strong></span>
<strong></strong>
<ul>
	<li><strong>$ mkdir device/bn</strong></li>
	<li><strong> $ mkdir device/bn/acclaim</strong></li>
	<li><strong> $ git clone <a href="https://github.com/succulent/android_device_bn_acclaim" rel="nofollow" target="_blank">https://github.com/succulent/android_device_bn_acclaim</a></strong></li>
	<li><strong> $ mv android_device_bn_acclaim device/bn/acclaim</strong></li>
	<li><strong> $ mkdir vendor/bn</strong></li>
	<li><strong> $ mkdir vendor/bn/acclaim</strong></li>
	<li><strong> $ git clone <a href="https://github.com/succulent/android_vendor_bn_acclaim" rel="nofollow" target="_blank">https://github.com/succulent/android_vendor_bn_acclaim</a></strong></li>
	<li><strong> $ mv android_vendor_bn_acclaim vendor/bn/acclaim</strong></li>
	<li><strong> $ /vendor/cyanogen/./get-rommanager</strong></li>
	<li><strong> $ make clean</strong></li>
</ul>
<span style="color:#ff6600;"><strong>Configure Build &amp; Compile</strong></span>
<ul>
	<li><strong>$ . build/envsetup.sh &amp;&amp; brunch acclaim</strong></li>
</ul>
<span style="color:#3366ff;"><strong>NOTE: This step takes a long time, time vary depend on your computer processing power.</strong></span>

<span style="color:#ff6600;"><strong>Outputted flashable roms</strong></span>
<ul>
	<li><strong>cyanogen_acclaim-ota-eng.hd.zip</strong></li>
	<li><strong>update-cm-7.2.0-RC1-acclaim-UNOFFICIAL-signed.zip</strong></li>
	<li><strong>location, out/target/product/acclaim/</strong></li>
</ul>
<span style="color:#ff6600;"><strong>Copy your .zip file from ~/out/target/product/acclaim/update.cm-XXXXX-signed.zip to the root of the SD card. </strong></span>

<span style="color:#ff6600;"> <strong>Your rom will contain recovery, MLO and U-boot.bin.</strong><strong></strong></span>

<span style="color:#ff6600;"> <strong>Flash .zip files from recovery. Wipe data/factory reset/cache. </strong></span>

<span style="color:#ff6600;"><strong>References:</strong></span>

<span style="color:#ff6600;"><strong>Fattire's CM9 for NookColor Build Instructions</strong></span>
<span style="text-decoration:underline;"><span style="color:#ff0000;text-decoration:underline;"><a href="https://docs.google.com/document/d/19f7Z1rxJHa5grNlNFSkh7hQ0LmDOuPdKMQUg8HFiyzs/edit?pli=1" rel="nofollow" target="_blank"><span style="color:#ff0000;text-decoration:underline;">https://docs.google.com/document/d/1...yzs/edit?pli=1</span></a></span></span>

<span style="color:#ff6600;"><strong>Barnes &amp; Noble Nook Color: Compile CyanogenMod (Linux)</strong></span>
<span style="text-decoration:underline;"><span style="color:#ff0000;text-decoration:underline;"><a href="http://wiki.cyanogenmod.com/wiki/Barnes_%26_Noble_Nook_Color:_Compile_CyanogenMod_%28Linux%29" rel="nofollow" target="_blank"><span style="color:#ff0000;text-decoration:underline;">http://wiki.cyanogenmod.com/wiki/Bar...od_%28Linux%29</span></a></span></span>

<a name="setting_up_recovery_sdcard"></a>
<span style="color:#ff0000;"><strong>2) Setting up recovery sdcard</strong></span> <a href="#nook_tablet_and_cm7">^</a>
<ul>
	<li><strong>Format micro sdcard with FAT32 LBA Boot <span style="color:#3366ff;">(tested with 2GB SanDisk/Kingston microSD)</span></strong></li>
	<li><strong>For Windows 7, <span style="text-decoration:underline;"><span style="color:#ff0000;"><a title="MiniTool Partition Wizard Home Edition" href="http://www.partitionwizard.com/free-partition-manager.html" target="_blank"><span style="color:#ff0000;text-decoration:underline;">MiniTool Partition Wizard Home Edition</span></a></span></span> <span style="color:#3366ff;">(free)</span></strong></li>
	<li><strong>-Format sdcard,</strong></li>
	<li><strong>-File System: FAT32</strong></li>
	<li><strong>-Partition Label: Boot</strong></li>
	<li><strong>-Create As: Primary</strong></li>
	<li><strong>-Cluster Size: Biggest one, 64KB if available</strong></li>
	<li><strong>-Apply patch</strong></li>
	<li><strong>-Right click on Boot partition, Modify &gt; Set status Active</strong></li>
	<li><strong>-Apply patch again</strong></li>
	<li><strong>Copy recovery.img from the directory, out/target/product/acclaim/ onto the root of your sdcard</strong></li>
	<li><strong>Rename recovery.img to boot.img or use the contents here,</strong></li>
	<li><strong><span style="text-decoration:underline;"><span style="color:#ff0000;"><a href="https://github.com/succulent/acclaim_recovery_sdcard"><span style="color:#ff0000;text-decoration:underline;">https://github.com/succulent/acclaim_recovery_sdcard</span></a></span></span></strong></li>
	<li><strong>Copy contents (<span style="text-decoration:underline;"><span style="color:#ff0000;"><a id="728a65b29ade6c3de48459affcc2faf9f97e2f17" href="https://github.com/succulent/acclaim_recovery_sdcard/blob/master/flashing_boot.img"><span style="color:#ff0000;text-decoration:underline;">flashing_boot.img</span></a></span></span>, <span style="text-decoration:underline;"><span style="color:#ff0000;"><a id="7d129a28fcb03857b64ba0ce29abbbcb8fcc0d32" href="https://github.com/succulent/acclaim_recovery_sdcard/blob/master/MLO"><span style="color:#ff0000;text-decoration:underline;">MLO</span></a></span></span>, and <span style="text-decoration:underline;"><span style="color:#ff0000;"><a id="ae131b593a8622fe90b68aa0424ab79412a4ab5a" href="https://github.com/succulent/acclaim_recovery_sdcard/blob/master/u-boot.bin"><span style="color:#ff0000;text-decoration:underline;">u-boot.bin</span></a></span></span>) onto the root of your sdcard</strong></li>
	<li><strong>Copy <span style="color:#008000;">update-cm-7.2.0-RC1-acclaim-UNOFFICIAL-signed.zip</span> onto the root of your sdcard</strong></li>
	<li><strong>Power off device <span style="color:#3366ff;">(Nook Tablet)</span></strong></li>
	<li><strong>insert sdcard to device</strong></li>
	<li><strong>hold power button for a couple of seconds to power on</strong></li>
	<li><strong>wait until device boot into recovery</strong></li>
</ul>
<a name="backup_using_recovery"></a>
<span style="color:#ff0000;"><strong>3) Backup using recovery (If you are coming from stock)</strong></span> <a href="#nook_tablet_and_cm7">^</a>
<ul>
	<li><strong>At the CWM-based Recovery v5.0.2.8 screen</strong></li>
	<li><strong><span style="color:#3366ff;">(navigate with volume keys and select with home button)</span></strong></li>
	<li><strong>&gt; backup and restore</strong></li>
	<li><strong>&gt; backup (to restore, use restore)</strong></li>
</ul>
<a name="installing_rom_from_recovery"></a>
<strong><span style="color:#ff0000;">4) Installing rom from recovery</span></strong> <a href="#nook_tablet_and_cm7">^</a>
<ul>
	<li><strong><span style="color:#3366ff;">(press power button to go back)</span></strong></li>
	<li><strong>&gt; install zip from sdcard</strong></li>
	<li><strong><span style="color:#3366ff;">(navigate with volume keys and select with home button)</span></strong></li>
	<li><strong>&gt; choose zip from sdcard</strong></li>
	<li><strong><span style="color:#008000;">&gt; Yes - update-cm-7.2.0-RC1-acclaim-UNOFFICIAL-signed.zip</span> <span style="color:#3366ff;">(wait up to a couple minutes)</span></strong></li>
	<li><strong>&gt; wipe data/factory reset <span style="color:#3366ff;">(1st time installing)</span></strong></li>
	<li><strong>&gt; wipe cache partition <span style="color:#3366ff;">(1st time installing)</span></strong></li>
	<li><strong>&gt; reboot system now <span style="color:#3366ff;">(restart device)</span></strong></li>
</ul>
<a name="first_time_booting_sequence"></a>
<span style="color:#ff0000;"><strong>5) First time booting sequence</strong></span> <a href="#nook_tablet_and_cm7">^</a>
<ul>
	<li><strong>Initial BN n logo</strong></li>
	<li><strong>Custom n logo<span style="color:#3366ff;"> (a couple of seconds)</span></strong></li>
	<li><strong><span style="text-decoration:underline;"><span style="color:#ff0000;"><a title="2 Androids Logo" href="http://iamafanof.files.wordpress.com/2012/04/two_androids.png" target="_blank"><span style="color:#ff0000;text-decoration:underline;">2 androids logo</span></a></span></span> <span style="color:#3366ff;">(wait up to a minute)</span></strong></li>
	<li><strong><span style="text-decoration:underline;"><span style="color:#ff0000;"><a title="CM7 Android Logo" href="http://iamafanof.files.wordpress.com/2012/04/cm7.png" target="_blank"><span style="color:#ff0000;text-decoration:underline;">CM7 android logo</span></a></span></span> <span style="color:#3366ff;">(wait up to a couple minutes)</span></strong></li>
</ul>
<a name="other_flashable_files"></a>
<span style="color:#ff0000;"><strong>6) Other flashable files (Did you messed up your Nook Tablet?)</strong></span> <a href="#nook_tablet_and_cm7">^</a>
<ul>
	<li><strong><span style="color:#3366ff;"><span style="text-decoration:underline;"><span style="color:#ff0000;"><a id="f0843bfd5b63190deb74efe1c5d7fac5de136607" href="https://github.com/succulent/acclaim_recovery_sdcard/blob/master/flash_recovery.zip"><span style="color:#ff0000;text-decoration:underline;">flash_recovery.zip</span></a></span></span> (use recovery to flash it. no more sdcard CWM Recovery)</span></strong></li>
	<li><strong>Hold Power &amp; “n button” down until the device turns on and off again.</strong></li>
	<li><strong>Then press Power to turn the device on normally and access the recovery.</strong></li>
	<li><strong>You can also boot to recovery by issuing command “reboot recovery” in adb or terminal</strong></li>
	<li><strong><span style="text-decoration:underline;color:#ff0000;"><a id="8c7a91316f76701334b2d2420c12a24cc2a71b08" href="https://github.com/succulent/acclaim_recovery_sdcard/blob/master/flash_stock_recovery.zip"><span style="color:#ff0000;text-decoration:underline;">flash_stock_recovery.zip</span></a></span> <span style="color:#3366ff;">(use it to restore stock recovery.img)</span></strong></li>
	<li><strong><span style="text-decoration:underline;"><span style="color:#ff0000;"> <a id="085b9831e49522e2740605ef971c6db01acfe535" href="https://github.com/succulent/acclaim_recovery_sdcard/blob/master/flash_boot.zip"><span style="color:#ff0000;text-decoration:underline;">flash_boot.zip</span></a></span></span> <span style="color:#3366ff;">(a backup boot.img if needed to re-flash)</span></strong></li>
	<li><strong><span style="color:#ff0000;">DO NOT FLASH</span> it with other rom besides the rom created with this source and kernel.</strong></li>
	<li><strong><span style="text-decoration:underline;"><span style="color:#ff0000;"><a id="6bc1d621bbaf1633ce2f416229b937a28c1b8049" href="https://github.com/succulent/acclaim_recovery_sdcard/blob/master/flash_u-boot_and_MLO.zip"><span style="color:#ff0000;text-decoration:underline;">flash_u-boot_and_MLO.zip</span></a></span></span> <span style="color:#3366ff;">(use it to restore bootloader and x-loader)</span></strong></li>
	<li><strong>Flash this if all you get is a black screen (no ‘n’ logo screen) when turning your Nook Tablet on.</strong></li>
	<li><strong><span style="text-decoration:underline;"><span style="color:#ff0000;text-decoration:underline;"> <a id="470d9c30a38f8e5745043acc82b59cfbb4a454a5" href="https://github.com/succulent/acclaim_recovery_sdcard/blob/master/flash_stock_1.4.2.zip"><span style="color:#ff0000;text-decoration:underline;">flash_stock_1.4.2.zip</span></a></span></span><span style="color:#3366ff;"> (use it to restore to stock 1.4.2)</span></strong></li>
	<li><strong>After restart, it will take up to a couple minutes to setup data and system folder.</strong></li>
	<li><strong>It’ll be up to a couple of minutes before the setup screen shows up.</strong></li>
	<li><strong><span style="color:#008000;"><span style="text-decoration:underline;"><span style="color:#ff0000;"><a id="5307f5e7626b8ab5f8c9dad0fe976b182f341e1f" href="https://github.com/succulent/acclaim_recovery_sdcard/blob/master/flash-restore-stock.zip"><span style="color:#ff0000;text-decoration:underline;">flash-restore-stock.zip</span></a></span></span> </span><span style="color:#3366ff;">(use it to restore partition 1-6)</span></strong></li>
	<li><strong>Only use this as last measure. Meaning only if you formatted rom (p5) and bootdata (p6).</strong></li>
	<li><strong>You will need to install flash_stock_1.4.2.zip afterward or a CM7 rom.</strong></li>
	<li><strong>To get your serial number back, you need to perform factory restore (8 failed boot method)</strong></li>
	<li><strong>The one that prompt</strong>
<ul>
	<li><strong> Clearing data…</strong></li>
	<li><strong> A reset is being performed.</strong></li>
	<li><strong> This may take a few minutes</strong></li>
</ul>
</li>
	<li><strong><span style="text-decoration:underline;"><span style="color:#ff0000;"><a href="https://github.com/succulent/acclaim_recovery_sdcard"><span style="color:#ff0000;text-decoration:underline;">https://github.com/succulent/acclaim_recovery_sdcard</span></a></span></span></strong></li>
	<li><strong>Click on a file and click open raw to download.</strong></li>
</ul>
<span style="color:#ff6600;"><strong>–HD (succulent on XDA)</strong></span>
<ul>
	<li><strong>For help go here, <span style="text-decoration:underline;color:#ff0000;"><a href="http://forum.xda-developers.com/showthread.php?t=1545766"><span style="color:#ff0000;text-decoration:underline;">http://forum.xda-developers.com/showthread.php?t=1545766</span></a></span></strong></li>
	<li><strong>Prebuilt rom, <a title="LINKS" href="http://iamafanof.wordpress.com/2012/04/16/nook-tablet-cm7-2-rc1/" target="_blank"> <span style="text-decoration:underline;"><span style="color:#ff0000;"><span style="color:#ff0000;text-decoration:underline;">http://iamafanof.wordpress.com/</span></span></span></a></strong></li>
</ul>
