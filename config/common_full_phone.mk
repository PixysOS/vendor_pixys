# Inherit full common PixysOS stuff
$(call inherit-product, vendor/pixys/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include pixys LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/pixys/overlay/dictionaries

$(call inherit-product, vendor/pixys/config/telephony.mk)
