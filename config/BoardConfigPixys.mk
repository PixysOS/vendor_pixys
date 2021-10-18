include vendor/pixys/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/pixys/config/BoardConfigQcom.mk
endif

include vendor/pixys/config/BoardConfigSoong.mk
