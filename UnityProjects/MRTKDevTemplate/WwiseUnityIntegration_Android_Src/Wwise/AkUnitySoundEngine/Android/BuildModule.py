# Android Wwise Unity Build module
import BuildUtil
import os
from os import path
from BuildWwiseUnityIntegration import MultiArchBuilder
from GenerateApiBinding import GccSwigCommand
from PrepareSwigInput import SwigPlatformHandlerPOSIX, SwigApiHeaderBlobber

class AndroidBuilder(MultiArchBuilder):
	def __init__(self, platformName, arches, configs, generateSwig, skipPremake, **kwargs):
		MultiArchBuilder.__init__(self, platformName, arches, configs, generateSwig, skipPremake, **kwargs)
		self.ndkroot = os.environ[BuildUtil.AndroidNdkEnvVar]

	def _CreateCommands(self, arch=None, config='Profile'):
		cmds = []

		for t in self.tasks:

			cmake = os.path.join(os.environ['WWISESDK'], "..", "Tools", "cmake", "windows-x86_64", "bin", "cmake.exe")
			ninja = os.path.join(os.environ['WWISESDK'], "..", "Tools", "Win32", "bin", "ninja.exe")
			tcfile = os.path.join(self.ndkroot, "build", "cmake", "android.toolchain.cmake")

			cmakebuildtype = f'{arch}-{config}'
			cmakebuildfolder = f"./build-android-{cmakebuildtype}"

			cmake_command= (
				cmake,
				'-G', 'Ninja',
				f'-DCMAKE_TOOLCHAIN_FILE={tcfile}',
				f'-DCMAKE_MAKE_PROGRAM={ninja}',
				f'-DCMAKE_BUILD_TYPE={cmakebuildtype}',
				f'-DANDROID_ABI={arch}',
				f'-DWWISESDK={os.environ["WWISESDK"]}',
				f'-DANDROID_STL=c++_static',
				'-S', f'.',
				'-B', cmakebuildfolder
			)

			build_command = (
				ninja,
				'-C', cmakebuildfolder,
			)
			cmds.append(cmake_command)
			cmds.append(build_command)

		return cmds

	def _RunCommands(self, cmds):
		previous_cwd = os.getcwd()
		os.chdir('../Android')
		isSuccess = MultiArchBuilder._RunCommands(self, cmds)
		os.chdir(previous_cwd)
		return isSuccess

class AndroidSwigCommand(GccSwigCommand):
	def __init__(self, pathMan, arch):
		GccSwigCommand.__init__(self, pathMan)
		self.wordSize = 64 if arch == 'arm64-v8a' else 32

		self.platformDefines += [
			'-D__ANDROID__',
			'-DAK_ANDROID',
			'-DAK_NEED_POSIX',
			'-DAK_DISABLE_UNITIALIZED_WARNING',
			'-DHAS_PRE_AK_TYPES_BINDING',
			'-DAKTYPESPATH=<AK/SoundEngine/Platforms/Android/AkTypes.h>'
			]
		self.dllName = ['-dllimport', self.pathMan.ProductName]

		incpath = os.path.join(os.environ['ANDROID_NDK_HOME'], 'toolchains', 'llvm', 'prebuilt', 'windows-x86_64', 'sysroot', 'usr', 'include')
		if not path.lexists(incpath):
			# Fallback on legacy NDK paths
			incpath = os.path.join(os.environ['ANDROID_NDK_HOME'], 'sysroot', 'usr', 'include')

		self.Includes += ['-I%s' % incpath]

class SwigApiHeaderBlobberAndroid(SwigApiHeaderBlobber):
	def __init__(self, pathMan):
		SwigApiHeaderBlobber.__init__(self, pathMan)

		self.inputHeaders.append(path.normpath(path.join(self.SdkIncludeDir, 'AK/SoundEngine/Platforms/Android/AkAndroidSoundEngine.h')))

class SwigPlatformHandlerAndroid(SwigPlatformHandlerPOSIX):
	def __init__(self, pathMan):
		SwigPlatformHandlerPOSIX.__init__(self, pathMan)

		self.ioFileSources = \
		[
			path.join(self.pathMan.Paths['Wwise_SDK_Samples'], 'SoundEngine/POSIX/stdafx.cpp'),
			path.join(self.pathMan.Paths['Wwise_SDK_Samples'], 'SoundEngine/POSIX/stdafx.h'),
			path.join(self.pathMan.Paths['Wwise_SDK_Samples'], 'SoundEngine/Android/AkFileHelpers.cpp'),
			path.join(self.pathMan.Paths['Wwise_SDK_Samples'], 'SoundEngine/Android/AkFileHelpers.h'),
			path.join(self.pathMan.Paths['Wwise_SDK_Samples'], 'SoundEngine/Android/AkFileHelpersAndroid.h'),
			path.join(self.pathMan.Paths['Wwise_SDK_Samples'], 'SoundEngine/Android/AkDefaultIOHookDeferred.cpp'),
			path.join(self.pathMan.Paths['Wwise_SDK_Samples'], 'SoundEngine/Android/AkDefaultIOHookDeferred.h'),
		]

def Init(argv=None):
	BuildUtil.BankPlatforms['Android'] = 'Android'
	BuildUtil.SupportedArches['Android'] = ['armeabi-v7a', 'arm64-v8a', 'x86', 'x86_64']
	BuildUtil.PremakeParameters['Android'] = { 'os': 'android', 'generator': 'cmake' }
	BuildUtil.PlatformSwitches['Android'] = '#if UNITY_ANDROID && ! UNITY_EDITOR'
	BuildUtil.SupportedPlatforms['Windows'].append("Android")
	BuildUtil.PlatformDependentFilenames.append('AkAudioPath.cs')

def CreatePlatformBuilder(platformName, arches, configs, generateSwig, skipPremake, isMultiSDK, **kwargs):
	return AndroidBuilder(platformName, arches, configs, generateSwig, skipPremake, **kwargs)

def CreateSwigCommand(pathMan, arch):
	return AndroidSwigCommand(pathMan, arch)

def CreateSwigPlatformHandler(pathMan):
	return SwigPlatformHandlerAndroid(pathMan)

def CreateSwigApiHeaderBlobber(pathMan):
	return SwigApiHeaderBlobberAndroid(pathMan)

if __name__ == '__main__':
	pass
