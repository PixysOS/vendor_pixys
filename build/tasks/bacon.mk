# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017 The LineageOS Project
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

PIXYS_TARGET_PACKAGE := $(PRODUCT_OUT)/PixysOS-$(PIXYS_VERSION).zip

.PHONY: bacon pixys
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(PIXYS_TARGET_PACKAGE)
	$(hide) $(MD5SUM) $(PIXYS_TARGET_PACKAGE) > $(PIXYS_TARGET_PACKAGE).md5sum
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
	@echo -e ${CL_RED}"                                      Your Build Is Ready! Enjoy the PixysOS                                                  "${CL_RED}
	@echo -e ${CL_RED}"$(PIXYS_TARGET_PACKAGE)																															 "${CL_RED}

pixys: bacon
