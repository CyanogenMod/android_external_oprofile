# Copyright (C) 2008 The Android Open Source Project
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

LOCAL_PATH:= $(call my-dir)
include $(LOCAL_PATH)/../common.mk

common_src := \
	db_debug.c \
	db_insert.c \
	db_manage.c \
	db_stat.c \
	db_travel.c

# Build libdb on target
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= $(common_src)
LOCAL_C_INCLUDES := $(common_target_c_includes)
LOCAL_CFLAGS := $(common_target_cflags)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libdb

include $(BUILD_STATIC_LIBRARY)

# Build libdb on host
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= $(common_src)
LOCAL_C_INCLUDES := $(common_host_c_includes)
LOCAL_CFLAGS := $(common_host_cflags)
LOCAL_LDFLAGS := $(common_host_ldflags)

LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libdb

include $(BUILD_HOST_STATIC_LIBRARY)
