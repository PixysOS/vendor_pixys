# Copyright (C) 2018 Pixys OS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# PixysOS apps
PRODUCT_PACKAGES += \
     MarkupGoogle \
     WellbeingPrebuilt \
     LatinIME \
     PixelLauncher3 \
     PixysOTA \
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

# Call Overlay
DEVICE_PACKAGE_OVERLAYS += vendor/pixys/overlay/common

# Clean cache
PRODUCT_COPY_FILES += \
    vendor/pixys/prebuilt/common/bin/clean_cache.sh:system/bin/clean_cache.sh

# Permissions
PRODUCT_COPY_FILES += \
    vendor/pixys/prebuilt/common/etc/permissions/turbo.xml:system/etc/permissions/turbo.xml

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