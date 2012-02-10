#Dodane języki
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# European SUPL Server
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_PACKAGES += copybit.swift

# Extra DS overlay
DEVICE_PACKAGE_OVERLAYS += device/lge/gt540/overlay

# HAL libs and other system binaries
PRODUCT_PACKAGES += \
    VoiceDialer \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    Launcher2 \
    Provision \
    GoogleSearch \
    LatinIME \
    Stk \
    copybit.swift \
    hcitool \
    libmm-omxcore \
    librs_jni \
    libOmxCore \
    libstagefrighthw \
    libopencorehw \
    bdaddr_read \
    sensors.swift \
    gps.swift \
    lights.swift \
    gralloc.swift \
    libril.swift \
    liblgdrm


# Live wallpaper packages
PRODUCT_PACKAGES += \
	LiveWallpapers \
	LiveWallpapersPicker \
	librs_jni \

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
PRODUCT_COPY_FILES += $(LOCAL_PATH)/files/init.swift.rc:root/init.swift.rc
PRODUCT_COPY_FILES += $(LOCAL_PATH)/files/init.local.rc:system/etc/init.local.rc
PRODUCT_COPY_FILES += $(LOCAL_PATH)/files/ueventd.swift.rc:root/ueventd.swift.rc
PRODUCT_COPY_FILES += $(LOCAL_PATH)/files/initlogo.rle:root/initlogo.rle


# OpenGL
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/proprietary/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
	$(LOCAL_PATH)/proprietary/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
	$(LOCAL_PATH)/proprietary/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
	$(LOCAL_PATH)/proprietary/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
	$(LOCAL_PATH)/proprietary/lib/libgsl.so:system/lib/libgsl.so \
	$(LOCAL_PATH)/prebuilt/3d/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
	$(LOCAL_PATH)/prebuilt/3d/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw 


# Keylayouts
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/keylayout/msm_touchscreen.kcm.bin:system/usr/keychars/msm_touchscreen.kcm.bin \
	$(LOCAL_PATH)/prebuilt/keylayout/msm_touchscreen.kl:system/usr/keylayout/msm_touchscreen.kl \
	$(LOCAL_PATH)/prebuilt/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
	$(LOCAL_PATH)/prebuilt/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \

# LGE services
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/proprietary/lgeservices/akmd2:system/bin/akmd2 \
	$(LOCAL_PATH)/proprietary/lgeservices/qmuxd:system/bin/qmuxd 

# RIL
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/proprietary/lib/ril/libauth.so:system/lib/libauth.so \
	$(LOCAL_PATH)/proprietary/lib/ril/libbcmwl.so:system/lib/libbcmwl.so \
	$(LOCAL_PATH)/proprietary/lib/ril/libcm.so:system/lib/libcm.so \
	$(LOCAL_PATH)/proprietary/lib/ril/libdiag.so:system/lib/libdiag.so \
	$(LOCAL_PATH)/proprietary/lib/ril/libdll.so:system/lib/libdll.so \
	$(LOCAL_PATH)/proprietary/lib/ril/libdsm.so:system/lib/libdsm.so \
	$(LOCAL_PATH)/proprietary/lib/ril/libdss.so:system/lib/libdss.so \
	$(LOCAL_PATH)/proprietary/lib/ril/libgsdi_exp.so:system/lib/libgsdi_exp.so \
	$(LOCAL_PATH)/proprietary/lib/ril/libgstk_exp.so:system/lib/libgstk_exp.so \
	$(LOCAL_PATH)/proprietary/lib/ril/liblgeat.so:system/lib/liblgeat.so \
	$(LOCAL_PATH)/proprietary/lib/ril/liblgerft.so:system/lib/liblgerft.so \
	$(LOCAL_PATH)/proprietary/lib/ril/libmmgsdilib.so:system/lib/libmmgsdilib.so \
	$(LOCAL_PATH)/proprietary/lib/ril/libnv.so:system/lib/libnv.so \
	$(LOCAL_PATH)/proprietary/lib/ril/liboem_rapi.so:system/lib/liboem_rapi.so \
	$(LOCAL_PATH)/proprietary/lib/ril/liboncrpc.so:system/lib/liboncrpc.so \
	$(LOCAL_PATH)/proprietary/lib/ril/libpbmlib.so:system/lib/libpbmlib.so \
	$(LOCAL_PATH)/proprietary/lib/ril/libqmi.so:system/lib/libqmi.so \
	$(LOCAL_PATH)/proprietary/lib/ril/libqueue.so:system/lib/libqueue.so \
	$(LOCAL_PATH)/proprietary/lib/ril/libril_log.so:system/lib/libril_log.so \
	$(LOCAL_PATH)/proprietary/lib/ril/libril-qc-1.so:system/lib/libril-qc-1.so \
	$(LOCAL_PATH)/proprietary/lib/ril/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
	$(LOCAL_PATH)/proprietary/lib/ril/libwms.so:system/lib/libwms.so \
	$(LOCAL_PATH)/proprietary/lib/ril/libwmsts.so:system/lib/libwmsts.so \
	$(LOCAL_PATH)/prebuilt/rild/spn-conf.xml:system/etc/spn-conf.xml \
	$(LOCAL_PATH)/prebuilt/rild/rild:system/bin/rild \

