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

<span style="color: #ff6600;"><strong>Instructions on compiling CM7 for Nook Tablet (assuming you have set your cm7 repo and have necessary packages installed):</strong></span>

<span style="color: #ff6600;"><strong>In your terminal, redirect to your cm7 build directory.</strong></span>
<ul>
	<li>$ mkdir device/bn</li>
	<li>$ mkdir device/bn/acclaim</li>
	<li>$ git clone <span style="text-decoration: underline;"><span style="color: #ff0000;"><a href="https://github.com/succulent/android_device_bn_acclaim"><span style="color: #ff0000; text-decoration: underline;">https://github.com/succulent/android_device_bn_acclaim</span></a></span></span></li>
	<li>$ mv android_device_bn_acclaim device/bn/acclaim</li>
	<li>$ mkdir vendor/bn</li>
	<li>$ mkdir vendor/bn/acclaim</li>
	<li>$ git clone <span style="text-decoration: underline;"><span style="color: #ff0000;"><a href="https://github.com/succulent/android_vendor_bn_acclaim"><span style="color: #ff0000; text-decoration: underline;">https://github.com/succulent/android_vendor_bn_acclaim</span></a></span></span></li>
	<li>$ mv android_vendor_bn_acclaim vendor/bn/acclaim</li>
	<li>$ make clean</li>
	<li>$ . build/envsetup.sh &amp;&amp; brunch acclaim</li>
</ul>
<span style="color: #ff6600;"><strong>Outputted flashable roms,</strong></span>
<ul>
	<li><span style="color: #008000;">cyanogen_acclaim-ota-eng.hd.zip</span></li>
	<li><span style="color: #008000;">update-cm-7.2.0-RC1-acclaim-UNOFFICIAL-signed.zip</span></li>
	<li>location, out/target/product/acclaim/</li>
</ul>
<span style="color: #ff6600;"><strong>Setting up sdcard,</strong></span>
<ul>
	<li>Format micro sdcard with FAT32 LBA Boot <span style="color: #3366ff;">(tested with 2GB SanDisk/Kingston microSD)</span></li>
	<li>For Windows 7, Use EASEUS Partition Master Home Edition <span style="color: #3366ff;">(free)</span> or</li>
	<li>MiniTool Partition Wizard Home Edition<span style="color: #3366ff;"> (free)</span></li>
	<li>-Format sdcard,</li>
	<li>-File System: FAT32</li>
	<li>-Partition Label: Boot</li>
	<li>-Create As: Primary</li>
	<li>-Cluster Size: Biggest one, 64KB if available</li>
	<li>-Apply patch</li>
	<li>-Right click on Boot partition, Modify &gt; Set status Active</li>
	<li>-Apply patch again</li>
	<li>Copy recovery.img from the directory, out/target/product/acclaim/ onto the root of your sdcard</li>
	<li>Rename recovery.img to boot.img or use the contents here,</li>
	<li><span style="text-decoration: underline;"><span style="color: #ff0000;"><a href="https://github.com/succulent/acclaim_recovery_sdcard"><span style="color: #ff0000; text-decoration: underline;">https://github.com/succulent/acclaim_recovery_sdcard</span></a></span></span></li>
	<li>Copy contents (<span style="text-decoration: underline;"><span style="color: #ff0000;"><a id="728a65b29ade6c3de48459affcc2faf9f97e2f17" href="https://github.com/succulent/acclaim_recovery_sdcard/blob/master/flashing_boot.img"><span style="color: #ff0000; text-decoration: underline;">flashing_boot.img</span></a></span></span>, <span style="text-decoration: underline;"><span style="color: #ff0000;"><a id="7d129a28fcb03857b64ba0ce29abbbcb8fcc0d32" href="https://github.com/succulent/acclaim_recovery_sdcard/blob/master/MLO"><span style="color: #ff0000; text-decoration: underline;">MLO</span></a></span></span>, and <span style="text-decoration: underline;"><span style="color: #ff0000;"><a id="ae131b593a8622fe90b68aa0424ab79412a4ab5a" href="https://github.com/succulent/acclaim_recovery_sdcard/blob/master/u-boot.bin"><span style="color: #ff0000; text-decoration: underline;">u-boot.bin</span></a></span></span>) onto the root of your sdcard</li>
	<li>Copy <span style="color: #008000;">update-cm-7.2.0-RC1-acclaim-UNOFFICIAL-signed.zip</span> onto the root of your sdcard</li>
	<li>Power off device <span style="color: #3366ff;">(Nook Tablet)</span></li>
	<li>insert sdcard to device</li>
	<li>hold power button for a couple of seconds to power on</li>
	<li>wait until device boot into recovery</li>
