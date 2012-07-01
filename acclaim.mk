#
# Copyright (C) 2007 The Android Open Source Project
# Copyright (C) 2011 The CyanogenMod Project
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

# BoardConfig.mk
#
# Product-specific compile-time definitions.
#
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/bn/acclaim/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

ifeq ($(TARGET_PREBUILT_XLOADER),)
    LOCAL_XLOADER := device/bn/acclaim/MLO
else
    LOCAL_BOOTLOADER := $(TARGET_PREBUILT_XLOADER)
endif

ifeq ($(TARGET_PREBUILT_BOOTLOADER),)
    LOCAL_BOOTLOADER := device/bn/acclaim/u-boot.bin
else
    LOCAL_BOOTLOADER := $(TARGET_PREBUILT_BOOTLOADER)
endif

ifeq ($(TARGET_PREBUILT_CYANOBOOT),)
    LOCAL_CYANOBOOT := device/bn/acclaim/cyanoboot
else
    LOCAL_CYANOBOOT := $(TARGET_PREBUILT_CYANOBOOT)
endif

ifeq ($(TARGET_PREBUILT_IRECOVERY),)
    LOCAL_IRECOVERY := device/bn/acclaim/irecovery
else
    LOCAL_IRECOVERY := $(TARGET_PREBUILT_IRECOVERY)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    $(LOCAL_XLOADER):MLO \
    $(LOCAL_BOOTLOADER):u-boot.bin \
    $(LOCAL_CYANOBOOT):cyanoboot \
    $(LOCAL_IRECOVERY):irecovery \
    $(LOCAL_PATH)/root/initlogo.rle:root/initlogo.rle \
    $(LOCAL_PATH)/root/init.omap4430.rc:root/init.omap4430.rc \
    $(LOCAL_PATH)/root/init.rc:root/init.rc \
    $(LOCAL_PATH)/root/ueventd.omap4430.rc:root/ueventd.omap4430.rc \
    $(LOCAL_PATH)/root/ueventd.rc:root/ueventd.rc 

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery.fstab:system/etc/recovery.fstab \
    $(LOCAL_PATH)/misc/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/misc/vold.conf:system/etc/vold.conf \
    $(LOCAL_PATH)/misc/media_profiles.xml:system/etc/media_profiles.xml 

# high-density artwork where available
PRODUCT_AAPT_CONFIG := large hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
# still need to set english for audio init
PRODUCT_LOCALES += en_US

# Place permission files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissioasouns/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml


# BN stuffs
#PRODUCT_PACKAGES += \
#    $(LOCAL_PATH)/prebuilt/framework/bncloudapi.jar:system/framework/bncloudapi.jar \
#    $(LOCAL_PATH)/prebuilt/framework/com.bn.app.crypto.jar:system/framework/com.bn.app.crypto.jar \
#    $(LOCAL_PATH)/prebuilt/framework/com.bn.app.deviceinfo.jar:system/framework/com.bn.app.deviceinfo.jar \
#    $(LOCAL_PATH)/prebuilt/framework/com.bn.app.displayinfo.jar:system/framework/com.bn.app.displayinfo.jar \
#    $(LOCAL_PATH)/prebuilt/framework/com.bn.authentication.jar:system/framework/com.bn.authentication.jar \
#    $(LOCAL_PATH)/prebuilt/framework/com.bn.cloud.jar:system/framework/com.bn.cloud.jar \
#    $(LOCAL_PATH)/prebuilt/framework/com.bn.gpb.jar:system/framework/com.bn.gpb.jar \
#    $(LOCAL_PATH)/prebuilt/framework/com.bn.policymanager.jar:system/framework/com.bn.policymanager.jar \
#    $(LOCAL_PATH)/prebuilt/framework/com.bn.provider.utils.jar:system/framework/com.bn.provider.utils.jar \
#    $(LOCAL_PATH)/prebuilt/framework/com.bn.service.devicemanager.jar:system/framework/com.bn.service.devicemanager.jar \
#    $(LOCAL_PATH)/prebuilt/security/bnapp.x509.pem:system/etc/security/bnapp.x509.pem \
#    $(LOCAL_PATH)/prebuilt/permissions/platform.xml:system/etc/permissions/platform.xml 
#    $(LOCAL_PATH)/prebuilt/lib/libbndeviceinfo.so:/system/lib/libbndeviceinfo.so \
#    $(LOCAL_PATH)/prebuilt/lib/libbndisplayinfo.so:/system/lib/libbndisplayinfo.so \

