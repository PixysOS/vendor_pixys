# PixysOS apps
PRODUCT_PACKAGES += \
    Launcher3 \
    MarkupGoogle \
    LatinIME \
    WellbeingPrebuilt

# Markup libs
PRODUCT_COPY_FILES += \
    vendor/pixys/prebuilt/common/lib/libsketchology_native.so:system/lib/libsketchology_native.so \
    vendor/pixys/prebuilt/common/lib64/libsketchology_native.so:system/lib64/libsketchology_native.so

# Google Config
PRODUCT_COPY_FILES += \
    vendor/pixys/prebuilt/common/etc/sysconfig/nexus.xml:system/etc/sysconfig/nexus.xml
