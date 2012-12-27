# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS := device/zte/mooncakec/overlay

# Discard inherited values and use our own instead.
PRODUCT_NAME := zte_mooncakec
PRODUCT_DEVICE := mooncakec
PRODUCT_MODEL := Carl
PRODUCT_MANUFACTURER := ZTE

PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni \
    Gallery3d \
    SpareParts \
    Development \
    Term \
    copybit.mooncake \
    gps.mooncake \
    lights.mooncake \
    sensors.mooncake \
    libOmxCore \
    libOmxVidEnc \
    FM \
    abtfilt \
    RacerParts \
    dexpreopt

# proprietary side of the device
$(call inherit-product-if-exists, vendor/zte/mooncakec/mooncakec-vendor.mk)

DISABLE_DEXPREOPT := false

# Keypad
PRODUCT_COPY_FILES += \
    device/zte/mooncakec/prebuilt/usr/keylayout/mooncake-keypad.kl:system/usr/keylayout/mooncake-keypad.kl

# Vold
PRODUCT_COPY_FILES += \
    device/zte/mooncakec/prebuilt/etc/vold.fstab:system/etc/vold.fstab

# Init
PRODUCT_COPY_FILES += \
    device/zte/mooncakec/prebuilt/init.mooncakec.rc:root/init.mooncakec.rc\
    device/zte/mooncakec/prebuilt/ueventd.mooncakec.rc:root/ueventd.mooncakec.rc

# Audio + Media profiles
PRODUCT_COPY_FILES += \
    device/zte/mooncakec/prebuilt/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/zte/mooncakec/prebuilt/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/zte/mooncakec/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml

# WLAN + BT
PRODUCT_COPY_FILES += \
    device/zte/mooncakec/prebuilt/etc/init.bt.sh:system/etc/init.bt.sh \
    device/zte/mooncakec/prebuilt/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    device/zte/mooncakec/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/zte/mooncakec/prebuilt/etc/wifi/hostapd.conf:system/etc/wifi/hostapd.conf \
    device/zte/mooncakec/prebuilt/etc/dhcpd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# WiFi firmware
PRODUCT_COPY_FILES += \
    device/zte/mooncakec/prebuilt/wifi/ar6000.ko:system/wifi/ar6000.ko \
    device/zte/mooncakec/prebuilt/wifi/regcode:system/wifi/regcode \
    device/zte/mooncakec/prebuilt/wifi/data.patch.hw2_0.bin:system/wifi/data.patch.hw2_0.bin \
    device/zte/mooncakec/prebuilt/wifi/athwlan.bin.z77:system/wifi/athwlan.bin.z77 \
    device/zte/mooncakec/prebuilt/wifi/athtcmd_ram.bin:system/wifi/athtcmd_ram.bin \
    device/zte/mooncakec/prebuilt/wifi/device.bin:system/wifi/device.bin \
    device/zte/mooncakec/prebuilt/wifi/eeprom.bin:system/wifi/eeprom.bin \
    device/zte/mooncakec/prebuilt/wifi/eeprom.data:system/wifi/eeprom.data

# Mooncake uses low and medium-density artwork where available
PRODUCT_LOCALES += ldpi mdpi

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise