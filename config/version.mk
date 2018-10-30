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

PIXYS_VERSION_NUMBER := v2.3

ifndef PIXYS_BUILD_TYPE
PIXYS_BUILD_TYPE := UNOFFICIAL
CUSTOM_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)

PRODUCT_GENERIC_PROPERTIES += \
    ro.pixys.buildtype=unofficial
endif

ifeq ($(PIXYS_BUILD_TYPE), OFFICIAL)
PRODUCT_GENERIC_PROPERTIES += \
    ro.pixys.buildtype=official
endif

PIXYS_VERSION := PixysOS-$(PIXYS_VERSION_NUMBER)-$(PIXYS_BUILD)-$(PIXYS_BUILD_TYPE)-$(CUSTOM_BUILD_DATE)
PIXYS_MOD_VERSION := $(PIXYS_VERSION)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
  ro.pixys.version=$(PIXYS_VERSION) \
  ro.pixys.releasetype=$(PIXYS_BUILD_TYPE) \
  ro.modversion=$(PIXYS_MOD_VERSION)

PIXYS_DISPLAY_VERSION := $(PIXYS_VERSION)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.pixys.display.version=$(PIXYS_DISPLAY_VERSION)