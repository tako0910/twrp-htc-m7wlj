# Release name
PRODUCT_RELEASE_NAME := m7wlj

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/m7wlj/device.mk)

# Device identifier - this must come after all inclusions
PRODUCT_DEVICE := m7wlj
PRODUCT_NAME := cm_m7wlj
PRODUCT_BRAND := htc
PRODUCT_MODEL := One
PRODUCT_MANUFACTURER := HTC

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=m7wlj_google
