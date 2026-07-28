-- Android Unity premake module
local platform = {}

platform.akName = "Android"

function platform.GetUnityPlatformName(platformName, cfgplatforms)
    return platformName, cfgplatforms
end

function platform.setupTargetAndLibDir(baseTargetDir)
    libdirs(wwiseSDKEnv .. "/Android_%{cfg.platform}/%{cfg.buildcfg}/lib")
    targetdir(baseTargetDir .. "Android/%{cfg.platform}/%{cfg.buildcfg}")
end

function platform.platformSpecificConfiguration()
    files
    {
        "../Android/AkFileHelpers.cpp",
    }

    excludes
    {
        "../Common/AkMultipleFileLocation.cpp",
    }

    includedirs
    {
        wwiseSDKEnv .. "/samples/SoundEngine/Android/libzip/lib",
    }

    links
    {
        "OpenSLES",
        "android",
        "log",
        "dl",
        "zip",
        "z"
    }

    linkoptions
	{
        "-Wl,--as-needed"
	}

    defines
    {
        "AK_PLATFORM_SPECIFIC_STUBS"
    }

end

return platform