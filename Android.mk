LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

MY_C_LIST := $(wildcard $(LOCAL_PATH)/libsupp/*.c)
MY_C_LIST += $(wildcard $(LOCAL_PATH)/traceroute/*.c)

LOCAL_MODULE    := traceroute

LOCAL_SRC_FILES := $(MY_C_LIST:$(LOCAL_PATH)/%=%)

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
	LOCAL_CFLAGS += -D__ARMV7__
	LOCAL_ARM_MODE := arm
else
	LOCAL_ARM_MODE := arm
endif


LOCAL_CFLAGS += -DHAVE_FCNTL_H \
                -DHAVE_SYS_TIME_H \
                -DHAVE_STRUCT_TIMEVAL \
                -DHAVE_SYS_SELECT_H \
                -DHAVE_PTHREAD \
                -DHAVE_SEMAPHORE_H \
                -DENABLE_TRACE \
                -DOSIP_MT

#兼容5.0+
LOCAL_CFLAGS += -fPIE
LOCAL_LDFLAGS += -fPIE -pie

include $(BUILD_EXECUTABLE)

