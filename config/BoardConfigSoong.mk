PATH_OVERRIDE_SOONG := $(shell echo $(TOOLS_PATH_OVERRIDE))

# Add variables that we wish to make available to soong here.
EXPORT_TO_SOONG := \
    KERNEL_ARCH \
    KERNEL_BUILD_OUT_PREFIX \
    KERNEL_CROSS_COMPILE \
    KERNEL_MAKE_CMD \
    KERNEL_MAKE_FLAGS \
    PATH_OVERRIDE_SOONG \
    TARGET_KERNEL_CONFIG \
    TARGET_KERNEL_SOURCE \
    TARGET_KERNEL_HEADERS

# Setup SOONG_CONFIG_* vars to export the vars listed above.
# Documentation here:
# https://github.com/LineageOS/android_build_soong/commit/8328367c44085b948c003116c0ed74a047237a69

SOONG_CONFIG_NAMESPACES += pixysVarsPlugin

SOONG_CONFIG_pixysVarsPlugin :=

SOONG_CONFIG_NAMESPACES += pixysGlobalVars
SOONG_CONFIG_pixysGlobalVars :=
ifneq ($(TARGET_FORCE_BUILD_FINGERPRINT),)
SOONG_CONFIG_customGlobalVars += force_build_fingerprint
endif

define addVar
  SOONG_CONFIG_pixysVarsPlugin += $(1)
  SOONG_CONFIG_pixysVarsPlugin_$(1) := $$(subst ",\",$$($1))
endef

ifneq ($(TARGET_FORCE_BUILD_FINGERPRINT),)
SOONG_CONFIG_customGlobalVars_force_build_fingerprint := $(TARGET_FORCE_BUILD_FINGERPRINT)
endif

$(foreach v,$(EXPORT_TO_SOONG),$(eval $(call addVar,$(v))))
