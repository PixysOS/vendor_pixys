LOCAL_PATH := $(call my-dir)

# a wrapper for curl which provides wget syntax, for compatibility
include $(CLEAR_VARS)
LOCAL_MODULE := wget
LOCAL_SRC_FILES := bin/wget
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
include $(BUILD_PREBUILT)

#Markup
include $(CLEAR_VARS)
LOCAL_MODULE := MarkupGoogle
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := apps/MarkupGoogle/MarkupGoogle.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false
include $(BUILD_PREBUILT)

#Wellbeing
include $(CLEAR_VARS)
LOCAL_MODULE := WellbeingPrebuilt
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := apps/WellbeingPrebuilt/WellbeingPrebuilt.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_PRIVILEGED_MODULE := true
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false
include $(BUILD_PREBUILT)

#Turbo
include $(CLEAR_VARS)
LOCAL_MODULE := Turbo
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := apps/Turbo/Turbo.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_PRIVILEGED_MODULE := true
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false
include $(BUILD_PREBUILT)

#CameraRoll
include $(CLEAR_VARS)
LOCAL_MODULE := CameraRoll
LOCAL_SRC_FILES := apps/CameraRoll/CameraRoll.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_OVERRIDES_PACKAGES := Gallery Gallery2 SnapdragonGallery VanillaGallery
include $(BUILD_PREBUILT)

#WallpaperPickerGooglePrebuilt
include $(CLEAR_VARS)
LOCAL_MODULE := WallpaperPickerGooglePrebuilt
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := apps/WallpaperPickerGooglePrebuilt/WallpaperPickerGooglePrebuilt.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_PRIVILEGED_MODULE := true
LOCAL_OVERRIDES_PACKAGES := WallpaperPicker WallpaperCropper
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := .apk
include $(BUILD_PREBUILT)

#WeatherClient
include $(CLEAR_VARS)
LOCAL_MODULE := WeatherClient
LOCAL_SRC_FILES := apps/WeatherClient/WeatherClient.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_PRIVILEGED_MODULE := true
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false
include $(BUILD_PREBUILT)

#MaterialFX
include $(CLEAR_VARS)
LOCAL_MODULE := MaterialFXPrebuilt
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := apps/MaterialFXPrebuilt/MaterialFXPrebuilt.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_MODULE_PATH := $(TARGET_OUT)/priv-app
LOCAL_OVERRIDES_PACKAGES := MusicFX
include $(BUILD_PREBUILT)
