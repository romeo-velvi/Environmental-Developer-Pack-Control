@echo off
set pathfound="false"
REM Check if a version is provided as an argument
if "%~1"=="3.12.7" (
  set Path=%PATH%;C:\Python\versions\Py-3.12.7\Scripts;C:\Python\versions\Py-3.12.7
  setx PYTHON "C:\Python\versions\Py-3.12.7"
  setx /M PYTHON C:\Python\versions\Py-3.12.7
  set pathfound="true"
)
if "%~1"=="3.13.0" (
  set Path=%PATH%;C:\Python\versions\Py-3.13.0\Scripts;C:\Python\versions\Py-3.13.0
  setx PYTHON "C:\Python\versions\Py-3.13.0"
  setx /M PYTHON C:\Python\versions\Py-3.13.0
  set pathfound="true"
)
if "%~1"=="3.11.9" (
  set Path=%PATH%;C:\Python\versions\Py-3.11.9\Scripts;C:\Python\versions\Py-3.11.9
  setx PYTHON "C:\Python\versions\Py-3.11.9"
  setx /M PYTHON C:\Python\versions\Py-3.11.9
  set pathfound="true"
)

REM Check if an error occurred during the operation
if %ERRORLEVEL% neq 0 (
  if %pathfound% == "false" (
    echo.
    echo Python setting error - this version is not applicable
  )
)

if %ERRORLEVEL% neq 1 (
  if %pathfound% == "true" (
    echo.
    echo Python version updated to %~1
  )
)