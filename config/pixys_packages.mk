# Additional package
PRODUCT_PACKAGES += \
    ThemePicker \
    SettingsSuggestion \
    PixelTheme \
    WallpaperPickerGooglePrebuilt

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

# Pixys Theme
include vendor/PixysTheme/config.mk

# Cutout control overlay
PRODUCT_PACKAGES += \
    NoCutoutOverlay
