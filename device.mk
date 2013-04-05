#
# Copyright (C) 2013 The Android Open-Source Project
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This file includes all definitions that apply to ALL tuna devices, and
# are also specific to tuna devices
#
# Everything in this directory will become public

DEVICE_FOLDER := device/bn/acclaim

# Setup custom omap4xxx defines
BOARD_USE_CUSTOM_LIBION := true

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := $(DEVICE_FOLDER)/boot/zImage
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

ifeq ($(TARGET_PREBUILT_CYANOBOOT),)
    LOCAL_CYANOBOOT := $(DEVICE_FOLDER)/boot/flashing_boot_emmc.img
else
    LOCAL_CYANOBOOT := $(TARGET_PREBUILT_CYANOBOOT)
endif

ifeq ($(TARGET_PREBUILT_IRECOVERY),)
    LOCAL_IRECOVERY := $(DEVICE_FOLDER)/boot/irecovery
else
    LOCAL_IRECOVERY := $(TARGET_PREBUILT_IRECOVERY)
endif

PRODUCT_COPY_FILES += \
	$(LOCAL_KERNEL):kernel \
	$(LOCAL_CYANOBOOT):flashing_boot_emmc.img \
	$(LOCAL_IRECOVERY):irecovery \
	$(DEVICE_FOLDER)/init.acclaim.rc:root/init.acclaim.rc \
	$(DEVICE_FOLDER)/init.acclaim.usb.rc:root/init.acclaim.usb.rc \
	$(DEVICE_FOLDER)/ueventd.acclaim.rc:root/ueventd.acclaim.rc \
	$(DEVICE_FOLDER)/fstab.acclaim:root/fstab.acclaim \

DEVICE_PACKAGE_OVERLAYS := $(DEVICE_FOLDER)/overlay/aosp

PRODUCT_AAPT_CONFIG := xlarge hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Art
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/prebuilt/poetry/poem.txt:root/sbin/poem.txt

# Dolby DD+ Decoder + Surround AudioEffects
ifdef OMAP_ENHANCEMENT
PRODUCT_PACKAGES += \
        libstagefright_soft_ddpdec \
        libdseffect
endif

# DRM
PRODUCT_PACKAGES += \
	libwvm \

# Ducati
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/firmware/ducati-license.txt:system/vendor/firmware/ducati-license.txt \
	$(DEVICE_FOLDER)/firmware/ducati-m3.512MB.bin:system/vendor/firmware/ducati-m3.512MB.bin \
	$(DEVICE_FOLDER)/firmware/ducati-m3.bin:system/vendor/firmware/ducati-m3.bin \

# Graphics
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/prebuilt/sgx/gralloc.omap4430.so:/system/vendor/lib/hw/gralloc.omap4.so \
	$(DEVICE_FOLDER)/prebuilt/sgx/libEGL_POWERVR_SGX540_120.so:/system/vendor/lib/egl/libEGL_POWERVR_SGX540_120.so \
	$(DEVICE_FOLDER)/prebuilt/sgx/libGLESv1_CM_POWERVR_SGX540_120.so:/system/vendor/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so \
	$(DEVICE_FOLDER)/prebuilt/sgx/libGLESv2_POWERVR_SGX540_120.so:/system/vendor/lib/egl/libGLESv2_POWERVR_SGX540_120.so \
	$(DEVICE_FOLDER)/prebuilt/sgx/libglslcompiler_SGX540_120.so:/system/vendor/lib/libglslcompiler_SGX540_120.so \
	$(DEVICE_FOLDER)/prebuilt/sgx/libIMGegl_SGX540_120.so:/system/vendor/lib/libIMGegl_SGX540_120.so \
	$(DEVICE_FOLDER)/prebuilt/sgx/libpvr2d_SGX540_120.so:/system/vendor/lib/libpvr2d_SGX540_120.so \
	$(DEVICE_FOLDER)/prebuilt/sgx/libpvrANDROID_WSEGL_SGX540_120.so:/system/vendor/lib/libpvrANDROID_WSEGL_SGX540_120.so \
	$(DEVICE_FOLDER)/prebuilt/sgx/libPVRScopeServices_SGX540_120.so:/system/vendor/lib/libPVRScopeServices_SGX540_120.so \
	$(DEVICE_FOLDER)/prebuilt/sgx/libsrv_init_SGX540_120.so:/system/vendor/lib/libsrv_init_SGX540_120.so \
	$(DEVICE_FOLDER)/prebuilt/sgx/libsrv_um_SGX540_120.so:/system/vendor/lib/libsrv_um_SGX540_120.so \
	$(DEVICE_FOLDER)/prebuilt/sgx/libusc_SGX540_120.so:/system/vendor/lib/libusc_SGX540_120.so \
	$(DEVICE_FOLDER)/prebuilt/sgx/pvrsrvctl_SGX540_120:/system/vendor/bin/pvrsrvctl_SGX540_120 \
	$(DEVICE_FOLDER)/prebuilt/sgx/pvrsrvinit:/system/vendor/bin/pvrsrvinit \
	$(DEVICE_FOLDER)/prebuilt/sgx/powervr.ini:/system/etc/powervr.ini

