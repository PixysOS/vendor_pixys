# PixysOS apps
PRODUCT_PACKAGES += \
    Launcher3

# Pixys Theme
include vendor/pixys/themes/config.mk

# Pixys props
$(call inherit-product, vendor/pixys/config/pixys_props.mk)
