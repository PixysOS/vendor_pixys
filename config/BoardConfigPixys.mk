# Safetynet
TARGET_FORCE_BUILD_FINGERPRINT := google/redfin/redfin:11/RD1A.201105.003.C1/6886399:user/release-keys

# Charger
ifeq ($(WITH_LINEAGE_CHARGER),true)
    BOARD_HAL_STATIC_LIBRARIES := libhealthd.lineage
endif

include vendor/pixys/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/pixys/config/BoardConfigQcom.mk
endif

include vendor/pixys/config/BoardConfigSoong.mk

ifneq ($(TARGET_USES_PREBUILT_CAMERA_SERVICE), true)
PRODUCT_SOONG_NAMESPACES += \
    frameworks/av/camera/cameraserver \
    frameworks/av/services/camera/libcameraservice
endif
