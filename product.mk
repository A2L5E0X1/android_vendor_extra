#
# Copyright (C) 2021-2022 A2L5E0X1
#

#
# This repository includes private stuff like dev-keys used to sign the builds.
# Do not share content of this repository without permissions!
#

PRIV_VENDOR_PATH := vendor/extra

#
# Sign keys
#

## MOVED TO VENDOR_A2L5

#ifneq ($(SIGN_WITH_TEST_KEYS),true)
#    $(warning Using a2l5 priv-keys for signing.)
#    PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/a2l5/keys/releasekey
#endif

-include vendor/a2l5/priv-keys.mk

#
# OTA
#

ifneq ($(filter sample,$(TARGET_DEVICE)),)
    $(warning Device has OTA support!)
    DEVICE_PACKAGE_OVERLAYS += $(PRIV_VENDOR_PATH)/ota
endif

#
# Disable Jack when building Oreo
#

ifeq ($(PLATFORM_VERSION),8.1.0)
    $(warning Oreo detected! Jack will be disabled...)
    ANDROID_COMPILE_WITH_JACK := false
endif
