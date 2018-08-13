# PixysOS apps
PRODUCT_PACKAGES += \
     MarkupGoogle

# Markup libs
PRODUCT_COPY_FILES += \
    vendor/pixys/prebuilt/common/lib/libsketchology_native.so:system/lib/libsketchology_native.so \
    vendor/pixys/prebuilt/common/lib64/libsketchology_native.so:system/lib64/libsketchology_native.so

# Pixys Theme
include vendor/pixys/themes/config.mk

# Pixys props
$(call inherit-product, vendor/pixys/config/pixys_props.mk)

# Call Overlay
DEVICE_PACKAGE_OVERLAYS += vendor/pixys/overlay/common
