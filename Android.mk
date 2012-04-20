ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),acclaim)
include $(call first-makefiles-under,$(call my-dir))
endif
