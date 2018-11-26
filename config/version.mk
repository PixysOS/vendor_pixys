# Copyright (C) 2018 The PixysOS Project
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

PIXYS_MOD_VERSION = v2.4

ifndef PIXYS_BUILD_TYPE
    PIXYS_BUILD_TYPE := UNOFFICIAL
endif

# Test Build Tag
ifeq ($(PIXYS_TEST),true)
    PIXYS_BUILD_TYPE := NOOBS

PRODUCT_PACKAGES += \
    Updater
endif

PIXYS_BUILD=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)

ifeq ($(PIXYS_OFFICIAL), true)
   LIST = $(shell curl -s https://raw.githubusercontent.com/PixysOS/vendor_pixys/pie/pixys.devices)
   FOUND_DEVICE =  $(filter $(PIXYS_BUILD), $(LIST))
    ifeq ($(FOUND_DEVICE),$(PIXYS_BUILD))
      IS_OFFICIAL=true
      PIXYS_BUILD_TYPE := OFFICIAL
     
PRODUCT_PACKAGES += \
    Updater

    endif
    ifneq ($(IS_OFFICIAL), true)
       PIXYS_BUILD_TYPE := UNOFFICIAL
       $(error Device is not official "$(FOUND)")
    endif
endif

TARGET_PRODUCT_SHORT := $(subst apixysos_,,$(PIXYS_BUILD))

PIXYS_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)
PIXYS_BUILD_DATETIME := $(shell date +%s)
PIXYS_VERSION := PixysOS-$(PIXYS_MOD_VERSION)-$(PIXYS_BUILD)-$(PIXYS_BUILD_TYPE)-$(PIXYS_BUILD_DATE)
PIXYS_FINGERPRINT := PixysOS/$(PIXYS_VERSION_NUMBER)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(PIXYS_BUILD_DATE)

PRODUCT_GENERIC_PROPERTIES += \
  ro.pixys.version=$(PIXYS_VERSION) \
  ro.pixys.releasetype=$(PIXYS_BUILD_TYPE) \
  ro.modversion=$(PIXYS_MOD_VERSION)

PIXYS_DISPLAY_VERSION := PixysOS-$(PIXYS_MOD_VERSION)-$(PIXYS_BUILD_TYPE)-$(PIXYS_BUILD_DATE)

PRODUCT_GENERIC_PROPERTIES += \
  ro.pixys.display.version=$(PIXYS_DISPLAY_VERSION) \
  ro.pixys.fingerprint=$(PIXYS_FINGERPRINT)
