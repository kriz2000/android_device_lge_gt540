/*
 * Copyright (C) 2011 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "SwiftCameraWrapper"

#include <cmath>
#include <dlfcn.h>
#include <fcntl.h>
#include <linux/videodev2.h>
#include <sys/ioctl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <camera/Camera.h>
#include "SwiftCameraWrapper.h"

namespace android {

typedef sp<CameraHardwareInterface> (*OpenCamFunc)(int);

static void * g_swiftLibHandle = NULL;
static OpenCamFunc g_swiftOpenCameraHardware = NULL;

static void ensureSwiftLibOpened()
{
    if (g_swiftLibHandle == NULL) {
        g_swiftLibHandle = ::dlopen("libswiftcamera.so", RTLD_NOW);
        if (g_swiftLibHandle == NULL) {
            assert(0);
            LOGE("dlopen() error: %s\n", dlerror());
        } else {
            g_swiftOpenCameraHardware = (OpenCamFunc) ::dlsym(g_swiftLibHandle, "openCameraHardware");
            assert(g_swiftOpenCameraHardware != NULL);
        }
    }
}

extern "C" int HAL_getNumberOfCameras()
{
    return 1;
}

extern "C" void HAL_getCameraInfo(int cameraId, struct CameraInfo* cameraInfo)
{
    cameraInfo->facing = CAMERA_FACING_BACK;
    cameraInfo->orientation = 90;
}

extern "C" sp<CameraHardwareInterface> HAL_openCameraHardware(int cameraId)
{
    LOGV("openCameraHardware: call createInstance");
    ensureSwiftLibOpened();
    return SwiftCameraWrapper::createInstance(cameraId);
}

wp<CameraHardwareInterface> SwiftCameraWrapper::singleton;

sp<CameraHardwareInterface> SwiftCameraWrapper::createInstance(int cameraId)
{
    LOGV("%s :", __func__);
    if (singleton != NULL) {
        sp<CameraHardwareInterface> hardware = singleton.promote();
        if (hardware != NULL) {
            return hardware;
        }
    }

    ensureSwiftLibOpened();

    sp<CameraHardwareInterface> hardware(new SwiftCameraWrapper(cameraId));
    singleton = hardware;
    return hardware;
}

SwiftCameraWrapper::SwiftCameraWrapper(int cameraId) :
    mSwiftInterface(g_swiftOpenCameraHardware(cameraId)),
    mVideoMode(false)
{
    LOGV("%s :", __func__);
}

SwiftCameraWrapper::~SwiftCameraWrapper()
{
    LOGV("%s :", __func__);
}

sp<IMemoryHeap>
SwiftCameraWrapper::getPreviewHeap() const
{
    LOGV("%s :", __func__);
    return mSwiftInterface->getPreviewHeap();
}

sp<IMemoryHeap>
SwiftCameraWrapper::getRawHeap() const
{
    LOGV("%s :", __func__);
    return mSwiftInterface->getRawHeap();
}

void
SwiftCameraWrapper::setCallbacks(notify_callback notify_cb,
                                  data_callback data_cb,
                                  data_callback_timestamp data_cb_timestamp,
                                  void* user)
{
    LOGV("%s :", __func__);
    mSwiftInterface->setCallbacks(notify_cb, data_cb, data_cb_timestamp, this/*user or this*/);
}

void
SwiftCameraWrapper::enableMsgType(int32_t msgType)
{
    LOGV("%s :", __func__);
    mSwiftInterface->enableMsgType(msgType);
}

void
SwiftCameraWrapper::disableMsgType(int32_t msgType)
{
    LOGV("%s :", __func__);
    mSwiftInterface->disableMsgType(msgType);
}

bool
SwiftCameraWrapper::msgTypeEnabled(int32_t msgType)
{
    LOGV("%s :", __func__);
    return mSwiftInterface->msgTypeEnabled(msgType);
}

status_t
SwiftCameraWrapper::startPreview()
{
    LOGV("%s :", __func__);
    return mSwiftInterface->startPreview();
}

bool
SwiftCameraWrapper::useOverlay()
{
    LOGV("%s :", __func__);
    return mSwiftInterface->useOverlay();
}

status_t
SwiftCameraWrapper::setOverlay(const sp<Overlay> &overlay)
{
    LOGV("%s :", __func__);
    return mSwiftInterface->setOverlay(overlay);
}

void
SwiftCameraWrapper::stopPreview()
{
    LOGV("%s :", __func__);
    mSwiftInterface->stopPreview();
}

bool
SwiftCameraWrapper::previewEnabled()
{
    return mSwiftInterface->previewEnabled();
}

status_t
SwiftCameraWrapper::startRecording()
{
    LOGV("%s :", __func__);
    return mSwiftInterface->startRecording();
}

void
SwiftCameraWrapper::stopRecording()
{
    LOGV("%s :", __func__);
    mSwiftInterface->stopRecording();
}

bool
SwiftCameraWrapper::recordingEnabled()
{
    LOGV("%s :", __func__);
    return mSwiftInterface->recordingEnabled();
}

void
SwiftCameraWrapper::releaseRecordingFrame(const sp<IMemory>& mem)
{
    LOGV("%s :", __func__);
    return mSwiftInterface->releaseRecordingFrame(mem);
}

status_t
SwiftCameraWrapper::autoFocus()
{
    LOGV("%s :", __func__);
    return mSwiftInterface->autoFocus();
}

status_t
SwiftCameraWrapper::cancelAutoFocus()
{
    LOGV("%s :", __func__);
    return mSwiftInterface->cancelAutoFocus();
}

status_t
SwiftCameraWrapper::takePicture()
{
    LOGV("%s :", __func__);
    return mSwiftInterface->takePicture();
}

status_t
SwiftCameraWrapper::cancelPicture()
{
    LOGV("%s :", __func__);
    return mSwiftInterface->cancelPicture();
}

status_t
SwiftCameraWrapper::setParameters(const CameraParameters& params)
{
    LOGV("%s :", __func__);
    CameraParameters pars(params.flatten());
    
    return mSwiftInterface->setParameters(pars);
}

CameraParameters
SwiftCameraWrapper::getParameters() const
{
    LOGV("%s :", __func__);
    
    CameraParameters ret = mSwiftInterface->getParameters();

    ret.set(CameraParameters::KEY_MAX_ZOOM, "15");
    ret.set(CameraParameters::KEY_ZOOM_RATIOS, "100,115,130,145,160,175,190,205,220,235,250,265,280,295,310,320");

    /*ret.set(CameraParameters::KEY_EXPOSURE_COMPENSATION, exposureParam);
    ret.set(CameraParameters::KEY_MAX_EXPOSURE_COMPENSATION, "5");
    ret.set(CameraParameters::KEY_MIN_EXPOSURE_COMPENSATION, "-5");
    ret.set(CameraParameters::KEY_EXPOSURE_COMPENSATION_STEP, "0.3333333333333");*/

    return ret;
}

status_t
SwiftCameraWrapper::sendCommand(int32_t cmd, int32_t arg1, int32_t arg2)
{
    LOGV("%s :", __func__);
    return mSwiftInterface->sendCommand(cmd, arg1, arg2);
}

void
SwiftCameraWrapper::release()
{
    LOGV("%s :", __func__);
    mSwiftInterface->release();
}

status_t
SwiftCameraWrapper::dump(int fd, const Vector<String16>& args) const
{
    LOGV("%s :", __func__);
    return mSwiftInterface->dump(fd, args);
}

}; //namespace android
