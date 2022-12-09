# arbutus-slab family
PRODUCT_PACKAGES += \
    ArbutusSlab-Regular.ttf

# google-sans family
PRODUCT_PACKAGES += \
    GoogleSansClock-Regular.ttf

# Lustria family
PRODUCT_PACKAGES += \
    Lustria-Regular.ttf

# lato family
PRODUCT_PACKAGES += \
    Lato-BoldItalic.ttf \
    Lato-Bold.ttf \
    Lato-Italic.ttf \
    Lato-MediumItalic.ttf \
    Lato-Medium.ttf \
    Lato-Regular.ttf

# rubik family
PRODUCT_PACKAGES += \
    Rubik-BoldItalic.ttf \
    Rubik-Bold.ttf \
    Rubik-Italic.ttf \
    Rubik-MediumItalic.ttf \
    Rubik-Medium.ttf \
    Rubik-Regular.ttf

# zilla-slab family
PRODUCT_PACKAGES += \
    ZillaSlab-MediumItalic.ttf \
    ZillaSlab-Medium.ttf \
    ZillaSlab-SemiBoldItalic.ttf \
    ZillaSlab-SemiBold.ttf

# Karla family
PRODUCT_PACKAGES += \
    Karla-Regular.ttf

# Fraunces family
PRODUCT_PACKAGES += \
    Fraunces-Regular.ttf \
    Fraunces-SemiBold.ttf

# BigShouldersText family
PRODUCT_PACKAGES += \
    BigShouldersText-Bold.ttf \
    BigShouldersText-ExtraBold.ttf

# Barlow family
PRODUCT_PACKAGES += \
    Barlow-Bold.ttf \
    Barlow-Medium.ttf

# Customization overlays
PRODUCT_PACKAGES += \
    FontGInterOverlay \
    FontGoogleSansOverlay \
    FontHarmonySansOverlay \
    FontLinotteSourceOverlay \
    FontManropeOverlay \
    FontNotoSerifSource \
    FontOnePlusSansOverlay \
    FontOneplusSlateSourceOverlay

PRODUCT_PACKAGES += \
    GInterVF-Italic.ttf \
    GInterVF-Roman.ttf \
    GoogleSans-Italic.ttf \
    GoogleSans-Regular.ttf \
    HarmonyOS-Sans-BlackItalic.ttf \
    HarmonyOS-Sans-Black.ttf \
    HarmonyOS-Sans-BoldItalic.ttf \
    HarmonyOS-Sans-Bold.ttf \
    HarmonyOS-Sans-Italic.ttf \
    HarmonyOS-Sans-LightItalic.ttf \
    HarmonyOS-Sans-Light.ttf \
    HarmonyOS-Sans-MediumItalic.ttf \
    HarmonyOS-Sans-Medium.ttf \
    HarmonyOS-Sans-Regular.ttf \
    HarmonyOS-Sans-ThinItalic.ttf \
    HarmonyOS-Sans-Thin.ttf \
    Lexend-VF.ttf \
    Manrope-VF.ttf \

# Register vendor fonts
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/pixys/fonts/prebuilt,$(TARGET_COPY_OUT_PRODUCT)/fonts) \
    vendor/pixys/fonts/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml
