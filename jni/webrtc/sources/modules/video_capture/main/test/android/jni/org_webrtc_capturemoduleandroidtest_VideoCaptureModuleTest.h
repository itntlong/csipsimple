/*
 *  Copyright (c) 2011 The WebRTC project authors. All Rights Reserved.
 *
 *  Use of this source code is governed by a BSD-style license
 *  that can be found in the LICENSE file in the root of the source
 *  tree. An additional intellectual property rights grant can be found
 *  in the file PATENTS.  All contributing project authors may
 *  be found in the AUTHORS file in the root of the source tree.
 */

/* DO NOT EDIT THIS FILE - it is machine generated */
#include <jni.h>
/* Header for class org_webrtc_capturemoduleandroidtest_VideoCaptureModuleTest */

#ifndef _Included_org_webrtc_capturemoduleandroidtest_VideoCaptureModuleTest
#define _Included_org_webrtc_capturemoduleandroidtest_VideoCaptureModuleTest
#ifdef __cplusplus
extern "C" {
#endif
/*
 * Class:     org_webrtc_capturemoduleandroidtest_VideoCaptureModuleTest
 * Method:    RunTest
 * Signature: (Landroid/content/Context;)I
 */
JNIEXPORT jint JNICALL Java_org_webrtc_capturemoduleandroidtest_VideoCaptureModuleTest_RunTest
  (JNIEnv *, jobject, jobject);

JNIEXPORT jint JNICALL Java_org_webrtc_capturemoduleandroidtest_VideoCaptureModuleTest_RenderInit
(JNIEnv * env, jobject context,jobject surface);

JNIEXPORT jint JNICALL Java_org_webrtc_capturemoduleandroidtest_VideoCaptureModuleTest_StartCapture
(JNIEnv *, jobject);

JNIEXPORT jint JNICALL Java_org_webrtc_capturemoduleandroidtest_VideoCaptureModuleTest_StopCapture
(JNIEnv *, jobject);

#ifdef __cplusplus
}
#endif
#endif
