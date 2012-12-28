# proprietary side of the device
$(call inherit-product-if-exists, vendor/zte/mooncakec/mooncakec-vendor.mk)

DEVICE_PACKAGE_OVERLAYS := device/zte/mooncakec/overlay

$(call inherit-product, device/zte/mooncake-common/mooncake.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := zte_mooncakec
PRODUCT_DEVICE := mooncakec
PRODUCT_MODEL := Carl

PRODUCT_PACKAGES += \
    sensors.mooncake

# Init
PRODUCT_COPY_FILES += \
    device/zte/mooncakec/prebuilt/init.mooncake.rc:root/init.mooncake.rc\
    device/zte/mooncakec/prebuilt/ueventd.mooncake.rc:root/ueventd.mooncake.rc
