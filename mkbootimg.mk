LOCAL_PATH := $(call my-dir)
DEVICE_PATH := device/dexp/mlte5

DTBTOOL := $(DEVICE_PATH)/mkbootimg_dtb
KERNEL := $(DEVICE_PATH)/kernel
DTB := $(DEVICE_PATH)/dt.img

INSTALLED_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.img
INSTALLED_RECOVERYIMAGE_TARGET := $(PRODUCT_OUT)/recovery.img

## Overload bootimg generation: Same as the original, + --dt arg
$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES)
	@echo ----- Made boot image -------- $@
	$(hide) $(DTBTOOL) --kernel $(KERNEL) --ramdisk $(PRODUCT_OUT)/ramdisk.img --cmdline "$(BOARD_KERNEL_CMDLINE)" --base $(BOARD_KERNEL_BASE) --offset 0x01000000 --dt $(DTB) --pagesize 2048 --tags-addr 0x00000100 -o $(INSTALLED_BOOTIMAGE_TARGET)
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
	@echo ----- Added DTB ------------------ $@

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
	$(recovery_ramdisk) \
	$(recovery_kernel)
	@echo ----- Made recovery image -------- $@
	$(hide) $(DTBTOOL) --kernel $(KERNEL) --ramdisk $(PRODUCT_OUT)/ramdisk-recovery.img --cmdline "ramoops_memreserve=2M androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 earlyprintk" --base 0x80000000 --offset 0x01000000 --dt $(DTB) --pagesize 2048 --tags-addr 0x00000100 -o $(PRODUCT_OUT)/recovery.img
	@echo ----- Added DTB ------------------ $@ 