# Hardware HALs
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio_policy.default \
	audio.primary.acclaim \
	audio.r_submix.default \
	audio.usb.default \
	hwcomposer.acclaim \
	libaudioutils \
	libinvensense_mpl \
	libtinyalsa \
	lights.acclaim \
	Music \
	power.acclaim \
	sensors.acclaim \
	tinycap \
	tinymix \
	tinyplay \

# Misc
PRODUCT_PACKAGES += \
	e2fsck \
	libjni_pinyinime \
	setpropex \
	setup_fs \
	sh \
	strace \
	libtimemmgr \
	TFF \

# OMX
PRODUCT_PACKAGES += \
	libdomx \
	libOMX_Core \
	libOMX.TI.DUCATI1.VIDEO.H264E \
	libOMX.TI.DUCATI1.VIDEO.MPEG4E \
	libOMX.TI.DUCATI1.VIDEO.DECODER \
	libOMX.TI.DUCATI1.VIDEO.DECODER.secure \
	libOMX.TI.DUCATI1.VIDEO.CAMERA \
	libOMX.TI.DUCATI1.MISC.SAMPLE \
	libdrmdecrypt \
	libstagefrighthw \
	libI420colorconvert \
	libtiutils \
	libcamera \
	libion_ti \
	libomxcameraadapter \
	smc_pa_ctrl \
	tf_daemon \
	libtf_crypto_sst \

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	$(call add-to-product-copy-files-if-exists,packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml)

# recovery stuffs
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh \
	$(DEVICE_FOLDER)/recovery/sbin/gdisk:root/sbin/gdisk \
	$(DEVICE_FOLDER)/recovery/sbin/genptable:root/sbin/genptable \
	$(DEVICE_FOLDER)/recovery/sbin/make_ext4fs:root/sbin/make_ext4fs \
	$(DEVICE_FOLDER)/recovery/sbin/mkdosfs:root/sbin/mkdosfs \
	$(DEVICE_FOLDER)/recovery/sbin/parted:root/sbin/parted \
	$(DEVICE_FOLDER)/recovery/sbin/ptable:root/sbin/ptable \
	$(DEVICE_FOLDER)/recovery/sbin/sgdisk:root/sbin/sgdisk

# Prebuilts /system/bin
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/clear_bootcnt.sh:system/bin/clear_bootcnt.sh \
	$(DEVICE_FOLDER)/prebuilt/bin/fix-mac.sh:system/bin/fix-mac.sh \
	$(DEVICE_FOLDER)/prebuilt/bin/fix-serial-no.sh:system/bin/fix-serial-no.sh \
	$(DEVICE_FOLDER)/prebuilt/bin/log_battery_data.sh:system/bin/log_battery_data.sh \

# Prebuilts /system/etc
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/audio/audio_policy.conf:system/etc/audio_policy.conf \
	$(DEVICE_FOLDER)/media_codecs.xml:system/etc/media_codecs.xml \
	$(DEVICE_FOLDER)/media_profiles.xml:system/etc/media_profiles.xml \
	$(DEVICE_FOLDER)/mixer_paths.xml:system/etc/mixer_paths.xml \
	$(DEVICE_FOLDER)/prebuilt/etc/wifi/TQS_S_2.6.ini:system/etc/wifi/TQS_S_2.6.ini \
	$(DEVICE_FOLDER)/vold.fstab:system/etc/vold.fstab \