# HW Libs and miscs
PRODUCT_PACKAGES += \
    acoustics.default \
    alsa.omap4 \
    dspexec \
    libbridge \
    lights.acclaim \
    libtiOsLib \
    overlay.omap4

# OpenMAX IL configuration
TI_OMX_POLICY_MANAGER := hardware/ti/omx/system/src/openmax_il/omx_policy_manager
PRODUCT_COPY_FILES += \
    $(TI_OMX_POLICY_MANAGER)/src/policytable.tbl:system/etc/policytable.tbl 

# OMX
PRODUCT_PACKAGES += \
    libdomx \
    libLCML \
    libomxcameraadapter \
    libOMX_Core \
    libOMX_CoreOsal \
    libomx_proxy_common \
    libomx_rpc \
    libOMX.TI.DUCATI1.IMAGE.JPEGD \
    libOMX.TI.DUCATI1.MISC.SAMPLE \
    libOMX.TI.DUCATI1.VIDEO.CAMERA \
    libOMX.TI.DUCATI1.VIDEO.DECODER \
    libOMX.TI.DUCATI1.VIDEO.DECODER.secure \
    libOMX.TI.DUCATI1.VIDEO.H264D \
    libOMX.TI.DUCATI1.VIDEO.H264E \
    libOMX.TI.DUCATI1.VIDEO.MPEG4D \
    libOMX.TI.DUCATI1.VIDEO.MPEG4E \
    libOMX.TI.DUCATI1.VIDEO.VP6D \
    libOMX.TI.DUCATI1.VIDEO.VP7D \
    libstagefrighthw \
    libVendor_ti_omx \
    libVendor_ti_omx_config_parser \
    OMXCore \

# Syslink and Tiler
PRODUCT_PACKAGES += \
    libcamera \
    libklod2cmap \
    libipc \
    libipcutils \
    libnotify \
    libomap_mm_library_jni \
    librcm \
    libsysmgr \
    libtimemmgr \
    libtiutils \
    dmm_daemontest.out \
    ducati_load.out \
    event_listener.out \
    gateMPApp.out \
    heapBufMPApp.out \
    heapMemMPApp.out \
    interm3.out \
    listMPApp.out \
    memmgrserver.out \
    messageQApp.out \
    nameServerApp.out \
    notifyping.out \
    procMgrApp.out \
    rcm_daemontest.out \
    rcm_multiclienttest.out \
    rcm_multitest.out \
    rcm_multithreadtest.out \
    rcm_singletest.out \
    sharedRegionApp.out \
    slpmresources.out \
    slpmtest.out \
    slpmtransport.out \
    syslink_daemon.out \
    syslink_tilertest.out \
    syslink_trace_daemon.out \
    tf_daemon \
    utilsApp.out

# HW Libs
#PRODUCT_PACKAGES += \
#    gralloc.omap4 \
#    gralloc.default \

# Wifi
PRODUCT_PACKAGES += \
    libtiOsLib \
    libCustomWifi \
    tiap_cu \
    tiap_loader \
    wlan_loader \
    wlan_cu \
    dhcpcd.conf

# Misc
PRODUCT_PACKAGES += \
    libreference-ril \
    libreference-cdma-sms 

# Skia HW
PRODUCT_PACKAGES += \
    libskiahwdec \
    libskiahwenc \
    SkLibTiJpeg_Test

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs \
    hwprops

