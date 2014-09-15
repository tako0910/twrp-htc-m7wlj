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

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/lpm.rc:recovery/root/lpm.rc \
    $(LOCAL_PATH)/recovery/init.recovery.qcom.rc:root/init.recovery.qcom.rc \
    $(LOCAL_PATH)/recovery/charger:recovery/root/sbin/charger \
    $(LOCAL_PATH)/recovery/choice_fn:recovery/root/sbin/choice_fn \
    $(LOCAL_PATH)/recovery/offmode_charging:recovery/root/sbin/offmode_charging \
    $(LOCAL_PATH)/recovery/fstab.qcom:recovery/root/fstab.qcom \
    $(LOCAL_PATH)/recovery/images/battery_0.png:recovery/root/res/images/charger/battery_0.png \
    $(LOCAL_PATH)/recovery/images/battery_1.png:recovery/root/res/images/charger/battery_1.png \
    $(LOCAL_PATH)/recovery/images/battery_2.png:recovery/root/res/images/charger/battery_2.png \
    $(LOCAL_PATH)/recovery/images/battery_3.png:recovery/root/res/images/charger/battery_3.png \
    $(LOCAL_PATH)/recovery/images/battery_4.png:recovery/root/res/images/charger/battery_4.png \
    $(LOCAL_PATH)/recovery/images/battery_fail.png:recovery/root/res/images/charger/battery_fail.png \
    $(LOCAL_PATH)/recovery/images/battery_full.png:recovery/root/res/images/charger/battery_full.png

PRODUCT_PACKAGES += \
    chargeled

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_m7wlj
PRODUCT_DEVICE := m7wlj
