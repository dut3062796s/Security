:: @ECHO OFF

:: Build packages
cd src\Steeltoe.Security.Authentication.CloudFoundry
dotnet restore --configfile ..\..\nuget.config
IF NOT "%APPVEYOR_REPO_TAG_NAME%"=="" (
    IF NOT "%STEELTOE_VERSION_SUFFIX%"=="" (
        dotnet pack --configuration %BUILD_TYPE% --version-suffix %STEELTOE_VERSION_SUFFIX%
    ) ELSE (
        dotnet pack --configuration %BUILD_TYPE%
    )    
)
IF "%APPVEYOR_REPO_TAG_NAME%"=="" (dotnet pack --configuration %BUILD_TYPE% --version-suffix %STEELTOE_VERSION_SUFFIX% --include-symbols --include-source)
cd ..\..

cd src\Steeltoe.Security.DataProtection.Redis
dotnet restore --configfile ..\..\nuget.config
IF NOT "%APPVEYOR_REPO_TAG_NAME%"=="" (
    IF NOT "%STEELTOE_VERSION_SUFFIX%"=="" (
        dotnet pack --configuration %BUILD_TYPE% --version-suffix %STEELTOE_VERSION_SUFFIX%
    ) ELSE (
        dotnet pack --configuration %BUILD_TYPE%
    )    
)
IF "%APPVEYOR_REPO_TAG_NAME%"=="" (dotnet pack --configuration %BUILD_TYPE% --version-suffix %STEELTOE_VERSION_SUFFIX% --include-symbols --include-source)
cd ..\..

