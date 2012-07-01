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

# inherit from the proprietary version
-include vendor/bn/acclaim/BoardConfigVendor.mk

USE_CAMERA_STUB := true

# Board props
TARGET_BOARD_PLATFORM := omap4
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_BOOTLOADER_BOARD_NAME := acclaim
TARGET_CPU_SMP := true
TARGET_PROVIDES_INIT_RC := true
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := neon
ARCH_ARM_HAVE_TLS_REGISTER := true
NEEDS_ARM_ERRATA_754319_754320 := true
TARGET_GLOBAL_CFLAGS += -DNEEDS_ARM_ERRATA_754319_754320
BOARD_NEEDS_CUTILS_LOG := true
#ARCH_ARM_HAVE_ARMV7A := true

# CMDLine
BOARD_KERNEL_CMDLINE := androidboot.console=ttyO0 console=ttyO0,115200n8 mem=448M@0x80000000 mem=512M@0xA0000000 init=/init rootwait vram=32M,82000000 omapfb.vram=0:5M@82000000
#BOARD_KERNEL_CMDLINE := androidboot.console=ttyO0 console=ttyO0,115200n8 mem=448M@0x80000000 mem=35M@0x9CC00000 mem=512M@0xA0000000 init=/init rootwait vram=32M,9CC00000 omapfb.vram=0:5M@9CC00000
#BOARD_KERNEL_CMDLINE := androidboot.console=ttyO0 console=ttyO0,115200n8 mem=460M@0x80000000 mem=512M@0xA0000000 init=/init rootwait vram=32M,82000000 omapfb.vram=0:16M@82000000

BOARD_KERNEL_BASE := 0x80080000
BOARD_KERNEL_PAGESIZE := 4096
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Keep this as a fallback
TARGET_PREBUILT_KERNEL := device/bn/acclaim/kernel

# Graphics
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/bn/acclaim/misc/egl.cfg

# Packaging
TARGET_PROVIDES_RELEASETOOLS := true
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := device/bn/acclaim/releasetools/acclaim_img_from_target_files
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/bn/acclaim/releasetools/acclaim_ota_from_target_files
TARGET_CUSTOM_RELEASETOOL := ./device/bn/acclaim/releasetools/squisher

# OMAP
OMAP_ENHANCEMENT := true
ENHANCED_DOMX := true
ifdef OMAP_ENHANCEMENT
COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT -DTARGET_OMAP4
endif

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 15728640
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 641728512
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12949893120
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_HAVE_BLUETOOTH := false

BOARD_HAVE_FAKE_GPS := true
BOARD_GPS_LIBRARIES := false

# audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true
BOARD_USES_TI_OMAP_MODEM_AUDIO := false
HAVE_2_3_DSP := 1

BOARD_HAS_NO_MISC_PARTITION := true

# OMX
HARDWARE_OMX := true
ifdef HARDWARE_OMX
OMX_JPEG := true
OMX_VENDOR := ti
OMX_VENDOR_INCLUDES := \
  hardware/ti/omx/system/src/openmax_il/omx_core/inc \
  hardware/ti/omx/image/src/openmax_il/jpeg_enc/inc
OMX_VENDOR_WRAPPER := TI_OMX_Wrapper
BOARD_OPENCORE_LIBRARIES := libOMX_Core
BOARD_OPENCORE_FLAGS := -DHARDWARE_OMX=1
BOARD_CAMERA_LIBRARIES := libcamera
endif

# XXX: CHANGED FROM TRUE
BOARD_USES_TI_CAMERA_HAL := false

# Recovery
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/bn/acclaim/recovery/recovery_ui.c
TARGET_RECOVERY_PRE_COMMAND := "echo 'recovery' >> /rom/bcb ; echo 'recovery' >> /bootdata/BCB ; sync"
TARGET_RECOVERY_INITRC := device/bn/acclaim/recovery/init.rc

# Use this flag if the board has a ext4 partition larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true

# adb has root
#ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0

# Use pre-kernel.35 vold usb mounting
BOARD_USE_USB_MASS_STORAGE_SWITCH := true

# Storage
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/platform/mmci-omap-hs.1/by-name/media
BOARD_SDCARD_DEVICE_INTERNAL := /dev/block/platform/mmci-omap-hs.1/by-name/media

#Vold
BOARD_VOLD_MAX_PARTITIONS := 20
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

