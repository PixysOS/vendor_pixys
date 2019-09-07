# Inherit common PixysOS stuff
$(call inherit-product, vendor/pixys/config/common.mk)

PRODUCT_SIZE := full

# Recorder
PRODUCT_PACKAGES += \
    Recorder
