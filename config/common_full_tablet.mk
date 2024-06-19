$(call inherit-product, $(SRC_TARGET_DIR)/product/window_extensions.mk)

# Inherit full common Wings stuff
$(call inherit-product, vendor/wings/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Wings LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/wings/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/wings/overlay/dictionaries

# Settings
PRODUCT_PRODUCT_PROPERTIES += \
    persist.settings.large_screen_opt.enabled=true

$(call inherit-product, vendor/wings/config/telephony.mk)