# Wifi
BOARD_WPA_SUPPLICANT_DRIVER := CUSTOM
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := libCustomWifi
WPA_SUPPLICANT_VERSION      := VER_0_6_X
HOSTAPD_VERSION             := VER_0_6_X
BOARD_WLAN_DEVICE           := wl1283
BOARD_SOFTAP_DEVICE         := wl1283
WIFI_DRIVER_MODULE_PATH     := "/system/etc/wifi/tiwlan_drv.ko"
WIFI_DRIVER_MODULE_NAME     := "tiwlan_drv"
WIFI_DRIVER_MODULE_ARG      := ""
WIFI_FIRMWARE_LOADER        := "wlan_loader"
WIFI_DRIVER_FW_STA_PATH     := "/system/etc/wifi/firmware.bin"
WIFI_DRIVER_FW_AP_PATH      := "/system/etc/wifi/softap/firmware_ap.bin"

# Try to build the kernel
#TARGET_KERNEL_CONFIG := cyanogenmod_acclaim_defconfig
#TARGET_KERNEL_SOURCE := kernel/bn/acclaim

#WIFI_MODULES:
#	make -C hardware/ti/wlan/wl1283/platforms/os/linux/ KERNEL_DIR=$(KERNEL_OUT) ARCH="arm" CROSS_COMPILE="arm-eabi-" TNETW=1273 RANDOM_MAC=n REPORT_LOG=n
#	mv kernel/bn/acclaim/external/wlan/wl1283/platforms/os/linux/tiwlan_drv.ko $(KERNEL_MODULES_OUT)
#	make -C hardware/ti/wlan/wl1283_softAP/platforms/os/linux/ KERNEL_DIR=$(KERNEL_OUT) ARCH="arm" CROSS_COMPILE="arm-eabi-" TNETW=1273 REPORT_LOG=n
#	mv kernel/bn/acclaim/external/wlan/wl1283_softAP/platforms/os/linux/tiap_drv.ko $(KERNEL_MODULES_OUT)

#TARGET_KERNEL_MODULES := WIFI_MODULES

#Config for building TWRP
#DEVICE_RESOLUTION := 1024x600
#RECOVERY_TOUCHSCREEN_SWAP_XY := true
#RECOVERY_TOUCHSCREEN_FLIP_Y := true
#TW_NO_REBOOT_BOOTLOADER := true
#TW_NO_REBOOT_RECOVERY := true
#TW_INTERNAL_STORAGE_PATH := "/media"
#TW_INTERNAL_STORAGE_MOUNT_POINT := "media"
#TW_EXTERNAL_STORAGE_PATH := "/sdcard"
#TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"
#TW_DEFAULT_EXTERNAL_STORAGE := true

# TWRP
# DEVICE_RESOLUTION := 1024x600
# RECOVERY_GRAPHICS_USE_LINELENGTH := true
#TARGET_RECOVERY_INITRC :=
#SP1_NAME := "pds"
#SP1_BACKUP_METHOD := files
#SP1_MOUNTABLE := 1
#SP2_NAME := "osh"
#SP2_DISPLAY_NAME := "Webtop"
#SP2_BACKUP_METHOD := files
#SP2_MOUNTABLE := 1
#SP3_NAME := "preinstall"
#SP3_BACKUP_METHOD := image
#SP3_MOUNTABLE := 0
#RECOVERY_SDCARD_ON_DATA := true
#BOARD_HAS_NO_REAL_SDCARD := true
#TW_INCLUDE_DUMLOCK := true
# TW_INTERNAL_STORAGE_PATH := "/media"
# TW_INTERNAL_STORAGE_MOUNT_POINT := "media"
# TW_EXTERNAL_STORAGE_PATH := "/sdcard"
# TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"
# TW_DEFAULT_EXTERNAL_STORAGE := true
#TW_NO_BATT_PERCENT := true
#TW_CUSTOM_POWER_BUTTON := 107
# TW_NO_REBOOT_BOOTLOADER := true
# TW_NO_REBOOT_RECOVERY := true
# TW_NO_USB_STORAGE := true
# RECOVERY_TOUCHSCREEN_SWAP_XY := true
# RECOVERY_TOUCHSCREEN_FLIP_Y := true
#TW_ALWAYS_RMRF := true
#TW_NEVER_UNMOUNT_SYSTEM := true
#TW_INCLUDE_INJECTTWRP := true
#TW_INCLUDE_BLOBPACK := true
