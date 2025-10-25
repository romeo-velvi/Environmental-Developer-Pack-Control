@echo off
:: =====================================================
:: SwitchPython.bat
:: A script to switch between local Python versions.
::
:: Usage:
::   SwitchPython <version>
:: Example:
::   SwitchPython 3.12.7
::
:: This script assumes each version is under:
::   [script folder]\versions\Py-<version>
::
:: =====================================================


:: === CONFIGURATION ===
:: Automatically set the base directory to the script’s folder + "\versions"
set PYTHON_BASE_DIR=%~dp0versions

:: === INPUT VALIDATION ===
if "%~1"=="" (
    echo.
    echo ERROR: No Python version specified.
    echo.
    echo Usage: SwitchPython ^<version^>
    echo Example: SwitchPython 3.12.7
    echo.
    echo Example versions: 3.11.9, 3.12.7, 3.13.0
    echo.
    goto :eof
)

:: === BUILD TARGET PATH ===
set "PYTHON_SELECTED_VERSION=%PYTHON_BASE_DIR%\Py-%~1"

:: === CHECK IF THE TARGET VERSION EXISTS ===
if not exist "%PYTHON_SELECTED_VERSION%" (
    echo.
    echo ERROR: Python version %~1 not found in "%PYTHON_BASE_DIR%"
    echo Make sure the version folder exists and is correctly installed.
    echo.
    echo Example versions: 3.11.9, 3.12.7, 3.13.0
    echo.
    goto :eof
)

:: === UPDATE ENVIRONMENT VARIABLES ===
setx PYTHON "%PYTHON_SELECTED_VERSION%"
setx /M PYTHON "%PYTHON_SELECTED_VERSION%"
set "Path=%PATH%;%PYTHON_SELECTED_VERSION%;%PYTHON_SELECTED_VERSION%\Scripts"

:: === VERIFY THE SWITCH ===
if %ERRORLEVEL% neq 0 (
if %ERRORLEVEL% neq 0 (
    echo.
    echo ERROR: Failed to set the specified Python version.
    echo Reasons: 
	echo - This version might not be compatible
	echo - The installation was unsuccessful.
	echo - Insufficient permissions to change system settings.
	echo Try running the .bat in administrator mode.
    echo.
    goto :eof
)
)

echo.
echo Python version successfully switched to %~1
echo.