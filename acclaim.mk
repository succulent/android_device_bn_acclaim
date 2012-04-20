#
# Copyright (C) 2009 The Android Open Source Project
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

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/bn/acclaim/acclaim-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/bn/acclaim/overlay

# Ramdisk scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/root/init.rc:root/init.rc \
    $(LOCAL_PATH)/root/init.omap4430.rc:root/init.omap4430.rc \
    $(LOCAL_PATH)/root/ueventd.omap4430.rc:root/ueventd.omap4430.rc \
    $(LOCAL_PATH)/root/ueventd.rc:root/ueventd.rc \
    $(LOCAL_PATH)/root/initlogo.rle:root/initlogo.rle

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/misc/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/misc/vold.conf:system/etc/vold.conf \
    $(LOCAL_PATH)/misc/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_LOCALES += mdpi

# Place permission files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml 

# Random stuffs
PRODUCT_COPY_FILES += \
    vendor/bn/acclaim/proprietary/bins/BNTV250_PD_ModelCertKeys.wrapped:/system/bin/BNTV250_PD_ModelCertKeys.wrapped \
    vendor/bn/acclaim/proprietary/bins/BNTV250_PD_ModelCert.wrapped:/system/bin/BNTV250_PD_ModelCert.wrapped \
    vendor/bn/acclaim/proprietary/bins/BNTV250_PR_ModelCertKeys.wrapped:/system/bin/BNTV250_PR_ModelCertKeys.wrapped \
    vendor/bn/acclaim/proprietary/bins/BNTV250_PR_ModelCert.wrapped:/system/bin/BNTV250_PR_ModelCert.wrapped \
    vendor/bn/acclaim/proprietary/bins/clrbootcount.sh:/system/bin/clrbootcount.sh \
    vendor/bn/acclaim/proprietary/bins/install_smc:/system/bin/install_smc \
    vendor/bn/acclaim/proprietary/bins/run_wlancu.sh:/system/bin/run_wlancu.sh \
    vendor/bn/acclaim/proprietary/bins/setup_smc:/system/bin/setup_smc \
    vendor/bn/acclaim/proprietary/etc/fwram.ko:/system/etc/fwram.ko \
    vendor/bn/acclaim/proprietary/modules/gspca_main.ko:/system/lib/modules/gspca_main.ko \

# Wifi
PRODUCT_COPY_FILES += \
    vendor/bn/acclaim/proprietary/etc/wifi/firmware.bin:/system/etc/wifi/firmware.bin \
    vendor/bn/acclaim/proprietary/etc/wifi/softap/firmware_ap.bin:/system/etc/wifi/softap/firmware_ap.bin \
    vendor/bn/acclaim/proprietary/etc/wifi/softap/tiap_drv.ko:/system/etc/wifi/softap/tiap_drv.ko \
    vendor/bn/acclaim/proprietary/etc/wifi/softap/tiwlan_ap.ini:/system/etc/wifi/softap/tiwlan_ap.ini \
    vendor/bn/acclaim/proprietary/etc/wifi/tiwlan_drv.ko:/system/etc/wifi/tiwlan_drv.ko \
    vendor/bn/acclaim/proprietary/etc/wifi/tiwlan.ini.activemode:/system/etc/wifi/tiwlan.ini.activemode \
    vendor/bn/acclaim/proprietary/etc/wifi/tiwlan.ini:/system/etc/wifi/tiwlan.ini \
    vendor/bn/acclaim/proprietary/etc/wifi/wlan_cu.st:/system/etc/wifi/wlan_cu.st \

# HW Libs
PRODUCT_PACKAGES += \
    alsa.omap4 \
    acoustics.default \
    hwprops \
    overlay.omap4

# OpenMAX IL configuration
TI_OMX_POLICY_MANAGER := hardware/ti/omx/system/src/openmax_il/omx_policy_manager
PRODUCT_COPY_FILES += \
    $(TI_OMX_POLICY_MANAGER)/src/policytable.tbl:system/etc/policytable.tbl \
    $(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml

# OMX
PRODUCT_PACKAGES += \
    OMXCore \
    libomxcameraadapter \
    libOMX_CoreOsal \
    libOMX_Core \
    libomx_proxy_common \
    libomx_rpc \
    libOMX.TI.DUCATI1.IMAGE.JPEGD \
    libOMX.TI.DUCATI1.MISC.SAMPLE \
    libOMX.TI.DUCATI1.VIDEO.CAMERA \
    libOMX.TI.DUCATI1.VIDEO.DECODER \
    libOMX.TI.DUCATI1.VIDEO.H264D \
    libOMX.TI.DUCATI1.VIDEO.H264E \
    libOMX.TI.DUCATI1.VIDEO.MPEG4D \
    libOMX.TI.DUCATI1.VIDEO.MPEG4E \
    libOMX.TI.DUCATI1.VIDEO.VP6D \
    libOMX.TI.DUCATI1.VIDEO.VP7D \
    libVendor_ti_omx \
    libVendor_ti_omx_config_parser

# Syslink and Tiler
PRODUCT_PACKAGES += \
    libcamera \
    libd2cmap \
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
    utilsApp.out

# Wifi
PRODUCT_PACKAGES += \
    libtiOsLib \
    libCustomWifi \
    wlan_loader \
    wlan_cu \
    wpa_supplicant.conf \
    dhcpcd.conf

# Misc
PRODUCT_PACKAGES += \
    librs_jni \
    libreference-ril \
    libreference-cdma-sms \
    Usb\

PRODUCT_PACKAGES += \
    libskiahwdec \
    libskiahwenc \

FRAMEWORKS_BASE_SUBDIRS += \
    $(addsuffix /java, omapmmlib )

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/bn/acclaim/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

ifeq ($(TARGET_PREBUILT_2NDBOOTLOADER),)
    LOCAL_2NDBOOTLOADER := device/bn/acclaim/irboot
else
    LOCAL_2NDBOOTLOADER := $(TARGET_PREBUILT_2NDBOOTLOADER)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    $(LOCAL_2NDBOOTLOADER):irboot

# Set property overrides
PRODUCT_PROPERTY_OVERRIDES += \
    qemu.sf.lcd_density=160 \
    ro.allow.mock.location=1 \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.setupwizard.enable_bypass=1 

$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_acclaim
PRODUCT_DEVICE := acclaim
