#Dodane języki
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_PACKAGES += copybit.swift

# Extra DS overlay
DEVICE_PACKAGE_OVERLAYS += device/lg/swift/overlay

# HAL libs and other system binaries
PRODUCT_PACKAGES += \
	brcm_patchram_plus \
	libmm-omxcore \
	libOmxCore \
	bdaddr_read \
	gadget_id \
	sensors.swift \
	gps.swift \
#	lights.swift 


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/lge/gt540/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

#PRODUCT_SKIP_THEMES := true
#PRODUCT_SKIP_WALLPAPERS := true

# Board-specific init
PRODUCT_COPY_FILES += device/lge/gt540/files/init.swift.rc:root/init.swift.rc
PRODUCT_COPY_FILES += device/lge/gt540/files/init.local.rc:system/etc/init.local.rc
PRODUCT_COPY_FILES += device/lge/gt540/files/ueventd.swift.rc:root/ueventd.swift.rc
PRODUCT_COPY_FILES += device/lge/gt540/files/initlogo.rle:root/initlogo.rle


# OpenGL
PRODUCT_COPY_FILES += \
	device/lge/gt540/proprietary/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
	device/lge/gt540/proprietary/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
	device/lge/gt540/proprietary/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
	device/lge/gt540/proprietary/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
	device/lge/gt540/proprietary/lib/libgsl.so:system/lib/libgsl.so \
	device/lge/gt540/prebuilt/3d/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
	device/lge/gt540/prebuilt/3d/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw 

# 2D
PRODUCT_COPY_FILES += \
	device/lge/gt540/proprietary/lib/gralloc.swift.so:system/lib/hw/gralloc.swift.so \
	device/lge/gt540/proprietary/lib/gralloc.default.so:system/lib/hw/gralloc.default.so
#	device/lge/gt540/proprietary/lib/copybit.swift.so:system/lib/hw/copybit.swift.so \

# Keylayouts
PRODUCT_COPY_FILES += \
	device/lge/gt540/prebuilt/keylayout/msm_touchscreen.kcm.bin:system/usr/keychars/msm_touchscreen.kcm.bin \
	device/lge/gt540/prebuilt/keylayout/msm_touchscreen.kl:system/usr/keylayout/msm_touchscreen.kl \
	device/lge/gt540/prebuilt/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
	device/lge/gt540/prebuilt/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \

# LGE services
PRODUCT_COPY_FILES += \
	device/lge/gt540/proprietary/lge services/akmd2:system/bin/akmd2 \
	device/lge/gt540/proprietary/lge services/qmuxd:system/bin/qmuxd 

# RIL
PRODUCT_COPY_FILES += \
	device/lge/gt540/proprietary/lib/ril/libauth.so:system/lib/libauth.so \
	device/lge/gt540/proprietary/lib/ril/libbcmwl.so:system/lib/libbcmwl.so \
	device/lge/gt540/proprietary/lib/ril/libcm.so:system/lib/libcm.so \
	device/lge/gt540/proprietary/lib/ril/libdiag.so:system/lib/libdiag.so \
	device/lge/gt540/proprietary/lib/ril/libdll.so:system/lib/libdll.so \
	device/lge/gt540/proprietary/lib/ril/libdsm.so:system/lib/libdsm.so \
	device/lge/gt540/proprietary/lib/ril/libdss.so:system/lib/libdss.so \
	device/lge/gt540/proprietary/lib/ril/libgsdi_exp.so:system/lib/libgsdi_exp.so \
	device/lge/gt540/proprietary/lib/ril/libgstk_exp.so:system/lib/libgstk_exp.so \
	device/lge/gt540/proprietary/lib/ril/liblgdrm.so:system/lib/liblgdrm.so \
	device/lge/gt540/proprietary/lib/ril/liblgdrmwbxml.so:system/lib/liblgdrmwbxml.so \
	device/lge/gt540/proprietary/lib/ril/liblgeat.so:system/lib/liblgeat.so \
	device/lge/gt540/proprietary/lib/ril/liblgerft.so:system/lib/liblgerft.so \
	device/lge/gt540/proprietary/lib/ril/libmmgsdilib.so:system/lib/libmmgsdilib.so \
	device/lge/gt540/proprietary/lib/ril/libnv.so:system/lib/libnv.so \
	device/lge/gt540/proprietary/lib/ril/liboem_rapi.so:system/lib/liboem_rapi.so \
	device/lge/gt540/proprietary/lib/ril/liboncrpc.so:system/lib/liboncrpc.so \
	device/lge/gt540/proprietary/lib/ril/libpbmlib.so:system/lib/libpbmlib.so \
	device/lge/gt540/proprietary/lib/ril/libqmi.so:system/lib/libqmi.so \
	device/lge/gt540/proprietary/lib/ril/libqueue.so:system/lib/libqueue.so \
	device/lge/gt540/proprietary/lib/ril/libril_log.so:system/lib/libril_log.so \
	device/lge/gt540/proprietary/lib/ril/libril-qc-1.so:system/lib/libril-qc-1.so \
	device/lge/gt540/proprietary/lib/ril/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
	device/lge/gt540/proprietary/lib/ril/libwms.so:system/lib/libwms.so \
	device/lge/gt540/proprietary/lib/ril/libwmsts.so:system/lib/libwmsts.so \
	device/lge/gt540/prebuilt/rild/spn-conf.xml:system/etc/spn-conf.xml \
	device/lge/gt540/prebuilt/rild/rild:system/bin/rild \
	device/lge/gt540/proprietary/lib/ril/libril.so:system/lib/libril.so

