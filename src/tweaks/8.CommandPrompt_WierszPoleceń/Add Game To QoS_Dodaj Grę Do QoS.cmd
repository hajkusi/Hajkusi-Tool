@echo off
if exist "%SYSTEMDRIVE%\Gaming_Pack\Resources\RunAsTI.cmd" ( goto Exist ) else ( goto DownloadRunAsTI )
:DownloadRunAsTI
mkdir %SYSTEMDRIVE%\Gaming_Pack\Resources\
curl -g -L -# -o "%SYSTEMDRIVE%\Gaming_Pack\Resources\RunAsTI.cmd" "github.com/hajkusi/Gaming-Pack/raw/main/Files/RunAsTI.cmd"
cls
goto Exist

:Exist
cd %SYSTEMDRIVE%\Gaming_Pack\Resources\
whoami /user | find /i "S-1-5-18" > nul 2>&1 || (
	call RunAsTI.cmd "%~f0" "%*"
	exit /b
)

if exist "%SYSTEMDRIVE%\Gaming_Pack\Resources\FilePicker.exe" ( goto Again ) else ( goto DownloadFilePicker )
:DownloadFilePicker
curl -g -L -# -o "%SYSTEMDRIVE%\Gaming_Pack\Resources\FilePicker.exe" "https://github.com/hajkusi/Gaming-Pack/raw/main/Files/FilePicker.exe"
cls
goto Again

:Again
cd %SYSTEMDRIVE%\Gaming_Pack\Resources\
for /f "tokens=* delims=\" %%i in ('FilePicker.exe exe') do (
    if "%%i" == "cancelled by user" goto Again
    reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Application Name" /t REG_SZ /d "%%~ni%%~xi" /f
    reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "DSCP Value" /t REG_SZ /d "46" /f
    reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Local IP Prefix Length" /t REG_SZ /d "*" /f
    reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Local IP" /t REG_SZ /d "*" /f
    reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Local Port" /t REG_SZ /d "*" /f
    reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Protocol" /t REG_SZ /d "*" /f
    reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Remote IP Prefix Length" /t REG_SZ /d "*" /f
    reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Remote IP" /t REG_SZ /d "*" /f
    reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Remote Port" /t REG_SZ /d "*" /f
    reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Throttle Rate" /t REG_SZ /d "-1" /f
    reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Version" /t REG_SZ /d "1.0" /f
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%%~ni%%~xi\PerfOptions\" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%%~ni%%~xi\PerfOptions\" /v "IoPriority" /t Reg_DWORD /d "3" /f
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%%~ni%%~xi\PerfOptions\" /v "PagePriority" /t REG_DWORD /d "5" /f
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Control.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Control.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Control.exe\PerfOptions" /v "PagePriority" /t REG_DWORD /d "5" /f
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Control_DX11.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Control_DX11.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Control_DX11.exe\PerfOptions" /v "PagePriority" /t REG_DWORD /d "5" /f
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Control_DX12.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Control_DX12.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Control_DX12.exe\PerfOptions" /v "PagePriority" /t REG_DWORD /d "5" /f
)
goto End

:End
rmdir %SYSTEMDRIVE%\Gaming_Pack\ /s /q
cls
echo Finished, Please Reboot Your Device For Changes To Apply.\Zakonczono, Prosze Uruchom Ponownie Twoje Urzadzenie zeby Zastosowac
pause
exit /b