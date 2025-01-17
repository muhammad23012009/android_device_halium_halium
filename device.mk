#
# Copyright (C) 2020 The LineageOS Project
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
#

# Charger
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/charger/images/battery_fail.png:$(TARGET_COPY_OUT_PRODUCT)/etc/res/images/charger/battery_fail.png \
    $(LOCAL_PATH)/charger/images/battery_scale.png:$(TARGET_COPY_OUT_PRODUCT)/etc/res/images/charger/battery_scale.png \
    $(LOCAL_PATH)/charger/images/main_font.png:$(TARGET_COPY_OUT_PRODUCT)/etc/res/images/charger/main_font.png \
    $(LOCAL_PATH)/charger/values/animation.txt:$(TARGET_COPY_OUT_PRODUCT)/etc/res/values/charger/animation.txt

# Enable dynamic partition size
PRODUCT_USE_DYNAMIC_PARTITION_SIZE := true

# init scripts
PRODUCT_PACKAGES += \
    init.disabled.rc \
    init.halium.rc \
    vndk-detect \
    on-post-data.sh

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

# SPL fix
PRODUCT_PACKAGES += \
    getSPL

# Test tools
PRODUCT_PACKAGES += \
    bootctl \
    vintf

# Soong
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/etc/rqbalance_config.xml:system/etc/rqbalance_config.xml

# Ubuntu Touch additional properties
PRODUCT_PROPERTY_OVERRIDES += \
    ubuntu.widi.supported=1

PRODUCT_PACKAGES += \
    powerswitch

# Enable libpowerswitch (RQBalance controller)
PRODUCT_PROPERTY_OVERRIDES += \
ifeq ($(PRODUCT_DEVICE),halium_arm)
    ubuntu.booster.dl=/system/lib/libpowerswitch.so
endif
ifeq ($(PRODUCT_DEVICE),halium_arm64)
    ubunto.booster.dl=/system/lib64/libpowerswitch.so
endif
    ubuntu.booster.enable=set_screen_on \
    ubuntu.booster.disable=set_screen_off
