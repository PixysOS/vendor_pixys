# RRO Overlays
PRODUCT_PACKAGES += \
    PixelDocumentsUIGoogleOverlay \
    BuiltInPrintServiceOverlay \
    CustomPixelLauncherOverlay \
    GooglePermissionControllerOverlay \
    PixelConfigOverlayCommon \
    TeleServiceOverlay \
    CaptivePortalLoginOverlay \
    GoogleWebViewOverlay \
    TelecomOverlay \
    CellBroadcastServiceOverlay \
    SettingsGoogleOverlay \
    SettingsGoogleOverlayPixel2021 \
    TelephonyProviderOverlay \
    ContactsProviderOverlay \
    PixelConfigOverlay2018 \
    SettingsProviderOverlay \
    TraceurOverlay \
    PixelConfigOverlay2019 \
    PixelConfigOverlay2019Midyear \
    PixelConfigOverlay2021 \
    PixelSetupWizardOverlay \
    PixelSetupWizardOverlay2019 \
    PixelSetupWizardOverlayActiveEdge \
    PixelFwResOverlay \
    GoogleConfigOverlay \
    SystemUIGoogleOverlay \
    GesturalNavigationOverlayLong \
    GesturalNavigationOverlayMedium \
   NavigationBarNoHintOverlay

ifeq ($(TARGET_INCLUDE_LIVE_WALLPAPERS),true)
PRODUCT_PACKAGES += \
    PixelLiveWallpapersOverlay
endif
