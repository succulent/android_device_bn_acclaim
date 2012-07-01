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

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

ALL_PREBUILT += $(INSTALLED_KERNEL_TARGET)

file := $(TARGET_RECOVERY_ROOT_OUT)/sbin/postrecoveryboot.sh
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/recovery/postrecoveryboot.sh | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_RECOVERY_ROOT_OUT)/sbin/badblocks
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/recovery/sbin/badblocks | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_RECOVERY_ROOT_OUT)/sbin/dedupe
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/recovery/sbin/dedupe | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_RECOVERY_ROOT_OUT)/sbin/gdisk
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/recovery/sbin/gdisk | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_RECOVERY_ROOT_OUT)/sbin/genptable
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/recovery/sbin/genptable | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_RECOVERY_ROOT_OUT)/sbin/make_ext4fs
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/recovery/sbin/make_ext4fs | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_RECOVERY_ROOT_OUT)/sbin/minizip
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/recovery/sbin/minizip | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_RECOVERY_ROOT_OUT)/sbin/mkdosfs
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/recovery/sbin/mkdosfs | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_RECOVERY_ROOT_OUT)/sbin/resize2fs
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/recovery/sbin/resize2fs | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_RECOVERY_ROOT_OUT)/sbin/sgdisk
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/recovery/sbin/sgdisk | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_RECOVERY_ROOT_OUT)/sbin/simg2img
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/recovery/sbin/simg2img | $(ACP)
	$(transform-prebuilt-to-target)

# include the non-open-source counterpart to this file
-include vendor/bn/acclaim/AndroidBoardVendor.mk
