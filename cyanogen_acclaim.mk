# Inherit AOSP device configuration for Nook Tablet.
$(call inherit-product, device/bn/acclaim/acclaim.mk)
# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_acclaim
PRODUCT_BRAND := nook
PRODUCT_DEVICE := acclaim
PRODUCT_BOARD := omap4sdp
PRODUCT_MODEL := BNTV250
PRODUCT_MANUFACTURER := Barnes&Noble
ANDROID_VERSION := 2.3.7
BUILD_ID := GRK39F
DEVELOPER_NAME := hd
DEVELOPER_HOST := hd-pc
UTC_DATE := $(shell date +%s)
DATE := $(shell date +%m%d%Y)


PRODUCT_BUILD_PROP_OVERRIDES += \
   PRODUCT_NAME=${PRODUCT_DEVICE} \
   PRODUCT_BOARD=${PRODUCT_BOARD} \
   PRODUCT_BRAND=${PRODUCT_BRAND} \
   BUILD_ID=${BUILD_ID} \
   BUILD_FINGERPRINT=google/passion/passion:${ANDROID_VERSION}/${BUILD_ID}/${DATE}:user/release-keys \
   PRIVATE_BUILD_DESC="passion-user ${ANDROID_VERSION} ${BUILD_ID} ${DATE} release-keys" \
   TARGET_DEVICE=${PRODUCT_DEVICE} \
   TARGET_BUILD_TYPE=user \
   BUILD_VERSION_TAGS=release-keys \
   USER=${DEVELOPER_NAME} \
   BUILD_HOST=${DEVELOPER_HOST} \
   PRODUCT_DEFAULT_LANGUAGE=en \
   PRODUCT_DEFAULT_REGION=US \
   BUILD_NUMBER=${DATE} 

PRODUCT_PROPERTY_OVERRIDES := \
        net.dns1=8.8.8.8 \
        net.dns2=8.8.4.4

# Build kernel
#PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel/bn/acclaim
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=cyanogenmod_acclaim_defconfig

PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/tablet

# Release name and versioning
PRODUCT_RELEASE_NAME := acclaim
PRODUCT_VERSION_DEVICE_SPECIFIC :=
   -include vendor/cyanogen/products/common_versions.mk

PRODUCT_COPY_FILES += \
   vendor/cyanogen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
