###
##
# Device tree for Samsung Galaxy A3 2016 with Exynos7580 SoC
# Copyright (C) 2017, Victor Lourme <contact@zeroside.co>
##
###

# Define device-tree path
LOCAL_PATH := device/samsung/j7eltexx

# Include layers
DEVICE_PACKAGE_OVERLAYS += device/samsung/j7eltexx/overlay

# Define screen size for prebuilt apps
PRODUCT_AAPT_CONFIG := xlarge
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_AAPT_PREBUILT_DPI := hdpi mdpi

# Use dtbhtoolExynos to build dt.img
PRODUCT_PACKAGES += \
    dtbhtoolExynos

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:system/etc/mixer_paths.xml

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps/gps.xml:system/etc/gps.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.heartrate.xml:system/etc/permissions/android.hardware.sensor.heartrate.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \

# Key-layout
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/idc/Synaptics_HID_TouchPad.idc:system/usr/idc/Synaptics_HID_TouchPad.idc \
	$(LOCAL_PATH)/configs/idc/Synaptics_RMI4_TouchPad_Sensor.idc:system/usr/idc/Synaptics_RMI4_TouchPad_Sensor.idc \
	$(LOCAL_PATH)/configs/keylayout/gpio_keys.kl:system/usr/keylayout/gpio_keys.kl \
	$(LOCAL_PATH)/configs/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl

# Lights
PRODUCT_PACKAGES += \
    lights.universal7580

# Media profile
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_profiles.xml:system/etc/media_profiles.xml

# Shims
PRODUCT_PACKAGES += \
    libshim_gpsd

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.samsungexynos7580 \
    init.baseband.rc \
    init.samsung.rc \
    init.samsungexynos7580.rc \
    init.samsungexynos7580.usb.rc \
    init.wifi.rc \
    ueventd.samsungexynos7580.rc \
    init.battery.rc

# Wi-Fi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/cred.conf:system/etc/wifi/cred.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

# Samsung
PRODUCT_PACKAGES += \
    SamsungServiceMode

# Samsung's SSWAP
PRODUCT_COPY_FILES += \
		$(LOCAL_PATH)/ramdisk/external/sswap:root/sbin/sswap

# RIL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/radio/apns-conf.xml:system/etc/apns-conf.xml \
    $(LOCAL_PATH)/configs/radio/cbd:system/bin/cbd \
    $(LOCAL_PATH)/ramdisk/rild.rc:system/etc/init/rild.rc

# RIL-packages
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    modemloader

# Power
PRODUCT_COPY_FILES += \
		$(LOCAL_PATH)/ramdisk/external/healthd:root/sbin/healthd

# Power packages
PRODUCT_PACKAGES += \
    power.exynos5

# Inherit from Exynos7580-common
$(call inherit-product, device/samsung/exynos7580-common/device-common.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/samsung/j7eltexx/j7eltexx-vendor.mk)
