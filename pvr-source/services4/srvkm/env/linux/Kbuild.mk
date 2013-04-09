########################################################################### ###
#@Copyright     Copyright (c) Imagination Technologies Ltd. All Rights Reserved
#@License       Dual MIT/GPLv2
# 
# The contents of this file are subject to the MIT license as set out below.
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# Alternatively, the contents of this file may be used under the terms of
# the GNU General Public License Version 2 ("GPL") in which case the provisions
# of GPL are applicable instead of those above.
# 
# If you wish to allow use of your version of this file only under the terms of
# GPL, and not to allow others to use your version of this file under the terms
# of the MIT license, indicate your decision by deleting the provisions above
# and replace them with the notice and other provisions required by GPL as set
# out in the file called "GPL-COPYING" included in this distribution. If you do
# not delete the provisions above, a recipient may use your version of this file
# under the terms of either the MIT license or GPL.
# 
# This License is also included in this distribution in the file called
# "MIT-COPYING".
# 
# EXCEPT AS OTHERWISE STATED IN A NEGOTIATED AGREEMENT: (A) THE SOFTWARE IS
# PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
# BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
# PURPOSE AND NONINFRINGEMENT; AND (B) IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
### ###########################################################################

pvrsrvkm_sgx$(SGXCORE)_$(SGX_CORE_REV)-y += \
	services4/srvkm/env/linux/osfunc.o \
	services4/srvkm/env/linux/mutils.o \
	services4/srvkm/env/linux/mmap.o \
	services4/srvkm/env/linux/module.o \
	services4/srvkm/env/linux/pdump.o \
	services4/srvkm/env/linux/proc.o \
	services4/srvkm/env/linux/pvr_bridge_k.o \
	services4/srvkm/env/linux/pvr_debug.o \
	services4/srvkm/env/linux/mm.o \
	services4/srvkm/env/linux/mutex.o \
	services4/srvkm/env/linux/event.o \
	services4/srvkm/env/linux/osperproc.o \
	services4/srvkm/env/linux/sysfs.o \
	services4/srvkm/common/buffer_manager.o \
	services4/srvkm/common/devicemem.o \
	services4/srvkm/common/deviceclass.o \
	services4/srvkm/common/handle.o \
	services4/srvkm/common/hash.o \
	services4/srvkm/common/lists.o \
	services4/srvkm/common/mem.o \
	services4/srvkm/common/mem_debug.o \
	services4/srvkm/common/metrics.o \
	services4/srvkm/common/osfunc_common.o \
	services4/srvkm/common/pdump_common.o \
	services4/srvkm/common/perproc.o \
	services4/srvkm/common/power.o \
	services4/srvkm/common/pvrsrv.o \
	services4/srvkm/common/queue.o \
	services4/srvkm/common/ra.o \
	services4/srvkm/common/refcount.o \
	services4/srvkm/common/resman.o \
	services4/srvkm/bridged/bridged_support.o \
	services4/srvkm/bridged/bridged_pvr_bridge.o \
	services4/system/$(PVR_SYSTEM)/sysconfig.o \
	services4/system/$(PVR_SYSTEM)/sysutils.o

pvrsrvkm_sgx$(SGXCORE)_$(SGX_CORE_REV)-$(CONFIG_ION_OMAP) += \
	services4/srvkm/env/linux/ion.o
pvrsrvkm_sgx$(SGXCORE)_$(SGX_CORE_REV)-$(CONFIG_GCBV) += \
	services4/srvkm/env/linux/gc_bvmapping.o

ifeq ($(SUPPORT_ION),1)
pvrsrvkm-y += \
	services4/srvkm/env/linux/ion.o
endif

ifeq ($(TTRACE),1)
pvrsrvkm-y += \
	services4/srvkm/common/ttrace.o
endif

ifneq ($(W),1)
CFLAGS_osfunc.o := 
CFLAGS_mutils.o := 
CFLAGS_mmap.o := 
CFLAGS_module.o := 
CFLAGS_pdump.o := 
CFLAGS_proc.o := 
CFLAGS_pvr_bridge_k.o := 
CFLAGS_pvr_debug.o := 
CFLAGS_mm.o := 
CFLAGS_mutex.o := 
CFLAGS_event.o := 
CFLAGS_osperproc.o := 
CFLAGS_buffer_manager.o := 
CFLAGS_devicemem.o := 
CFLAGS_deviceclass.o := 
CFLAGS_handle.o := 
CFLAGS_hash.o := 
CFLAGS_metrics.o := 
CFLAGS_pvrsrv.o := 
CFLAGS_queue.o := 
CFLAGS_ra.o := 
CFLAGS_resman.o := 
CFLAGS_power.o := 
CFLAGS_mem.o := 
CFLAGS_pdump_common.o := 
CFLAGS_bridged_support.o := 
CFLAGS_bridged_pvr_bridge.o := 
CFLAGS_perproc.o := 
CFLAGS_lists.o := 
CFLAGS_mem_debug.o := 
CFLAGS_osfunc_common.o := 
CFLAGS_refcount.o := 
endif

# SUPPORT_SGX==1 only

pvrsrvkm_sgx$(SGXCORE)_$(SGX_CORE_REV)-y += \
	services4/srvkm/bridged/sgx/bridged_sgx_bridge.o \
	services4/srvkm/devices/sgx/sgxinit.o \
	services4/srvkm/devices/sgx/sgxpower.o \
	services4/srvkm/devices/sgx/sgxreset.o \
	services4/srvkm/devices/sgx/sgxutils.o \
	services4/srvkm/devices/sgx/sgxkick.o \
	services4/srvkm/devices/sgx/sgxtransfer.o \
	services4/srvkm/devices/sgx/mmu.o \
	services4/srvkm/devices/sgx/pb.o

ifneq ($(W),1)
CFLAGS_bridged_sgx_bridge.o := 
CFLAGS_sgxinit.o := 
CFLAGS_sgxpower.o := 
CFLAGS_sgxreset.o := 
CFLAGS_sgxutils.o := 
CFLAGS_sgxkick.o := 
CFLAGS_sgxtransfer.o := 
CFLAGS_mmu.o := 
CFLAGS_pb.o := 
endif

ifeq ($(SUPPORT_DRI_DRM),1)

pvrsrvkm_sgx$(SGXCORE)_$(SGX_CORE_REV)-y += \
 services4/srvkm/env/linux/pvr_drm.o

ccflags-y += \
 -I$(KERNELDIR)/include/drm \
 -I$(TOP)/services4/include/env/linux \

ifeq ($(PVR_DRI_DRM_NOT_PCI),1)
ccflags-y += -I$(TOP)/services4/3rdparty/linux_drm
endif

endif # SUPPORT_DRI_DRM
