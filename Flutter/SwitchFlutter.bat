@echo off
:: =====================================================
:: SwitchFlutter.bat
:: A script to switch between local Flutter versions.
::
:: Usage:
::   SwitchFlutter <version>
:: Example:
::   SwitchFlutter 3.38.2
:: =====================================================


:: === CONFIGURATION ===
:: Automatically set the base directory to the script’s folder + "\versions"
set FLUTTER_BASE_DIR=%~dp0versions

:: === INPUT VALIDATION ===
if "%~1"=="" (
    echo.
    echo ERROR: No Flutter version specified.
    echo.
    echo Usage: SwitchFlutter ^<version^>
    echo Example: SwitchFlutter 11.0.11
    echo.
    echo Example versions: 3.38.2, 3.27.2
    echo.
    goto :eof
)

:: === BUILD TARGET PATH ===
set "FLUTTER_SELECTED_VERSION=%FLUTTER_BASE_DIR%\flutter-%~1"

:: === CHECK IF THE TARGET VERSION EXISTS ===
if not exist "%FLUTTER_SELECTED_VERSION%" (
    echo.
    echo ERROR: Flutter version %~1 not found in "%FLUTTER_BASE_DIR%"
    echo Make sure the version folder exists and is correctly installed.
    echo.
    echo Example versions: 3.38.2, 3.27.2
    echo.
    goto :eof
)

:: === UPDATE ENVIRONMENT VARIABLES ===
setx FLUTTER "%FLUTTER_SELECTED_VERSION%"
setx /M FLUTTER "%FLUTTER_SELECTED_VERSION%"
set "Path=%PATH%;%FLUTTER_SELECTED_VERSION%\bin"

:: === VERIFY THE SWITCH ===
if %ERRORLEVEL% neq 0 (
    echo.
    echo ERROR: Failed to set the specified Flutter version.
    echo Reasons: 
    echo - This version might not be compatible
    echo - The installation was unsuccessful
    echo - Insufficient permissions to change system settings
    echo Try running the .bat in administrator mode.
    echo.
    goto :eof
)

echo.
echo Flutter version successfully switched to %~1
echo.