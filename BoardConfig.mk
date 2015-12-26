#
# Copyright (C) 2015 The CyanogenMod Project
# Copyright (c) 2015, mdeejay (mdjrussia@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

-include device/cyanogen/msm8916-common/BoardConfigCommon.mk

DEVICE_PATH := device/dexp/mlte5

TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

TARGET_USES_UNCOMPRESSED_KERNEL := false

# Cortex arch
TARGET_CPU_CORTEX_A53 := true

# Secure services
BOARD_USES_SECURE_SERVICES := true

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 androidboot.selinux=disabled earlyprintk
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET     := 0x01000000
TARGET_KERNEL_SOURCE := kernel/ark
TARGET_KERNEL_CONFIG := cyanogenmod_ark-64_defconfig

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Camera
BOARD_CAMERA_SENSORS := ov2680_5987fhq ov2680_cht852b ov8865_cm9462 ov8865_q8v18a
TARGET_USE_VENDOR_CAMERA_EXT := true
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_USES_AOSP := true

# Disable Jack & Jill compilation
ANDROID_COMPILE_WITH_JACK := false

# Disable ashmem size tracking
COMMON_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING

# Flags
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# GPS
USE_DEVICE_SPECIFIC_GPS := true
TARGET_NO_RPC := true

# Radio
TARGET_RIL_VARIANT := caf

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 335544320
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5939100672

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# WiFi - EAP-SIM
CONFIG_EAP_PROXY := qmi
CONFIG_EAP_PROXY_DUAL_SIM := true

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
TARGET_USES_QCOM_WCNSS_QMI := true
TARGET_USES_WCNSS_CTRL := true
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"
WPA_SUPPLICANT_VERSION := VER_0_8_X

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/dexp/mlte5/sepolicy

TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Rom Toolchain
TARGET_GCC_VERSION_EXP := 4.9

# inherit from the proprietary version
-include vendor/dexp/mlte5/BoardConfigVendor.mk
