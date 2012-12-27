LOCAL_PATH:= $(call my-dir)

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
USE_CAMERA_STUB := true

# Use the non-open-source parts, if they're present
-include vendor/zte/mooncake/BoardConfigVendor.mk

# CPU
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv6-vfp

# Target and board properties
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := msm7k
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_BOOTLOADER_BOARD_NAME := mooncake
TARGET_PROVIDES_LIBRIL := true
TARGET_PROVIDES_LIBAUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true

# FM Radio
BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
BOARD_FM_DEVICE := si4708

# Wifi
BOARD_WPA_SUPPLICANT_DRIVER := AWEXT
WIFI_DRIVER_MODULE_PATH     := /system/wifi/ar6000.ko
WIFI_DRIVER_MODULE_NAME     := ar6000

# Browser
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8

# Graphics
TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
BOARD_EGL_CFG := device/zte/mooncakec/prebuilt/lib/egl/egl.cfg

# QCOM
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true

# GPS
BOARD_GPS_LIBRARIES := libloc
BOARD_USES_GPSSHIM := true
BOARD_GPS_NEEDS_XTRA := true

# USB
BOARD_CUSTOM_USB_CONTROLLER := ../../device/zte/mooncakec/UsbController.cpp
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"

# Kernel
TARGET_KERNEL_SOURCE := kernel/zte/msm7x27
TARGET_KERNEL_CONFIG := cyanogen_mooncakec_defconfig
BOARD_KERNEL_BASE := 0x02600000
BOARD_KERNEL_CMDLINE := androidboot.hardware=mooncake console=null

# Gen2 partition sizes
BOARD_BOOTIMAGE_PARTITION_SIZE     := 0x00500000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 0x0dc00000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0a280000
BOARD_FLASH_BLOCK_SIZE := 131072

# Recovery
BOARD_LDPI_RECOVERY := true
TARGET_PREBUILT_RECOVERY_KERNEL := device/zte/mooncakec/recovery/recovery_kernel
BOARD_CUSTOM_RECOVERY_KEYMAPPING:= ../../device/zte/mooncakec/recovery/recovery_ui.c
TARGET_RECOVERY_INITRC := device/zte/mooncakec/recovery/recovery.rc
