# PixysOS apps
PRODUCT_PACKAGES += \
    Launcher3 \
    Stk \
    Terminal \
    PixysOTA

# Pixys Theme
include vendor/pixys/themes/config.mk

# Pixys props
$(call inherit-product, vendor/pixys/config/pixys_props.mk)

# Call Overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/pixys/themes/overlay/common
