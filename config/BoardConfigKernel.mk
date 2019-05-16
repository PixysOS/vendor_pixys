# Copyright (C) 2018 The LineageOS Project
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

TARGET_AUTO_KDIR := $(shell echo $(TARGET_DEVICE_DIR) | sed -e 's/^device/kernel/g')

# kernel location - optional, defaults to kernel/<vendor>/<device> (see above TARGET_AUTO_KDIR)
TARGET_KERNEL_SOURCE ?= $(TARGET_AUTO_KDIR)
ifneq ($(TARGET_PREBUILT_KERNEL),)
TARGET_KERNEL_SOURCE :=
endif

CUSTOM_KERNEL_ARCH := $(strip $(TARGET_KERNEL_ARCH))
ifeq ($(CUSTOM_KERNEL_ARCH),)
TARGET_KERNEL_ARCH := $(TARGET_ARCH)
else
TARGET_KERNEL_ARCH := $(CUSTOM_KERNEL_ARCH)
endif

# Set DTBO image locations so the build system knows to build them
ifeq ($(TARGET_NEEDS_DTBOIMAGE),true)
BOARD_PREBUILT_DTBOIMAGE ?= $(PRODUCT_OUT)/dtbo/arch/$(KERNEL_ARCH)/boot/dtbo.img
else ifeq ($(BOARD_KERNEL_SEPARATED_DTBO),true)
BOARD_PREBUILT_DTBOIMAGE ?= $(PRODUCT_OUT)/dtbo-pre.img
endif
