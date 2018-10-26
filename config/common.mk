PRODUCT_BRAND ?= Pixys

PIXYS_VERSION_NUMBER := v2.3

ifndef PIXYS_BUILD_TYPE
PIXYS_BUILD_TYPE := UNOFFICIAL

PRODUCT_GENERIC_PROPERTIES += \
    ro.pixys.buildtype=unofficial
endif

ifeq ($(PIXYS_BUILD_TYPE), OFFICIAL)
PRODUCT_GENERIC_PROPERTIES += \
    ro.pixys.buildtype=official

PRODUCT_PACKAGES += \
    Updater

endif

PIXYS_VERSION := PixysOS-$(PIXYS_VERSION_NUMBER)-$(shell date -u +%Y%m%d)-$(PIXYS_BUILD)-$(PIXYS_BUILD_TYPE)
PIXYS_MOD_VERSION := $(PIXYS_VERSION)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
  ro.pixys.version=$(PIXYS_VERSION) \
  ro.pixys.releasetype=$(PIXYS_BUILD_TYPE) \
  ro.modversion=$(PIXYS_MOD_VERSION)

PIXYS_DISPLAY_VERSION := $(PIXYS_VERSION)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.pixys.display.version=$(PIXYS_DISPLAY_VERSION)

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    keyguard.no_require_sim=true

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.selinux=1

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.dun.override=0
endif

ifeq ($(BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE),)
  PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.device.cache_dir=/data/cache
else
  PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.device.cache_dir=/cache
endif

# init file
PRODUCT_COPY_FILES += \
    vendor/pixys/prebuilt/common/etc/init.local.rc:system/etc/init/init.arrow.rc

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/pixys/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/pixys/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/pixys/prebuilt/common/bin/50-pixys.sh:system/addon.d/50-pixys.sh \
    vendor/pixys/prebuilt/common/bin/blacklist:system/addon.d/blacklist

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/pixys/prebuilt/common/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/pixys/prebuilt/common/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/pixys/prebuilt/common/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/pixys/config/permissions/backup.xml:system/etc/sysconfig/backup.xml

# init.d support
PRODUCT_COPY_FILES += \
    vendor/pixys/prebuilt/common/bin/sysinit:system/bin/sysinit

# Copy all PixysOS-specific init rc files
$(foreach f,$(wildcard vendor/pixys/prebuilt/common/etc/init/*.rc),\
	$(eval PRODUCT_COPY_FILES += $(f):system/etc/init/$(notdir $f)))

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/pixys/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# TWRP
ifeq ($(WITH_TWRP),true)
include vendor/pixys/config/twrp.mk
endif

# Bootanimation
ifeq ($(TARGET_BOOT_ANIMATION_RES),720)
     PRODUCT_COPY_FILES += vendor/pixys/media/bootanimation_720.zip:system/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1080)
     PRODUCT_COPY_FILES += vendor/pixys/media/bootanimation_1080.zip:system/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1440)
     PRODUCT_COPY_FILES += vendor/pixys/media/bootanimation_1440.zip:system/media/bootanimation.zip
else
    $(error "Bootanimation: TARGET_BOOT_ANIMATION_RES is undefined")
endif

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# Extra tools in PixysOS
PRODUCT_PACKAGES += \
    7z \
    awk \
    bash \
    bzip2 \
    curl \
    fsck.ntfs \
    gdbserver \
    htop \
    lib7z \
    libsepol \
    micro_bench \
    mke2fs \
    mkfs.ntfs \
    mount.ntfs \
    oprofiled \
    pigz \
    powertop \
    sqlite3 \
    strace \
    tune2fs \
    unrar \
    unzip \
    vim \
    wget \
    zip

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# exFAT tools
PRODUCT_PACKAGES += \
    fsck.exfat \
    mkfs.exfat

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

# Storage manager
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.storage_manager.enabled=true

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# These packages are excluded from user builds
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    procmem \
    procrank

# Conditionally build in su
ifeq ($(WITH_SU),true)
PRODUCT_PACKAGES += \
    su
endif
endif

-include $(WORKSPACE)/build_env/image-auto-bits.mk
-include vendor/pixys/config/partner_gms.mk

include vendor/pixys/config/pixys_main.mk

$(call inherit-product-if-exists, vendor/extra/product.mk)
