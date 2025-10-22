@echo off
set pathfound="false"
REM Check if a file path is provided as an argument
if "%~1"=="1.8.0" (
  setx JAVA_HOME "C:\Java\development_kit\jdk-1.8.0"
  setx /M JAVA_HOME C:\Java\development_kit\jdk-1.8.0
  set pathfound="true"
)
if "%~1"=="11.0.11" (
  setx JAVA_HOME "C:\Java\development_kit\jdk-11.0.11"
  setx /M JAVA_HOME C:\Java\development_kit\jdk-11.0.11
  set pathfound="true"
)

if "%~1"=="19.0.2" (
  setx JAVA_HOME "C:\Java\development_kit\jdk-19.0.2"
  setx /M JAVA_HOME C:\Java\development_kit\jdk-19.0.2
  set pathfound="true"
)

REM Check if an error occourred during the operation
if %ERRORLEVEL% neq 0 (
	if %pathfound% == "false" (
		echo.
		echo Java setting error - this version is not applicable
	)
)

if %ERRORLEVEL% neq 1 (
	if %pathfound% == "true" (
	  echo.
	  echo Java version updated to %~1
	)
)