</ul>
<strong><span style="color: #ff6600;">Backup using recovery (If you are coming from stock)</span></strong>
<ul>
	<li>At the CWM-based Recovery v5.0.2.8 screen</li>
	<li><span style="color: #3366ff;">(navigate with volume keys and select with home button)</span></li>
	<li>&gt; backup and restore</li>
	<li>&gt; backup (to restore, use restore)</li>
</ul>
<span style="color: #ff6600;"><strong>Installing rom from recovery,</strong></span>
<ul>
	<li><span style="color: #3366ff;">(press power button to go back)</span></li>
	<li>&gt; install zip from sdcard</li>
	<li><span style="color: #3366ff;">(navigate with volume keys and select with home button)</span></li>
	<li>&gt; choose zip from sdcard</li>
	<li><span style="color: #008000;">&gt; Yes - update-cm-7.2.0-RC1-acclaim-UNOFFICIAL-signed.zip</span> <span style="color: #3366ff;">(wait up to a couple minutes)</span></li>
	<li>&gt; wipe data/factory reset <span style="color: #3366ff;">(1st time installing)</span></li>
	<li>&gt; wipe cache partition <span style="color: #3366ff;">(1st time installing)</span></li>
	<li>&gt; reboot system now <span style="color: #3366ff;">(restart device)</span></li>
</ul>
<span style="color: #ff6600;"><strong>First time booting sequence,</strong></span>
<ul>
	<li>Initial BN n logo</li>
	<li>Custom n logo<span style="color: #3366ff;"> (a couple of seconds)</span></li>
	<li><span style="text-decoration: underline;"><span style="color: #ff0000;"><a title="2 Androids Logo" href="http://iamafanof.files.wordpress.com/2012/04/two_androids.png" target="_blank"><span style="color: #ff0000; text-decoration: underline;">2 androids logo</span></a></span></span> <span style="color: #3366ff;">(wait up to a minute)</span></li>
	<li><span style="text-decoration: underline;"><span style="color: #ff0000;"><a title="CM7 Android Logo" href="http://iamafanof.files.wordpress.com/2012/04/cm7.png" target="_blank"><span style="color: #ff0000; text-decoration: underline;">CM7 android logo</span></a></span></span> <span style="color: #3366ff;">(wait up to a couple minutes)</span></li>
