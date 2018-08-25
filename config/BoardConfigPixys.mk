# QCOM HW crypto
ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/pixys/config/BoardConfigQcom.mk
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
