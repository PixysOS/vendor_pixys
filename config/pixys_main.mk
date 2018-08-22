# PixysOS apps
PRODUCT_PACKAGES += \

# Pixys Theme
include vendor/pixys/themes/config.mk

# Pixys props
$(call inherit-product, vendor/pixys/config/pixys_props.mk)

# Call Overlay
DEVICE_PACKAGE_OVERLAYS += vendor/pixys/overlay/common
