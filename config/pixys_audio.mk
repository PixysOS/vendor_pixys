
# Sounds
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/pixys/audio/alarms,$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms) \
    $(call find-copy-subdir-files,*,vendor/pixys/audio/notifications,$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications) \
    $(call find-copy-subdir-files,*,vendor/pixys/audio/ringtones,$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones) \
    $(call find-copy-subdir-files,*,vendor/pixys/audio/ui,$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui)

# Change default sounds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.ringtone=Your_new_adventure.ogg \
    ro.config.notification_sound=Eureka.ogg \
    ro.config.alarm_alert=Fresh_start.ogg
