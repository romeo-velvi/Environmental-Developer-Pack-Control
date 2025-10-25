@echo off
:: =====================================================
:: SwitchJava.bat
:: A script to switch between local Java JDK versions.
::
:: Usage:
::   SwitchJava <version>
:: Example:
::   SwitchJava 11.0.11
:: =====================================================


:: === CONFIGURATION ===
:: Automatically set the base directory to the script’s folder + "\versions"
set JAVA_BASE_DIR=%~dp0versions

:: === INPUT VALIDATION ===
if "%~1"=="" (
    echo.
    echo ERROR: No Java version specified.
    echo.
    echo Usage: SwitchJava ^<version^>
    echo Example: SwitchJava 11.0.11
    echo.
    echo Example versions: 1.8.0, 11.0.11, 19.0.2
    echo.
    goto :eof
)

:: === BUILD TARGET PATH ===
set "JAVA_SELECTED_VERSION=%JAVA_BASE_DIR%\jdk-%~1"

:: === CHECK IF THE TARGET VERSION EXISTS ===
if not exist "%JAVA_SELECTED_VERSION%" (
    echo.
    echo ERROR: Java version %~1 not found in "%JAVA_BASE_DIR%"
    echo Make sure the version folder exists and is correctly installed.
    echo.
    echo Example versions: 1.8.0, 11.0.11, 19.0.2
    echo.
    goto :eof
)

:: === UPDATE ENVIRONMENT VARIABLES ===
setx JAVA_HOME "%JAVA_SELECTED_VERSION%"
setx /M JAVA_HOME "%JAVA_SELECTED_VERSION%"
set "Path=%PATH%;%JAVA_SELECTED_VERSION%\bin"

:: === VERIFY THE SWITCH ===
if %ERRORLEVEL% neq 0 (
    echo.
    echo ERROR: Failed to set the specified Java version.
    echo Reasons: 
    echo - This version might not be compatible
    echo - The installation was unsuccessful
    echo - Insufficient permissions to change system settings
    echo Try running the .bat in administrator mode.
    echo.
    goto :eof
)

echo.
echo Java version successfully switched to %~1
echo.
