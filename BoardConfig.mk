# Copyright (C) 2015 Matthew D. Mower
# Copyright (C) 2015 The CyanogenMod Project
# Copyright (C) 2013 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/htc/m7wlj/BoardConfigVendor.mk

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := m7wlj
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := krait
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

# Kernel
BOARD_KERNEL_BASE := 0x80600000
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom user_debug=31 androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01800000
TARGET_KERNEL_CONFIG := m7wlj_defconfig
TARGET_KERNEL_SOURCE := kernel/htc/msm8960

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# Flags
COMMON_GLOBAL_CFLAGS += -DHTCLOG
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# Graphics
USE_OPENGL_RENDERER := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
BOARD_EGL_CFG := device/htc/m7wlj/configs/egl.cfg
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Power
TARGET_POWERHAL_VARIANT := qcom

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776704
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1946156032
BOARD_USERDATAIMAGE_PARTITION_SIZE := 27917287424
BOARD_FLASH_BLOCK_SIZE := 131072

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true

# Vold
BOARD_VOLD_MAX_PARTITIONS := 40

# Charge mode
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/htc_lpm/lpm_mode

# SELinux
-include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += device/htc/m7wlj/sepolicy

BOARD_SEPOLICY_UNION += \
    akmd.te \
    cir_fw_update.te

# TWRP
TW_THEME := portrait_hdpi
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_INCLUDE_CRYPTO := true
BOARD_RECOVERY_BLDRMSG_OFFSET := 2048
RECOVERY_VARIANT := twrp
TARGET_RECOVERY_DEVICE_MODULES := chargeled zip
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_NO_USB_STORAGE := true
TW_EXTERNAL_STORAGE_PATH := "/usb-otg"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "usb-otg"

#MultiROM config. MultiROM also uses parts of TWRP config
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := device/htc/m7wlj/mr_init_devices.c
MR_DPI := xhdpi
MR_FSTAB := device/htc/m7wlj/recovery.fstab
MR_USE_MROM_FSTAB := true
MR_DEVICE_HOOKS := device/htc/m7wlj/mr_hooks.c
MR_DEVICE_HOOKS_VER := 4
MR_KEXEC_MEM_MIN := 0x85000000
MR_DPI_FONT := 216
