$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/htc/m7wlj/m7wlj-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/m7wlj/overlay

LOCAL_PATH := device/htc/m7wlj
ifeq ($(TARGET_PREBUILT_KERNEL),)
        LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
        LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_m7wlj
PRODUCT_DEVICE := m7wlj
