# PixysOS apps
PRODUCT_PACKAGES += \
     MarkupGoogle \
     WellbeingPrebuilt \
     LatinIME \
     PixelLauncher3 \
     PixysSettings \
     Turbo \
     CameraRoll

# Markup libs
ifeq ($(TARGET_ARCH),arm64)
PRODUCT_COPY_FILES += \
    vendor/pixys/prebuilt/common/lib/libsketchology_native.so:system/lib/libsketchology_native.so \
    vendor/pixys/prebuilt/common/lib64/libsketchology_native.so:system/lib64/libsketchology_native.so

    else
PRODUCT_COPY_FILES += \
    vendor/pixys/prebuilt/common/lib/libsketchology_native.so:system/lib/libsketchology_native.so
endif

# Pixel sysconfig
PRODUCT_COPY_FILES += \
    vendor/pixys/prebuilt/common/etc/sysconfig/pixel.xml:system/etc/sysconfig/pixel.xml \
    vendor/pixys/prebuilt/common/etc/sysconfig/google-hiddenapi-package-whitelist.xml:system/etc/sysconfig/google-hiddenapi-package-whitelist.xml \
    vendor/pixys/prebuilt/common/etc/sysconfig/turbo.xml:system/etc/sysconfig/turbo.xml

# Pixys Theme
include vendor/pixys/themes/config.mk

# Pixys props
$(call inherit-product, vendor/pixys/config/pixys_props.mk)

# Call Overlay
DEVICE_PACKAGE_OVERLAYS += vendor/pixys/overlay/common

# Clean cache
PRODUCT_COPY_FILES += \
    vendor/pixys/prebuilt/common/bin/clean_cache.sh:system/bin/clean_cache.sh

# Permissions
PRODUCT_COPY_FILES += \
    vendor/pixys/prebuilt/common/etc/permissions/turbo.xml:system/etc/permissions/turbo.xml

# Wi-fi
PRODUCT_PROPERTY_OVERRIDES := \
     persist.sys.wfd.nohdcp=1 \
     persist.debug.wfd.enable=1 \
     persist.sys.wfd.virtual=0 \
     persist.debug.wfd.enable=1 \
     persist.sys.wfd.virtual=0
