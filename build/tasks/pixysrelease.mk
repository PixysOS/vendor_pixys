# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017,2020 The LineageOS Project
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

# -----------------------------------------------------------------
# PixysOS OTA update package

ifneq ($(BUILD_WITH_COLORS),0)
    include $(TOP_DIR)vendor/pixys/build/core/colors.mk
endif

PIXYS_TARGET_PACKAGE := $(PRODUCT_OUT)/$(PIXYS_VERSION).zip
PIXYS_TARGET_UPDATEPACKAGE := $(PRODUCT_OUT)/$(PIXYS_VERSION)-img.zip
PIXYS_TARGET_PACKAGE_FOLDER := $(PRODUCT_OUT)
PIXYS_BUILD_TIME := 

MD5 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/md5sum

.PHONY: pixysrelease
pixysrelease: $(INTERNAL_OTA_PACKAGE_TARGET) $(INTERNAL_UPDATE_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(PIXYS_TARGET_PACKAGE)
	$(hide) $(MD5) $(PIXYS_TARGET_PACKAGE) > $(PIXYS_TARGET_PACKAGE).md5sum
	$(hide) ln -f $(INTERNAL_UPDATE_PACKAGE_TARGET) $(PIXYS_TARGET_UPDATEPACKAGE)
	$(hide) $(MD5) $(PIXYS_TARGET_UPDATEPACKAGE) > $(PIXYS_TARGET_UPDATEPACKAGE).md5sum
	@echo -e ${CL_BLU}"																																 "${CL_BLU}
	@echo -e ${CL_BLU}"                                                                                                                              "${CL_BLU}
	@echo -e ${CL_BLU}"                                                                                                                              "${CL_BLU}
	@echo -e ${CL_RED}"PPPPPPPPPPPPPPPPP     iiii                                                                   OOOOOOOOO        SSSSSSSSSSSSSSS "${CL_RED}
	@echo -e ${CL_RED}"P::::::::::::::::P   i::::i                                                                OO:::::::::OO    SS:::::::::::::::S"${CL_RED}
	@echo -e ${CL_RED}"P::::::PPPPPP:::::P   iiii                                                               OO:::::::::::::OO S:::::SSSSSS::::::S"${CL_RED}
	@echo -e ${CL_RED}"PP:::::P     P:::::P                                                                    O:::::::OOO:::::::OS:::::S     SSSSSSS"${CL_RED}
	@echo -e ${CL_RED}"  P::::P     P:::::Piiiiiii xxxxxxx      xxxxxxxyyyyyyy           yyyyyyy  ssssssssss   O::::::O   O::::::OS:::::S            "${CL_RED}
	@echo -e ${CL_BLU}"  P::::P     P:::::Pi:::::i  x:::::x    x:::::x  y:::::y         y:::::y ss::::::::::s  O:::::O     O:::::OS:::::S            "${CL_BLU}
	@echo -e ${CL_BLU}"  P::::PPPPPP:::::P  i::::i   x:::::x  x:::::x    y:::::y       y:::::yss:::::::::::::s O:::::O     O:::::O S::::SSSS         "${CL_BLU}
	@echo -e ${CL_BLU}"  P:::::::::::::PP   i::::i    x:::::xx:::::x      y:::::y     y:::::y s::::::ssss:::::sO:::::O     O:::::O  SS::::::SSSSS    "${CL_BLU}
	@echo -e ${CL_BLU}"  P::::PPPPPPPPP     i::::i     x::::::::::x        y:::::y   y:::::y   s:::::s  ssssss O:::::O     O:::::O    SSS::::::::SS  "${CL_BLU}
	@echo -e ${CL_BLU}"  P::::P             i::::i      x::::::::x          y:::::y y:::::y      s::::::s      O:::::O     O:::::O       SSSSSS::::S "${CL_BLU}
	@echo -e ${CL_GRN}"  P::::P             i::::i      x::::::::x           y:::::y:::::y          s::::::s   O:::::O     O:::::O            S:::::S"${CL_GRN}
	@echo -e ${CL_GRN}"  P::::P             i::::i     x::::::::::x           y:::::::::y     ssssss   s:::::s O::::::O   O::::::O            S:::::S"${CL_GRN}
	@echo -e ${CL_GRN}"PP::::::PP          i::::::i   x:::::xx:::::x           y:::::::y      s:::::ssss::::::sO:::::::OOO:::::::OSSSSSSS     S:::::S"${CL_GRN}
	@echo -e ${CL_GRN}"P::::::::P          i::::::i  x:::::x  x:::::x           y:::::y       s::::::::::::::s  OO:::::::::::::OO S::::::SSSSSS:::::S"${CL_GRN}
	@echo -e ${CL_GRN}"P::::::::P          i::::::i x:::::x    x:::::x         y:::::y         s:::::::::::ss     OO:::::::::OO   S:::::::::::::::SS "${CL_GRN}
	@echo -e ${CL_RED}"PPPPPPPPPP          iiiiiiiixxxxxxx      xxxxxxx       y:::::y           sssssssssss         OOOOOOOOO      SSSSSSSSSSSSSSS   "${CL_RED}
	@echo -e ${CL_RED}"                                                      y:::::y                                                                 "${CL_RED}
	@echo -e ${CL_RED}"                                                     y:::::y                                                                  "${CL_RED}
	@echo -e ${CL_RED}"                                                    y:::::y                                                                   "${CL_RED}
	@echo -e ${CL_RED}"                                                   y:::::y                                                                    "${CL_RED}
	@echo -e ${CL_RED}"                                                  yyyyyyy                                                                     "${CL_RED}
	@echo -e ${CL_RED}"                                                                                                                              "${CL_RED}
	@echo -e ${CL_RED}"                              Your Release Builds Is Ready! Enjoy the PixysOS                                                  "${CL_RED}
	@echo -e ${CL_CYN}"=============================-OTA Package Details-============================"${CL_RST}
	@echo -e ${CL_CYN}"Folder Location: "${CL_MAG} $(PIXYS_TARGET_PACKAGE_FOLDER)${CL_RST}
	@echo -e ${CL_CYN}"ZipName        : "${CL_MAG} $(PIXYS_VERSION).zip${CL_RST}
	@echo -e ${CL_CYN}"MD5            : "${CL_MAG}" $(shell cat $(PIXYS_TARGET_PACKAGE).md5sum | awk '{print $$1}')"${CL_RST}
	@echo -e ${CL_CYN}"Size           : "${CL_MAG}" $(shell du -hs $(PIXYS_TARGET_PACKAGE) | awk '{print $$1}')"${CL_RST}
	@echo -e ${CL_CYN}"Size(in bytes) : "${CL_MAG}" $(shell wc -c $(PIXYS_TARGET_PACKAGE) | awk '{print $$1}')"${CL_RST}
	@echo -e ${CL_CYN}"DateTime       : "${CL_MAG} $(PIXYS_BUILD_DATETIME)${CL_RST}
	@echo -e ${CL_CYN}"Build Type     : "${CL_MAG} $(PIXYS_BUILD_TYPE)${CL_RST}
	@echo -e ${CL_CYN}"==========================================================================="${CL_RST}
	@echo -e ""
	@echo -e ${CL_CYN}"============================-Fastboot Package Details-=============================="${CL_RST}
	@echo -e ${CL_CYN}"Folder Location: "${CL_MAG} $(PIXYS_TARGET_UPDATEPACKAGE_FOLDER)${CL_RST}
	@echo -e ${CL_CYN}"ZipName        : "${CL_MAG} $(PIXYS_VERSION)-img.zip${CL_RST}
	@echo -e ${CL_CYN}"MD5            : "${CL_MAG}" $(shell cat $(PIXYS_TARGET_UPDATEPACKAGE).md5sum | awk '{print $$1}')"${CL_RST} 
	@echo -e ${CL_CYN}"Size           : "${CL_MAG}" $(shell du -hs $(PIXYS_TARGET_UPDATEPACKAGE) | awk '{print $$1}')"${CL_RST}
	@echo -e ${CL_CYN}"Size(in bytes) : "${CL_MAG}" $(shell wc -c $(PIXYS_TARGET_UPDATEPACKAGE) | awk '{print $$1}')"${CL_RST} 
	@echo -e ${CL_CYN}"DateTime       : "${CL_MAG} $(PIXYS_BUILD_DATETIME)${CL_RST}
	@echo -e ${CL_CYN}"Build Type     : "${CL_MAG} $(PIXYS_BUILD_TYPE)${CL_RST}
	@echo -e ${CL_CYN}"==========================================================================="${CL_RST}
	@echo -e ""
