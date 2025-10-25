@echo off
:: =====================================================
:: SwitchDotnet.bat
:: A script to switch between local .NET SDK versions.
::
:: Usage:
::   SwitchDotnet <version>
:: Example:
::   SwitchDotnet 9.0.306
:: =====================================================

:: === CONFIGURATION ===
set DOTNET_BASE_DIR=%~dp0versions

:: === INPUT VALIDATION ===
if "%~1"=="" (
    echo.
    echo ERROR: No .NET version specified.
    echo.
    echo Usage: SwitchDotnet ^<version^>
    echo Example: SwitchDotnet 9.0.306
    echo.
    echo Example versions: 8.0.121, 9.0.306, 10.0.100
    echo.
    goto :eof
)

:: === BUILD THE TARGET PATH ===
set "DOTNET_SELECTED_VERSION=%DOTNET_BASE_DIR%\dotnet-sdk-%~1"

:: === CHECK IF THE TARGET VERSION EXISTS ===
if not exist "%DOTNET_SELECTED_VERSION%\dotnet.exe" (
    echo.
    echo ERROR: .NET SDK version %~1 not found in "%DOTNET_BASE_DIR%"
    echo Make sure you have extracted the SDK binaries correctly.
    echo.
    echo Example versions: 8.0.121, 9.0.306, 10.0.100
    echo.
    goto :eof
)

:: === UPDATE ENVIRONMENT VARIABLES ===
setx DOTNET_ROOT "%DOTNET_SELECTED_VERSION%"
setx /M DOTNET_ROOT "%DOTNET_SELECTED_VERSION%"
set "Path=%PATH%;%DOTNET_SELECTED_VERSION%;%DOTNET_SELECTED_VERSION%\dotnet.exe"

:: === VERIFY THE SWITCH ===
if %ERRORLEVEL% neq 0 (
    echo.
    echo ERROR: Failed to set the specified .NET version.
    echo Reasons: 
	echo - This version might not be compatible
	echo - The installation was unsuccessful.
	echo - Insufficient permissions to change system settings.
	echo Try running the .bat in administrator mode.
    echo.
    goto :eof
)

echo.
echo .NET version successfully switched to %~1
echo.

