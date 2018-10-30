# Copyright (C) 2018 PixysOS
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

PRODUCT_GENERIC_PROPERTIES += \
    ro.opa.eligible_device=true\
    ro.setupwizard.rotation_locked=true \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.setupwizard.rotation_locked=true
	
# Wi-fi
PRODUCT_PROPERTY_OVERRIDES := \
     persist.sys.wfd.nohdcp=1 \
     persist.debug.wfd.enable=1 \
     persist.sys.wfd.virtual=0 \
     persist.debug.wfd.enable=1 \
     persist.sys.wfd.virtual=0