</ul>
<span style="color: #ff6600;"><strong>Other flashable Files (Did you messed up your Nook Tablet?)</strong></span>
<ul>
	<li><span style="color: #3366ff;"><span style="text-decoration: underline;"><span style="color: #ff0000;"><a id="f0843bfd5b63190deb74efe1c5d7fac5de136607" href="https://github.com/succulent/acclaim_recovery_sdcard/blob/master/flash_recovery.zip"><span style="color: #ff0000; text-decoration: underline;">flash_recovery.zip</span></a></span></span> (use recovery to flash it. no more sdcard CWM Recovery)</span></li>
	<li>Hold Power &amp; “n button” down until the device turns on and off again.</li>
	<li>Then press Power to turn the device on normally and access the recovery.</li>
	<li>You can also boot to recovery by issuing command “reboot recovery” in adb or terminal</li>
	<li><span style="text-decoration: underline;"><span style="color: #ff0000;"> <a id="085b9831e49522e2740605ef971c6db01acfe535" href="https://github.com/succulent/acclaim_recovery_sdcard/blob/master/flash_boot.zip"><span style="color: #ff0000; text-decoration: underline;">flash_boot.zip</span></a></span></span> <span style="color: #3366ff;">(a backup boot.img if needed to re-flash)</span></li>
	<li><span style="color: #ff0000;">DO NOT FLASH</span> it with other rom besides the rom created with this source and kernel.</li>
	<li><span style="text-decoration: underline;"><span style="color: #ff0000;"><a id="8c7a91316f76701334b2d2420c12a24cc2a71b08" href="https://github.com/succulent/acclaim_recovery_sdcard/blob/master/flash_stock_recovery.zip"><span style="color: #ff0000; text-decoration: underline;">flash_stock_recovery.zip</span></a></span></span><span style="color: #3366ff;"> (use it to restore stock recovery.img)</span></li>
	<li><span style="text-decoration: underline;"><span style="color: #ff0000;"><a id="6bc1d621bbaf1633ce2f416229b937a28c1b8049" href="https://github.com/succulent/acclaim_recovery_sdcard/blob/master/flash_u-boot_and_MLO.zip"><span style="color: #ff0000; text-decoration: underline;">flash_u-boot_and_MLO.zip</span></a></span></span> <span style="color: #3366ff;">(use it to restore bootloader and x-loader)</span></li>
	<li>Flash this if all you get is a black screen (no ‘n’ logo screen) when turning your Nook Tablet on.</li>
	<li><span style="text-decoration: underline;"><span style="color: #ff0000; text-decoration: underline;"> <a id="470d9c30a38f8e5745043acc82b59cfbb4a454a5" href="https://github.com/succulent/acclaim_recovery_sdcard/blob/master/flash_stock_1.4.2.zip"><span style="color: #ff0000; text-decoration: underline;">flash_stock_1.4.2.zip</span></a></span></span><span style="color: #3366ff;"> (use it to restore to stock 1.4.2)</span></li>
	<li>After restart, it will take up to a couple minutes to setup data and system folder.</li>
	<li>It’ll be up to a couple of minutes before the setup screen shows up.</li>
	<li><span style="color: #008000;"><span style="text-decoration: underline;"><span style="color: #ff0000;"><a id="5307f5e7626b8ab5f8c9dad0fe976b182f341e1f" href="https://github.com/succulent/acclaim_recovery_sdcard/blob/master/flash-restore-stock.zip"><span style="color: #ff0000; text-decoration: underline;">flash-restore-stock.zip</span></a></span></span> </span><span style="color: #3366ff;">(use it to restore partition 1-6)</span></li>
	<li>You will need to install <span style="text-decoration: underline;"><span style="color: #ff0000;"><a id="470d9c30a38f8e5745043acc82b59cfbb4a454a5" href="https://github.com/succulent/acclaim_recovery_sdcard/blob/master/flash_stock_1.4.2.zip"><span style="color: #ff0000; text-decoration: underline;">flash_stock_1.4.2.zip</span></a> </span></span>afterward or a <span style="color: #3366ff;"><span style="color: #008000;">CM7 rom</span>.</span></li>
	<li><span style="text-decoration: underline;"><span style="color: #ff0000;"><a href="https://github.com/succulent/acclaim_recovery_sdcard"><span style="color: #ff0000; text-decoration: underline;">https://github.com/succulent/acclaim_recovery_sdcard</span></a></span></span></li>
	<li>Click on a file and click open raw to download.</li>
</ul>
<span style="color: #ff6600;"><strong>–HD (succulent on XDA)</strong></span>
<ul>
	<li>For help go here,<span style="text-decoration: underline; color: #ff0000;"> <a href="http://forum.xda-developers.com/showthread.php?t=1545766"><span style="color: #ff0000; text-decoration: underline;">http://forum.xda-developers.com/showthread.php?t=1545766</span></a></span></li>
	<li>Prebuilt rom, <span style="text-decoration: underline;"><span style="color: #ff0000;"><a href="../2012/04/25/"><span style="color: #ff0000; text-decoration: underline;">http://iamafanof.wordpress.com/</span></a></span></span></li>
</ul>
