# Inherit device configuration for p500.
$(call inherit-product, device/lge/gt540/gt540.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

PRODUCT_NAME := cyanogen_gt540
PRODUCT_BRAND := lge
PRODUCT_DEVICE := gt540
PRODUCT_MODEL := LG-GT540
PRODUCT_MANUFACTURER := LGE

# Release name and versioning
PRODUCT_RELEASE_NAME := LG Optimus GT540
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/cyanogen/products/common_versions.mk

#Bootanimacja CM
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip
