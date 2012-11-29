# Inherit device configuration for Nook Tablet
$(call inherit-product, device/bn/acclaim/full_acclaim.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common_tablet_small.mk)

DEVICE_PACKAGE_OVERLAYS += device/bn/acclaim/overlay/aokp

# Setup device specific product configuration.
PRODUCT_NAME := aokp_acclaim
PRODUCT_DEVICE := acclaim
PRODUCT_BRAND := bn
PRODUCT_MODEL := Nook Tablet
PRODUCT_MANUFACTURER := bn
PRODUCT_RELEASE_NAME := NookTablet
