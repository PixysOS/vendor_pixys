# RRO Overlays
PRODUCT_PACKAGES += \
    FilesOverlay \
    PixelDocumentsUIGoogleOverlay \
    BuiltInPrintServiceOverlay \
    GooglePermissionControllerOverlay \
    PixelConfigOverlayCommon \
    TeleServiceOverlay \
    CaptivePortalLoginOverlay \
    GoogleWebViewOverlay \
    SettingsGoogleOverlay \
    TelecomOverlay \
    CellBroadcastServiceOverlay \
    SettingsGoogleOverlayPixel2019_midyear \
    TelephonyProviderOverlay \
    ContactsProviderOverlay \
    PixelConfigOverlay2018 \
    SettingsProviderOverlay \
    TraceurOverlay \
    PixelConfigOverlay2019 \
    PixelConfigOverlay2019Midyear \
    PixelSetupWizardOverlay \
    PixelSetupWizardOverlay2019 \
    PixelSetupWizardOverlayActiveEdge \
    PixelFwResOverlay \
    GoogleConfigOverlay \
    SystemUIGoogleOverlay

ifeq ($(TARGET_INCLUDE_LIVE_WALLPAPERS),true)
PRODUCT_PACKAGES += \
    PixelLiveWallpapersOverlay
endif