# Camera proprietaries
PRODUCT_COPY_FILES += \
	device/lge/gt540/proprietary/lib/camera/liboemcamera.so:system/lib/liboemcamera.so \
	device/lge/gt540/proprietary/lib/camera/libmmjpeg.so:system/lib/libmmjpeg.so \
	device/lge/gt540/proprietary/lib/camera/libmmipl.so:system/lib/libmmipl.so 

PRODUCT_COPY_FILES += \
	device/lge/gt540/files/apns-conf.xml:system/etc/apns-conf.xml 

# Audio 
PRODUCT_COPY_FILES += \
	device/lge/gt540/files/media_profiles.xml:system/etc/media_profiles.xml \
	device/lge/gt540/files/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
	device/lge/gt540/files/AudioFilter.csv:system/etc/AudioFilter.csv \
	device/lge/gt540/proprietary/lib/libaudioeq.so:system/lib/libaudioeq.so \
	device/lge/gt540/proprietary/lib/libaudioalsa.so:system/lib/libaudioalsa.so 


# Bluetooth
PRODUCT_COPY_FILES += \
	device/lge/gt540/proprietary/bluetooth/BCM4325D1_004.002.004.0262.0270.hcd:system/bin/BCM4325D1_004.002.004.0262.0270.hcd \
	device/lge/gt540/proprietary/bluetooth/btld:system/bin/btld
# Это уже и так создается само, и с нужными параметрами
#	device/lge/gt540/proprietary/bluetooth/bluetooth/audio.conf:system/etc/bluetooth/audio.conf \
#	device/lge/gt540/proprietary/bluetooth/bluetooth/auto_pairing.conf:system/etc/bluetooth/auto_pairing.conf \
#	device/lge/gt540/proprietary/bluetooth/bluetooth/blacklist.conf:system/etc/bluetooth/blacklist.conf \
#	device/lge/gt540/proprietary/bluetooth/bluetooth/input.conf:system/etc/bluetooth/input.conf \
#	device/lge/gt540/proprietary/bluetooth/bluetooth/main.conf:system/etc/bluetooth/main.conf

# Wifi
PRODUCT_COPY_FILES += \
	device/lge/gt540/prebuilt/etc/wl/rtecdc.bin:system/etc/wl/rtecdc.bin \
	device/lge/gt540/prebuilt/etc/wl/rtecdc-apsta.bin:system/etc/wl/rtecdc-apsta.bin \
	device/lge/gt540/prebuilt/etc/wl/nvram.txt:system/etc/wl/nvram.txt \
	device/lge/gt540/prebuilt/etc/wl/rtecdc-mfgtest.bin:system/etc/wl/rtecdc-mfgtest.bin \
	device/lge/gt540/files/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
	device/lge/gt540/prebuilt/kernel/modules/wireless.ko:system/lib/modules/wireless.ko \
	device/lge/gt540/files/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
	device/lge/gt540/prebuilt/kernel/modules/librasdioif.ko:system/lib/modules/librasdioif.ko

# HW
PRODUCT_COPY_FILES += \
	device/lge/gt540/proprietary/lib/lights.swift.so:system/lib/hw/lights.swift.so \
#	device/lge/gt540/proprietary/lib/sensors.swift.so:system/lib/hw/sensors.swift.so

# Hardware properties 
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml
#	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml


# OMX proprietaries
PRODUCT_COPY_FILES += \
    device/lge/gt540/proprietary/lib/omx/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    device/lge/gt540/proprietary/lib/omx/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    device/lge/gt540/proprietary/lib/omx/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
    device/lge/gt540/proprietary/lib/omx/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    device/lge/gt540/proprietary/lib/omx/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so \
    device/lge/gt540/proprietary/lib/omx/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
    device/lge/gt540/proprietary/lib/omx/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \
    device/lge/gt540/proprietary/lib/omx/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
    device/lge/gt540/proprietary/lib/omx/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    device/lge/gt540/proprietary/lib/omx/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
    device/lge/gt540/proprietary/lib/omx/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
    device/lge/gt540/proprietary/lib/omx/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    device/lge/gt540/proprietary/lib/omx/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    device/lge/gt540/proprietary/lib/omx/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
    device/lge/gt540/proprietary/lib/omx/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
    device/lge/gt540/proprietary/lib/omx/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
    device/lge/gt540/proprietary/lib/omx/libOmxWmvDec.so:system/lib/libOmxWmvDec.so

# SD Card
PRODUCT_COPY_FILES += \
    device/lge/gt540/configs/vold.fstab:/system/etc/vold.fstab


SWIFT_WITH_GOOGLE := true

PRODUCT_MANUFACTURER := LGE
PRODUCT_BRAND := LGE
PRODUCT_NAME := gt540
PRODUCT_DEVICE := gt540
PRODUCT_MODEL := LG Optimus GT540
