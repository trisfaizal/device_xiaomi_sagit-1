LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),sagit)

include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

PERSIST_FPCALIBRATION_SYMLINK := $(TARGET_OUT_VENDOR)/etc/fp/calibrationimage.pndat
$(PERSIST_FPCALIBRATION_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "FPC Calibrationimage link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /mnt/vendor/persist/misc/calibration_image.pndat $@

ALL_DEFAULT_INSTALLED_MODULES += $(PERSIST_FPCALIBRATION_SYMLINK)

endif