# frandom
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/prebuilt/etc/init.d/00random:system/etc/init.d/00random \

# Prebuilt /system/usr
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/prebuilt/usr/idc/ft5x06-i2c.idc:system/usr/idc/ft5x06-i2c.idc \
	$(DEVICE_FOLDER)/prebuilt/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
	$(DEVICE_FOLDER)/prebuilt/usr/idc/twl6030_pwrbutton.idc:system/usr/idc/twl6030_pwrbutton.idc \
	$(DEVICE_FOLDER)/prebuilt/usr/keylayout/twl6030_pwrbutton.kl:system/usr/keylayout/twl6030_pwrbutton.kl \

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory \
	Superuser \
	su \

# SMC components for secure services like crypto, secure storage
#PRODUCT_PACKAGES += \
#         smc_pa.ift \
#         smc_normal_world_android_cfg.ini \
#         libsmapi.so \
#         libtfsw_jce_provider.so \
#         tfsw_jce_provider.jar \
#         tfctrl \

# TI-Connectivity
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/firmware/ti-connectivity/wl127x-fw-4-mr.bin:system/etc/firmware/ti-connectivity/wl127x-fw-4-mr.bin \
	$(DEVICE_FOLDER)/firmware/ti-connectivity/wl127x-fw-4-sr.bin:system/etc/firmware/ti-connectivity/wl127x-fw-4-sr.bin \
	$(DEVICE_FOLDER)/firmware/ti-connectivity/wl127x-fw-4-plt.bin:system/etc/firmware/ti-connectivity/wl127x-fw-4-plt.bin \
	$(DEVICE_FOLDER)/firmware/ti-connectivity/wl1271-nvs_127x.bin:system/etc/firmware/ti-connectivity/wl1271-nvs.bin \

# Wifi
PRODUCT_PACKAGES += \
	calibrator \
	crda \
	hostapd.conf \
	dhcpcd.conf \
	regulatory.bin \
	TQS_D_1.7.ini \
        TQS_D_1.7_127x.ini \
	wpa_supplicant.conf \
	lib_driver_cmd_wl12xx \

PRODUCT_PROPERTY_OVERRIDES += \
	com.ti.omap_enhancement=true \
	omap.enhancement=true \
	persist.sys.root_access=3 \
	persist.sys.usb.config=mtp,adb \
	persist.sys.vold.switchexternal=0 \
	ro.additionalmounts=/storage/sdcard0;/storage/usbdisk0 \
	ro.crypto.state=unencrypted \
	ro.hwc.legacy_api=true \
	ro.opengles.version=131072 \
	ro.sf.lcd_density=160 \
	ro.vold.switchablepair=/storage/sdcard0,/storage/sdcard1 \
	wifi.interface=wlan0 \
	softap.interface=wlan0 \
	video.accelerate.hw=1 \
	wifi.supplicant_scan_interval=180 \
	ro.media.enc.jpeg.quality=100 \
	sys.mem.max_hidden_apps=10

# Google DNS Tweak -- fastest dns
PRODUCT_PROPERTY_OVERRIDES += \
	net.rmnet0.dns1=8.8.8.8 \
	net.rmnet0.dns2=8.8.4.4 \
	net.ppp0.dns1=8.8.8.8 \
	net.ppp0.dns2=8.8.4.4 \
	net.dns1=8.8.8.8 \
	net.dns2=8.8.4.4

PRODUCT_CHARACTERISTICS := tablet

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.locationfeatures=1 \
	ro.com.google.networklocation=1 \

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
#$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
#$(call inherit-product-if-exists, device/bn/acclaim/imgtec/sgx-imgtec-bins.mk)
#$(call inherit-product-if-exists, hardware/ti/omap4xxx/omap4.mk)
#$(call inherit-product, $(DEVICE_FOLDER)/wl12xx/ti-wl12xx-vendor.mk)
#$(call inherit-product, $(DEVICE_FOLDER)/wl12xx/ti-wpan-products.mk)

