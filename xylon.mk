# Copyright (C) 2013 The Android Open Source Project
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
# Inherit AOSP device configuration for acclaim (Nook Tablet).
$(call inherit-product, device/bn/acclaim/full_acclaim.mk)

# Inherit common product files.
$(call inherit-product, vendor/aosp/config/common.mk)

# Tablet Overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aosp/overlay/common_tablet

# Setup device specific product configuration.
PRODUCT_NAME := xylon_acclaim
PRODUCT_DEVICE := acclaim
PRODUCT_BRAND := NOOK
PRODUCT_MODEL := NookTablet
PRODUCT_MANUFACTURER := BN LLC

# Boot Animation
PRODUCT_COPY_FILES +=  \
    vendor/aosp/prebuilt/bootanimation/bootanimation.zip:system/media/bootanimation.zip \
    vendor/aosp/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/aosp/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

