# Additional package
PRODUCT_PACKAGES += \
    ThemePicker \
    SettingsSuggestion \
    PixelTheme \
    ThemePicker \
    Longshot

# Call Overlay
DEVICE_PACKAGE_OVERLAYS += vendor/pixys/overlay/common

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.dun.override=0
endif

# Extra tools in Lineage
PRODUCT_PACKAGES += \
    7z \
    awk \
    bash \
    bzip2 \
    curl \
    getcap \
    htop \
    lib7z \
    libsepol \
    pigz \
    powertop \
    setcap \
    unrar \
    unzip \
    vim \
    wget \
    zip


# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# init file
PRODUCT_COPY_FILES += \
    vendor/pixys/prebuilt/common/etc/init.local.rc:system/etc/init/init.pixys.rc \
    vendor/pixys/prebuilt/common/etc/permissions/privapp-permissions-google-wallpaper.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-google-wallpaper.xml \
    vendor/pixys/prebuilt/common/etc/permissions/pixys-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/pixys-hiddenapi-package-whitelist.xml \
    vendor/pixys/prebuilt/common/etc/permissions/privapp-permissions-pixys-system.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-pixys-system.xml

# Pixys Theme
include vendor/PixysTheme/config.mk

# Cutout control overlay
PRODUCT_PACKAGES += \
    NoCutoutOverlay

# SetupWizard
PRODUCT_PRODUCT_PROPERTIES += \
    setupwizard.enable_assist_gesture_training=true \
    setupwizard.feature.baseline_setupwizard_enabled=true \
    setupwizard.feature.show_pixel_tos=true \
    setupwizard.feature.show_support_link_in_deferred_setup=false \
    setupwizard.theme=glif_v3_light

# IME
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.ime.bs_theme=true \
    ro.com.google.ime.theme_id=5

