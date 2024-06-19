# Copyright (C) 2016-2017 AOSiP
# Copyright (C) 2020 Fluid
# Copyright (C) 2024 WingsOS
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

# Versioning System
WINGS_CODENAME := NAMCHE
WINGS_NUM_VER := 1.0

TARGET_PRODUCT_SHORT := $(subst wings_,,$(WINGS_BUILD_TYPE))

WINGS_BUILD_TYPE ?= UNOFFICIAL

# Only include Updater for official  build
ifeq ($(filter-out OFFICIAL,$(WINGS_BUILD_TYPE)),)
    PRODUCT_PACKAGES += \
        Updater

PRODUCT_COPY_FILES += \
    vendor/wings/prebuilt/common/etc/init/init.wings-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.wings-updater.rc
endif

# Sign builds if building an official build
ifeq ($(filter-out OFFICIAL,$(WINGS_BUILD_TYPE)),)
    PRODUCT_DEFAULT_DEV_CERTIFICATE := $(KEYS_LOCATION)
endif

# Set all versions
BUILD_DATE := $(shell date -u +%Y%m%d)
BUILD_TIME := $(shell date -u +%H%M)
WINGS_BUILD_VERSION := $(WINGS_NUM_VER)-$(WINGS_CODENAME)
WINGS_VERSION := $(WINGS_BUILD_VERSION)-$(WINGS_BUILD)-$(WINGS_BUILD_TYPE)-$(BUILD_TIME)-$(BUILD_DATE)
ROM_FINGERPRINT := wings/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(BUILD_TIME)
WINGS_DISPLAY_VERSION := $(WINGS_VERSION)
RELEASE_TYPE := $(WINGS_BUILD_TYPE)

# WINGSOS System Version
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.wings.base.codename=$(WINGS_CODENAME) \
    ro.wings.base.version=$(WINGS_NUM_VER) \
    ro.wings.build.version=$(WINGS_BUILD_VERSION) \
    ro.wings.build.date=$(BUILD_DATE) \
    ro.wings.buildtype=$(WINGS_BUILD_TYPE) \
    ro.wings.display.version=$(WINGS_DISPLAY_VERSION) \
    ro.wings.fingerprint=$(ROM_FINGERPRINT) \
    ro.wings.version=$(WINGS_VERSION) \
    ro.modversion=$(WINGS_VERSION)
