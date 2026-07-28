/*******************************************************************************
The content of this file includes portions of the proprietary AUDIOKINETIC Wwise
Technology released in source code form as part of the game integration package.
The content of this file may not be used without valid licenses to the
AUDIOKINETIC Wwise Technology.
Note that the use of the game engine is subject to the Unity(R) Terms of
Service at https://unity3d.com/legal/terms-of-service
 
License Usage
 
Licensees holding valid licenses to the AUDIOKINETIC Wwise Technology may use
this file in accordance with the end user license agreement provided with the
software or, alternatively, in accordance with the terms contained
in a written agreement between you and Audiokinetic Inc.
Copyright (c) 2026 Audiokinetic Inc.
*******************************************************************************/

#include <sys/types.h>
#include <android/asset_manager_jni.h>
#include <android/asset_manager.h>
#include <jni.h>

extern CAkFilePackageLowLevelIODeferred g_lowLevelIO;

namespace AkUnityAndroidSystem
{
	JavaVM* g_JavaVm = nullptr;
	jobject g_Activity = nullptr;

	void SetAndroidActivity(void* activityPtr)
	{
		if (g_JavaVm == NULL)
		{
			__android_log_print(ANDROID_LOG_DEBUG, "AkSoundEngine", "SetAndroidActivity: JavaVM was nullptr. Failing");
			return;
		}

		JNIEnv* lJNIEnv;
		g_JavaVm->GetEnv((void**)&lJNIEnv, JNI_VERSION_1_6);
		if (lJNIEnv == nullptr)
		{
			__android_log_print(ANDROID_LOG_DEBUG, "AkSoundEngine", "SetAndroidActivity: JNIEnv was nullptr. Failing");
			return;
		}

		jobject activity = reinterpret_cast<jobject>(activityPtr);

		if (activity != nullptr)
		{
			g_Activity = lJNIEnv->NewGlobalRef(activity);
			__android_log_print(ANDROID_LOG_DEBUG, "AkSoundEngine", "SetAndroidActivity: Android activity properly set to the environment!");
			return;
		}

		__android_log_print(ANDROID_LOG_DEBUG, "AkSoundEngine", "SetAndroidActivity: Activity was nullptr. Failing");
	}

	AKRESULT InitAndroidSystem(jobject& out_jActivity)
	{
		out_jActivity = nullptr;
		if (g_JavaVm == NULL)
		{
			__android_log_print(ANDROID_LOG_DEBUG, "AkSoundEngine", "InitAndroidSystem: JavaVM was nullptr. Failing");
			return AK_NoJavaVM;
		}

		if (g_Activity == nullptr)
		{
			__android_log_print(ANDROID_LOG_DEBUG, "AkSoundEngine", "InitAndroidSystem: g_Activity was nullptr. Failing");
			return AK_Fail;
		}

		g_lowLevelIO.Init(g_JavaVm, g_Activity);
		out_jActivity = g_Activity;
		return AK_Success;
	}

	AKRESULT TermAndroidSystem()
	{
		if (g_JavaVm == nullptr)
		{
			return AK_NoJavaVM;
		}

		JNIEnv* lJNIEnv;
		g_JavaVm->GetEnv((void**)&lJNIEnv, JNI_VERSION_1_6);
		if(lJNIEnv == nullptr)
		{
			return AK_NoJavaVM;
		}
		
		lJNIEnv->DeleteGlobalRef(g_Activity);
		g_Activity = nullptr;
		return AK_Success;
	}
};
jint JNI_OnLoad(JavaVM* vm, void* reserved)
{
	AkUnityAndroidSystem::g_JavaVm = vm;
	return JNI_VERSION_1_6;		// minimum JNI version
}