# All the blobs necessary for Nook Tablet
PRODUCT_COPY_FILES  += \
    $(LOCAL_PATH)/prebuilt/app/com.rookiestudio.perfectviewer-1.apk:/system/app/com.rookiestudio.perfectviewer-1.apk \
    $(LOCAL_PATH)/prebuilt/app/com.smart.swkey-1.apk:/system/app/com.smart.swkey-1.apk \
    $(LOCAL_PATH)/prebuilt/app/es_file_explorer_v1_6_1_6.apk:/system/app/es_file_explorer_v1_6_1_6.apk \
    $(LOCAL_PATH)/prebuilt/app/ws.plattner.cifsmanager-1.apk:/system/app/ws.plattner.cifsmanager-1.apk \
    $(LOCAL_PATH)/prebuilt/bin/battery_log.sh:/system/bin/battery_log.sh \
    $(LOCAL_PATH)/prebuilt/bin/BNTV250_PD_ModelCertKeys.wrapped:/system/bin/BNTV250_PD_ModelCertKeys.wrapped \
    $(LOCAL_PATH)/prebuilt/bin/BNTV250_PD_ModelCert.wrapped:/system/bin/BNTV250_PD_ModelCert.wrapped \
    $(LOCAL_PATH)/prebuilt/bin/BNTV250_PR_ModelCertKeys.wrapped:/system/bin/BNTV250_PR_ModelCertKeys.wrapped \
    $(LOCAL_PATH)/prebuilt/bin/BNTV250_PR_ModelCert.wrapped:/system/bin/BNTV250_PR_ModelCert.wrapped \
    $(LOCAL_PATH)/prebuilt/bin/clrbootcount.sh:/system/bin/clrbootcount.sh \
    $(LOCAL_PATH)/prebuilt/bin/d2c_test:/system/bin/d2c_test \
    $(LOCAL_PATH)/prebuilt/bin/fix-mac.sh:/system/bin/fix-mac.sh \
    $(LOCAL_PATH)/prebuilt/bin/hostap:/system/bin/hostap \
    $(LOCAL_PATH)/prebuilt/bin/idme:/system/bin/idme \
    $(LOCAL_PATH)/prebuilt/bin/install_smc:/system/bin/install_smc \
    $(LOCAL_PATH)/prebuilt/bin/klog.sh:/system/bin/klog.sh \
    $(LOCAL_PATH)/prebuilt/bin/pvrsrvinit:/system/bin/pvrsrvinit \
    $(LOCAL_PATH)/prebuilt/bin/rild:/system/bin/rild \
    $(LOCAL_PATH)/prebuilt/bin/run_wlancu.sh:/system/bin/run_wlancu.sh \
    $(LOCAL_PATH)/prebuilt/bin/setup_smc:/system/bin/setup_smc \
    $(LOCAL_PATH)/prebuilt/bin/smc_normal_world_android_cfg.ini:/system/bin/smc_normal_world_android_cfg.ini \
    $(LOCAL_PATH)/prebuilt/bin/smc_pa_ctrl:/system/bin/smc_pa_ctrl \
    $(LOCAL_PATH)/prebuilt/bin/smc_pa.ift:/system/bin/smc_pa.ift \
    $(LOCAL_PATH)/prebuilt/bin/v4l2_gfx_client:/system/bin/v4l2_gfx_client \
    $(LOCAL_PATH)/prebuilt/bin/vold:/system/bin/vold \
    $(LOCAL_PATH)/prebuilt/ducati/base_image_app_m3.xem3:/system/lib/ducati/base_image_app_m3.xem3 \
    $(LOCAL_PATH)/prebuilt/ducati/base_image_sys_m3.xem3:/system/lib/ducati/base_image_sys_m3.xem3 \
    $(LOCAL_PATH)/prebuilt/vendor/lib/gralloc.omap4.so:/system/vendor/lib/hw/gralloc.omap4.so \
    $(LOCAL_PATH)/prebuilt/vendor/lib/libEGL_POWERVR_SGX540_120.so:/system/vendor/lib/egl/libEGL_POWERVR_SGX540_120.so \
    $(LOCAL_PATH)/prebuilt/vendor/lib/libGLESv1_CM_ORG_CF3D.so:/system/vendor/lib/egl/libGLESv1_CM_ORG_CF3D.so \
    $(LOCAL_PATH)/prebuilt/vendor/lib/libGLESv1_CM_POWERVR_SGX540_120.so:/system/vendor/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so \
    $(LOCAL_PATH)/prebuilt/vendor/lib/libGLESv2_POWERVR_SGX540_120.so:/system/vendor/lib/egl/libGLESv2_POWERVR_SGX540_120.so \
    $(LOCAL_PATH)/prebuilt/vendor/lib/libglslcompiler.so:/system/vendor/lib/libglslcompiler.so \
    $(LOCAL_PATH)/prebuilt/vendor/lib/libIMGegl.so:/system/vendor/lib/libIMGegl.so \
    $(LOCAL_PATH)/prebuilt/vendor/lib/libpvr2d.so:/system/vendor/lib/libpvr2d.so \
    $(LOCAL_PATH)/prebuilt/vendor/lib/libpvrANDROID_WSEGL.so:/system/vendor/lib/libpvrANDROID_WSEGL.so \
    $(LOCAL_PATH)/prebuilt/vendor/lib/libPVRScopeServices.so:/system/vendor/lib/libPVRScopeServices.so \
    $(LOCAL_PATH)/prebuilt/vendor/lib/libsrv_init.so:/system/vendor/lib/libsrv_init.so \
    $(LOCAL_PATH)/prebuilt/vendor/lib/libsrv_um.so:/system/vendor/lib/libsrv_um.so \
    $(LOCAL_PATH)/prebuilt/vendor/lib/libusc.so:/system/vendor/lib/libusc.so \
    $(LOCAL_PATH)/prebuilt/lib/libafdrm.so:/system/lib/libafdrm.so \
    $(LOCAL_PATH)/prebuilt/lib/libCore.so:/system/lib/libCore.so \
    $(LOCAL_PATH)/prebuilt/lib/libdrmplay.so:/system/lib/libdrmplay.so \
    $(LOCAL_PATH)/prebuilt/lib/libdrm_plugin.so:/system/lib/libdrm_plugin.so \
    $(LOCAL_PATH)/prebuilt/lib/libpdfhost.so:/system/lib/libpdfhost.so \
    $(LOCAL_PATH)/prebuilt/lib/libplayready.so:/system/lib/libplayready.so \
    $(LOCAL_PATH)/prebuilt/lib/libsmapi.so:/system/lib/libsmapi.so \
    $(LOCAL_PATH)/prebuilt/lib/libTIPVR2DBLT.so:/system/lib/libTIPVR2DBLT.so \
    $(LOCAL_PATH)/prebuilt/lib/libysshared.so:/system/lib/libysshared.so \
    $(LOCAL_PATH)/prebuilt/etc/asound.conf:/system/etc/asound.conf \
    $(LOCAL_PATH)/prebuilt/etc/event-log-tags:/system/etc/event-log-tags \
    $(LOCAL_PATH)/prebuilt/etc/fwram.ko:/system/etc/fwram.ko \
    $(LOCAL_PATH)/prebuilt/etc/wifi/firmware.bin:/system/etc/wifi/firmware.bin \
    $(LOCAL_PATH)/prebuilt/etc/wifi/softap/firmware_ap.bin:/system/etc/wifi/softap/firmware_ap.bin \
    $(LOCAL_PATH)/prebuilt/etc/wifi/softap/hostapd.conf:/system/etc/wifi/softap/hostapd.conf \
    $(LOCAL_PATH)/prebuilt/etc/wifi/softap/tiap_drv.ko:/system/etc/wifi/softap/tiap_drv.ko \
    $(LOCAL_PATH)/prebuilt/etc/wifi/softap/tiwlan_ap.ini:/system/etc/wifi/softap/tiwlan_ap.ini \
    $(LOCAL_PATH)/prebuilt/etc/wifi/tiwlan_drv.ko:/system/etc/wifi/tiwlan_drv.ko \
    $(LOCAL_PATH)/prebuilt/etc/wifi/tiwlan.ini.activemode:/system/etc/wifi/tiwlan.ini.activemode \
    $(LOCAL_PATH)/prebuilt/etc/wifi/tiwlan.ini:/system/etc/wifi/tiwlan.ini \
    $(LOCAL_PATH)/prebuilt/etc/wifi/wlan_cu.st:/system/etc/wifi/wlan_cu.st \
    $(LOCAL_PATH)/prebuilt/etc/wifi/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/prebuilt/hw/alsa.omap4.so:/system/lib/hw/alsa.omap4.so \
    $(LOCAL_PATH)/prebuilt/hw/gralloc.default.so:/system/lib/hw/gralloc.default.so \
    $(LOCAL_PATH)/prebuilt/hw/lights.omap4.so:/system/lib/hw/lights.omap4.so \
    $(LOCAL_PATH)/prebuilt/hw/overlay.omap4.so:/system/lib/hw/overlay.omap4.so \
    $(LOCAL_PATH)/prebuilt/hw/sensors.omap4.so:/system/lib/hw/sensors.omap4.so \
    $(LOCAL_PATH)/prebuilt/usr/icu/icudt44l.dat:system/usr/icu/icudt44l.dat \
    $(LOCAL_PATH)/prebuilt/usr/keychars/omap-keypad.kcm.bin:system/usr/keychars/omap-keypad.kcm.bin \
    $(LOCAL_PATH)/prebuilt/usr/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    $(LOCAL_PATH)/prebuilt/usr/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl\
    $(LOCAL_PATH)/prebuilt/usr/keylayout/omap-keypad.kl:system/usr/keylayout/omap-keypad.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl 

# Live wallpaper packages
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

FRAMEWORKS_BASE_SUBDIRS += \
    $(addsuffix /java, omapmmlib )

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Set property overrides
# PRODUCT_PROPERTY_OVERRIDES += \

DEVICE_PACKAGE_OVERLAYS += device/bn/acclaim/overlay

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, device/common/gps/gps_us_supl.mk)
$(call inherit-product-if-exists, vendor/bn/acclaim/acclaim-vendor.mk)
$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_NAME := acclaim
PRODUCT_DEVICE := acclaim
