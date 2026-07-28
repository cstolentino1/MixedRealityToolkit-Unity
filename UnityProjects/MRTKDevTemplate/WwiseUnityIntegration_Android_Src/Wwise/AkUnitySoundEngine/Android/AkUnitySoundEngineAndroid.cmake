add_library("AkUnitySoundEngineAndroid" SHARED
  "${CMAKE_CURRENT_LIST_DIR}/../Common/AkCallbackSerializer.cpp"
  "${CMAKE_CURRENT_LIST_DIR}/../Common/AkFileLocationBase.cpp"
  "${CMAKE_CURRENT_LIST_DIR}/../Common/AkFilePackage.cpp"
  "${CMAKE_CURRENT_LIST_DIR}/../Common/AkFilePackageLUT.cpp"
  "${CMAKE_CURRENT_LIST_DIR}/../Common/AkGeneratedSoundBanksResolver.cpp"
  "${CMAKE_CURRENT_LIST_DIR}/../Common/AkUnityErrorMessageTranslator.cpp"
  "${CMAKE_CURRENT_LIST_DIR}/../Common/AkUnitySoundEngineStubs.cpp"
  "${CMAKE_CURRENT_LIST_DIR}/AkDefaultIOHookDeferred.cpp"
  "${CMAKE_CURRENT_LIST_DIR}/AkFileHelpers.cpp"
  "${CMAKE_CURRENT_LIST_DIR}/SoundEngine_wrap.cxx"
  "${CMAKE_CURRENT_LIST_DIR}/stdafx.cpp"
)
if(CMAKE_BUILD_TYPE STREQUAL armeabi-v7a-Debug)
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES
    OUTPUT_NAME "AkUnitySoundEngine"
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/armeabi-v7a/Debug"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/armeabi-v7a/Debug"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/armeabi-v7a/Debug"
  )
  target_include_directories("AkUnitySoundEngineAndroid" PRIVATE
    "${CMAKE_CURRENT_LIST_DIR}/."
    "${WWISESDK}/include"
    "${WWISESDK}/tools"
    "${CMAKE_CURRENT_LIST_DIR}/../Common"
    "${WWISESDK}/samples/SoundEngine/Android/libzip/lib"
  )
  target_compile_definitions("AkUnitySoundEngineAndroid" PRIVATE
    "AUDIOKINETIC"
    "_DEBUG"
    "AK_PLATFORM_SPECIFIC_STUBS"
  )
  target_link_directories("AkUnitySoundEngineAndroid" PRIVATE
    "C:/Audiokinetic/Wwise_2025.1.9.9197/SDK/Android_armeabi-v7a/Debug/lib"
    "${WWISESDK}/Android_armeabi-v7a/Debug/lib"
  )
  target_link_libraries("AkUnitySoundEngineAndroid"
    "AkSpatialAudio"
    "AkMemoryMgr"
    "AkStreamMgr"
    "CommunicationCentral"
    "AkSoundEngine"
    "AkSilenceSource"
    "AkSineSource"
    "AkToneSource"
    "AkSynthOneSource"
    "AkVorbisDecoder"
    "AkOpusDecoder"
    "AkAudioInputSource"
    "Ak3DAudioBedMixerFX"
    "AkCompressorFX"
    "AkDelayFX"
    "AkFlangerFX"
    "AkGainFX"
    "AkGuitarDistortionFX"
    "AkHarmonizerFX"
    "AkMatrixReverbFX"
    "AkParametricEQFX"
    "AkPeakLimiterFX"
    "AkPitchShifterFX"
    "AkRecorderFX"
    "AkReflectFX"
    "AkRoomVerbFX"
    "AkStereoDelayFX"
    "AkTimeStretchFX"
    "AkTremoloFX"
    "OpenSLES"
    "android"
    "log"
    "dl"
    "zip"
    "z"
  )
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fPIC")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-conversion-null")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-deprecated-declarations")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-invalid-offsetof")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fvisibility=hidden")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-rtti")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-exceptions")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-omit-frame-pointer")
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES LINK_FLAGS "-Wl,--as-needed,-z,max-page-size=16384 -Wl,--as-needed ")
  if (MSVC)
    target_compile_options("AkUnitySoundEngineAndroid" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:/WX>
      $<$<COMPILE_LANGUAGE:C>:/MDd>
      $<$<COMPILE_LANGUAGE:C>:/Z7>
      $<$<COMPILE_LANGUAGE:C>:/std:c11>
      $<$<COMPILE_LANGUAGE:CXX>:/WX>
      $<$<COMPILE_LANGUAGE:CXX>:/MDd>
      $<$<COMPILE_LANGUAGE:CXX>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/std:c++17>
      $<$<COMPILE_LANGUAGE:CXX>:/GR->
    )
  else()
    target_compile_options("AkUnitySoundEngineAndroid" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:-Werror>
      $<$<COMPILE_LANGUAGE:C>:-fPIC>
      $<$<COMPILE_LANGUAGE:C>:-g>
      $<$<COMPILE_LANGUAGE:C>:-std=c11>
      $<$<COMPILE_LANGUAGE:CXX>:-Werror>
      $<$<COMPILE_LANGUAGE:CXX>:-fPIC>
      $<$<COMPILE_LANGUAGE:CXX>:-g>
      $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
  endif()
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE True
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()

if(CMAKE_BUILD_TYPE STREQUAL x86-Debug)
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES
    OUTPUT_NAME "AkUnitySoundEngine"
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/x86/Debug"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/x86/Debug"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/x86/Debug"
  )
  target_include_directories("AkUnitySoundEngineAndroid" PRIVATE
    "${CMAKE_CURRENT_LIST_DIR}/."
    "${WWISESDK}/include"
    "${WWISESDK}/tools"
    "${CMAKE_CURRENT_LIST_DIR}/../Common"
    "${WWISESDK}/samples/SoundEngine/Android/libzip/lib"
  )
  target_compile_definitions("AkUnitySoundEngineAndroid" PRIVATE
    "AUDIOKINETIC"
    "_DEBUG"
    "AK_PLATFORM_SPECIFIC_STUBS"
  )
  target_link_directories("AkUnitySoundEngineAndroid" PRIVATE
    "C:/Audiokinetic/Wwise_2025.1.9.9197/SDK/Android_x86/Debug/lib"
    "${WWISESDK}/Android_x86/Debug/lib"
  )
  target_link_libraries("AkUnitySoundEngineAndroid"
    "AkSpatialAudio"
    "AkMemoryMgr"
    "AkStreamMgr"
    "CommunicationCentral"
    "AkSoundEngine"
    "AkSilenceSource"
    "AkSineSource"
    "AkToneSource"
    "AkSynthOneSource"
    "AkVorbisDecoder"
    "AkOpusDecoder"
    "AkAudioInputSource"
    "Ak3DAudioBedMixerFX"
    "AkCompressorFX"
    "AkDelayFX"
    "AkFlangerFX"
    "AkGainFX"
    "AkGuitarDistortionFX"
    "AkHarmonizerFX"
    "AkMatrixReverbFX"
    "AkParametricEQFX"
    "AkPeakLimiterFX"
    "AkPitchShifterFX"
    "AkRecorderFX"
    "AkReflectFX"
    "AkRoomVerbFX"
    "AkStereoDelayFX"
    "AkTimeStretchFX"
    "AkTremoloFX"
    "OpenSLES"
    "android"
    "log"
    "dl"
    "zip"
    "z"
  )
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fPIC")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-conversion-null")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-deprecated-declarations")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-invalid-offsetof")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fvisibility=hidden")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-rtti")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-exceptions")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-sync-alignment")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-omit-frame-pointer")
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES LINK_FLAGS "-Wl,--as-needed,-z,max-page-size=16384 -Wl,--as-needed ")
  if (MSVC)
    target_compile_options("AkUnitySoundEngineAndroid" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:/WX>
      $<$<COMPILE_LANGUAGE:C>:/MDd>
      $<$<COMPILE_LANGUAGE:C>:/Z7>
      $<$<COMPILE_LANGUAGE:C>:/std:c11>
      $<$<COMPILE_LANGUAGE:CXX>:/WX>
      $<$<COMPILE_LANGUAGE:CXX>:/MDd>
      $<$<COMPILE_LANGUAGE:CXX>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/std:c++17>
      $<$<COMPILE_LANGUAGE:CXX>:/GR->
    )
  else()
    target_compile_options("AkUnitySoundEngineAndroid" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:-m32>
      $<$<COMPILE_LANGUAGE:C>:-Werror>
      $<$<COMPILE_LANGUAGE:C>:-fPIC>
      $<$<COMPILE_LANGUAGE:C>:-g>
      $<$<COMPILE_LANGUAGE:C>:-std=c11>
      $<$<COMPILE_LANGUAGE:CXX>:-m32>
      $<$<COMPILE_LANGUAGE:CXX>:-Werror>
      $<$<COMPILE_LANGUAGE:CXX>:-fPIC>
      $<$<COMPILE_LANGUAGE:CXX>:-g>
      $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
  endif()
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE True
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()

if(CMAKE_BUILD_TYPE STREQUAL arm64-v8a-Debug)
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES
    OUTPUT_NAME "AkUnitySoundEngine"
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/arm64-v8a/Debug"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/arm64-v8a/Debug"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/arm64-v8a/Debug"
  )
  target_include_directories("AkUnitySoundEngineAndroid" PRIVATE
    "${CMAKE_CURRENT_LIST_DIR}/."
    "${WWISESDK}/include"
    "${WWISESDK}/tools"
    "${CMAKE_CURRENT_LIST_DIR}/../Common"
    "${WWISESDK}/samples/SoundEngine/Android/libzip/lib"
  )
  target_compile_definitions("AkUnitySoundEngineAndroid" PRIVATE
    "AUDIOKINETIC"
    "_DEBUG"
    "AK_PLATFORM_SPECIFIC_STUBS"
  )
  target_link_directories("AkUnitySoundEngineAndroid" PRIVATE
    "C:/Audiokinetic/Wwise_2025.1.9.9197/SDK/Android_arm64-v8a/Debug/lib"
    "${WWISESDK}/Android_arm64-v8a/Debug/lib"
  )
  target_link_libraries("AkUnitySoundEngineAndroid"
    "AkSpatialAudio"
    "AkMemoryMgr"
    "AkStreamMgr"
    "CommunicationCentral"
    "AkSoundEngine"
    "AkSilenceSource"
    "AkSineSource"
    "AkToneSource"
    "AkSynthOneSource"
    "AkVorbisDecoder"
    "AkOpusDecoder"
    "AkAudioInputSource"
    "Ak3DAudioBedMixerFX"
    "AkCompressorFX"
    "AkDelayFX"
    "AkFlangerFX"
    "AkGainFX"
    "AkGuitarDistortionFX"
    "AkHarmonizerFX"
    "AkMatrixReverbFX"
    "AkParametricEQFX"
    "AkPeakLimiterFX"
    "AkPitchShifterFX"
    "AkRecorderFX"
    "AkReflectFX"
    "AkRoomVerbFX"
    "AkStereoDelayFX"
    "AkTimeStretchFX"
    "AkTremoloFX"
    "OpenSLES"
    "android"
    "log"
    "dl"
    "zip"
    "z"
  )
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fPIC")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-conversion-null")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-deprecated-declarations")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-invalid-offsetof")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fvisibility=hidden")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-rtti")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-exceptions")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-omit-frame-pointer")
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES LINK_FLAGS "-Wl,--as-needed,-z,max-page-size=16384 -Wl,--as-needed ")
  if (MSVC)
    target_compile_options("AkUnitySoundEngineAndroid" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:/WX>
      $<$<COMPILE_LANGUAGE:C>:/MDd>
      $<$<COMPILE_LANGUAGE:C>:/Z7>
      $<$<COMPILE_LANGUAGE:C>:/std:c11>
      $<$<COMPILE_LANGUAGE:CXX>:/WX>
      $<$<COMPILE_LANGUAGE:CXX>:/MDd>
      $<$<COMPILE_LANGUAGE:CXX>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/std:c++17>
      $<$<COMPILE_LANGUAGE:CXX>:/GR->
    )
  else()
    target_compile_options("AkUnitySoundEngineAndroid" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:-Werror>
      $<$<COMPILE_LANGUAGE:C>:-fPIC>
      $<$<COMPILE_LANGUAGE:C>:-g>
      $<$<COMPILE_LANGUAGE:C>:-std=c11>
      $<$<COMPILE_LANGUAGE:CXX>:-Werror>
      $<$<COMPILE_LANGUAGE:CXX>:-fPIC>
      $<$<COMPILE_LANGUAGE:CXX>:-g>
      $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
  endif()
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE True
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()

if(CMAKE_BUILD_TYPE STREQUAL x86_64-Debug)
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES
    OUTPUT_NAME "AkUnitySoundEngine"
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/x86_64/Debug"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/x86_64/Debug"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/x86_64/Debug"
  )
  target_include_directories("AkUnitySoundEngineAndroid" PRIVATE
    "${CMAKE_CURRENT_LIST_DIR}/."
    "${WWISESDK}/include"
    "${WWISESDK}/tools"
    "${CMAKE_CURRENT_LIST_DIR}/../Common"
    "${WWISESDK}/samples/SoundEngine/Android/libzip/lib"
  )
  target_compile_definitions("AkUnitySoundEngineAndroid" PRIVATE
    "AUDIOKINETIC"
    "_DEBUG"
    "AK_PLATFORM_SPECIFIC_STUBS"
  )
  target_link_directories("AkUnitySoundEngineAndroid" PRIVATE
    "C:/Audiokinetic/Wwise_2025.1.9.9197/SDK/Android_x86_64/Debug/lib"
    "${WWISESDK}/Android_x86_64/Debug/lib"
  )
  target_link_libraries("AkUnitySoundEngineAndroid"
    "AkSpatialAudio"
    "AkMemoryMgr"
    "AkStreamMgr"
    "CommunicationCentral"
    "AkSoundEngine"
    "AkSilenceSource"
    "AkSineSource"
    "AkToneSource"
    "AkSynthOneSource"
    "AkVorbisDecoder"
    "AkOpusDecoder"
    "AkAudioInputSource"
    "Ak3DAudioBedMixerFX"
    "AkCompressorFX"
    "AkDelayFX"
    "AkFlangerFX"
    "AkGainFX"
    "AkGuitarDistortionFX"
    "AkHarmonizerFX"
    "AkMatrixReverbFX"
    "AkParametricEQFX"
    "AkPeakLimiterFX"
    "AkPitchShifterFX"
    "AkRecorderFX"
    "AkReflectFX"
    "AkRoomVerbFX"
    "AkStereoDelayFX"
    "AkTimeStretchFX"
    "AkTremoloFX"
    "OpenSLES"
    "android"
    "log"
    "dl"
    "zip"
    "z"
  )
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fPIC")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-conversion-null")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-deprecated-declarations")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-invalid-offsetof")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fvisibility=hidden")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-rtti")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-exceptions")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-omit-frame-pointer")
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES LINK_FLAGS "-Wl,--as-needed,-z,max-page-size=16384 -Wl,--as-needed ")
  if (MSVC)
    target_compile_options("AkUnitySoundEngineAndroid" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:/WX>
      $<$<COMPILE_LANGUAGE:C>:/MDd>
      $<$<COMPILE_LANGUAGE:C>:/Z7>
      $<$<COMPILE_LANGUAGE:C>:/std:c11>
      $<$<COMPILE_LANGUAGE:CXX>:/WX>
      $<$<COMPILE_LANGUAGE:CXX>:/MDd>
      $<$<COMPILE_LANGUAGE:CXX>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/std:c++17>
      $<$<COMPILE_LANGUAGE:CXX>:/GR->
    )
  else()
    target_compile_options("AkUnitySoundEngineAndroid" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:-m64>
      $<$<COMPILE_LANGUAGE:C>:-Werror>
      $<$<COMPILE_LANGUAGE:C>:-fPIC>
      $<$<COMPILE_LANGUAGE:C>:-g>
      $<$<COMPILE_LANGUAGE:C>:-std=c11>
      $<$<COMPILE_LANGUAGE:CXX>:-m64>
      $<$<COMPILE_LANGUAGE:CXX>:-Werror>
      $<$<COMPILE_LANGUAGE:CXX>:-fPIC>
      $<$<COMPILE_LANGUAGE:CXX>:-g>
      $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
  endif()
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE True
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()

if(CMAKE_BUILD_TYPE STREQUAL armeabi-v7a-Profile)
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES
    OUTPUT_NAME "AkUnitySoundEngine"
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/armeabi-v7a/Profile"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/armeabi-v7a/Profile"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/armeabi-v7a/Profile"
  )
  target_include_directories("AkUnitySoundEngineAndroid" PRIVATE
    "${CMAKE_CURRENT_LIST_DIR}/."
    "${WWISESDK}/include"
    "${WWISESDK}/tools"
    "${CMAKE_CURRENT_LIST_DIR}/../Common"
    "${WWISESDK}/samples/SoundEngine/Android/libzip/lib"
  )
  target_compile_definitions("AkUnitySoundEngineAndroid" PRIVATE
    "AK_ENABLE_ASSERTS"
    "AUDIOKINETIC"
    "NDEBUG"
    "AK_PLATFORM_SPECIFIC_STUBS"
  )
  target_link_directories("AkUnitySoundEngineAndroid" PRIVATE
    "C:/Audiokinetic/Wwise_2025.1.9.9197/SDK/Android_armeabi-v7a/Profile/lib"
    "${WWISESDK}/Android_armeabi-v7a/Profile/lib"
  )
  target_link_libraries("AkUnitySoundEngineAndroid"
    "AkSpatialAudio"
    "AkMemoryMgr"
    "AkStreamMgr"
    "CommunicationCentral"
    "AkSoundEngine"
    "AkSilenceSource"
    "AkSineSource"
    "AkToneSource"
    "AkSynthOneSource"
    "AkVorbisDecoder"
    "AkOpusDecoder"
    "AkAudioInputSource"
    "Ak3DAudioBedMixerFX"
    "AkCompressorFX"
    "AkDelayFX"
    "AkFlangerFX"
    "AkGainFX"
    "AkGuitarDistortionFX"
    "AkHarmonizerFX"
    "AkMatrixReverbFX"
    "AkParametricEQFX"
    "AkPeakLimiterFX"
    "AkPitchShifterFX"
    "AkRecorderFX"
    "AkReflectFX"
    "AkRoomVerbFX"
    "AkStereoDelayFX"
    "AkTimeStretchFX"
    "AkTremoloFX"
    "OpenSLES"
    "android"
    "log"
    "dl"
    "zip"
    "z"
  )
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fPIC")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-conversion-null")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-deprecated-declarations")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-invalid-offsetof")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fvisibility=hidden")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-rtti")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-exceptions")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-ffunction-sections")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fdata-sections")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-omit-frame-pointer")
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES LINK_FLAGS "-Wl,--as-needed,-z,max-page-size=16384 -Wl,--as-needed ")
  if (MSVC)
    target_compile_options("AkUnitySoundEngineAndroid" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:/WX>
      $<$<COMPILE_LANGUAGE:C>:/Ot>
      $<$<COMPILE_LANGUAGE:C>:/MD>
      $<$<COMPILE_LANGUAGE:C>:/Z7>
      $<$<COMPILE_LANGUAGE:C>:/std:c11>
      $<$<COMPILE_LANGUAGE:CXX>:/WX>
      $<$<COMPILE_LANGUAGE:CXX>:/Ot>
      $<$<COMPILE_LANGUAGE:CXX>:/MD>
      $<$<COMPILE_LANGUAGE:CXX>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/std:c++17>
      $<$<COMPILE_LANGUAGE:CXX>:/GR->
    )
  else()
    target_compile_options("AkUnitySoundEngineAndroid" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:-Werror>
      $<$<COMPILE_LANGUAGE:C>:-O2>
      $<$<COMPILE_LANGUAGE:C>:-fPIC>
      $<$<COMPILE_LANGUAGE:C>:-g>
      $<$<COMPILE_LANGUAGE:C>:-std=c11>
      $<$<COMPILE_LANGUAGE:CXX>:-Werror>
      $<$<COMPILE_LANGUAGE:CXX>:-O2>
      $<$<COMPILE_LANGUAGE:CXX>:-fPIC>
      $<$<COMPILE_LANGUAGE:CXX>:-g>
      $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
  endif()
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE True
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()

if(CMAKE_BUILD_TYPE STREQUAL x86-Profile)
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES
    OUTPUT_NAME "AkUnitySoundEngine"
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/x86/Profile"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/x86/Profile"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/x86/Profile"
  )
  target_include_directories("AkUnitySoundEngineAndroid" PRIVATE
    "${CMAKE_CURRENT_LIST_DIR}/."
    "${WWISESDK}/include"
    "${WWISESDK}/tools"
    "${CMAKE_CURRENT_LIST_DIR}/../Common"
    "${WWISESDK}/samples/SoundEngine/Android/libzip/lib"
  )
  target_compile_definitions("AkUnitySoundEngineAndroid" PRIVATE
    "AK_ENABLE_ASSERTS"
    "AUDIOKINETIC"
    "NDEBUG"
    "AK_PLATFORM_SPECIFIC_STUBS"
  )
  target_link_directories("AkUnitySoundEngineAndroid" PRIVATE
    "C:/Audiokinetic/Wwise_2025.1.9.9197/SDK/Android_x86/Profile/lib"
    "${WWISESDK}/Android_x86/Profile/lib"
  )
  target_link_libraries("AkUnitySoundEngineAndroid"
    "AkSpatialAudio"
    "AkMemoryMgr"
    "AkStreamMgr"
    "CommunicationCentral"
    "AkSoundEngine"
    "AkSilenceSource"
    "AkSineSource"
    "AkToneSource"
    "AkSynthOneSource"
    "AkVorbisDecoder"
    "AkOpusDecoder"
    "AkAudioInputSource"
    "Ak3DAudioBedMixerFX"
    "AkCompressorFX"
    "AkDelayFX"
    "AkFlangerFX"
    "AkGainFX"
    "AkGuitarDistortionFX"
    "AkHarmonizerFX"
    "AkMatrixReverbFX"
    "AkParametricEQFX"
    "AkPeakLimiterFX"
    "AkPitchShifterFX"
    "AkRecorderFX"
    "AkReflectFX"
    "AkRoomVerbFX"
    "AkStereoDelayFX"
    "AkTimeStretchFX"
    "AkTremoloFX"
    "OpenSLES"
    "android"
    "log"
    "dl"
    "zip"
    "z"
  )
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fPIC")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-conversion-null")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-deprecated-declarations")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-invalid-offsetof")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fvisibility=hidden")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-rtti")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-exceptions")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-sync-alignment")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-ffunction-sections")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fdata-sections")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-omit-frame-pointer")
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES LINK_FLAGS "-Wl,--as-needed,-z,max-page-size=16384 -Wl,--as-needed ")
  if (MSVC)
    target_compile_options("AkUnitySoundEngineAndroid" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:/WX>
      $<$<COMPILE_LANGUAGE:C>:/Ot>
      $<$<COMPILE_LANGUAGE:C>:/MD>
      $<$<COMPILE_LANGUAGE:C>:/Z7>
      $<$<COMPILE_LANGUAGE:C>:/std:c11>
      $<$<COMPILE_LANGUAGE:CXX>:/WX>
      $<$<COMPILE_LANGUAGE:CXX>:/Ot>
      $<$<COMPILE_LANGUAGE:CXX>:/MD>
      $<$<COMPILE_LANGUAGE:CXX>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/std:c++17>
      $<$<COMPILE_LANGUAGE:CXX>:/GR->
    )
  else()
    target_compile_options("AkUnitySoundEngineAndroid" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:-m32>
      $<$<COMPILE_LANGUAGE:C>:-Werror>
      $<$<COMPILE_LANGUAGE:C>:-O2>
      $<$<COMPILE_LANGUAGE:C>:-fPIC>
      $<$<COMPILE_LANGUAGE:C>:-g>
      $<$<COMPILE_LANGUAGE:C>:-std=c11>
      $<$<COMPILE_LANGUAGE:CXX>:-m32>
      $<$<COMPILE_LANGUAGE:CXX>:-Werror>
      $<$<COMPILE_LANGUAGE:CXX>:-O2>
      $<$<COMPILE_LANGUAGE:CXX>:-fPIC>
      $<$<COMPILE_LANGUAGE:CXX>:-g>
      $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
  endif()
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE True
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()

if(CMAKE_BUILD_TYPE STREQUAL arm64-v8a-Profile)
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES
    OUTPUT_NAME "AkUnitySoundEngine"
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/arm64-v8a/Profile"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/arm64-v8a/Profile"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/arm64-v8a/Profile"
  )
  target_include_directories("AkUnitySoundEngineAndroid" PRIVATE
    "${CMAKE_CURRENT_LIST_DIR}/."
    "${WWISESDK}/include"
    "${WWISESDK}/tools"
    "${CMAKE_CURRENT_LIST_DIR}/../Common"
    "${WWISESDK}/samples/SoundEngine/Android/libzip/lib"
  )
  target_compile_definitions("AkUnitySoundEngineAndroid" PRIVATE
    "AK_ENABLE_ASSERTS"
    "AUDIOKINETIC"
    "NDEBUG"
    "AK_PLATFORM_SPECIFIC_STUBS"
  )
  target_link_directories("AkUnitySoundEngineAndroid" PRIVATE
    "C:/Audiokinetic/Wwise_2025.1.9.9197/SDK/Android_arm64-v8a/Profile/lib"
    "${WWISESDK}/Android_arm64-v8a/Profile/lib"
  )
  target_link_libraries("AkUnitySoundEngineAndroid"
    "AkSpatialAudio"
    "AkMemoryMgr"
    "AkStreamMgr"
    "CommunicationCentral"
    "AkSoundEngine"
    "AkSilenceSource"
    "AkSineSource"
    "AkToneSource"
    "AkSynthOneSource"
    "AkVorbisDecoder"
    "AkOpusDecoder"
    "AkAudioInputSource"
    "Ak3DAudioBedMixerFX"
    "AkCompressorFX"
    "AkDelayFX"
    "AkFlangerFX"
    "AkGainFX"
    "AkGuitarDistortionFX"
    "AkHarmonizerFX"
    "AkMatrixReverbFX"
    "AkParametricEQFX"
    "AkPeakLimiterFX"
    "AkPitchShifterFX"
    "AkRecorderFX"
    "AkReflectFX"
    "AkRoomVerbFX"
    "AkStereoDelayFX"
    "AkTimeStretchFX"
    "AkTremoloFX"
    "OpenSLES"
    "android"
    "log"
    "dl"
    "zip"
    "z"
  )
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fPIC")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-conversion-null")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-deprecated-declarations")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-invalid-offsetof")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fvisibility=hidden")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-rtti")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-exceptions")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-ffunction-sections")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fdata-sections")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-omit-frame-pointer")
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES LINK_FLAGS "-Wl,--as-needed,-z,max-page-size=16384 -Wl,--as-needed ")
  if (MSVC)
    target_compile_options("AkUnitySoundEngineAndroid" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:/WX>
      $<$<COMPILE_LANGUAGE:C>:/Ot>
      $<$<COMPILE_LANGUAGE:C>:/MD>
      $<$<COMPILE_LANGUAGE:C>:/Z7>
      $<$<COMPILE_LANGUAGE:C>:/std:c11>
      $<$<COMPILE_LANGUAGE:CXX>:/WX>
      $<$<COMPILE_LANGUAGE:CXX>:/Ot>
      $<$<COMPILE_LANGUAGE:CXX>:/MD>
      $<$<COMPILE_LANGUAGE:CXX>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/std:c++17>
      $<$<COMPILE_LANGUAGE:CXX>:/GR->
    )
  else()
    target_compile_options("AkUnitySoundEngineAndroid" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:-Werror>
      $<$<COMPILE_LANGUAGE:C>:-O2>
      $<$<COMPILE_LANGUAGE:C>:-fPIC>
      $<$<COMPILE_LANGUAGE:C>:-g>
      $<$<COMPILE_LANGUAGE:C>:-std=c11>
      $<$<COMPILE_LANGUAGE:CXX>:-Werror>
      $<$<COMPILE_LANGUAGE:CXX>:-O2>
      $<$<COMPILE_LANGUAGE:CXX>:-fPIC>
      $<$<COMPILE_LANGUAGE:CXX>:-g>
      $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
  endif()
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE True
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()

if(CMAKE_BUILD_TYPE STREQUAL x86_64-Profile)
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES
    OUTPUT_NAME "AkUnitySoundEngine"
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/x86_64/Profile"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/x86_64/Profile"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/x86_64/Profile"
  )
  target_include_directories("AkUnitySoundEngineAndroid" PRIVATE
    "${CMAKE_CURRENT_LIST_DIR}/."
    "${WWISESDK}/include"
    "${WWISESDK}/tools"
    "${CMAKE_CURRENT_LIST_DIR}/../Common"
    "${WWISESDK}/samples/SoundEngine/Android/libzip/lib"
  )
  target_compile_definitions("AkUnitySoundEngineAndroid" PRIVATE
    "AK_ENABLE_ASSERTS"
    "AUDIOKINETIC"
    "NDEBUG"
    "AK_PLATFORM_SPECIFIC_STUBS"
  )
  target_link_directories("AkUnitySoundEngineAndroid" PRIVATE
    "C:/Audiokinetic/Wwise_2025.1.9.9197/SDK/Android_x86_64/Profile/lib"
    "${WWISESDK}/Android_x86_64/Profile/lib"
  )
  target_link_libraries("AkUnitySoundEngineAndroid"
    "AkSpatialAudio"
    "AkMemoryMgr"
    "AkStreamMgr"
    "CommunicationCentral"
    "AkSoundEngine"
    "AkSilenceSource"
    "AkSineSource"
    "AkToneSource"
    "AkSynthOneSource"
    "AkVorbisDecoder"
    "AkOpusDecoder"
    "AkAudioInputSource"
    "Ak3DAudioBedMixerFX"
    "AkCompressorFX"
    "AkDelayFX"
    "AkFlangerFX"
    "AkGainFX"
    "AkGuitarDistortionFX"
    "AkHarmonizerFX"
    "AkMatrixReverbFX"
    "AkParametricEQFX"
    "AkPeakLimiterFX"
    "AkPitchShifterFX"
    "AkRecorderFX"
    "AkReflectFX"
    "AkRoomVerbFX"
    "AkStereoDelayFX"
    "AkTimeStretchFX"
    "AkTremoloFX"
    "OpenSLES"
    "android"
    "log"
    "dl"
    "zip"
    "z"
  )
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fPIC")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-conversion-null")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-deprecated-declarations")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-invalid-offsetof")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fvisibility=hidden")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-rtti")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-exceptions")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-ffunction-sections")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fdata-sections")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-omit-frame-pointer")
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES LINK_FLAGS "-Wl,--as-needed,-z,max-page-size=16384 -Wl,--as-needed ")
  if (MSVC)
    target_compile_options("AkUnitySoundEngineAndroid" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:/WX>
      $<$<COMPILE_LANGUAGE:C>:/Ot>
      $<$<COMPILE_LANGUAGE:C>:/MD>
      $<$<COMPILE_LANGUAGE:C>:/Z7>
      $<$<COMPILE_LANGUAGE:C>:/std:c11>
      $<$<COMPILE_LANGUAGE:CXX>:/WX>
      $<$<COMPILE_LANGUAGE:CXX>:/Ot>
      $<$<COMPILE_LANGUAGE:CXX>:/MD>
      $<$<COMPILE_LANGUAGE:CXX>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/std:c++17>
      $<$<COMPILE_LANGUAGE:CXX>:/GR->
    )
  else()
    target_compile_options("AkUnitySoundEngineAndroid" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:-m64>
      $<$<COMPILE_LANGUAGE:C>:-Werror>
      $<$<COMPILE_LANGUAGE:C>:-O2>
      $<$<COMPILE_LANGUAGE:C>:-fPIC>
      $<$<COMPILE_LANGUAGE:C>:-g>
      $<$<COMPILE_LANGUAGE:C>:-std=c11>
      $<$<COMPILE_LANGUAGE:CXX>:-m64>
      $<$<COMPILE_LANGUAGE:CXX>:-Werror>
      $<$<COMPILE_LANGUAGE:CXX>:-O2>
      $<$<COMPILE_LANGUAGE:CXX>:-fPIC>
      $<$<COMPILE_LANGUAGE:CXX>:-g>
      $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
  endif()
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE True
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()

if(CMAKE_BUILD_TYPE STREQUAL armeabi-v7a-Release)
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES
    OUTPUT_NAME "AkUnitySoundEngine"
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/armeabi-v7a/Release"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/armeabi-v7a/Release"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/armeabi-v7a/Release"
  )
  target_include_directories("AkUnitySoundEngineAndroid" PRIVATE
    "${CMAKE_CURRENT_LIST_DIR}/."
    "${WWISESDK}/include"
    "${WWISESDK}/tools"
    "${CMAKE_CURRENT_LIST_DIR}/../Common"
    "${WWISESDK}/samples/SoundEngine/Android/libzip/lib"
  )
  target_compile_definitions("AkUnitySoundEngineAndroid" PRIVATE
    "AUDIOKINETIC"
    "NDEBUG"
    "AK_OPTIMIZED"
    "AK_PLATFORM_SPECIFIC_STUBS"
  )
  target_link_directories("AkUnitySoundEngineAndroid" PRIVATE
    "C:/Audiokinetic/Wwise_2025.1.9.9197/SDK/Android_armeabi-v7a/Release/lib"
    "${WWISESDK}/Android_armeabi-v7a/Release/lib"
  )
  target_link_libraries("AkUnitySoundEngineAndroid"
    "AkSpatialAudio"
    "AkMemoryMgr"
    "AkStreamMgr"
    "AkSoundEngine"
    "AkSilenceSource"
    "AkSineSource"
    "AkToneSource"
    "AkSynthOneSource"
    "AkVorbisDecoder"
    "AkOpusDecoder"
    "AkAudioInputSource"
    "Ak3DAudioBedMixerFX"
    "AkCompressorFX"
    "AkDelayFX"
    "AkFlangerFX"
    "AkGainFX"
    "AkGuitarDistortionFX"
    "AkHarmonizerFX"
    "AkMatrixReverbFX"
    "AkParametricEQFX"
    "AkPeakLimiterFX"
    "AkPitchShifterFX"
    "AkRecorderFX"
    "AkReflectFX"
    "AkRoomVerbFX"
    "AkStereoDelayFX"
    "AkTimeStretchFX"
    "AkTremoloFX"
    "OpenSLES"
    "android"
    "log"
    "dl"
    "zip"
    "z"
  )
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fPIC")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-conversion-null")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-deprecated-declarations")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-invalid-offsetof")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fvisibility=hidden")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-rtti")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-exceptions")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-ffunction-sections")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fdata-sections")
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES LINK_FLAGS "-Wl,--as-needed,-z,max-page-size=16384 -Wl,--as-needed ")
  if (MSVC)
    target_compile_options("AkUnitySoundEngineAndroid" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:/WX>
      $<$<COMPILE_LANGUAGE:C>:/Ot>
      $<$<COMPILE_LANGUAGE:C>:/MD>
      $<$<COMPILE_LANGUAGE:C>:/std:c11>
      $<$<COMPILE_LANGUAGE:CXX>:/WX>
      $<$<COMPILE_LANGUAGE:CXX>:/Ot>
      $<$<COMPILE_LANGUAGE:CXX>:/MD>
      $<$<COMPILE_LANGUAGE:CXX>:/std:c++17>
      $<$<COMPILE_LANGUAGE:CXX>:/GR->
    )
  else()
    target_compile_options("AkUnitySoundEngineAndroid" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:-Werror>
      $<$<COMPILE_LANGUAGE:C>:-O2>
      $<$<COMPILE_LANGUAGE:C>:-fPIC>
      $<$<COMPILE_LANGUAGE:C>:-std=c11>
      $<$<COMPILE_LANGUAGE:CXX>:-Werror>
      $<$<COMPILE_LANGUAGE:CXX>:-O2>
      $<$<COMPILE_LANGUAGE:CXX>:-fPIC>
      $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
  endif()
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE True
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()

if(CMAKE_BUILD_TYPE STREQUAL x86-Release)
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES
    OUTPUT_NAME "AkUnitySoundEngine"
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/x86/Release"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/x86/Release"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/x86/Release"
  )
  target_include_directories("AkUnitySoundEngineAndroid" PRIVATE
    "${CMAKE_CURRENT_LIST_DIR}/."
    "${WWISESDK}/include"
    "${WWISESDK}/tools"
    "${CMAKE_CURRENT_LIST_DIR}/../Common"
    "${WWISESDK}/samples/SoundEngine/Android/libzip/lib"
  )
  target_compile_definitions("AkUnitySoundEngineAndroid" PRIVATE
    "AUDIOKINETIC"
    "NDEBUG"
    "AK_OPTIMIZED"
    "AK_PLATFORM_SPECIFIC_STUBS"
  )
  target_link_directories("AkUnitySoundEngineAndroid" PRIVATE
    "C:/Audiokinetic/Wwise_2025.1.9.9197/SDK/Android_x86/Release/lib"
    "${WWISESDK}/Android_x86/Release/lib"
  )
  target_link_libraries("AkUnitySoundEngineAndroid"
    "AkSpatialAudio"
    "AkMemoryMgr"
    "AkStreamMgr"
    "AkSoundEngine"
    "AkSilenceSource"
    "AkSineSource"
    "AkToneSource"
    "AkSynthOneSource"
    "AkVorbisDecoder"
    "AkOpusDecoder"
    "AkAudioInputSource"
    "Ak3DAudioBedMixerFX"
    "AkCompressorFX"
    "AkDelayFX"
    "AkFlangerFX"
    "AkGainFX"
    "AkGuitarDistortionFX"
    "AkHarmonizerFX"
    "AkMatrixReverbFX"
    "AkParametricEQFX"
    "AkPeakLimiterFX"
    "AkPitchShifterFX"
    "AkRecorderFX"
    "AkReflectFX"
    "AkRoomVerbFX"
    "AkStereoDelayFX"
    "AkTimeStretchFX"
    "AkTremoloFX"
    "OpenSLES"
    "android"
    "log"
    "dl"
    "zip"
    "z"
  )
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fPIC")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-conversion-null")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-deprecated-declarations")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-invalid-offsetof")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fvisibility=hidden")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-rtti")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-exceptions")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-sync-alignment")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-ffunction-sections")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fdata-sections")
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES LINK_FLAGS "-Wl,--as-needed,-z,max-page-size=16384 -Wl,--as-needed ")
  if (MSVC)
    target_compile_options("AkUnitySoundEngineAndroid" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:/WX>
      $<$<COMPILE_LANGUAGE:C>:/Ot>
      $<$<COMPILE_LANGUAGE:C>:/MD>
      $<$<COMPILE_LANGUAGE:C>:/std:c11>
      $<$<COMPILE_LANGUAGE:CXX>:/WX>
      $<$<COMPILE_LANGUAGE:CXX>:/Ot>
      $<$<COMPILE_LANGUAGE:CXX>:/MD>
      $<$<COMPILE_LANGUAGE:CXX>:/std:c++17>
      $<$<COMPILE_LANGUAGE:CXX>:/GR->
    )
  else()
    target_compile_options("AkUnitySoundEngineAndroid" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:-m32>
      $<$<COMPILE_LANGUAGE:C>:-Werror>
      $<$<COMPILE_LANGUAGE:C>:-O2>
      $<$<COMPILE_LANGUAGE:C>:-fPIC>
      $<$<COMPILE_LANGUAGE:C>:-std=c11>
      $<$<COMPILE_LANGUAGE:CXX>:-m32>
      $<$<COMPILE_LANGUAGE:CXX>:-Werror>
      $<$<COMPILE_LANGUAGE:CXX>:-O2>
      $<$<COMPILE_LANGUAGE:CXX>:-fPIC>
      $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
  endif()
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE True
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()

if(CMAKE_BUILD_TYPE STREQUAL arm64-v8a-Release)
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES
    OUTPUT_NAME "AkUnitySoundEngine"
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/arm64-v8a/Release"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/arm64-v8a/Release"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/arm64-v8a/Release"
  )
  target_include_directories("AkUnitySoundEngineAndroid" PRIVATE
    "${CMAKE_CURRENT_LIST_DIR}/."
    "${WWISESDK}/include"
    "${WWISESDK}/tools"
    "${CMAKE_CURRENT_LIST_DIR}/../Common"
    "${WWISESDK}/samples/SoundEngine/Android/libzip/lib"
  )
  target_compile_definitions("AkUnitySoundEngineAndroid" PRIVATE
    "AUDIOKINETIC"
    "NDEBUG"
    "AK_OPTIMIZED"
    "AK_PLATFORM_SPECIFIC_STUBS"
  )
  target_link_directories("AkUnitySoundEngineAndroid" PRIVATE
    "C:/Audiokinetic/Wwise_2025.1.9.9197/SDK/Android_arm64-v8a/Release/lib"
    "${WWISESDK}/Android_arm64-v8a/Release/lib"
  )
  target_link_libraries("AkUnitySoundEngineAndroid"
    "AkSpatialAudio"
    "AkMemoryMgr"
    "AkStreamMgr"
    "AkSoundEngine"
    "AkSilenceSource"
    "AkSineSource"
    "AkToneSource"
    "AkSynthOneSource"
    "AkVorbisDecoder"
    "AkOpusDecoder"
    "AkAudioInputSource"
    "Ak3DAudioBedMixerFX"
    "AkCompressorFX"
    "AkDelayFX"
    "AkFlangerFX"
    "AkGainFX"
    "AkGuitarDistortionFX"
    "AkHarmonizerFX"
    "AkMatrixReverbFX"
    "AkParametricEQFX"
    "AkPeakLimiterFX"
    "AkPitchShifterFX"
    "AkRecorderFX"
    "AkReflectFX"
    "AkRoomVerbFX"
    "AkStereoDelayFX"
    "AkTimeStretchFX"
    "AkTremoloFX"
    "OpenSLES"
    "android"
    "log"
    "dl"
    "zip"
    "z"
  )
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fPIC")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-conversion-null")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-deprecated-declarations")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-invalid-offsetof")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fvisibility=hidden")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-rtti")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-exceptions")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-ffunction-sections")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fdata-sections")
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES LINK_FLAGS "-Wl,--as-needed,-z,max-page-size=16384 -Wl,--as-needed ")
  if (MSVC)
    target_compile_options("AkUnitySoundEngineAndroid" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:/WX>
      $<$<COMPILE_LANGUAGE:C>:/Ot>
      $<$<COMPILE_LANGUAGE:C>:/MD>
      $<$<COMPILE_LANGUAGE:C>:/std:c11>
      $<$<COMPILE_LANGUAGE:CXX>:/WX>
      $<$<COMPILE_LANGUAGE:CXX>:/Ot>
      $<$<COMPILE_LANGUAGE:CXX>:/MD>
      $<$<COMPILE_LANGUAGE:CXX>:/std:c++17>
      $<$<COMPILE_LANGUAGE:CXX>:/GR->
    )
  else()
    target_compile_options("AkUnitySoundEngineAndroid" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:-Werror>
      $<$<COMPILE_LANGUAGE:C>:-O2>
      $<$<COMPILE_LANGUAGE:C>:-fPIC>
      $<$<COMPILE_LANGUAGE:C>:-std=c11>
      $<$<COMPILE_LANGUAGE:CXX>:-Werror>
      $<$<COMPILE_LANGUAGE:CXX>:-O2>
      $<$<COMPILE_LANGUAGE:CXX>:-fPIC>
      $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
  endif()
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE True
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()

if(CMAKE_BUILD_TYPE STREQUAL x86_64-Release)
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES
    OUTPUT_NAME "AkUnitySoundEngine"
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/x86_64/Release"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/x86_64/Release"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../../Integration/Assets/Wwise/API/Runtime/Plugins/Android/x86_64/Release"
  )
  target_include_directories("AkUnitySoundEngineAndroid" PRIVATE
    "${CMAKE_CURRENT_LIST_DIR}/."
    "${WWISESDK}/include"
    "${WWISESDK}/tools"
    "${CMAKE_CURRENT_LIST_DIR}/../Common"
    "${WWISESDK}/samples/SoundEngine/Android/libzip/lib"
  )
  target_compile_definitions("AkUnitySoundEngineAndroid" PRIVATE
    "AUDIOKINETIC"
    "NDEBUG"
    "AK_OPTIMIZED"
    "AK_PLATFORM_SPECIFIC_STUBS"
  )
  target_link_directories("AkUnitySoundEngineAndroid" PRIVATE
    "C:/Audiokinetic/Wwise_2025.1.9.9197/SDK/Android_x86_64/Release/lib"
    "${WWISESDK}/Android_x86_64/Release/lib"
  )
  target_link_libraries("AkUnitySoundEngineAndroid"
    "AkSpatialAudio"
    "AkMemoryMgr"
    "AkStreamMgr"
    "AkSoundEngine"
    "AkSilenceSource"
    "AkSineSource"
    "AkToneSource"
    "AkSynthOneSource"
    "AkVorbisDecoder"
    "AkOpusDecoder"
    "AkAudioInputSource"
    "Ak3DAudioBedMixerFX"
    "AkCompressorFX"
    "AkDelayFX"
    "AkFlangerFX"
    "AkGainFX"
    "AkGuitarDistortionFX"
    "AkHarmonizerFX"
    "AkMatrixReverbFX"
    "AkParametricEQFX"
    "AkPeakLimiterFX"
    "AkPitchShifterFX"
    "AkRecorderFX"
    "AkReflectFX"
    "AkRoomVerbFX"
    "AkStereoDelayFX"
    "AkTimeStretchFX"
    "AkTremoloFX"
    "OpenSLES"
    "android"
    "log"
    "dl"
    "zip"
    "z"
  )
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fPIC")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-conversion-null")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-deprecated-declarations")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-Wno-invalid-offsetof")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fvisibility=hidden")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-rtti")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fno-exceptions")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-ffunction-sections")
  target_compile_options("AkUnitySoundEngineAndroid" PRIVATE "-fdata-sections")
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES LINK_FLAGS "-Wl,--as-needed,-z,max-page-size=16384 -Wl,--as-needed ")
  if (MSVC)
    target_compile_options("AkUnitySoundEngineAndroid" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:/WX>
      $<$<COMPILE_LANGUAGE:C>:/Ot>
      $<$<COMPILE_LANGUAGE:C>:/MD>
      $<$<COMPILE_LANGUAGE:C>:/std:c11>
      $<$<COMPILE_LANGUAGE:CXX>:/WX>
      $<$<COMPILE_LANGUAGE:CXX>:/Ot>
      $<$<COMPILE_LANGUAGE:CXX>:/MD>
      $<$<COMPILE_LANGUAGE:CXX>:/std:c++17>
      $<$<COMPILE_LANGUAGE:CXX>:/GR->
    )
  else()
    target_compile_options("AkUnitySoundEngineAndroid" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:-m64>
      $<$<COMPILE_LANGUAGE:C>:-Werror>
      $<$<COMPILE_LANGUAGE:C>:-O2>
      $<$<COMPILE_LANGUAGE:C>:-fPIC>
      $<$<COMPILE_LANGUAGE:C>:-std=c11>
      $<$<COMPILE_LANGUAGE:CXX>:-m64>
      $<$<COMPILE_LANGUAGE:CXX>:-Werror>
      $<$<COMPILE_LANGUAGE:CXX>:-O2>
      $<$<COMPILE_LANGUAGE:CXX>:-fPIC>
      $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
  endif()
  set_target_properties("AkUnitySoundEngineAndroid" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE True
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
