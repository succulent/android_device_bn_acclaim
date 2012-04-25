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
