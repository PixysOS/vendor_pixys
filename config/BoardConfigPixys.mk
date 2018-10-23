PRODUCT_SOONG_NAMESPACES += \
    hardware/qcom/audio-caf/$(QCOM_HARDWARE_VARIANT) \
    hardware/qcom/display-caf/$(QCOM_HARDWARE_VARIANT) \
    hardware/qcom/media-caf/$(QCOM_HARDWARE_VARIANT)

# QCOM HW crypto
ifeq ($(TARGET_HW_DISK_ENCRYPTION),true)
    TARGET_CRYPTFS_HW_PATH ?= vendor/qcom/opensource/cryptfs_hw
endif

TARGET_AUTO_KDIR := $(shell echo $(TARGET_DEVICE_DIR) | sed -e 's/^device/kernel/g')
TARGET_KERNEL_SOURCE ?= $(TARGET_AUTO_KDIR)
KERNEL_SRC := $(TARGET_KERNEL_SOURCE)

ifneq "$(wildcard $(KERNEL_SRC) )" ""
PRODUCT_SOONG_NAMESPACES += \
    $(KERNEL_SRC)
endif

include vendor/pixys/config/BoardConfigKernel.mk

include vendor/pixys/config/BoardConfigSoong.mk
