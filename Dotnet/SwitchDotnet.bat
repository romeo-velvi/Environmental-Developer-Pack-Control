@echo off

set DOTNET_BASE_DIR=C:\Dotnet\versions

if "%~1"=="" (
	echo.
	echo ERRORE: Nessuna versione .NET specificata.
	echo.
	echo Uso: SwitchDotnet ^<versione^>
	echo Esempio: SwitchDotnet 9.0.306
	echo.
	echo Versioni supportate: 8.0.121, 9.0.306, 10.0.100
	echo.
	goto :eof
)

set DOTNET_SELECTED_VERSION=%DOTNET_BASE_DIR%\dotnet-sdk-%~1

if not exist "%DOTNET_SELECTED_VERSION%\dotnet.exe" (
	echo.
	echo ERRORE: .NET SDK per la versione %~1 non trovato in "%DOTNET_BASE_DIR%"
	echo Assicurati di aver estratto correttamente l'SDK binario.
	echo.
	echo Versioni supportate: 8.0.121, 9.0.306, 10.0.100
	echo.
	goto :eof
)

REM set DOTNET_ROOT=%DOTNET_SELECTED_VERSION%

setx DOTNET_ROOT %DOTNET_SELECTED_VERSION%
setx /M DOTNET_ROOT %DOTNET_SELECTED_VERSION%
set Path=%PATH%;"%DOTNET_ROOT%";"%DOTNET_ROOT%\dotnet.exe!

dotnet --version

REM Check if an error occurred during the operation
if %ERRORLEVEL% neq 0 (
	echo.
    echo Dotnet setting error - this version is not applicable
	echo.
)

if %ERRORLEVEL% neq 1 (
	echo.
    echo Dotnet version updated to %~1
	echo.
)