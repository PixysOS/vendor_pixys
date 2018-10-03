PRODUCT_SOONG_NAMESPACES += \
    hardware/qcom/audio-caf/$(QCOM_HARDWARE_VARIANT) \
    hardware/qcom/display-caf/$(QCOM_HARDWARE_VARIANT) \
    hardware/qcom/media-caf/$(QCOM_HARDWARE_VARIANT)

# QCOM HW crypto
ifeq ($(TARGET_HW_DISK_ENCRYPTION),true)
    TARGET_CRYPTFS_HW_PATH ?= vendor/qcom/opensource/cryptfs_hw
endif