# Camera proprietaries
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/proprietary/lib/camera/liboemcamera.so:system/lib/liboemcamera.so \
	$(LOCAL_PATH)/proprietary/lib/camera/libmmjpeg.so:system/lib/libmmjpeg.so \
	$(LOCAL_PATH)/proprietary/lib/camera/libmmipl.so:system/lib/libmmipl.so 

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/files/apns-conf.xml:system/etc/apns-conf.xml 

# Audio 
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/files/media_profiles.xml:system/etc/media_profiles.xml \
	$(LOCAL_PATH)/files/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
	$(LOCAL_PATH)/files/AudioFilter.csv:system/etc/AudioFilter.csv \
	$(LOCAL_PATH)/proprietary/lib/libaudioeq.so:system/lib/libaudioeq.so \
	$(LOCAL_PATH)/proprietary/lib/libaudioalsa.so:system/lib/libaudioalsa.so 


# Bluetooth
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/proprietary/bluetooth/BCM4325D1_004.002.004.0262.0270.hcd:system/bin/BCM4325D1_004.002.004.0262.0270.hcd \
	$(LOCAL_PATH)/proprietary/bluetooth/btld:system/bin/btld
# Это уже и так создается само, и с нужными параметрами
#	$(LOCAL_PATH)/proprietary/bluetooth/bluetooth/audio.conf:system/etc/bluetooth/audio.conf \
#	$(LOCAL_PATH)/proprietary/bluetooth/bluetooth/auto_pairing.conf:system/etc/bluetooth/auto_pairing.conf \
#	$(LOCAL_PATH)/proprietary/bluetooth/bluetooth/blacklist.conf:system/etc/bluetooth/blacklist.conf \
#	$(LOCAL_PATH)/proprietary/bluetooth/bluetooth/input.conf:system/etc/bluetooth/input.conf \
#	$(LOCAL_PATH)/proprietary/bluetooth/bluetooth/main.conf:system/etc/bluetooth/main.conf


# Wifi
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/etc/wl/rtecdc.bin:system/etc/wl/rtecdc.bin \
	$(LOCAL_PATH)/prebuilt/etc/wl/rtecdc-apsta.bin:system/etc/wl/rtecdc-apsta.bin \
	$(LOCAL_PATH)/prebuilt/etc/wl/nvram.txt:system/etc/wl/nvram.txt \
	$(LOCAL_PATH)/prebuilt/etc/wl/rtecdc-mfgtest.bin:system/etc/wl/rtecdc-mfgtest.bin \
	$(LOCAL_PATH)/files/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
	$(LOCAL_PATH)/prebuilt/kernel/modules/wireless.ko:system/lib/modules/wireless.ko \
	$(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
	$(LOCAL_PATH)/prebuilt/kernel/modules/librasdioif.ko:system/lib/modules/librasdioif.ko \
	$(LOCAL_PATH)/proprietary/wifi/wpa_supplicant:system/bin/wpa_supplicant \
	$(LOCAL_PATH)/proprietary/wifi/wl:system/bin/wl

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
    $(LOCAL_PATH)/proprietary/lib/omx/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    $(LOCAL_PATH)/proprietary/lib/omx/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    $(LOCAL_PATH)/proprietary/lib/omx/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
    $(LOCAL_PATH)/proprietary/lib/omx/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    $(LOCAL_PATH)/proprietary/lib/omx/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so \
    $(LOCAL_PATH)/proprietary/lib/omx/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
    $(LOCAL_PATH)/proprietary/lib/omx/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \
    $(LOCAL_PATH)/proprietary/lib/omx/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
    $(LOCAL_PATH)/proprietary/lib/omx/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    $(LOCAL_PATH)/proprietary/lib/omx/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
    $(LOCAL_PATH)/proprietary/lib/omx/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
    $(LOCAL_PATH)/proprietary/lib/omx/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    $(LOCAL_PATH)/proprietary/lib/omx/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    $(LOCAL_PATH)/proprietary/lib/omx/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
    $(LOCAL_PATH)/proprietary/lib/omx/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
    $(LOCAL_PATH)/proprietary/lib/omx/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
    $(LOCAL_PATH)/proprietary/lib/omx/libOmxWmvDec.so:system/lib/libOmxWmvDec.so

# SD Card
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/vold.fstab:/system/etc/vold.fstab

# chargermode
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_ani_01.rle:root/chargerimages/battery_ani_01.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_ani_02.rle:root/chargerimages/battery_ani_02.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_ani_03.rle:root/chargerimages/battery_ani_03.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_ani_04.rle:root/chargerimages/battery_ani_04.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_ani_05.rle:root/chargerimages/battery_ani_05.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_bg.rle:root/chargerimages/battery_bg.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_01.rle:root/chargerimages/battery_charging_01.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_02.rle:root/chargerimages/battery_charging_02.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_03.rle:root/chargerimages/battery_charging_03.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_04.rle:root/chargerimages/battery_charging_04.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_05.rle:root/chargerimages/battery_charging_05.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_06.rle:root/chargerimages/battery_charging_06.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_wait_ani_01.rle:root/chargerimages/battery_wait_ani_01.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_wait_ani_02.rle:root/chargerimages/battery_wait_ani_02.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/black_bg.rle:root/chargerimages/black_bg.rle \
    $(LOCAL_PATH)/chargemode/chargerlogo:root/sbin/chargerlogo


PRODUCT_MANUFACTURER := LGE
PRODUCT_BRAND := LGE
PRODUCT_NAME := gt540
PRODUCT_DEVICE := gt540
PRODUCT_MODEL := LG Optimus GT540


