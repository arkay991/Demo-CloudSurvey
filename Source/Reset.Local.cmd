@echo off
setlocal
CD /d "%~dp0"

::Test If script has Admin Privileges/is elevated
REG QUERY "HKU\S-1-5-19"
IF %ERRORLEVEL% NEQ 0 (
    ECHO Please run this script as an administrator
    pause
    EXIT /B 1
)
cls

REM --------- Variables ---------
SET powerShellDir=%WINDIR%\system32\windowspowershell\v1.0
echo.

echo.
echo ========= Setting PowerShell Execution Policy ========= 
%powerShellDir%\powershell.exe -NonInteractive -Command "Set-ExecutionPolicy unrestricted"
echo Setting Execution Policy Done!
echo.

cls

call %powerShellDir%\powershell.exe -Command "&'.\Setup\tasks\show-consent-message.ps1' -ResetLocal "; exit $LASTEXITCODE

IF %ERRORLEVEL% == 1 GOTO exit

cls

call %powerShellDir%\powershell.exe -Command "&'.\Setup\tasks\show-config-xml-message.ps1' Config.Local.xml"; exit $LASTEXITCODE

IF %ERRORLEVEL% == 1 GOTO exit

cls

ECHO ========= Installing Demo Toolkit =========
CALL %powerShellDir%\powershell.exe -Command "&'.\Setup\tasks\InstallDemoToolkit.ps1'" ..\assets\DemoToolkit; exit $LASTEXITCODE

IF %ERRORLEVEL% == 1 GOTO exit

ECHO.
ECHO Demo toolkit installed sucessfully...
ECHO.

ECHO ========= Installing SnapIns =========
IF EXIST %WINDIR%\SysWow64 (
	SET installUtilDir=%WINDIR%\Microsoft.NET\Framework64\v4.0.30319
) ELSE (
	SET installUtilDir=%WINDIR%\Microsoft.NET\Framework\v4.0.30319
)
%installUtilDir%\installutil.exe /u .\Setup\assets\DemoToolkit\DemoToolkit.Cmdlets.dll
%installUtilDir%\installutil.exe -i .\Setup\assets\DemoToolkit\DemoToolkit.Cmdlets.dll
ECHO Installing SnapIns Done!


%powerShellDir%\powershell.exe -NonInteractive -command ".\Setup\cleanup.local.ps1" "..\config.local.xml"
%powerShellDir%\powershell.exe -NonInteractive -command ".\Setup\setup.local.ps1" "..\config.local.xml"
%powerShellDir%\powershell.exe -NonInteractive -command ".\Setup\reset.environment.ps1" "setup.xml" "..\config.local.xml"

echo.

@pause

:exit