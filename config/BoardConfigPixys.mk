include vendor/pixys/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include hardware/qcom-caf/common/BoardConfigQcom.mk
endif

include vendor/pixys/config/BoardConfigSoong.mk

# Namespace for fwk-detect
TARGET_FWK_DETECT_PATH ?= hardware/qcom-caf/common
PRODUCT_SOONG_NAMESPACES += \
    $(TARGET_FWK_DETECT_PATH)/fwk-detect

# Certification
include vendor/certification/BoardConfig.mk
