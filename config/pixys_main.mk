# PixysOS apps
PRODUCT_PACKAGES += \
    Launcher3 \
    NexusLauncherPrebuilt

# Markup libs
PRODUCT_COPY_FILES += \
    vendor/pixys/prebuilt/common/lib/libsketchology_native.so:system/lib/libsketchology_native.so \
    vendor/pixys/prebuilt/common/lib64/libsketchology_native.so:system/lib64/libsketchology_native.so
