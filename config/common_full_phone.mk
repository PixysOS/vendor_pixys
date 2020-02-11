# Inherit full common Lineage stuff
$(call inherit-product, vendor/pixys/config/common_full.mk)

ifeq ($(TARGET_USES_CARRIERSETTINGS),true)
# CarrierSettings
$(call inherit-product, vendor/pixys/CarrierSettings/config.mk)
endif

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Lineage LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/pixys/overlay/dictionaries

$(call inherit-product, vendor/pixys/config/telephony.mk)
