# Inherit common mobile Wings stuff
$(call inherit-product, vendor/wings/config/common.mk)

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

ifneq ($(WITH_WINGS_CHARGER),false)
PRODUCT_PACKAGES += \
    wings_charger_animation \
    wings_charger_animation_vendor
endif

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet
